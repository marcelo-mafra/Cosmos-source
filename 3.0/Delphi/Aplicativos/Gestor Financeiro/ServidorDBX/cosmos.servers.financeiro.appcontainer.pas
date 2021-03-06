unit cosmos.servers.financeiro.appcontainer;

interface

uses System.SysUtils, System.Classes, Datasnap.DSTCPServerTransport,
  Datasnap.DSServer, Datasnap.DSCommonServer, Datasnap.DSAuth, IPPeerServer,
  Datasnap.DSHTTP,  System.Generics.Collections, Datasnap.DSSession, IdTCPConnection,
  cosmos.system.types, cosmos.system.messages, cosmos.system.exceptions,
  cosmos.classes.application, Data.DBXCommon, DSHTTPLayer, cosmos.classes.logs,
  cosmos.classes.persistence.ini, Data.DBCommonTypes, Datasnap.DSHTTPCommon,
  Data.DBXCommonIndy, Data.DBXJSON, cosmos.system.winshell;

type
  TServerProtocol = (spTCP, spHTTPS); //Protocolos de comenx�o que podem ser usados.

  TOnPrepareCommandEvent = procedure(Session: TDSSession) of object;
  TOnConnectServerEvent = procedure(DSConnectEventObject: TDSConnectEventObject) of object;
  TOnDisconnectServerEvent = procedure(DSConnectEventObject: TDSConnectEventObject) of object;


  TDMFinanceiroAppContainer = class(TDataModule)
    DSServerFinaneiro: TDSServer;
    DSTCPServerTransport: TDSTCPServerTransport;
    DSHTTPService: TDSHTTPService;
    DSCertFiles: TDSCertFiles;
    DSAuthenticationManager: TDSAuthenticationManager;
    DSServerApplicationClass: TDSServerClass;
    DSServerFinanceiroClass: TDSServerClass;
    DSHTTPServiceFile: TDSHTTPServiceFileDispatcher;
    procedure DSServerApplicationClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSCertFilesGetPEMFilePasskey(ASender: TObject;
      var APasskey: AnsiString);
    procedure DSAuthenticationManagerUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DataModuleCreate(Sender: TObject);
    procedure DSTCPServerTransportConnect(Event: TDSTCPConnectEventObject);
    procedure DSTCPServerTransportDisconnect(
      Event: TDSTCPDisconnectEventObject);
    procedure DSServerFinaneiroPrepare(
      DSPrepareEventObject: TDSPrepareEventObject);
    procedure DSServerFinaneiroError(DSErrorEventObject: TDSErrorEventObject);
    procedure DSServerFinaneiroConnect(
      DSConnectEventObject: TDSConnectEventObject);
    procedure DSServerFinaneiroDisconnect(
      DSConnectEventObject: TDSConnectEventObject);
    function DSServerFinaneiroTrace(TraceInfo: TDBXTraceInfo): CBRType;
    procedure DSAuthenticationManagerUserAuthorize(Sender: TObject;
      AuthorizeEventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSHTTPServiceTrace(Sender: TObject; AContext: TDSHTTPContext;
      ARequest: TDSHTTPRequest; AResponse: TDSHTTPResponse);
    procedure DSServerFinanceiroClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
    FActiveProtocol: TServerProtocol;
    sTestServerPage: string;

    FOnConnectServer: TOnConnectServerEvent;
    FOnDisconnectServer: TOnDisconnectServerEvent;
    FOnPrepareCommand: TOnPrepareCommandEvent;

    FTCPConnections: TObjectDictionary<TIdTCPConnection,TDSTCPChannel>;

    procedure LoadMethodsAuthorizations;
    procedure LoadServerConfigurations;
    procedure ValidateCertificate(Owner: TObject; Certificate: TX509Certificate;
                 const ADepth: Integer; var Ok: Boolean);
  public
    procedure GetServerConfigurations(AList: TStringList);

    property ActiveProtocol: TServerProtocol read FActiveProtocol;
    property OnConnectServer: TOnConnectServerEvent read FOnConnectServer write FOnConnectServer;
    property OnDisconnectServer: TOnDisconnectServerEvent read FOnDisconnectServer write FOnDisconnectServer;
    property OnPrepareCommand: TOnPrepareCommandEvent read FOnPrepareCommand write FOnPrepareCommand;
  end;

var
  DMFinanceiroAppContainer: TDMFinanceiroAppContainer;

implementation

uses Winapi.Windows, cosmos.servers.common.services, cosmos.servers.common.methods,
  cosmos.servers.common.security, cosmos.servers.common.dataacess,
  cosmos.servers.common.security.authorizations, cosmos.servers.financeiro.finmethods;

{$R *.dfm}

procedure TDMFinanceiroAppContainer.DSServerApplicationClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMCosmosApplicationServer;
end;

procedure TDMFinanceiroAppContainer.DSServerFinanceiroClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
 PersistentClass := TDMFinanceiroMethods;
end;

procedure TDMFinanceiroAppContainer.DSServerFinaneiroConnect(
  DSConnectEventObject: TDSConnectEventObject);
var
 AInfo: string;
 AContextInfo: TStringList;
begin
 {Registra informa��es de logs de opera��es de conex�o.}
 AContextInfo := DMCosmosServerServices.CreateContextInfoObject;

 try
  with DSConnectEventObject do
   begin
    //Registra os dados da conex�o no log do sistema
    AInfo := Format(TCosmosLogs.ConnectedUser, [ConnectProperties[TDBXPropertyNames.DSAuthenticationUser]]);
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoUser, [ConnectProperties[TDBXPropertyNames.DSAuthenticationUser]]));
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoSession, [TDSSessionManager.GetThreadSession.Id]));
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoRoles, [TDSSessionManager.GetThreadSession.GetData('UserRoles')]));
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [ConnectProperties[TDBXPropertyNames.CommunicationProtocol]]));
    AContextInfo.Append(FormatDateTime('dd/mm/yyyy hh:nn:ss:zzz', Now));

    DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.DelimitedText, leOnConnect);

    //Registra na janela do servidor o usu�rio conectado.
    AContextInfo.Clear;
    AContextInfo.Append(ConnectProperties[TDBXPropertyNames.DSAuthenticationUser]);
    AContextInfo.Append(DateTimeToStr(Now));
    AContextInfo.Append(ConnectProperties[TDBXPropertyNames.CommunicationProtocol]);

    if Assigned(OnConnectServer) then OnConnectServer(DsConnectEventObject);
   end;

 finally
  AContextInfo.Free;
 end;
end;

procedure TDMFinanceiroAppContainer.DSServerFinaneiroDisconnect(
  DSConnectEventObject: TDSConnectEventObject);
var
 AInfo: string;
 AContextInfo: TStringList;
begin
 {Registra informa��es de logs de opera��es de desconex�o.}
 //DMServerDataAcess.ConnectionPool.RemoveConnection(TDSSessionManager.GetThreadSession.Id);

 AContextInfo := DMCosmosServerServices.CreateContextInfoObject;

 try
  with DSConnectEventObject do
   begin
    AInfo := Format(TCosmosLogs.DisconnectedUser, [ConnectProperties[TDBXPropertyNames.DSAuthenticationUser]]);

    AContextInfo.Append(Format(TCosmosLogs.ContextInfoSession, [TDSSessionManager.GetThreadSession.Id]));
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoUser, [ConnectProperties[TDBXPropertyNames.DSAuthenticationUser]]));
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoRoles, [TDSSessionManager.GetThreadSession.GetData('UserRoles')]));
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [ConnectProperties[TDBXPropertyNames.CommunicationProtocol]]));
   end;

  DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.DelimitedText, leOnConnectClose);

  if Assigned(OnDisconnectServer) then OnDisconnectServer(DSConnectEventObject);

 finally
  AContextInfo.Free;
 end;
end;

procedure TDMFinanceiroAppContainer.DSServerFinaneiroError(
  DSErrorEventObject: TDSErrorEventObject);
var
 Info: string;
 AContextInfo: TStringList;
begin
 {Registra informa��es de logs de erros de execu��o de m�todos remotos.}
 if leOnError in DMCosmosServerServices.LogEvents then
  begin
   AContextInfo := DMCosmosServerServices.CreateContextInfoObject;

   try
    with DSErrorEventObject do
     begin
      Info := DSErrorEventObject.Error.Message;
      AContextInfo.Append(Format(TCosmosLogs.ContextInfoSession, [TDSSessionManager.GetThreadSession.Id]));
      AContextInfo.Append(Format(TCosmosLogs.ContextInfoUser, [TDSSessionManager.GetThreadSession.GetData('UserName')]));
      AContextInfo.Append(Format(TCosmosLogs.ContextInfoRoles, [TDSSessionManager.GetThreadSession.GetData('UserRoles')]));
      AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [ServerConnectionHandler.Channel.ChannelInfo.ClientInfo.Protocol]));
     end;

    DMCosmosServerServices.RegisterLog(Info, AContextInfo.DelimitedText, leOnError);

   finally
    FreeAndNil(AContextInfo);
   end;
  end;
end;

procedure TDMFinanceiroAppContainer.DSServerFinaneiroPrepare(
  DSPrepareEventObject: TDSPrepareEventObject);
var
 Info: string;
 AContextInfo: TStringList;
begin
 {Registra informa��es de logs de prepara��o de execu��o de m�todos remotos.}
 if leOnPrepare in DMCosmosServerServices.LogEvents then
  begin
   AContextInfo := DMCosmosServerServices.CreateContextInfoObject;

   try
    with DSPrepareEventObject do
     begin
      Info := DSPrepareEventObject.MethodAlias;
      AContextInfo.Append(Format(TCosmosLogs.ContextInfoSession, [TDSSessionManager.GetThreadSession.Id]));
      AContextInfo.Append(Format(TCosmosLogs.ContextInfoUser, [TDSSessionManager.GetThreadSession.GetData('UserName')]));
      AContextInfo.Append(Format(TCosmosLogs.ContextInfoRoles, [TDSSessionManager.GetThreadSession.GetData('UserRoles')]));
      AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [ServerConnectionHandler.Channel.ChannelInfo.ClientInfo.Protocol]));
     end;

    DMCosmosServerServices.RegisterLog(Info, AContextInfo.DelimitedText, leOnPrepare);

    //Dispara um evento que pode ser capturado pelo Form principal, para notifica��o.
    if Assigned(FOnPrepareCommand) then FOnPrepareCommand(TDSSessionManager.GetThreadSession);

   finally
    FreeAndNil(AContextInfo);
   end;
  end;
end;

function TDMFinanceiroAppContainer.DSServerFinaneiroTrace(
  TraceInfo: TDBXTraceInfo): CBRType;
var
 Info: string;
 AContextInfo: TStringList;
begin
 {Registra informa��es de logs de trace, caso a gera��o para este tipo de
 evento esteja ativa.}
 if leOnTrace in DMCosmosServerServices.LogEvents then
  begin
   AContextInfo := DMCosmosServerServices.CreateContextInfoObject;

   try
    Info := TraceInfo.Message;
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoSession, [TDSSessionManager.GetThreadSession.Id]));
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoUser, [TDSSessionManager.GetThreadSession.GetData('UserName')]));
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoRoles, [TDSSessionManager.GetThreadSession.GetData('UserRoles')]));

    DMCosmosServerServices.RegisterLog(Info, AContextInfo.DelimitedText, leOnTrace);

   finally
    FreeAndNil(AContextInfo);
   end;
  end;
end;

procedure TDMFinanceiroAppContainer.DSTCPServerTransportConnect(
  Event: TDSTCPConnectEventObject);
begin
//http://docwiki.embarcadero.com/RADStudio/XE3/en/Monitoring_and_Controlling_DataSnap_TCP/IP_Connections
{ TMonitor.Enter(FTCPConnections);

 try
   FTCPConnections.Add(TIdTCPConnection(Event.Connection), Event.Channel);

 finally
   TMonitor.Exit(FTCPConnections);
 end;

 //Enable Keep-alive for this new connection.
 Event.Channel.EnableKeepAlive(DSTCPServerTransport.KeepAliveTime, DSTCPServerTransport.KeepAliveInterval);

 TThread.Synchronize(nil, procedure
  begin
   sInfo := Format('RequestConnect: Ip: %s', [Event.Channel.ChannelInfo.ClientInfo.IpAddress]);
   FrmSecretariasMainForm.RegisterInfo(sInfo, TIdTCPConnection(Event.Connection));
  end);}
end;

procedure TDMFinanceiroAppContainer.DSTCPServerTransportDisconnect(
  Event: TDSTCPDisconnectEventObject);
begin
{  if (FTCPConnections = nil) or (Event.Connection = nil) then
    Exit;

  //This is called when a TCP connection is closed, for whatever reason.
  TMonitor.Enter(FTCPConnections);

  try
    FTCPConnections.Remove(TIdTCPConnection(Event.Connection));

    TThread.Synchronize(nil, procedure
      begin
        //update the connection list box, removing the connection that was just closed
        FrmSecretariasMainForm.UnregisterInfo(Event.Connection);
      end);

  finally
    TMonitor.Exit(FTCPConnections);
  end; }
end;

procedure TDMFinanceiroAppContainer.GetServerConfigurations(
  AList: TStringList);
begin
 //Lista em um objeto tipo "lista" informa��es sobre o servidor.
 if self.ActiveProtocol = spTCP then
  begin
   AList.Append(Format('Protocolo=%s', ['tcp/ip'])); //do not localize!
   AList.Append(Format('Porta=%d', [DSTCPServerTransport.Port]));
  end
 else
 if self.ActiveProtocol = spHTTPS then
  begin
   AList.Append(Format('Protocolo=%s', ['https'])); //do not localize!
   AList.Append(Format('Porta=%s', ['-']));  //do not localize!
  end;


 AList.Append(Format('Servidor=%s', [TWinShell.GetIPAddress]));
 AList.Append(Format('RunOn=%s', [DateTimeToStr(Now)]));
end;

procedure TDMFinanceiroAppContainer.LoadMethodsAuthorizations;
var
 IAuthorizations: IXMLAuthorizationsType;
 IMethodInfo: IXMLMethodInfoType;
 AFileName: string;
 I: integer;
 ARoleInfo: TDSRoleItem;
 CosmosApp: TCosmosApplication;
begin
{Carrega as informa��es de autoriza��o existente no arquivo de configura��o de
 permiss�es "RolesPermissions.xml". Essas informa��es se referem tanto ao acesso
 a funcionalidadades como a m�todos remotos. Este m�todo apenas carrega as autoriza��es
 relativas aos m�todos remotos.}
 CosmosApp := TCosmosApplication.Create;

 AFileName := CosmosApp.GetModulePath + 'RolesPermissions.xml';
 IAuthorizations := LoadAuthorizations(AFileName);
 DSAuthenticationManager.Roles.Clear;

 try
  for I := 0 to Pred(IAuthorizations.Methods.Count) do
   begin
    IMethodInfo := IAuthorizations.Methods.MethodInfo[I];
    if (IMethodInfo.CosmosModule = 'cmFinanceiro') or (IMethodInfo.CosmosModule = 'cmAll') then //do not localize!
     begin
      ARoleInfo := TDSRoleItem(DSAuthenticationManager.Roles.Add);
      ARoleInfo.ApplyTo.CommaText := IMethodInfo.MethodName;
      ARoleInfo.AuthorizedRoles.CommaText := IMethodInfo.AuthorizedRoles;
      ARoleInfo.DeniedRoles.CommaText := IMethodInfo.DeniedRoles;
      ARoleInfo.Exclude.CommaText := IMethodInfo.Exclude;
     end;
   end;

  DMCosmosServerServices.RegisterLog(TCosmosLogs.AuthorizationsMethods, '');

 finally
  if Assigned(IAuthorizations) then
   IAuthorizations := nil;
  if Assigned(CosmosApp) then
   FreeAndNil(CosmosApp);
 end;
end;

procedure TDMFinanceiroAppContainer.LoadServerConfigurations;
 var
  AFile: TIniFilePersistence;
  AFileName, CurrentProtocol, sModuleName: string;
  CosmosApp: TCosmosApplication;
  AList: TStringList;
begin
{Carregas as configura��es do servidor em execu��o. Estas configura��es envolvem
 protocolos de conex�o, certificados, dentre outros itens.}
 CosmosApp := TCosmosApplication.Create;
 AFileName := CosmosApp.GetModulePath + 'CosmosRoot.ini';
 AFile := TIniFilePersistence.Create(AFileName, True);
 AList := TStringList.Create;

 sModuleName := DMCosmosServerServices.CosmosModuleShortName.ToUpper;

 try
  //Configura��es das classes expostas remotamente.
  DSServerApplicationClass.LifeCycle := AFile.ReadString(sModuleName, 'DSServerApplicationClass.LifeCycle', 'Session');
  DSServerFinanceiroClass.LifeCycle := DSServerApplicationClass.LifeCycle;

  CurrentProtocol := AFile.ReadString(sModuleName, 'DSCurrentProtocol', 'HTTPS');

  if UpperCase(CurrentProtocol) = 'TCP/IP' then //Conex�o TCP/IP
   begin
    DSTCPServerTransport.BufferKBSize := AFile.ReadInteger(sModuleName, 'TCPConnection.BufferKBSize', 32);
    DSTCPServerTransport.Port := AFile.ReadInteger(sModuleName, 'TCPConnection.Port', 10001);
    DSTCPServerTransport.MaxThreads := AFile.ReadInteger(sModuleName, 'TCPConnection.MaxThreads', 0);
    DSTCPServerTransport.PoolSize := AFile.ReadInteger(sModuleName, 'TCPConnection.PoolSize', 10);

    case AFile.ReadInteger(sModuleName, 'TCPConnection.KeepAliveEnablement', 0) of
     0: DSTCPServerTransport.KeepAliveEnablement := kaDefault;
     1: DSTCPServerTransport.KeepAliveEnablement := kaEnabled;
     2: DSTCPServerTransport.KeepAliveEnablement := kaDisabled
     else
      DSTCPServerTransport.KeepAliveEnablement := kaDefault;
    end;

    DSTCPServerTransport.KeepAliveTime := AFile.ReadInteger(sModuleName, 'TCPConnection.KeepAliveTime', 0);
    DSTCPServerTransport.KeepAliveInterval := AFile.ReadInteger(sModuleName, 'TCPConnection.KeepAliveInterval', 0);

    DSTCPServerTransport.Server := DSServerFinaneiro;
    DSTCPServerTransport.Start;
   end
   else
  if UpperCase(CurrentProtocol) = 'HTTP' then  //Configura��es do objeto de conex�o HTTP
   begin
    sTestServerPage := AFile.ReadString(sModuleName, 'TestSeverPage', '');
    DSHTTPService.DSHostname := AFile.ReadString(sModuleName, 'DSHTTPService.DSHostname', '');
    DSHTTPService.DSPort := AFile.ReadInteger(sModuleName, 'DSHTTPService.DSPort', 0);
    DSHTTPService.HttpPort := AFile.ReadInteger(sModuleName, 'DSHTTPService.HttpPort', 0);
    DSHTTPService.SessionTimeout := AFile.ReadInteger(sModuleName, 'DSHTTPService.SessionTimeout', 0);

    DSHTTPService.Server := DSServerFinaneiro;
    DSHTTPService.Start;
    FActiveProtocol := spTCP;
   end
   else
  if UpperCase(CurrentProtocol) = 'HTTPS' then  //Configura��es do objeto de conex�o HTTPS
   begin
    //Primeiro, carrega as configura��es de certificados X.509.
    DSCertFiles.RootCertFile := AFile.ReadString('Certificates', 'RootCertFile', '');
    DSCertFiles.CertFile := AFile.ReadString('Certificates', 'CertificateFile', '');
    DSCertFiles.KeyFile := AFile.ReadString('Certificates', 'PrivateKeyFile', '');
    DSHTTPService.CertFiles := DSCertFiles;

    //Aponta a propriedade para o m�todo de valida��o do certificado SSL.
    DSAuthenticationManager.OnValidatePeerCertificate := ValidateCertificate;

    //Configura o objeto Indy interno que implementa HTTPS.
    DSCertFiles.SetServerProperties(DSHTTPService.HttpServer);

    //Agora, carrega as propriedades do servidor HTTPS.
    DSHTTPService.Server := DSServerFinaneiro;
    DSHTTPService.DSHostname := AFile.ReadString(sModuleName, 'DSHTTPService.DSHostname', '');
    DSHTTPService.DSPort := AFile.ReadInteger(sModuleName, 'DSHTTPService.DSPort', 0);
    DSHTTPService.HttpPort := AFile.ReadInteger(sModuleName, 'DSHTTPService.HttpsPort', 443);
    DSHTTPService.SessionTimeout := AFile.ReadInteger(sModuleName, 'DSHTTPService.SessionTimeout', 0);

    DSHTTPService.Start;
    FActiveProtocol := spHTTPS;
   end
  else //Configura��o de protocolo errada. N�o pode continuar!
    raise EInvalidProtocol.Create(TCosmosErrorMsg.InvalidProtocol);


  if Assigned(AFile) then
   FreeAndNil(AFile);

  if Assigned(CosmosApp) then
   FreeAndNil(CosmosApp);

  if Assigned(AList) then
   FreeAndNil(AList);

 except
  on E: EInvalidProtocol do
   begin
     //Gerar logs de exce��o...
    DMCosmosServerServices.RegisterLog(E.Message, Format(TCosmosLogs.ContextInfoProtocol, [CurrentProtocol]), leOnError);
    DSServerFinaneiro.Stop;
   end;
  on E: Exception do
   begin
     //Gerar logs de exce��o...
    DMCosmosServerServices.RegisterLog(E.Message, Format(TCosmosLogs.AppMethod, ['TDMFinanceiroAppContainer.LoadServerConfigurations']), leOnError);
   end;
 end;
end;

procedure TDMFinanceiroAppContainer.ValidateCertificate(Owner: TObject;
  Certificate: TX509Certificate; const ADepth: Integer; var Ok: Boolean);
begin
// Certificate := TX509CertificateIndy.Create(DSCertFiles.CertFile);

 try
 // TX509CertificateIndy(Certificate).CheckValidity;

  //Ok := Certificate.Verify(Certificate.GetPublicKey);

 except
  Ok := False;
 end;
end;

procedure TDMFinanceiroAppContainer.DataModuleCreate(Sender: TObject);
begin
 DMCosmosServerServices.CosmosModule := cmFinanceiroServer;
 //Carrega as configura��es do servidor
 LoadServerConfigurations;

 //Carrega as autoriza��es para cada m�todo remoto.;
 LoadMethodsAuthorizations;

 //Cria o pool de conex�o com o banco de dados.
 FTCPConnections := TObjectDictionary<TIdTCPConnection,TDSTCPChannel>.Create;

 DMCosmosServerServices.RegisterLog(TCosmosLogs.InitializedServer, '');

end;

procedure TDMFinanceiroAppContainer.DSAuthenticationManagerUserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
var
 AInfo: string;
 AContextInfo, AUserInfo: TStringList;
begin
 {Autentica o usu�rio. Ap�s a autentica��o, o sistema armazena alguns dados
  do usu�rio e da conex�o no gerenciador de sess�es.}
 AContextInfo := DMCosmosServerServices.CreateContextInfoObject;
 AUserInfo := TStringList.Create;

 try
  //Autentica o usu�rio.
  Valid := TCosmosSecurity.AuthenticateUser(User, Password);

  if Valid then
    begin
     try
       TCosmosSecurity.GetCosmosUserInfo(User, AUserInfo);
       //Checa se o usu�rio est� ativo.
       Valid := AUserInfo.Values['INDATI'] = 'S';
       if not Valid then
         raise EInactivedUser.Create('');

       if Valid then //Checa se o usu�rio est� bloqueado.
        begin
         Valid := AUserInfo.Values['INDBLO'] = 'N';
         if not Valid then
          raise EBlockedUser.Create('');
        end;

     except
       Valid := False;
     end;

     //Verifica se o usu�rio pode acessar o m�dulo corrente do Cosmos.
     Valid := TCosmosSecurity.CanAcessModule(User, DMCosmosServerServices.CosmosModule);
     if not Valid then
       raise ECantAcessCosmosModule.Create('');

     if Valid then
      begin
       TCosmosSecurity.GetUserRoles(User, UserRoles);
       TDSSessionManager.GetThreadSession.PutData('UserName', User);
       TDSSessionManager.GetThreadSession.PutData('UserRoles', UserRoles.CommaText);
       TDSSessionManager.GetThreadSession.PutData('ConnectedUser', AUserInfo.Values['NOMCAD']);
       TDSSessionManager.GetThreadSession.PutData('UserInfo', AUserInfo.CommaText);
       TDSSessionManager.GetThreadSession.PutData('ConnectTime', DateTimeToStr(Now));

       //Agora registra logs sobre a autentica��o.
       AInfo := Format(TCosmosLogs.AutenticatedUser, [User]);
       AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [protocol]));
       AContextInfo.Append(Context);
       DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.CommaText, leOnAuthenticateSucess);
      end;
    end
   else
    raise EValidateUser.Create(Format(TCosmosLogs.InvalidAuthentication, [User]));

 AContextInfo.Free;
 AUserInfo.Free;

 except
  on E: EValidateUser do//login ou senha inv�lidos
   begin
    AInfo := AInfo.Format(TCosmosLogs.InvalidAuthentication, [User]);
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [protocol]));
    AContextInfo.Append(Context);
    DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.CommaText, leOnAuthenticateFail);

    if Assigned(AContextInfo) then FreeAndNil(AContextInfo);
    if Assigned(AUserInfo) then FreeAndNil(AUserInfo);
   end;
  //o usu�rio est� inativo.
  on E: EInactivedUser do
   begin
    AInfo := Format(TCosmosLogs.InactivedUser, [User]);
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [protocol]));
    AContextInfo.Append(Context);
    DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.CommaText, leOnAuthenticateFail);

    if Assigned(AContextInfo) then FreeAndNil(AContextInfo);
    if Assigned(AUserInfo) then FreeAndNil(AUserInfo);
   end;
  //o usu�rio n�o pode acessar o m�dulo do Cosmos.
  on E: ECantAcessCosmosModule do
   begin
    AInfo := TCosmosLogs.CantAcessCosmosModule;
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [protocol]));
    AContextInfo.Append(Context);
    DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.CommaText, leOnAuthenticateFail);

    if Assigned(AContextInfo) then FreeAndNil(AContextInfo);
    if Assigned(AUserInfo) then FreeAndNil(AUserInfo);
   end;
  //O usu�rio est� bloqueado
  on E: EBlockedUser do
   begin
     AInfo := Format(TCosmosLogs.BlockedUser, [User]);
     AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [protocol]));
     AContextInfo.Append(Context);
     DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.CommaText, leOnAuthenticateFail);

    if Assigned(AContextInfo) then FreeAndNil(AContextInfo);
    if Assigned(AUserInfo) then FreeAndNil(AUserInfo);
   end;
  //outros erros
  on E: Exception do
   begin
    Valid := False;
    DMCosmosServerServices.RegisterLog(E.Message, '', leOnError);
    if Assigned(AContextInfo) then FreeAndNil(AContextInfo);
    if Assigned(AUserInfo) then FreeAndNil(AUserInfo);
   end;
 end;
end;

procedure TDMFinanceiroAppContainer.DSAuthenticationManagerUserAuthorize(
  Sender: TObject; AuthorizeEventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
var
 AInfo: string;
 AContextInfo: TStringList;
begin
 {Caso a autoriza��o seja negada e a gera��o de logs estiver ativa para esse
 evento, ser� registrado um log.}
 if not Valid then
  begin
    if leOnAuthorize in DMCosmosServerServices.LogEvents then
     begin
      AContextInfo := DMCosmosServerServices.CreateContextInfoObject;

      try
        AInfo := Format(TCosmosLogs.DeniedAuthorization, [AuthorizeEventObject.UserName,
         AuthorizeEventObject.MethodAlias]);
        AContextInfo.Append(Format(TCosmosLogs.ContextInfoRoles, [AuthorizeEventObject.UserRoles.CommaText]));
        AContextInfo.Append(Format(TCosmosLogs.AuthorizedRoles, [AuthorizeEventObject.AuthorizedRoles.CommaText]));
        DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.CommaText, leOnAuthorize);

      finally
         AContextInfo.Free;
      end;
     end;
  end;
end;

procedure TDMFinanceiroAppContainer.DSCertFilesGetPEMFilePasskey(ASender: TObject;
  var APasskey: AnsiString);
begin
  APasskey := '';
end;


procedure TDMFinanceiroAppContainer.DSHTTPServiceTrace(Sender: TObject;
  AContext: TDSHTTPContext; ARequest: TDSHTTPRequest;
  AResponse: TDSHTTPResponse);
 var
 AContent: TStringList;
begin
{Aciona uma p�gina de testes para o usu�rio certificar-se de que o servidor est�
sendo executado normalmente. Isso � feito por meio de um navegador web, informando
na url o endere�o completo do servidor e o par�metro "testpage". Uma p�gina
HTML ser� exibida caso o servidor Cosmos responda corretamente.}

 if (ARequest.Params.Count > 0) and (ARequest.Params.Strings[0] = 'testpage') then
  begin

   AContent := TStringList.Create;

   try
    //AResponse.ContentText := DMSecPageProducer.GeneratePage(ARequest.Params);
    AContent.LoadFromFile(sTestServerPage);
    AResponse.ContentText := AContent.Text;

   finally
    AContent.Free;
   end;
  end;
end;

end.


unit cosmos.server.financeiro.appcontainer;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.SvcMgr, Datasnap.DSServer,
  Datasnap.DSCommonServer, Datasnap.DSAuth, Datasnap.DSTCPServerTransport, IPPeerServer,
  System.Generics.Collections, Datasnap.DSSession,
  cosmos.system.types, cosmos.system.messages, cosmos.system.exceptions,
  cosmos.classes.application, Data.DBXCommon, cosmos.classes.logs,
  cosmos.classes.persistence.ini, cosmos.classes.persistence.registry,
  Data.DBCommonTypes;

type
  TOnPrepareCommandEvent = procedure(Session: TDSSession) of object;
  TOnConnectServerEvent = procedure(DSConnectEventObject: TDSConnectEventObject) of object;
  TOnDisconnectServerEvent = procedure(DSConnectEventObject: TDSConnectEventObject) of object;


  TCosmosFinanceiroService = class(TService)
    DSServerFinanceiro: TDSServer;
    DSAuthenticationManager: TDSAuthenticationManager;
    DSServerApplicationClass: TDSServerClass;
    DSServerFinanceiroClass: TDSServerClass;
    DSTCPServerTransport: TDSTCPServerTransport;
    procedure DSServerApplicationClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManagerUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DSServerFinanceiroPrepare(
      DSPrepareEventObject: TDSPrepareEventObject);
    procedure DSServerFinanceiroError(DSErrorEventObject: TDSErrorEventObject);
    procedure DSServerFinanceiroConnect(
      DSConnectEventObject: TDSConnectEventObject);
    procedure DSServerFinanceiroDisconnect(
      DSConnectEventObject: TDSConnectEventObject);
    function DSServerFinanceiroTrace(TraceInfo: TDBXTraceInfo): CBRType;
    procedure DSAuthenticationManagerUserAuthorize(Sender: TObject;
      AuthorizeEventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DSServerFinanceiroClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceShutdown(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceDestroy(Sender: TObject);
    procedure DSTCPServerTransportConnect(Event: TDSTCPConnectEventObject);
    procedure DSTCPServerTransportDisconnect(
      Event: TDSTCPDisconnectEventObject);
  private
    { Private declarations }
    FOnConnectServer: TOnConnectServerEvent;
    FOnDisconnectServer: TOnDisconnectServerEvent;
    FOnPrepareCommand: TOnPrepareCommandEvent;

    procedure LoadMethodsAuthorizations;
    procedure LoadServerConfigurations;


  protected
    function DoStop: Boolean; override;
    function DoPause: Boolean; override;
    function DoContinue: Boolean; override;
    procedure DoInterrogate; override;

  public
    function GetServiceController: TServiceController; override;

    property OnConnectServer: TOnConnectServerEvent read FOnConnectServer write FOnConnectServer;
    property OnDisconnectServer: TOnDisconnectServerEvent read FOnDisconnectServer write FOnDisconnectServer;
    property OnPrepareCommand: TOnPrepareCommandEvent read FOnPrepareCommand write FOnPrepareCommand;
  end;

function DSServer: TDSServer;
function DSAuthenticationManager: TDSAuthenticationManager;

var
  CosmosFinanceiroService: TCosmosFinanceiroService;

implementation

uses cosmos.servers.common.services, cosmos.servers.common.methods,
  cosmos.servers.financeiro.finmethods, cosmos.servers.common.security,
  cosmos.servers.common.security.authorizations, cosmos.servers.common.dataacess;

{$R *.dfm}

var
  FDSServer: TDSServer;
  FDSAuthenticationManager: TDSAuthenticationManager;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  CosmosFinanceiroService.Controller(CtrlCode);
end;

function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

function DSAuthenticationManager: TDSAuthenticationManager;
begin
  Result := FDSAuthenticationManager;
end;

procedure TCosmosFinanceiroService.DSServerApplicationClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMCosmosApplicationServer;
end;

procedure TCosmosFinanceiroService.DSServerFinanceiroClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMFinanceiroMethods;
end;

procedure TCosmosFinanceiroService.DSServerFinanceiroConnect(
  DSConnectEventObject: TDSConnectEventObject);
var
 AInfo: string;
 AContextInfo: TStringList;
begin
 {Registra informa��es de logs de opera��es de conex�o.}

 //Registra qual o servidor Cosmos que est� usando a classe TCosmosFinanceiroService.
 DMCosmosServerServices.CosmosModule := cmFinanceiroServer;
 //Prepara o objeto que receber� as informa��es de contexto da conex�o.
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

procedure TCosmosFinanceiroService.DSServerFinanceiroDisconnect(
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

procedure TCosmosFinanceiroService.DSServerFinanceiroError(
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

procedure TCosmosFinanceiroService.DSServerFinanceiroPrepare(
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

    //Dispara um evento de notifica��o que pode ser capturado.
    if Assigned(FOnPrepareCommand) then FOnPrepareCommand(TDSSessionManager.GetThreadSession);

   finally
    FreeAndNil(AContextInfo);
   end;
  end;
end;

function TCosmosFinanceiroService.DSServerFinanceiroTrace(
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

procedure TCosmosFinanceiroService.DSTCPServerTransportConnect(
  Event: TDSTCPConnectEventObject);
var
 AInfo: string;
 AContextInfo: TStringList;
begin
 {Registra informa��es de logs de abertura de conectividade client/server em tcp.}

 //Registra qual o servidor Cosmos que est� usando a classe TCosmosFinanceiroService.
 DMCosmosServerServices.CosmosModule := cmSecretariasServer;
 //Prepara o objeto que receber� as informa��es de contexto da conex�o.
 AContextInfo := DMCosmosServerServices.CreateContextInfoObject;

 try
  with Event do
   begin
    //Registra os dados da conex�o no log do sistema
    AInfo := TCosmosLogs.NetOnConnectEvent;
    AContextInfo.Append(Format(TCosmosLogs.NetTransportProtocol, [Channel.ChannelInfo.ClientInfo.Protocol]));
    AContextInfo.Append(Format(TCosmosLogs.NetTransportClientIp, [Channel.ChannelInfo.ClientInfo.IpAddress]));
    AContextInfo.Append(Format(TCosmosLogs.NetTransportClientPort, [Channel.ChannelInfo.ClientInfo.ClientPort]));
    AContextInfo.Append(FormatDateTime('dd/mm/yyyy hh:nn:ss:zzz', Now));

    DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.DelimitedText, leOnConnect);
   end;

 finally
  AContextInfo.Free;
 end;
end;

procedure TCosmosFinanceiroService.DSTCPServerTransportDisconnect(
  Event: TDSTCPDisconnectEventObject);
var
 AInfo: string;
 AContextInfo: TStringList;
begin
 {Registra informa��es de logs de abertura de conectividade client/server em tcp.}

 //Registra qual o servidor Cosmos que est� usando a classe TCosmosFinanceiroService.
 DMCosmosServerServices.CosmosModule := cmSecretariasServer;
 //Prepara o objeto que receber� as informa��es de contexto da conex�o.
 AContextInfo := DMCosmosServerServices.CreateContextInfoObject;

 try
  with Event do
   begin
    //Registra os dados da conex�o no log do sistema
    AInfo := TCosmosLogs.NetOnDisconnectEvent;
    AContextInfo.Append(FormatDateTime('dd/mm/yyyy hh:nn:ss:zzz', Now));

    DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.DelimitedText, leOnConnect);
   end;

 finally
  AContextInfo.Free;
 end;
end;

function TCosmosFinanceiroService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TCosmosFinanceiroService.LoadMethodsAuthorizations;
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

 AFileName := CosmosApp.GetModulePath + TCosmosFiles.RolesPermissions;
 IAuthorizations := LoadAuthorizations(AFileName);
 DSAuthenticationManager.Roles.Clear;

 try
  for I := 0 to Pred(IAuthorizations.Methods.Count) do
   begin
    IMethodInfo := IAuthorizations.Methods.MethodInfo[I];
    if (IMethodInfo.CosmosModule = TCosmosAppName.CosmosFinanceiroId) or (IMethodInfo.CosmosModule = TCosmosAppName.CosmosCommonId) then
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
  if Assigned(IAuthorizations) then IAuthorizations := nil;
  if Assigned(CosmosApp) then FreeAndNil(CosmosApp);
 end;
end;

procedure TCosmosFinanceiroService.LoadServerConfigurations;
 var
  AFile: TIniFilePersistence;
  AFileName, CurrentProtocol: string;
  CosmosApp: TCosmosApplication;
begin
{Carregas as configura��es do servidor em execu��o. Estas configura��es envolvem
 protocolos de conex�o, certificados, dentre outros itens.}
 CosmosApp := TCosmosApplication.Create;
 AFileName := CosmosApp.GetModulePath + TCosmosFiles.CosmosRoot;
 AFile := TIniFilePersistence.Create(AFileName, True);

 try
  //Configura��es das classes expostas remotamente.
  DSServerApplicationClass.LifeCycle := AFile.ReadString('GFIN', 'DSServerApplicationClass.LifeCycle', 'Session');
  DSServerFinanceiroClass.LifeCycle := DSServerApplicationClass.LifeCycle;

  //Porta na qual o servidor ser� executado e outras configura��es.
  DSTCPServerTransport.Port := AFile.ReadInteger('GFIN', 'TCPConnection.Port', 2100);
  DSTCPServerTransport.BufferKBSize := AFile.ReadInteger('GFIN', 'TCPConnection.BufferKbSize', 32);
  DSTCPServerTransport.PoolSize := AFile.ReadInteger('GFIN', 'TCPConnection.PoolSize', 10);
  DSTCPServerTransport.MaxThreads := AFile.ReadInteger('GFIN', 'TCPConnection.MaxThreads', 0);

  //Op��es de KeepAlive.
  if AFile.ReadBoolean('GFIN', 'TCPConnection.KeepAliveEnablement', False) then
   begin
     DSTCPServerTransport.KeepAliveEnablement := kaEnabled;
     DSTCPServerTransport.KeepAliveTime := AFile.ReadInteger('GFIN', 'TCPConnection.KeepAliveTime', 300000);
     DSTCPServerTransport.KeepAliveInterval := AFile.ReadInteger('GFIN', 'TCPConnection.KeepAliveInterval', 100);
   end;

  if Assigned(AFile) then FreeAndNil(AFile);
  if Assigned(CosmosApp) then  FreeAndNil(CosmosApp);

 except
  on E: EInvalidProtocol do
   begin
     //Gerar logs de exce��o...
    DMCosmosServerServices.RegisterLog(E.Message, Format(TCosmosLogs.ContextInfoProtocol, [CurrentProtocol]), leOnError);
    DSServerFinanceiro.Stop;
   end;
  on E: Exception do
   begin
     //Gerar logs de exce��o...
    DMCosmosServerServices.RegisterLog(E.Message, Format(TCosmosLogs.AppMethod, ['TDMFinanceiroAppContainer.LoadServerConfigurations']), leOnError);
   end;
 end;
end;

procedure TCosmosFinanceiroService.ServiceAfterInstall(Sender: TService);
const
 sServiceDescription = 'Implementa o servidor Cosmos Gestor Financeiro, da ' +
 'su�te Cosmos. Esse servi�o implementa as funcionalidades para a gest�o ' +
 'financeira b�sica da Escola Internacional da Rosacruz �urea.';//do not localize!
var
  RegObj : TRegistryPersistence;
begin
{Registra na registry os dados de descri��o do servi�o. Esse registro n�o � feito
automaticamente, mas deve ser implementado aqui.}
  RegObj := TRegistryPersistence.Create;
  try
    RegObj.Open(HKEY_LOCAL_MACHINE);

    if RegObj.OpenKey('\SYSTEM\CurrentControlSet\Services\' + self.Name, True) then
      begin
       RegObj.WriteString('Description', sServiceDescription);//do not localize!
       RegObj.CloseKey;
      end;

  finally
    FreeAndNil(RegObj);
  end;

end;

procedure TCosmosFinanceiroService.ServiceCreate(Sender: TObject);
begin
  inherited;
 FDSServer := DSServerFinanceiro;
 FDSAuthenticationManager := DSAuthenticationManager;

 //Cria os objetos que disponibilizam m�todos de servi�os e acesso a dados.
 DMCosmosServerServices := TDMCosmosServerServices.Create(nil);
 DMCosmosServerServices.CosmosModule := cmFinanceiroServer;

 DMServerDataAcess := TDMServerDataAcess.Create(nil);
 //Carrega as configura��es do servidor
 LoadServerConfigurations;

 //Carrega as autoriza��es para cada m�todo remoto.
 LoadMethodsAuthorizations;

 DMCosmosServerServices.RegisterLog(TCosmosLogs.InitializedServer, '');
end;

procedure TCosmosFinanceiroService.ServiceDestroy(Sender: TObject);
begin
  FDSServer := nil;
  FDSAuthenticationManager := nil;
  DMServerDataAcess.Free;
  DMCosmosServerServices.Free;
end;

procedure TCosmosFinanceiroService.ServiceShutdown(Sender: TService);
begin
 if Assigned(DMServerDataAcess) then
  DMServerDataAcess.ConnectionPool.ClearAll;
end;

procedure TCosmosFinanceiroService.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  DSServerFinanceiro.Start;
end;

function TCosmosFinanceiroService.DoContinue: Boolean;
begin
  Result := inherited;
  DSServerFinanceiro.Start;
end;

procedure TCosmosFinanceiroService.DoInterrogate;
begin
  inherited;
end;

function TCosmosFinanceiroService.DoPause: Boolean;
begin
  DSServerFinanceiro.Stop;
  Result := inherited;  DSServerFinanceiro.Stop;
end;

function TCosmosFinanceiroService.DoStop: Boolean;
begin
  DSServerFinanceiro.Stop;
  Result := inherited;
end;

procedure TCosmosFinanceiroService.DSAuthenticationManagerUserAuthenticate(
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
       Valid := AUserInfo.Values['INDATI'] = 'S'; //do not localize!
       if not Valid then
         raise EInactivedUser.Create('');

       if Valid then //Checa se o usu�rio est� bloqueado.
        begin
         Valid := AUserInfo.Values['INDBLO'] = 'N';  //do not localize!
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

     //Se chegou aqui, o usu�rio est� autenticado.
     if Valid then
      begin
       //Pega as roles do usu�rio autenticado e coloca os seus dados em sess�o.
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
  //O usu�rio est� inativo.
  on E: EInactivedUser do
   begin
    AInfo := Format(TCosmosLogs.InactivedUser, [User]);
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [protocol]));
    AContextInfo.Append(Context);
    DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.CommaText, leOnAuthenticateFail);

    if Assigned(AContextInfo) then FreeAndNil(AContextInfo);
    if Assigned(AUserInfo) then FreeAndNil(AUserInfo);
   end;
  //O usu�rio n�o pode acessar o m�dulo corrente do Cosmos.
  on E: ECantAcessCosmosModule do
   begin
    AInfo := TCosmosLogs.CantAcessCosmosModule;
    AContextInfo.Append(Format(TCosmosLogs.ContextInfoProtocol, [protocol]));
    AContextInfo.Append(Context);
    DMCosmosServerServices.RegisterLog(AInfo, AContextInfo.CommaText, leOnAuthenticateFail);

    if Assigned(AContextInfo) then FreeAndNil(AContextInfo);
    if Assigned(AUserInfo) then FreeAndNil(AUserInfo);
   end;
  //O usu�rio est� bloqueado.
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

procedure TCosmosFinanceiroService.DSAuthenticationManagerUserAuthorize(
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

end.


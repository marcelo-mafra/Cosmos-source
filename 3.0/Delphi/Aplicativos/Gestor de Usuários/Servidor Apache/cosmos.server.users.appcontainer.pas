unit cosmos.server.users.appcontainer;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Datasnap.DSServer,
  Datasnap.DSCommonServer, Datasnap.DSAuth, IPPeerServer,
  System.Generics.Collections, Datasnap.DSSession,
  cosmos.system.types, cosmos.system.messages, cosmos.system.exceptions,
  cosmos.classes.application, Data.DBXCommon, DSHTTPLayer, cosmos.classes.logs,
  cosmos.classes.persistence.ini, Data.DBCommonTypes;

type
  TOnPrepareCommandEvent = procedure(Session: TDSSession) of object;
  TOnConnectServerEvent = procedure(DSConnectEventObject: TDSConnectEventObject) of object;
  TOnDisconnectServerEvent = procedure(DSConnectEventObject: TDSConnectEventObject) of object;


  TDMUsuariosAppContainer = class(TDataModule)
    DSServerUsuarios: TDSServer;
    DSAuthenticationManager: TDSAuthenticationManager;
    DSServerApplicationClass: TDSServerClass;
    DSServerUsuariosClass: TDSServerClass;
    procedure DSServerApplicationClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSAuthenticationManagerUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
    procedure DataModuleCreate(Sender: TObject);
    procedure DSServerUsuariosPrepare(
      DSPrepareEventObject: TDSPrepareEventObject);
    procedure DSServerUsuariosError(DSErrorEventObject: TDSErrorEventObject);
    procedure DSServerUsuariosConnect(
      DSConnectEventObject: TDSConnectEventObject);
    procedure DSServerUsuariosDisconnect(
      DSConnectEventObject: TDSConnectEventObject);
    function DSServerUsuariosTrace(TraceInfo: TDBXTraceInfo): CBRType;
    procedure DSAuthenticationManagerUserAuthorize(Sender: TObject;
      AuthorizeEventObject: TDSAuthorizeEventObject; var valid: Boolean);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DSServerUsuariosClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    { Private declarations }
    FTestServerPage: string;

    FOnConnectServer: TOnConnectServerEvent;
    FOnDisconnectServer: TOnDisconnectServerEvent;
    FOnPrepareCommand: TOnPrepareCommandEvent;

    procedure LoadMethodsAuthorizations;
    procedure LoadServerConfigurations;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property OnConnectServer: TOnConnectServerEvent read FOnConnectServer write FOnConnectServer;
    property OnDisconnectServer: TOnDisconnectServerEvent read FOnDisconnectServer write FOnDisconnectServer;
    property OnPrepareCommand: TOnPrepareCommandEvent read FOnPrepareCommand write FOnPrepareCommand;
    property TestServerPage: string read FTestServerPage;
  end;

function DSServer: TDSServer;
function DSAuthenticationManager: TDSAuthenticationManager;

implementation

uses cosmos.servers.common.services, cosmos.servers.common.methods,
  cosmos.servers.users.usersmethods, cosmos.servers.common.security,
  cosmos.servers.common.security.authorizations, cosmos.servers.common.dataacess;

{$R *.dfm}

var
  FModule: TComponent;
  FDSServer: TDSServer;
  FDSAuthenticationManager: TDSAuthenticationManager;


function DSServer: TDSServer;
begin
  Result := FDSServer;
end;

function DSAuthenticationManager: TDSAuthenticationManager;
begin
  Result := FDSAuthenticationManager;
end;

procedure TDMUsuariosAppContainer.DSServerApplicationClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := TDMCosmosApplicationServer;
end;

procedure TDMUsuariosAppContainer.DSServerUsuariosConnect(
  DSConnectEventObject: TDSConnectEventObject);
var
 AInfo: string;
 AContextInfo: TStringList;
begin
 {Registra informa��es de logs de opera��es de conex�o.}

 //Registra qual o servidor Cosmos que est� usando a classe TDMCosmosServices.
 DMCosmosServerServices.CosmosModule := cmUsuariosServer;
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

procedure TDMUsuariosAppContainer.DSServerUsuariosDisconnect(
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

procedure TDMUsuariosAppContainer.DSServerUsuariosError(
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

procedure TDMUsuariosAppContainer.DSServerUsuariosPrepare(
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

function TDMUsuariosAppContainer.DSServerUsuariosTrace(
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

procedure TDMUsuariosAppContainer.DSServerUsuariosClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
 PersistentClass := TDMUserMethods;
end;

procedure TDMUsuariosAppContainer.LoadMethodsAuthorizations;
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

procedure TDMUsuariosAppContainer.LoadServerConfigurations;
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
  DSServerApplicationClass.LifeCycle := AFile.ReadString('GUSU', 'DSServerApplicationClass.LifeCycle', 'Session');
  DSServerUsuariosClass.LifeCycle := DSServerApplicationClass.LifeCycle;

  if Assigned(AFile) then FreeAndNil(AFile);
  if Assigned(CosmosApp) then  FreeAndNil(CosmosApp);

 except
  on E: EInvalidProtocol do
   begin
     //Gerar logs de exce��o...
    DMCosmosServerServices.RegisterLog(E.Message, Format(TCosmosLogs.ContextInfoProtocol, [CurrentProtocol]), leOnError);
    DSServerUsuarios.Stop;
   end;
  on E: Exception do
   begin
     //Gerar logs de exce��o...
    DMCosmosServerServices.RegisterLog(E.Message, Format(TCosmosLogs.AppMethod, ['TDMUsuariosAppContainer.LoadServerConfigurations']), leOnError);
   end;
 end;
end;

constructor TDMUsuariosAppContainer.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServerUsuarios;
  FDSAuthenticationManager := DSAuthenticationManager;
end;

destructor TDMUsuariosAppContainer.Destroy;
begin
  inherited;
  FDSServer := nil;
  FDSAuthenticationManager := nil;
end;

procedure TDMUsuariosAppContainer.DataModuleCreate(Sender: TObject);
begin
 FDSServer := DSServerUsuarios;
 FDSAuthenticationManager := DSAuthenticationManager;

 //Cria os objetos que disponibilizam m�todos de servi�os e acesso a dados.
 DMCosmosServerServices := TDMCosmosServerServices.Create(nil);
 DMCosmosServerServices.CosmosModule := cmUsuariosServer;

 DMServerDataAcess := TDMServerDataAcess.Create(nil);

 //Carrega as configura��es do servidor
 LoadServerConfigurations;

 //Carrega as autoriza��es para cada m�todo remoto.
 LoadMethodsAuthorizations;

 DMCosmosServerServices.RegisterLog(TCosmosLogs.InitializedServer, '');
end;

procedure TDMUsuariosAppContainer.DataModuleDestroy(Sender: TObject);
begin
  FDSServer := nil;
  FDSAuthenticationManager := nil;
  DMServerDataAcess.Free;
  DMCosmosServerServices.Free;
end;

procedure TDMUsuariosAppContainer.DSAuthenticationManagerUserAuthenticate(
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

procedure TDMUsuariosAppContainer.DSAuthenticationManagerUserAuthorize(
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

initialization
  FModule := TDMUsuariosAppContainer.Create(nil);

finalization
  FModule.Free;

end.


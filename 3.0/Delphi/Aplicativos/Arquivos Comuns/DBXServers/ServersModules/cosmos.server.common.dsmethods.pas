unit cosmos.server.common.dsmethods;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Winapi.Windows,
  cosmos.core.classes, cosmos.core.server.cosmosobj, cosmos.core.server.dataobjects,
  cosmos.core.server.security, cosmos.core.ConstantesMsg, cosmos.core.SQLServerInterface,
  SQLConsts, Data.DB, Data.DBXCommon, Variants;

const
 FCodeKey = '89533692230'; //Chave usada para criptografia interna

type
  TCosmosCommonMethods = class(TDSServerModule)
  private
    { Private declarations }
    FConnectedUser: TCosmosUser;
    function GetCurrentCosmosModule: TCosmosModules;
    function GetUserStatus(const UserName: string): TUserStatus;

    procedure CreateLog(const Message: string; MsgType: Cardinal); overload; inline;
    procedure CreateLog(E: Exception); overload; inline;
    function CreateMessageData: TServerReturn; inline;


  public
    { Public declarations }
    function GetSequenceValue(const SequenceName: WideString): OleVariant;
    function Get_DatabaseVersion: OleVariant;
    function Get_BetaVersion: WordBool;
    function ExecuteDQL(SearchID: Integer; Params: OleVariant): OleVariant;

    function Get_CodeKey: OleVariant;
    function ConnectDatabase(const UserName, Password, RoleName,
      HostName: WideString): OleVariant;
    function IsAdministrator(const UserName: WideString): OleVariant;
    function ExecuteCommand(CommandID: Integer; Params: OleVariant): OleVariant;
    function GetCosmosSearchsInfo: OleVariant;
    function ExecuteRegisteredSearch(SearchId: Integer; Params: OleVariant): OleVariant;

    function ServerDateTime: TDateTime;

    property CurrentCosmosModule: TCosmosModules read GetCurrentCosmosModule;

  end;

implementation

{$R *.dfm}

uses cosmos.server.users.dsdata;

{ TCosmosCommonMethods }

function TCosmosCommonMethods.ConnectDatabase(const UserName, Password,
  RoleName, HostName: WideString): OleVariant;
var
FAditionalInfo: TStringList;
AUserData : TCosmosData;
AUserManager : TCosmosUsersManager;
vUserStatus: TUserStatus;
sUserName: string;
AReturn: TServerReturn;
begin
{Este m�todo remoto permite que uma aplica��o cliente execute a valida��o de usu�rio no
 servidor Firebird. S�o registradas eventos de log para o sucesso ou erro gerados durante a
 execu��o deste m�todo.}

 //Cria a classe que retornar� dados do m�todo para a aplica��o cliente. A Classe
 //recebe valores padr�o.
 AReturn := self.CreateMessageData;
 //AReturn.SetMessageInfo(miInstallationID, self.ActiveRange);
 AReturn.ServerData := null;

 //Primeiro, checa se o servidor aceita novas conex�es.
 try
  {if Assigned(FrmMain) then
   begin
    if FrmMain.CManager.Locked then
     raise ELockedServerError.Create(sLogLockedServer);
    end;}

  AReturn.Code := DMCosmosUserData.ConnectDatabase(UserName, Password);

  //Descriptografa o login do usu�rio. Esse dado ser� usado em seguida.
  sUserName := TDataTransformation.Descriptografar(UserName);
  AReturn.SetMessageInfo(miUserName, sUserName);
  AReturn.SetMessageInfo(miRoleName, RoleName);

  //Agora, verifica o status do usu�rio...
  vUserStatus :=  self.GetUserStatus(sUserName);

  case vUserStatus of
   usCosmosUser:
    begin
     AReturn.Code := 0;//Usu�rio registrado do Cosmos.
     AReturn.MessageType := mtpSucess;
     AReturn.MessageText := sSucessfullLogin;
     AReturn.MessageTitle := sTitleAutentication;
     Result := AReturn.ServerReturn;
    end;
   usBlockedUser://� um usu�rio registrado, por�m est� bloqueado.
    begin
     AReturn.Code := 3;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := sBlockedUser;
     AReturn.MessageTitle := sTitleInvalidAutentication;
     Result := AReturn.ServerReturn;
     Exit;
    end;
   usSysdba://O usu�rio � o administrador do SGBD. No Gestor de Secretarias ele n�o pode trabalhar..
    begin
     AReturn.Code := 4;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := sSysdbaLoginFailure;
     AReturn.MessageTitle := sTitleInvalidAutentication;
     Result := AReturn.ServerReturn;
     Exit;
    end;
   usUnknown://O sistema n�o pode determinar o status do usu�rio.
    begin
     AReturn.Code := 5;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := Format(sUnknowUser, ['"'+ sUserName + '"']);
     AReturn.MessageTitle := sTitleInvalidAutentication;
     Result := AReturn.ServerReturn;
     Exit;
    end;
  end;

   //Se o login foi feito com sucesso, checa quem � o aluno usu�rio
   if AReturn.Code = 0 then
    begin
     AUserManager := TCosmosUsersManager.Create;
     AUserData := TCosmosData.Create(20);
     {Atribui os privil�gios do perfil do aluno que efetuou o login. A senha �
     �passada criptografada mesmo.}

     AUserManager.GetUserInfo(TDataTransformation.Descriptografar(UserName), Password, RoleName, AUserData);
    // SetUserInfo(Descriptografar(UserName), Password, RoleName, AUserData);
     AUserData.WriteValue('GROUP', RoleName, 14);

     //Agora, checa se o aluno est� ligado ou � um ex-aluno
     if AUserData.FindValue('ATIVO') = False then
      begin
       CreateLog(Format(sInvalidUser, [AUserData.FindValue('USER_NAME')]),EVENTLOG_AUDIT_FAILURE);
       raise EValidateUser.Create(Format(sInvalidUser, [AUserData.FindValue('USER_NAME')]));
      end;

     if (AUserData.FindValue('USER_NAME') = '') then
      raise EUnknownUser.Create(sErroUnknownUser);

    //Agora, verifica se o usu�rio pode acessar o m�dulo corrente do Cosmos.
    if not TCosmosMethods.CanAccessModule(AUserData.FindValue('CODUSU'), CurrentCosmosModule) then
     raise ECantAcessCosmosModule.Create(sErroCantAcessCosmosModuel);

    //Finalmente, usu�rio est� autenticado: registra-o e escreve um log do evento
     if AUserData.FindValue('USER_NAME') <> '' then
      begin
       FAditionalInfo := TStringList.Create;
       FAditionalInfo.Add('USER_NAME=' + AUserData.FindValue('USER_NAME'));
       FAditionalInfo.Add('MATRICULA=' + AUserData.FindValue('MATRICULA'));
       FAditionalInfo.Add('FOCO=' + AUserData.FindValue('FOCO'));
       FAditionalInfo.Add('DISCIPULADO=' + AUserData.FindValue('DISCIPULADO'));
       //FConnectionID := FrmMain.RegisterConnection(AUserData.FindValue('USER_NAME'), RoleName, HostName,
        //FAditionalInfo.CommaText);

       AUserData.WriteValue('CONNECTION_TIME', Now, 15);
       AUserData.WriteValue('CONNECTION_ID', '', 16);
       AUserData.WriteValue('CONNECTION_STATUS', 0, 17);

       AReturn.ServerData := AUserData.XMLData;
       Result := AReturn.ServerReturn;
       CreateLog(Format(sLogCorrectLogin, [AUserData.FindValue('USER_NAME'), RoleName]),EVENTLOG_AUDIT_SUCCESS);
      end;

     FConnectedUser.LoadInfo(AUserData);
    end;

  except
   on E: ELockedDatabaseError do //Banco de dados est� bloqueado pela sincroniza��o.
    begin
     AReturn.Code := 6;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := E.Message;
     AReturn.MessageTitle := sTitleCanceledAutentication;
     AReturn.SetMessageInfo(miInnerMessage, E.Message);
     Result := AReturn.ServerReturn;
     CreateLog(E.Message, EVENTLOG_AUDIT_FAILURE);
    end;
   on E: EDatabaseError do //Erro ocorrido durante tentativa de login
    begin
     AReturn.Code := 7;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := Format(sLogIncorrectLogin, [sUserName, E.Message]);
     AReturn.MessageTitle := sTitleCanceledAutentication;
     AReturn.SetMessageInfo(miInnerMessage, E.Message);
     Result := AReturn.ServerReturn;
     CreateLog(Format(sLogIncorrectLogin, [sUserName, E.Message]),EVENTLOG_AUDIT_FAILURE);
    end;
   on E: EIncorrectRoleAcess do //Usu�rio n�o � da role passada
    begin
     AReturn.Code := 8;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := Format(sLogIcorrectRole, [sUserName, RoleName]);
     AReturn.MessageTitle := sTitleInvalidAutentication;
     AReturn.SetMessageInfo(miInnerMessage, E.Message);
     Result := AReturn.ServerReturn;
     CreateLog(Format(sLogIcorrectRole, [sUserName, RoleName]),EVENTLOG_AUDIT_FAILURE);
    end;
   on E: ELockedServerError do //Servidor est� indispon�vel para novas conex�es
    begin
     AReturn.Code := 9;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := sLogLockedServer;
     AReturn.MessageTitle := sTitleCanceledAutentication;
     AReturn.SetMessageInfo(miInnerMessage, E.Message);
     Result := AReturn.ServerReturn;
     CreateLog(sLogLockedServer,EVENTLOG_AUDIT_FAILURE);
    end;
   on E: ECosmosSystemFailure do //Falha de sistema gen�rica...
    begin
     AReturn.Code := 10;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := E.Message;
     AReturn.MessageTitle := sTitleErrorAutentication;
     AReturn.SetMessageInfo(miInnerMessage, E.Message);
     Result := AReturn.ServerReturn;
     CreateLog(E.Message,EVENTLOG_ERROR_TYPE);
    end;
   on E: EValidateUser do //Dados fornecidos pelo usu�rio est�o incorretos...
    begin
     AReturn.Code := 11;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := sLoginFailure;
     AReturn.MessageTitle := sTitleInvalidAutentication;
     AReturn.SetMessageInfo(miInnerMessage, E.Message);
     Result := AReturn.ServerReturn;
     CreateLog(E.Message, EVENTLOG_AUDIT_FAILURE);
    end;
   on E: EUnknownUser do //N�o encontrou o usu�rio na tabela de usu�rios...
    begin
     AReturn.Code := 12;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := sLoginFailure;
     AReturn.MessageTitle := sTitleInvalidAutentication;
     AReturn.SetMessageInfo(miInnerMessage, E.Message);
     Result := AReturn.ServerReturn;
     CreateLog(E.Message, EVENTLOG_AUDIT_FAILURE);
    end;
   on E: ECantAcessCosmosModule do //Usu�rio n�o pdoe acessar o m�dulo do Cosmos.
    begin
     AReturn.Code := 13;
     AReturn.MessageType := mtpError;
     AReturn.MessageText := E.Message;
     AReturn.MessageTitle := sTitleInvalidAutentication;
     AReturn.SetMessageInfo(miInnerMessage, E.Message + ' : ' + sUserName);
     Result := AReturn.ServerReturn;
     CreateLog(E.Message + ' : ' + sUserName, EVENTLOG_AUDIT_FAILURE);
    end;
   on E: TDBXError do //Falha de sistema relacionada a banco de dados...
    begin
      if Pos('password', E.Message) > 0 then //Login ou senha inv�lidos.
       begin
        AReturn.Code := 14;
        AReturn.MessageType := mtpError;
        AReturn.MessageText := sLoginFailure;
        AReturn.MessageTitle := sTitleInvalidAutentication;
        AReturn.SetMessageInfo(miInnerMessage, E.Message);
        Result := AReturn.ServerReturn;
        CreateLog(E.Message, EVENTLOG_AUDIT_FAILURE);
       end
      else
       begin
        AReturn.Code := 14; //Erro desconhecido...
        AReturn.MessageType := mtpError;
        AReturn.MessageText := sErrorCosmosSystem;
        AReturn.MessageTitle := sTitleErrorAutentication;
        AReturn.SetMessageInfo(miInnerMessage, E.Message);
        Result := AReturn.ServerReturn;
        CreateLog(E.Message,EVENTLOG_ERROR_TYPE);
       end;
    end;
  end;

end;

procedure TCosmosCommonMethods.CreateLog(const Message: string;
  MsgType: Cardinal);
begin

end;

procedure TCosmosCommonMethods.CreateLog(E: Exception);
begin

end;

function TCosmosCommonMethods.CreateMessageData: TServerReturn;
begin

end;



function TCosmosCommonMethods.ExecuteCommand(CommandID: Integer;
  Params: OleVariant): OleVariant;
var
AReturn: TServerReturn;
begin
 //Executa um command DML simples (uma linha) no servidor SQL.
 AReturn := self.CreateMessageData;

 try
  AReturn.Code := 0;
  AReturn.ServerData := DMCosmosUserData.ExecuteCommand(CommandID, Params);
  Result := AReturn.ServerReturn;

 except
  on E: Exception do
   begin
    AReturn.Code := -1;
    AReturn.MessageType := mtpError;
    AReturn.MessageText := sErrorExecuteDML;
    AReturn.MessageTitle := sTitleExecuteDML;
    AReturn.SetMessageInfo(miInnerMessage, E.Message);
    Result := AReturn.ServerReturn;

    if Assigned(AReturn) then AReturn.Free;

    CreateLog(E.Message, EVENTLOG_ERROR_TYPE);
   end;
 end;

end;

function TCosmosCommonMethods.ExecuteDQL(SearchID: Integer;
  Params: OleVariant): OleVariant;
var
AReturn: TServerReturn;
begin
//Executa uma pesquisa padr�o do Cosmos.
 AReturn := self.CreateMessageData;

 try
  AReturn.ServerData := DMCosmosUserData.ExecuteDQL(SearchID, Params);
  Result := AReturn.ServerReturn;

 except
  on E: Exception do
   begin
    AReturn.Code := -1;
    AReturn.MessageType := mtpError;
    AReturn.MessageText := sErrorSelectData;
    AReturn.MessageTitle := sTitleErrorSelectData;
    AReturn.SetMessageInfo(miInnerMessage, E.Message);
    AReturn.ServerData := unassigned;
    Result := AReturn.ServerReturn;
    CreateLog(E.Message, EVENTLOG_ERROR_TYPE);
   end;
 end;

end;

function TCosmosCommonMethods.ExecuteRegisteredSearch(SearchId: Integer;
  Params: OleVariant): OleVariant;
var
AReturn: TServerReturn;
begin
//Executa uma pesquisa existente na tabela da Central de Pesquisas.
 AReturn := self.CreateMessageData;

 try
  AReturn.ServerData := DMCosmosUserData.ExecuteRegisteredSearch(SearchId, Params);
  Result := AReturn.ServerReturn;

 except
  on E: Exception do
   begin
    AReturn.Code := -1;
    AReturn.MessageType := mtpError;
    AReturn.MessageText := sErrorSelectData;
    AReturn.MessageTitle := sTitleErrorSelectData;
    AReturn.SetMessageInfo(miInnerMessage, E.Message);
    AReturn.ServerData := unassigned;
    Result := AReturn.ServerReturn;
    CreateLog(E.Message, EVENTLOG_ERROR_TYPE);
   end;
 end;
end;

function TCosmosCommonMethods.GetCosmosSearchsInfo: OleVariant;
var
AReturn: TServerReturn;
begin
{Retorna para o cliente o caminho de um arquivo XML com as configura��es das
 pesquisas que podem ser executadas por meio da ferramenta "Central de Relat�rios.}

 AReturn := self.CreateMessageData;

 try
  AReturn.ServerData := TCosmosMethods.GetCosmosSearchs;
  Result := AReturn.ServerReturn;

 except
  on E: Exception do
   begin
    AReturn.Code := -1;
    AReturn.MessageType := mtpError;
    AReturn.MessageText := sErrorGetCommand;
    AReturn.MessageTitle := sTitleGetCommands;
    AReturn.SetMessageInfo(miInnerMessage, E.Message);
    Result := AReturn.ServerReturn;

    if Assigned(AReturn) then AReturn.Free;

    CreateLog(E.Message, EVENTLOG_ERROR_TYPE);
   end;
 end;
end;

function TCosmosCommonMethods.GetCurrentCosmosModule: TCosmosModules;
begin
{Retorna o m�dulo do Cosmos que est� sendo executado.}
end;

function TCosmosCommonMethods.GetSequenceValue(
  const SequenceName: WideString): OleVariant;
var
AReturn: TServerReturn;
begin
 //Obt�m o valor atual de uma sequence a partir do nome da sequence e da faixa
 //de chaves prim�rias.
 AReturn := self.CreateMessageData;

 try
  AReturn.Code := 0;
  AReturn.ServerData := DMCosmosUserData.GetSequenceValue(SequenceName);
  Result := AReturn.ServerReturn;

  if Assigned(AReturn) then
   AReturn.Free;

 except
  on E: Exception do
   begin
    AReturn.Code := -1;
    AReturn.MessageType := mtpError;
    AReturn.MessageText := sErrorSelectSequenceData;
    AReturn.MessageTitle := sTitleErrorSelectData;
    AReturn.SetMessageInfo(miInnerMessage, E.Message);
    Result := AReturn.ServerReturn;

    if Assigned(AReturn) then AReturn.Free;
    self.CreateLog(E.Message, EVENTLOG_ERROR_TYPE);
   end;
 end;
end;

function TCosmosCommonMethods.GetUserStatus(
  const UserName: string): TUserStatus;
var
 UserManager: TCosmosUsersManager;
begin
//Verifica o status do usu�rio...
 UserManager := TCosmosUsersManager.Create;

 try
  Result := UserManager.GetUserStatus(UserName);

  if Assigned(UserManager) then
   FreeAndNil(UserManager);

 except
  on E: Exception do
   begin
    Result := usUnknown;
    if Assigned(UserManager) then
     FreeAndNil(UserManager);

    self.CreateLog(E.Message, EVENTLOG_ERROR_TYPE);
   end;
 end;
end;

function TCosmosCommonMethods.Get_BetaVersion: WordBool;
begin
//Retorna se a vers�o da aplica��o servidora � beta.
 Result := False;
end;

function TCosmosCommonMethods.Get_CodeKey: OleVariant;
var
AReturn: TServerReturn;
begin
//L� a chave din�mica para opera��o de criptografia e descriptografia.
 AReturn := self.CreateMessageData;

 try
  AReturn.Code := 0;
  AReturn.ServerData := FCodeKey;
  Result := AReturn.ServerReturn;

  if Assigned(AReturn) then
   FreeAndNil(AReturn);

 except
  on E: Exception do
   begin
    if Assigned(AReturn) then
     begin
      AReturn.Code := -1;
      AReturn.ServerData := '';
      AReturn.MessageType := mtpError;
      AReturn.MessageText := sErrorGetCodeKey;
      AReturn.MessageTitle := sTitleServerConection;
      AReturn.SetMessageInfo(miInnerMessage, E.Message);
      Result := AReturn.ServerReturn;
      AReturn.Free;
     end;

    self.CreateLog(E.Message, EVENTLOG_ERROR_TYPE);
   end;
 end;
end;

function TCosmosCommonMethods.Get_DatabaseVersion: OleVariant;
var
AReturn: TServerReturn;
begin
//Obt�m a vers�o do banco de dados
 AReturn := self.CreateMessageData;

 try
  AReturn.ServerData := DMCosmosUserData.Get_DatabaseVersion;
  Result := AReturn.ServerReturn;

  if Assigned(AReturn) then
   FreeAndNil(AReturn);

 except
  on E: Exception do
   begin
    AReturn.Code := -1;
    AReturn.MessageType := mtpError;
    AReturn.MessageText := sErrorSelectData;
    AReturn.MessageTitle := sTitleErrorSelectData;
    AReturn.ServerData := unassigned;
    Result := AReturn.ServerReturn;
    if Assigned(AReturn) then AReturn.Free;

    CreateLog(E.Message, EVENTLOG_ERROR_TYPE);
   end;
 end;
end;

function TCosmosCommonMethods.ServerDateTime: TDateTime;
begin
 //Retorna a data e hora no servidor.
 Result := Now;
end;

function TCosmosCommonMethods.IsAdministrator(
  const UserName: WideString): OleVariant;
var
AReturn: TServerReturn;
AUserManager: TCosmosUsersManager;
begin
//Checa se um usu�rio � um administrador do sistema.
 AUserManager := TCosmosUsersManager.Create;
 AReturn := self.CreateMessageData;

 try
  AReturn.ServerData := AUserManager.IsAdministrator(UserName);
  Result := AReturn.ServerReturn;

 finally
  if Assigned(AUserManager) then AUserManager.Free;
  if Assigned(AReturn) then AReturn.Free;
 end;
end;

end.


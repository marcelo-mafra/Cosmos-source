unit cosmos.classes.servers.security;

{Todos as opera��es executadas nos m�todos desta classe s�o executadas usando
 o usu�rio SYSDBA. O sistema assume uma senha padr�o para este usu�rio. Estas
 opera��es falhar�o caso n�o seja usado o usu�rio SYSDBA.}

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, cosmos.servers.sqlcommands,
  Data.DB, Datasnap.DBClient, Data.SqlExpr,
  cosmos.system.types, cosmos.system.messages, cosmos.classes.application,
  cosmos.system.exceptions, cosmos.classes.dataobjects, System.WideStrings,
  Data.DBXCommon, Data.DBXFirebird;

type
  TCosmosUser = class
   private
    FUserData: TCosmosData;
    function GetUserName: string;
    function GetUserRole: string;

   public
    constructor Create;
    destructor Destroy; override;
    procedure LoadInfo(AUserData: TCosmosData);

    property UserName: string read GetUserName;
    property UserRole: string read GetUserRole;
  end;


  TCosmosUsersManager = class(TSQLServerObject)

  private
  { Private declarations }
   sSystemUser: string;

   function CreateDataset(Connection: TSQLConnection): TSQLDataset; inline;

   procedure CloseDataset(Dataset: TDataset);
   function HasCosmosUser(const UserName: string): boolean; inline;
   function UserIsBlocked(const UserName: string): boolean; inline;


  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

   function ChangePassword(const UserName, NewPassword: string): integer;
   function CreateUser(UserData, FocusData: Olevariant; ActiveRange: integer): boolean;
   function DeleteUser(const codusu: integer): boolean;
   function GetUserStatus(const UserName: string): TUserStatus;
   procedure GetUserRoles(const UserName: string; List: TStringList);
   function GrantRole(const UserName, RoleName: string): boolean;
   function RevokeRole(const UserName, RoleName: string): boolean;
   procedure ListServerUsers(List: TStringList);
   function LockCosmosUser(const codusu: integer): boolean;
   function UnlockCosmosUser(const codusu: integer): boolean;
   procedure GetUserInfo(const UserName, Password, RoleName: WideString;
     var UserData: TCosmosData);
   function IsAdministrator(const UserName: WideString): boolean;
   procedure SetAdministrator(const Value: string; UserId: integer);
  end;

implementation

{ TDMUsersManager }

constructor TCosmosUsersManager.Create;
begin
 inherited Create;
 end;

function TCosmosUsersManager.CreateDataset(
  Connection: TSQLConnection): TSQLDataset;
begin
 Result := TSQLDataset.Create(nil);
 Result.SQLConnection := Connection;
end;

function TCosmosUsersManager.CreateUser(UserData,
  FocusData: Olevariant; ActiveRange: integer): boolean;
var
NewUserID, RoleID, codfoc, codcad: integer;
AScript: TStringList;
AConnection: TSQLConnection;
ACommand: TSQLServerCommand;
ASQLDataset: TSQLDataset;
ADataset: TClientDataset;
logusu, password, rolename, indati, indadm, tipper, indsec, indfin: string;
indblo, indpro, indcon, indfoc, indusu: string;
begin
//Cria um novo usu�rio do sistema cosmos e atribui os focos que possuir� acesso.
 ACommand := TSQLServerCommand.Create;
 AConnection := ACommand.CreateConnection;

 ASQLDataset := TSQLDataset.Create(nil);
 ASQLDataset.SQLConnection := AConnection;

 ADataset := TClientDataset.Create(nil);
 AScript := TStringList.Create;

 try

  with ADataset do
   begin
    Data := UserData;
    logusu := Fields.FieldByName('logusu').AsString;
    password := TDataTransformation.Criptografar(Fields.FieldByName('passwrd').AsString);
    rolename := Fields.FieldByName('rolename').AsString;
    codcad := Fields.FieldByName('codcad').AsInteger;
    indati := Fields.FieldByName('indati').AsString;
    indadm := Fields.FieldByName('indadm').AsString;
    indblo := Fields.FieldByName('indblo').AsString;
    indpro := Fields.FieldByName('indpro').AsString;
   end;

   //Primeiro, verifica se o usu�rio j� n�o est� cadastrado.
   if HasCosmosUser(logusu) then
    raise EDuplicatedCosmosUser.Create(TCosmosErrorSecurityMsg.UsuarioExists);


   {Checa se um cadastrado j� possui um login.}
   CloseDataset(ASQLDataset);
   ACommand.ExecuteDQL(Format(TGUsersCommands.UsuarioByCadastrado, [codcad]), ASQLDataset);

   if not ASQLDataset.IsEmpty then
    raise EDuplicatedCosmosUser.Create(TCosmosErrorMsg.LoginAlreadyExists);

   {Obt�m o c�digo da Role do usu�rio.}
   CloseDataset(ASQLDataset);
   ACommand.ExecuteDQL(Format(TGUsersCommands.CodigoPerfil, [QuotedStr(RoleName)]), ASQLDataset);

   if not ASQLDataset.IsEmpty then
    RoleID := ASQLDataset.Fields.Fields[0].Value
   else
    raise EUnknownRole.Create(TCosmosErrorSecurityMsg.UnknownProfile);


   //Agora, insere na tabela de usu�rios do Cosmos as informa��es sobre o novo
   //usu�rio e os focos que pode acessar.
   CloseDataset(ASQLDataset);
   ACommand.ExecuteDQL(Format(TDQLCommand.Generators, [TSequencesNames.GEN_USUARIOS, 1]), ASQLDataset);
   NewUserID := ASQLDataset.Fields.Fields[0].AsInteger + ActiveRange;
   CloseDataset(ASQLDataset);

   //Monta o comando de cria��o do usu�rio.
   AScript.Append(Format(TSecurityCommand.InsertCosmosUser, [NewUserID, QuotedStr(logusu), QuotedStr(Password), codcad,
   QuotedStr(indati), QuotedStr(indadm), QuotedStr(indblo), QuotedStr(indpro)]));

   //Monta o comando de cria��o do perfil do usu�rio.
   AScript.Append(Format(TSecurityCommand.InsertPerfilUsuario, [NewUserID, RoleId]));

   //Monta os comandos de permiss�o de acesso aos n�cleos.
   ADataset.Data := FocusData;
    while not ADataset.Eof do
     begin
      codfoc := ADataset.Fields.FieldByName('codfoc').AsInteger;
      tipper := QuotedStr(ADataset.Fields.FieldByName('tipper').AsString);
      indsec := QuotedStr(ADataset.Fields.FieldByName('indsec').AsString);
      indfin := QuotedStr(ADataset.Fields.FieldByName('indfin').AsString);
      indcon := QuotedStr(ADataset.Fields.FieldByName('indcon').AsString);
      indfoc := QuotedStr(ADataset.Fields.FieldByName('indfoc').AsString);
      indusu := QuotedStr(ADataset.Fields.FieldByName('indusu').AsString);

      AScript.Append(Format(TSecurityCommand.InsertPrivilegios, [NewUserID, codfoc, tipper, indsec,
       indfin, indcon, indfoc, indusu]));
      ADataset.Next;
     end;

   Result := ACommand.ExecuteScript(AConnection, AScript);

   //Usu�rio criado com sucesso.

   if Assigned(ADataset) then FreeAndNil(ADataset);
   if Assigned(AScript) then FreeAndNil(AScript);
   if Assigned(ACommand) then FreeAndNil(ACommand);
   if Assigned(AConnection) then FreeAndNil(AConnection);

 except
  begin
   if Assigned(ADataset) then FreeAndNil(ADataset);
   if Assigned(AScript) then FreeAndNil(AScript);
   if Assigned(ACommand) then FreeAndNil(ACommand);
   if Assigned(AConnection) then FreeAndNil(AConnection);

   raise;
  end;
 end;
end;

destructor TCosmosUsersManager.Destroy;
begin
  inherited;
end;

function TCosmosUsersManager.ChangePassword(const UserName,
  NewPassword: string): integer;
var
ADML: string;
ADataset: TSQLDataset;
AConnection: TSQLConnection;
ACommand: TSQLServerCommand;
begin
//Altera a senha de um usu�rio.
 ACommand := TSQLServerCommand.Create;
 AConnection := ACommand.CreateConnection;
 ADataset := TSQLDataset.Create(nil);
 ADataset.SQLConnection := AConnection;

 try
  ADML := Format(TSecurityCommand.UsuarioByLogin, [QuotedStr(UpperCase(UserName))]);
  ACommand.ExecuteDQL(ADML, ADataset);

  if ADataset.IsEmpty then
   begin
    CloseDataset(ADataset);
    Result := 2;
   end
  else
   begin
    CloseDataset(ADataset);
    ADML := Format(TSecurityCommand.ChangePassword, [QuotedStr(TDataTransformation.Criptografar(NewPassword)), QuotedStr(LowerCase(UserName))]);

    Result := ACommand.ExecuteCommand(ADML);
    if Result = 0 then //O comando n�o alterou nenhum registro!
     raise ECreateCosmosUser.Create(Format(TCosmosErrorMsg.PasswordUpdate, [UserName]));

    if Assigned(ADataset) then FreeAndNil(ADataset);

    if Assigned(AConnection) then
     begin
      AConnection.Close;
      FreeAndNil(AConnection);
     end;

    if Assigned(ACommand) then FreeAndNil(ACommand);
   end;

 except
  on E: Exception do
   begin
    Result := 2;
    if Assigned(ADataset) then
     begin
      ADataset.Close;
      FreeAndNil(ADataset);
     end;

    if Assigned(AConnection) then
     begin
      AConnection.Close;
      FreeAndNil(AConnection);
     end;

    if Assigned(ACommand) then FreeAndNil(ACommand);

    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;
end;

procedure TCosmosUsersManager.CloseDataset(Dataset: TDataset);
begin
 if (Dataset <> nil) and (Dataset.Active) then
  Dataset.Close;
end;

function TCosmosUsersManager.DeleteUser(const codusu: integer): boolean;
var
ADML: string;
AConnection: TSQLConnection;
begin
//Exclui um usu�rio.
 AConnection := self.CreateConnection;

 try
  AConnection.Open;
  ADML := Format(TGUsersCommands.DeleteUser, [codusu]);
  Result := AConnection.ExecuteDirect(ADML) > 0;

  if Assigned(AConnection) then
   begin
    AConnection.Close;
    FreeAndNil(AConnection);
   end;

 except
  on E: Exception do
   begin
    if Assigned(AConnection) then
     begin
      AConnection.Close;
      FreeAndNil(AConnection);
     end;

    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;
end;

procedure TCosmosUsersManager.GetUserInfo(const UserName, Password,
  RoleName: WideString; var UserData: TCosmosData);
var
 ACommand: TSQLServerCommand;
 AList: TStringList;
 AConnection: TSQLConnection;
 ADataset: TSQLDataset;
begin
 AList := TStringList.Create;
 ACommand := TSQLServerCommand.Create;
 AConnection := CreateConnection;
 ADataset := self.CreateDataset(AConnection);

 try
  ACommand.ExecuteDQL(Format(TSecurityCommand.UsuarioInfo, [QuotedStr(UserName)]), ADataset);

  //Testa se o login do usu�rio existe...
  if ADataset.IsEmpty then //N�o encontrou um usu�rio com o login indicado...
    raise EUnknownUser.Create(TCosmosErrorSecurityMsg.UnknownUser);

  //Testa se a senha do usu�rio est� correta. O teste � feito com a senha criptografada.
  if Password <> ADataset.Fields.FieldByName('paswrd').AsString then //Senha do usu�rio � inv�lida...
    raise EValidateUser.Create(TCosmosErrorMsg.PasswordNotConfirmed);

  if Assigned(UserData) then
   begin
    with ADataset.Fields do
     begin
      UserData.WriteValue('CODUSU', FieldByName('codusu').AsInteger);
      UserData.WriteValue('LOGIN', FieldByName('logusu').AsString, 1);
      UserData.WriteValue('USER_NAME', FieldByName('nomcad').AsString, 2);
      UserData.WriteValue('FOCO', FieldByName('sigfoc').AsString, 3);
      UserData.WriteValue('MATRICULA', FieldByName('matcad').AsString, 4);
      UserData.WriteValue('DISCIPULADO', FieldByName('sigdis').AsString, 5);

      //Usu�rio est� ativo?
      if FieldByName('indati').Value = 'S' then
       UserData.WriteValue('ATIVO', True, 6)
      else
       UserData.WriteValue('ATIVO', False, 6);

      //Usu�rio � administrador?
      if FieldByName('indadm').Value = 'S' then
       UserData.WriteValue('ADM', True, 7)
      else
       UserData.WriteValue('ADM', False, 7);
     end;

    //Testa se a role do usu�rio est� correta.
    self.GetUserRoles(UserName, AList);

    if AList.IndexOf(RoleName) < 0 then
     raise EIncorrectRoleAcess.Create(TCosmosErrorMsg.IncorrectRoleName);

    if Assigned(AList) then
     FreeAndNil(AList);

    //Agora, checa quais campos de trabalho poder�o ser acessados pelo usu�rio.
    ACommand.ExecuteDQL(Format(TSecurityCommand.PerfilUsuario, [QuotedStr(UpperCase(RoleName))]), ADataset);
    with ADataset.Fields do
     begin
      UserData.WriteValue('INDLEC', FieldByName('INDLEC').AsString, 8);
      UserData.WriteValue('INDTMO', FieldByName('INDTMO').AsString, 9);
      UserData.WriteValue('INDTMB', FieldByName('INDTMB').AsString, 10);
      UserData.WriteValue('INDTPU', FieldByName('INDTPU').AsString, 11);
      UserData.WriteValue('INDEIN', FieldByName('INDEIN').AsString, 12);
      UserData.WriteValue('ABRANGENCIA', FieldByName('ABRPER').AsString, 13);
     end;
   end;

 if Assigned(ACommand) then FreeAndNil(ACommand);
 if Assigned(ADataset) then FreeAndNil(ADataset);
 if Assigned(AConnection) then FreeAndNil(AConnection);
 if Assigned(AList) then FreeAndNil(AList);

 except
  if Assigned(ACommand) then FreeAndNil(ACommand);
  if Assigned(ADataset) then FreeAndNil(ADataset);
  if Assigned(AConnection) then FreeAndNil(AConnection);
  if Assigned(AList) then FreeAndNil(AList);
  raise;
 end;

end;

procedure TCosmosUsersManager.GetUserRoles(const UserName: string;
  List: TStringList);
var
sDQL: string;
AConnection: TSQLConnection;
ADataset: TSQLDataset;
begin
//Lista as roles atribu�das a um usu�rio.
 AConnection := CreateConnection;
 ADataset := CreateDataset(AConnection);

 try
  AConnection.Open;
  sDQL := Format(TGUsersCommands.UserRoles, [QuotedStr(UserName)]);
  ADataset.CommandText := sDQL;
  ADataset.Open;

  while not ADataset.Eof do
   begin
    List.Append(TrimRight(ADataset.Fields.FieldByName('nomper').AsString));
    ADataset.Next;
   end;

  if Assigned(ADataset) then
   begin
    self.CloseDataset(ADataset);
    FreeAndNil(ADataset);
   end;

  if Assigned(AConnection) then
   begin
    AConnection.Close;
    FreeAndNil(AConnection);
   end;

 except
  on E: Exception do
   begin
    if Assigned(ADataset) then
     begin
      self.CloseDataset(ADataset);
      FreeAndNil(ADataset);
     end;

    if Assigned(AConnection) then
     begin
      AConnection.Close;
      FreeAndNil(AConnection);
     end;

    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;

end;

function TCosmosUsersManager.GetUserStatus(const UserName: string): TUserStatus;
var
vCosmosUser, vBlockedUser: boolean;
begin
 Result := usUnknown;

 //Verifica se o usu�rio que est� acessando � o sysdba
 if LowerCase(UserName) = sSystemUser then
  begin
   Result := usSysdba;
   Exit;
  end;

 try
  //Verifica se o usu�rio est� cadastrado na tabela de usu�rios do Cosmos.
  vCosmosUser := self.HasCosmosUser(UserName);

 except
  Result := usUnknown;
  Exit;
 end;

  //...Se estiver, verifica se o usu�rio est� bloqueado
 if vCosmosUser = True then
  vBlockedUser := self.UserIsBlocked(UserName)
 else
   vBlockedUser := False;


 //Agora, "calcula" o status do usu�rio.
 if (vCosmosUser = True) and (vBlockedUser = False) then
  Result := usCosmosUser;

 if (vCosmosUser = True) and (vBlockedUser = True) then
  Result := usBlockedUser;

 if (vCosmosUser = False) then
  Result := usUnknown;
end;

function TCosmosUsersManager.GrantRole(const UserName, RoleName: string): boolean;
var
ADML: string;
AConnection: TSQLConnection;
ACommand: TSQLServerCommand;
ADataset: TSQLDataset;
codusu, codper: integer;
begin
//Atribui uma role a um usu�rio.
 ACommand := TSQLServerCommand.Create;
 AConnection := ACommand.CreateConnection;
 ADataset := TSQLDataset.Create(nil);

 try
  ADataset.SQLConnection := AConnection;
  AConnection.Open;

  //Primeiro, obt�m o c�digo do usu�rio passado em par�mentro.
  ADML := Format(TSecurityCommand.UserInfo, [QuotedStr(UpperCase(UserName))]);
  ADataset.CommandText := ADML;
  ADataset.Open;

  if not ADataset.IsEmpty then
   codusu := ADataset.Fields.FieldByName('CODUSU').AsInteger
  else
   raise ESetProfileUser.Create(TCosmosErrorSecurityMsg.SetUserProfile);

  self.CloseDataset(ADataset);

  //Agora, obt�m o c�digo do perfil passado em par�mentro.
  ADML := Format(TGUsersCommands.CodigoPerfil, [QuotedStr(UpperCase(RoleName))]);
  ADataset.CommandText := ADML;
  ADataset.Open;

  if not ADataset.IsEmpty then
   codper := ADataset.Fields.FieldByName('CODPER').AsInteger
  else
   raise ESetProfileUser.Create(TCosmosErrorSecurityMsg.SetUserProfile);

  self.CloseDataset(ADataset);

  //Executa o comando para inserir atribuir o perfil ao usu�rio.
  Result :=  ACommand.ExecuteCommand(Format(TSecurityCommand.InsertPerfilUsuario, [codusu, codper])) > 0;

  if Assigned(ADataset) then FreeAndNil(ADataset);

  if Assigned(AConnection) then
   begin
    AConnection.Close;
    FreeAndNil(AConnection);
   end;

  if Assigned(ACommand) then FreeAndNil(ACommand);

 except
  on E: Exception do
   begin
    Result := False;

    if Assigned(ADataset) then FreeAndNil(ADataset);

    if Assigned(AConnection) then
     begin
      AConnection.Close;
      FreeAndNil(AConnection);
     end;

    if Assigned(ACommand) then FreeAndNil(ACommand);

    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;

end;

function TCosmosUsersManager.HasCosmosUser(const UserName: string): boolean;
var
sDQL: string;
AConnection: TSQLConnection;
ADataset: TSQLDataset;
begin
//Verifica se um usu�rio est� cadastrado na tabela de usu�rios do Cosmos.
 AConnection := CreateConnection;
 ADataset := CreateDataset(AConnection);

 try
  AConnection.Open;
  sDQL := Format(TSecurityCommand.UserInfo, [QuotedStr(UserName)]);
  ADataset.CommandText := sDQL;
  ADataset.Open;

  Result := not ADataset.IsEmpty;

  if Assigned(ADataset) then
   begin
    self.CloseDataset(ADataset);
    FreeAndNil(ADataset);
   end;

  if Assigned(AConnection) then
   begin
    AConnection.Close;
    FreeAndNil(AConnection);
   end;

 except
  on E: Exception do
   begin
    Result := False;

    if Assigned(ADataset) then
     begin
      self.CloseDataset(ADataset);
      FreeAndNil(ADataset);
     end;

    if Assigned(AConnection) then
     begin
      AConnection.Close;
      FreeAndNil(AConnection);
     end;

    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;
end;

function TCosmosUsersManager.IsAdministrator(
  const UserName: WideString): boolean;
var
AConnection: TSQLConnection;
ADataset: TSQLDataset;
begin
//Checa se um usu�rio � um administrador do sistema.
 AConnection := CreateConnection;
 ADataset := CreateDataset(AConnection);

 try
  ADataset.CommandText := Format(TSecurityCommand.AdmUser,[QuotedStr(UserName)]);
  ADataset.Open;
  Result := ADataset.Fields.Fields[0].AsString = 'S';

 finally
  if Assigned(ADataset) then FreeAndNil(ADataset);
  if Assigned(AConnection) then FreeAndNil(AConnection);
 end;
end;

procedure TCosmosUsersManager.ListServerUsers(List: TStringList);
begin

end;

function TCosmosUsersManager.LockCosmosUser(const codusu: integer): boolean;
var
ACommand: TSQLServerCommand;
begin
//Bloqueia um usu�rio do Cosmos.
 ACommand := TSQLServerCommand.Create;

 try
  //Executa o comando para bloquear o usu�rio.
  Result := ACommand.ExecuteCommand(Format(TGUsersCommands.LockUser, [QuotedStr('S'), codusu])) > 0;

  if Assigned(ACommand) then FreeAndNil(ACommand);

 except
  on E: Exception do
   begin
    if Assigned(ACommand) then  FreeAndNil(ACommand);

    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;
end;

function TCosmosUsersManager.RevokeRole(const UserName,
  RoleName: string): boolean;
var
ADML: string;
AConnection: TSQLConnection;
ACommand: TSQLServerCommand;
ADataset: TSQLDataset;
codusu, codper: integer;
begin
//Retira uma role de um usu�rio.
 ACommand := TSQLServerCommand.Create;
 AConnection := ACommand.CreateConnection;
 ADataset := TSQLDataset.Create(nil);

 try
  ADataset.SQLConnection := AConnection;
  AConnection.Open;

  //Primeiro, obt�m o c�digo do usu�rio passado em par�mentro.
  ADML := Format(TSecurityCommand.UserInfo, [QuotedStr(UpperCase(UserName))]);
  ACommand.ExecuteDQL(ADML, ADataset);

  if not ADataset.IsEmpty then
   codusu := ADataset.Fields.FieldByName('CODUSU').AsInteger
  else
   raise ESetProfileUser.Create(TCosmosErrorSecurityMsg.SetUserProfile);

  self.CloseDataset(ADataset);

  //Agora, obt�m o c�digo do perfil passado em par�mentro.
  ADML := Format(TGUsersCommands.CodigoPerfil, [QuotedStr(UpperCase(RoleName))]);
  ACommand.ExecuteDQL(ADML, ADataset);

  if not ADataset.IsEmpty then
   codper := ADataset.Fields.FieldByName('CODPER').AsInteger
  else
   raise ESetProfileUser.Create(TCosmosErrorSecurityMsg.SetUserProfile);

  self.CloseDataset(ADataset);

  //Executa o comando para inserir atribuir o perfil ao usu�rio.
  Result := ACommand.ExecuteCommand(Format(TSecurityCommand.DelPerfilUsuario, [codusu, codper])) > 0;

  if Assigned(ADataset) then FreeAndNil(ADataset);

  if Assigned(AConnection) then
   begin
    AConnection.Close;
    FreeAndNil(AConnection);
   end;

  if Assigned(ACommand) then FreeAndNil(ACommand);

 except
  on E: Exception do
   begin
    if Assigned(ADataset) then FreeAndNil(ADataset);

    if Assigned(AConnection) then
     begin
      AConnection.Close;
      FreeAndNil(AConnection);
     end;

    if Assigned(ACommand) then FreeAndNil(ACommand);

    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;
end;

procedure TCosmosUsersManager.SetAdministrator(const Value: string;
  UserId: integer);
var
ACommand: TSQLServerCommand;
begin
{Atribui ou retira os direitos de administrador do sistema para um usu�rio.}
 ACommand := TSQLServerCommand.Create;

 try
  //Executa o comando...
  ACommand.ExecuteCommand(Format(TGUsersCommands.UserAdministrator, [QuotedStr(Value), UserId]));

  if Assigned(ACommand) then FreeAndNil(ACommand);

 except
  on E: Exception do
   begin
    if Assigned(ACommand) then FreeAndNil(ACommand);
    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;
end;

function TCosmosUsersManager.UnlockCosmosUser(const codusu: integer): boolean;
var
ACommand: TSQLServerCommand;
begin
//Desbloqueia um usu�rio do Cosmos.
 ACommand := TSQLServerCommand.Create;

 try
  //Executa o comando para desbloquear o usu�rio.
  Result := ACommand.ExecuteCommand(Format(TGUsersCommands.LockUser, [QuotedStr('N'), codusu])) > 0;

  if Assigned(ACommand) then FreeAndNil(ACommand);

 except
  on E: Exception do
   begin
    if Assigned(ACommand) then FreeAndNil(ACommand);

    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;
end;

function TCosmosUsersManager.UserIsBlocked(const UserName: string): boolean;
var
sDQL: string;
AConnection: TSQLConnection;
ADataset: TSQLDataset;
begin
//Verifica se um usu�rio est� bloqueado.
 AConnection := self.CreateConnection;
 ADataset := TSQLDataset.Create(nil);
 ADataset.SQLConnection := AConnection;

 try
  AConnection.Open;
  sDQL := Format(TSecurityCommand.UsuarioInfo, [QuotedStr(UserName)]);
  ADataset.CommandText := sDQL;
  ADataset.Open;

  Result := (ADataset.RecordCount > 0) and (ADataset.Fields.FieldByName('indblo').Value = 'S');


 finally
  if Assigned(ADataset) then
   begin
    self.CloseDataset(ADataset);
    FreeAndNil(ADataset);
   end;

  if Assigned(AConnection) then
   begin
    AConnection.Close;
    FreeAndNil(AConnection);
   end;
 end;
end;

{ TCosmosUser }

constructor TCosmosUser.Create;
begin
 inherited Create;
 FUserData := TCosmosData.Create(20);
end;

destructor TCosmosUser.Destroy;
begin
  FUserData.Free;
  inherited;
end;

function TCosmosUser.GetUserName: string;
begin
 Result := FUserData.FindValue('USER_NAME');
end;

function TCosmosUser.GetUserRole: string;
begin
 Result := FUserData.FindValue('ROLE_NAME');
end;

procedure TCosmosUser.LoadInfo(AUserData: TCosmosData);
begin
 FUserData.CopyData(AUserData);
end;


end.

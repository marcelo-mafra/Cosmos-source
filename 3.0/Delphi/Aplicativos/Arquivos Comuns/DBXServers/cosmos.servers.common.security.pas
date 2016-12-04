unit cosmos.servers.common.security;

interface

uses
  System.SysUtils, System.Classes,  Datasnap.Provider, Data.DB, Datasnap.DBClient,
  Data.DBXFirebird, Data.SqlExpr, Data.DBXCommon, System.Variants,
  cosmos.system.types, cosmos.system.messages,cosmos.servers.sqlcommands,
  cosmos.classes.application, cosmos.classes.logs;


 type
  TCosmosSecurity = class

   public
    class function LockCosmosUser(const codusu: integer): boolean;
    class function CanAcessModule(const UserName: string; Module: TCosmosModules): boolean;
    class function CreatePassword: string;
    class function AuthenticateUser(const UserName, Password: string): boolean;
    class procedure GetUserRoles(const UserName: string; Roles: TStrings);
    class function ChangePassword(const UserName, NewPassword: string): boolean;
    class function PasswordIsTemporary(const UserName: string): boolean;
    class function UserIsBlocked(const UserName: string): boolean;
    class procedure ResetPasword(const UserName: string; out NewPassword: string);
    class procedure GetCosmosUserInfo(const UserName: string; AData: TStringList);
  end;

implementation

uses cosmos.servers.common.dataacess, cosmos.servers.common.services;

{ TComosSecurity }

class function TCosmosSecurity.AuthenticateUser(const UserName,
  Password: string): boolean;
var
 ADataset: TSQLDataset;
begin
 {Autentica o usu�rio com a senha passada em par�metro. A autentica��o basicamente
  verifica se existe um usu�rio com login e senha passados. Este m�todo n�o verifica
  se o usu�rio est� ativo ou bloqueado.}
 ADataset := DMServerDataAcess.CreateDataset;

 try
  ADataset.CommandText := Format(TSecurityCommand.LoginUser, [UserName.QuotedString, Password.QuotedString]);

  ADataset.Open;
  Result := ADataset.RecordCount > 0;

  DMCosmosServerServices.RegisterLog(Format(TCosmosLogs.SQLCommand, [ADataset.CommandText]), '', leOnInformation);

  if Assigned(ADataset) then FreeAndNil(ADataset);

 except
  on E: Exception do
   begin
    Result := False;
    if Assigned(ADataset) then FreeAndNil(ADataset);
    DMCosmosServerServices.RegisterLog(E.Message, '', leOnError);
   end;
 end;
end;

class function TCosmosSecurity.CanAcessModule(const UserName: string;
  Module: TCosmosModules): boolean;
var
 I: integer;
 ADQL, sModule: string;
 ADataset: TSQLDataset;
begin
 // Verifica se um usu�rio pode acessar um m�dulo do Cosmos.
 case Module of
   cmFocos, cmFocosServer: sModule := sModule.Format('pri.INDFOC = %s', [QuotedStr('S')]);   //do not localize!
   cmSecretarias, cmSecretariasServer: sModule := sModule.Format('pri.INDSEC = %s', [QuotedStr('S')]);  //do not localize!
   cmFinanceiro, cmFinanceiroServer: sModule := sModule.Format('pri.INDFIN = %s', [QuotedStr('S')]);  //do not localize!
   cmConferencias, cmConferenciasServer: sModule := sModule.Format('pri.INDCON = %s', [QuotedStr('S')]);   //do not localize!
   cmUsuarios, cmUsuariosServer: sModule := sModule.Format('pri.INDUSU = %s', [QuotedStr('S')]);  //do not localize!
 end;

 ADataset := DMServerDataAcess.CreateDataset;
 I := 0;

 try
  ADQL := ADQL.Format(TSecurityCommand.UserModule, [UserName.QuotedString, sModule]);
  ADataset.CommandText := ADQL;
  ADataset.Open;

  //N�o � poss�vel ler ADataset.RecordCount aqui, uma vez que a query � um join.
  //Ver a ajuda do dbExpress para essa propriedade.
  while not ADataset.Eof do
   begin
    Inc(I);
    ADataset.Next;
   end;

  Result := I > 0;
  ADataset.Free;

 except
   if Assigned(ADataset) then FreeAndNil(ADataset);
   raise;
 end;

end;

class function TCosmosSecurity.ChangePassword(const UserName, NewPassword: string): boolean;
var
 ADML: string;
begin
 try
  ADML := ADML.Format(TSecurityCommand.ChangePassword, [NewPassword.QuotedString, QuotedStr('N'), UserName.QuotedString]);
  Result := DMServerDataAcess.DoExecuteCommand(ADML) > 0;

 except
   raise;
 end;
end;

class function TCosmosSecurity.CreatePassword: string;
const
  conso: array [0..19] of Char = ('b', 'c', 'd', 'f', 'g', 'h', 'j',
    'k', 'l', 'm', 'n', 'p', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z');
  vocal: array [0..4] of Char = ('a', 'e', 'i', 'o', 'u');
var
  i: Integer;
begin
 //Cria uma senha rand�mica.
  Result := '';
  for i := 1 to 5 do
  begin
    Result := Result + conso[Random(19)];
    Result := Result + vocal[Random(4)];
  end;
end;

class procedure TCosmosSecurity.GetCosmosUserInfo(const UserName: string;
  AData: TStringList);
var
 ADataset: TSQLDataset;
begin
 {Busca os dados pessoais de um usu�rio. Estas informa��es s�o usadas em diversos
 locais das aplica��es Cosmos}
 ADataset := DMServerDataAcess.CreateDataset;

 try
  ADataset.CommandText := Format(TSecurityCommand.UserInfo, [UserName.QuotedString]);
  ADataset.Open;

  AData.Clear;

  if not ADataset.IsEmpty then
   begin
    AData.Append('LOGUSU=' + ADataset.Fields.FieldByName('LOGUSU').AsString.TrimRight);
    AData.Append('NOMCAD=' + ADataset.Fields.FieldByName('NOMCAD').AsString.TrimRight);
    AData.Append('MATCAD=' + ADataset.Fields.FieldByName('MATCAD').AsString.TrimRight);
    AData.Append('SIGFOC=' + ADataset.Fields.FieldByName('SIGFOC').AsString.TrimRight);
    AData.Append('SIGDIS=' + ADataset.Fields.FieldByName('SIGDIS').AsString.TrimRight);
    AData.Append('INDBLO=' + ADataset.Fields.FieldByName('INDBLO').AsString.TrimRight);
    AData.Append('INDATI=' + ADataset.Fields.FieldByName('INDATI').AsString.TrimRight);
   end;

  if Assigned(ADataset) then FreeAndNil(ADataset);

 except
  on E: Exception do
   begin
    if Assigned(ADataset) then FreeAndNil(ADataset);
    DMCosmosServerServices.RegisterLog(E.Message, '', leOnError);
   end;
 end;

end;

class procedure TCosmosSecurity.GetUserRoles(const UserName: string;
  Roles: TStrings);
var
 ADataset: TSQLDataset;
begin
 ADataset := DMServerDataAcess.CreateDataset;

 try
  ADataset.CommandText := Format(TSecurityCommand.UsuarioRolesAtivas, [UserName.QuotedString, QuotedStr('S')]);
  ADataset.Open;

  while not ADataset.Eof do
   begin
    Roles.Append(ADataset.Fields.Fields[0].AsString);
    ADataset.Next;
   end;

 finally
   if Assigned(ADataset) then
    FreeAndNil(ADataset);
 end;
end;

class function TCosmosSecurity.LockCosmosUser(const codusu: integer): boolean;
var
 ADML: string;
begin
//Bloqueia um usu�rio do Cosmos.
 try
  //Executa o comando para bloquear o usu�rio.
  ADML := ADML.Format(TGUsersCommands.LockUser, [QuotedStr('S'), codusu]);
  Result := DMServerDataAcess.DoExecuteCommand(ADML) > 0;

 except
  on E: Exception do
   begin
    raise; //Redispara a exce��o para ser capturada pelo m�todo evocador...
   end;
 end;
end;

class function TCosmosSecurity.PasswordIsTemporary(
  const UserName: string): boolean;
var
 ADataset: TSQLDataset;
 ACommand: string;
begin
//Verifica se a senha do usu�rio � tempor�ria.
 try
  ACommand := ACommand.Format(TSecurityCommand.PasswordIsTemporary, [UserName.QuotedString]);
  ADataset := DMServerDataAcess.DoExecuteDQL(ACommand);

  if Assigned(ADataset) then
   Result := ADataset.Fields.FieldByName('indpro').AsString.Trim.ToUpper = 'S'
  else
   Result := True;

 finally
   if Assigned(ADataset) then
    FreeAndNil(ADataset);
 end;
end;

class procedure TCosmosSecurity.ResetPasword(const UserName: string;
  out NewPassword: string);
var
 ADML, APassword: string;
begin
{Reseta a senha de um usu�rio e a marca como provis�ria.}
 try
  NewPassword := CreatePassword;
  APassword := DMCosmosServerServices.HashValue(NewPassword);
  ADML := ADML.Format(TSecurityCommand.ChangePassword, [APassword.QuotedString, QuotedStr('S'), QuotedStr(UserName)]);
  DMServerDataAcess.DoExecuteCommand(ADML);

 except
   raise;
 end;
end;

class function TCosmosSecurity.UserIsBlocked(const UserName: string): boolean;
var
sDQL: string;
ADataset: TSQLDataset;
begin
//Verifica se um usu�rio est� bloqueado.
 try
  sDQL := sDQL.Format(TSecurityCommand.UsuarioInfo, [UserName.QuotedString]);
  ADataset := DMServerDataAcess.DoExecuteDQL(sDQL);

  if ADataset <> nil then
   Result := (ADataset.RecordCount > 0) and (ADataset.Fields.FieldByName('indblo').Value = 'S')
  else
   Result := False;

 finally
  if Assigned(ADataset) then FreeAndNil(ADataset);
 end;
end;

end.

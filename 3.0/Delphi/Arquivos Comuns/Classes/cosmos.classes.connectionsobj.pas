unit cosmos.classes.connectionsobj;

interface

uses
 System.Classes, System.Generics.Collections, System.SysUtils, Data.SQLExpr,
 Data.DBXCommon;

type
 TConnectionsPool = class
   strict private
    function PingSever(AConnection: TSQLConnection): boolean;
    procedure DoCloseConnection(AConnection: TSQLConnection);

   private
    FConnectionsPool:  TDictionary<Int64, TSQLConnection>;
    FCurrentConnection: TSQLConnection;
    procedure FillPool(const ObjCount: integer);
    procedure LoadParams(AConnection: TSQLConnection);

   public
    constructor Create;
    destructor Destroy;
    function NewConnection: TSQLConnection;
    function NewCommand: TDBXCommand;
    procedure CloseConnection(AConnection: TSQLConnection);

    property CurrentConnection: TSQLConnection read FCurrentConnection;
 end;

implementation

{ TConnectionsPool }

procedure TConnectionsPool.CloseConnection(AConnection: TSQLConnection);
begin
 DoCloseConnection(AConnection);
end;

constructor TConnectionsPool.Create;
begin
 FConnectionsPool := TDictionary<Int64, TSQLConnection>.Create;
 FillPool(5);
 FCurrentConnection := NewConnection;
end;

destructor TConnectionsPool.Destroy;
begin
  FConnectionsPool.Values.Free;
  FConnectionsPool.Keys.Free;
  FConnectionsPool.Free;

  FCurrentConnection.Close;
  FCurrentConnection.Free;

  inherited Destroy;
end;

procedure TConnectionsPool.DoCloseConnection(AConnection: TSQLConnection);
begin
 try
   if AConnection.Connected then
    AConnection.Close;

 except

 end;
end;

procedure TConnectionsPool.FillPool(const ObjCount: integer);
var
 I: integer;
 AIndex: Int64;
 AConnection : TSQLConnection;
begin
 {Cria objetos TSQLConnection no pool para uso das aplica��es. O n�mero de objetos
  TSQLConnection que ser�o criados � definido pelo par�metro ObjCount}
 I := ObjCount;
 Randomize;

 while I > 0 do
  begin
    AConnection := TSQLConnection.Create(nil);
    AConnection.LoginPrompt := False;
    AIndex := Random(30);
    AConnection.Tag := AIndex;
    LoadParams(AConnection);

    if not FConnectionsPool.ContainsKey(AIndex) then
     begin
      FConnectionsPool.Add(AIndex, AConnection);
      Dec(I);
     end;
  end;
end;

procedure TConnectionsPool.LoadParams(AConnection: TSQLConnection);
begin

end;

function TConnectionsPool.NewCommand: TDBXCommand;
begin
  try
   if CurrentConnection = nil then
    FCurrentConnection := NewConnection;

   Result := CurrentConnection.DBXConnection.CreateCommand;
   Result.FreeOnExecute(Result);
   Result.FreeOnExecute(FCurrentConnection);

  except
   on E: Exception do
    begin
     raise;
    end;
 end;

end;

function TConnectionsPool.NewConnection: TSQLConnection;
var
 AKey: Int64;
begin
 //Retorna uma conex�o com o servidor existente no pool de conex�es.
 Randomize;
 Result := nil;

 Akey := Random(30);

 while Result = nil do
  begin
   if (FConnectionsPool.ContainsKey(AKey)) then
    begin
     Result := FConnectionsPool[AKey];
     if Result <> nil then
      begin
        if not PingSever(Result) then
         begin
          Result := nil;
          Continue;
         end;
      end;
    end;

   Akey := Random(30);
  end;
end;

function TConnectionsPool.PingSever(AConnection: TSQLConnection): boolean;
var
 ACommand: TDBXCommand;
begin
  try
   if AConnection.Connected then
    AConnection.Close;

   AConnection.Open;
   ACommand := AConnection.DBXConnection.CreateCommand;

   ACommand.CommandType := TDBXCommandTypes.DSServerMethod;
   ACommand.Text := 'TDMCosmosApplicationServer.PingServer'; //do not localize!
   ACommand.Prepare;

   ACommand.ExecuteUpdate;

   Result := ACommand.Parameters[0].Value.GetBoolean;
   ACommand.Free;


 except
  on E: Exception do
   begin
    if Assigned(ACommand) then FreeAndNil(ACommand);
    raise;
   end;
 end;

end;

end.

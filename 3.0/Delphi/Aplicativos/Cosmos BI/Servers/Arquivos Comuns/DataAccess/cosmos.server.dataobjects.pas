unit cosmos.server.dataobjects;

interface

uses System.SysUtils, System.Classes, Firedac.Comp.Client, Data.DB, System.JSON,
 System.IniFiles;

const
  dbConfigFile = 'dbconfig.ini'; //do not localize!

type
 ///Extende TDataset para automática conversão para formato JSON.///
 TDatasetJsonHelper = class helper for TDataset
  public
   function ToJsonArray(Dataset: TDataset): TJsonArray;
   function ToJson(const FieldName: string): TJsonObject; overload;
   function ToJson(FieldList: TStrings): TJsonArray; overload;
 end;

 TCosmosDataObjects = class
  private
   FConnectionString: string;
   FConnection: TFDConnection;
   function DoCreateConnection: boolean;

  public
    constructor Create;
    destructor Destroy;

    procedure CloseAll;
    function CreateConnection: TFDConnection;
    function CreateDataset: TFDQuery;

    property Connection: TFDConnection read FConnection;
    property ConnectionString: string read FConnectionString;

 end;

implementation

{ TCosmosDataObjects }

procedure TCosmosDataObjects.CloseAll;
begin
 self.Connection.Close;
end;

constructor TCosmosDataObjects.Create;
var
 aFile: TIniFile;
 sFilePath: string;
begin
 inherited Create;

 sFilePath := GetModuleName(HInstance);
 sFilePath := ExtractFilePath(sFilePath);
 sFilePath := sFilePath + dbConfigFile;

 if sFilePath.IsEmpty then
  abort;

 aFile := TIniFile.Create(sFilePath);

 try
   FConnectionString := '';
   FConnectionString := 'DriverID=' + aFile.ReadString('DBCONNECTION','DriverID', '') + ';';
   FConnectionString := FConnectionString + 'User_Name=' + aFile.ReadString('DBCONNECTION','User_Name', '') + ';';
   FConnectionString := FConnectionString + 'Password=' + aFile.ReadString('DBCONNECTION','Password', '') + ';';
   FConnectionString := FConnectionString + 'Protocol=' + aFile.ReadString('DBCONNECTION','Protocol', '') + ';';
   FConnectionString := FConnectionString + 'Database=' + aFile.ReadString('DBCONNECTION','Database', '') + ';';
   FConnectionString := FConnectionString + 'Server=' + aFile.ReadString('DBCONNECTION','Server', '') + ';';
   FConnectionString := FConnectionString + 'SQLDialect=' + aFile.ReadString('DBCONNECTION','SQLDialect', '') + ';';
   FConnectionString := FConnectionString + 'RoleName=' + aFile.ReadString('DBCONNECTION','RoleName', '') + ';';
   FConnectionString := FConnectionString + 'CharacterSet=' + aFile.ReadString('DBCONNECTION','CharacterSet', '');


 finally
  aFile.Free;
 end;
end;

function TCosmosDataObjects.CreateConnection: TFDConnection;
begin
 Result := TFDConnection.Create(nil);

  try
    Result.LoginPrompt := False;
    Result.Open(self.ConnectionString);

  finally

  end;
end;

function TCosmosDataObjects.CreateDataset: TFDQuery;
begin
 Result := TFDQuery.Create(nil);
 if DoCreateConnection then
  Result.Connection := self.Connection;
end;

destructor TCosmosDataObjects.Destroy;
begin
 inherited Destroy;
end;

function TCosmosDataObjects.DoCreateConnection: boolean;
begin
 if not Assigned(FConnection) then
  begin
   FConnection := TFDConnection.Create(nil);
   FConnection.LoginPrompt := False;
  end;

 try
  FConnection.Open(ConnectionString);

 finally
  Result := FConnection.Connected;
 end;
end;

{ TDatasetJsonHelper }

function TDatasetJsonHelper.ToJson(const FieldName: string): TJsonObject;
begin
  Result := TJsonObject.Create;

  if not self.Active then
   Abort;

  Result.AddPair(TJSONPair.Create(FieldName, self.FieldByName(FieldName).AsString));
end;

function TDatasetJsonHelper.ToJson(FieldList: TStrings): TJsonArray;
 var
  I: integer;
  aJsonObj: TJsonObject;
begin
  Result := TJSONArray.Create;

  if not (Assigned(FieldList)) and (FieldList.Count = 0) then
   Abort;

  while not self.Eof do
    begin
      aJsonObj := TJsonObject.Create;

      for i := 0 to Pred(FieldList.Count) do
        aJsonObj.AddPair(TJSONPair.Create(self.Fields[i].FieldName, self.Fields[i].AsString));

      Result.AddElement(aJsonObj);
      self.Next;
    end;

end;

function TDatasetJsonHelper.ToJsonArray(Dataset: TDataset): TJsonArray;
 var
  I: integer;
  aJsonObj: TJsonObject;
begin
  Result := TJSONArray.Create;

  if not Dataset.Active then
   Abort;

  while not Dataset.Eof do
    begin
      aJsonObj := TJsonObject.Create;

      for i := 0 to Dataset.FieldCount - 1 do
        aJsonObj.AddPair(TJSONPair.Create(Dataset.Fields[i].FieldName, Dataset.Fields[i].AsString));

      Result.AddElement(aJsonObj);
      Dataset.Next;
    end;
end;

end.

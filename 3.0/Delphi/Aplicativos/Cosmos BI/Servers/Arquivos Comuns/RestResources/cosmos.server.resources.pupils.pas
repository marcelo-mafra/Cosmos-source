unit cosmos.server.resources.pupils;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
Firedac.Comp.Client, FireDAC.Stan.Param, System.JSON, Data.DB;

type
{$METHODINFO ON}
  Pupils = class(TComponent)
  private
    { Private declarations }
  public
    {Pupils}
    function CountActivePupils(const FocusId: integer): TJSONObject;
    function GetGrades: TJSONArray;
    function GetPupils(FocusId: string): TJSONArray;
    function GetTotalPupilsFocus: TJSONArray;
    function GetPupilName(const PupilId: integer): TJsonObject;


  end;
{$METHODINFO OFF}

implementation

{ Pupils }

uses cosmos.server.dataobjects, cosmos.server.SQLConst;

function Pupils.CountActivePupils(const FocusId: integer): TJSONObject;
 var
  aCosmosData: TCosmosDataObjects;
  aQuery: TFDQuery;
begin
 {Conta os alunos ativos de um foco.}
  aCosmosData := TCosmosDataObjects.Create;
  aQuery := aCosmosData.CreateDataset;

  try
    aQuery.SQL.Add(TSQLPupilsCommands.cmdPupilsAtivosFocus);
    aQuery.Params.ParamByName('codfoc').Value := FocusId;
    aQuery.Params.ParamByName('indati').Value := 'S';
    aQuery.Params.ParamByName('camdis').Value := 'LEC';

    aQuery.Open();

    Result := aQuery.ToJson('Total')

  finally
   aCosmosData.CloseAll;
   FreeAndNil(aCosmosData);
  end;
end;

function Pupils.GetGrades: TJSONArray;
 var
  aCosmosData: TCosmosDataObjects;
  aQuery: TFDQuery;
begin
 {Lista os discipulados ativos do Lectorium Rosicrucianum.}
  aCosmosData := TCosmosDataObjects.Create;
  aQuery := aCosmosData.CreateDataset;

  try
    aQuery.SQL.Add(TSQLPupilsCommands.cmdGrades);
    aQuery.Params.ParamByName('camdis').Value := 'LEC';
    aQuery.Params.ParamByName('indati').Value := 'S';
    aQuery.Open();

    Result := aQuery.ToJsonArray(aQuery);

  finally
   aCosmosData.CloseAll;
   FreeAndNil(aCosmosData);
  end;
end;

function Pupils.GetPupilName(const PupilId: integer): TJsonObject;
 var
  aCosmosData: TCosmosDataObjects;
  aQuery: TFDQuery;
begin
 {Conta o nome de um aluno.}
  aCosmosData := TCosmosDataObjects.Create;
  aQuery := aCosmosData.CreateDataset;

  try
    aQuery.SQL.Add(TSQLPupilsCommands.cmdPupilName);
    aQuery.Params.ParamByName('codcad').Value := PupilId;
    aQuery.Open();

    Result := aQuery.ToJson('nomcad')

  finally
   aCosmosData.CloseAll;
   FreeAndNil(aCosmosData);
  end;
end;

function Pupils.GetPupils(FocusId: string): TJSONArray;
 var
  aCosmosData: TCosmosDataObjects;
  aQuery: TFDQuery;
begin
  {Conta os alunos ativos de um foco.}
  aCosmosData := TCosmosDataObjects.Create;
  aQuery := aCosmosData.CreateDataset;

  try
    aQuery.SQL.Add(TSQLPupilsCommands.cmdPupilsFocus);
    aQuery.Params.ParamByName('sigfoc').Value := FocusId;
    aQuery.Open();

    Result := aQuery.ToJsonArray(aQuery);

  finally
   aCosmosData.CloseAll;
   FreeAndNil(aCosmosData);
  end;
end;

function Pupils.GetTotalPupilsFocus: TJSONArray;
 var
  aCosmosData: TCosmosDataObjects;
  aQuery: TFDQuery;
begin
 {Conta os alunos ativos de vários focos ativos.}
  aCosmosData := TCosmosDataObjects.Create;
  aQuery := aCosmosData.CreateDataset;

  try
    aQuery.SQL.Add(TSQLPupilsCommands.cmdFocusPupilsCount);
    aQuery.Open();

    Result := aQuery.ToJsonArray(aQuery);

  finally
   aCosmosData.CloseAll;
   FreeAndNil(aCosmosData);
  end;
end;

end.

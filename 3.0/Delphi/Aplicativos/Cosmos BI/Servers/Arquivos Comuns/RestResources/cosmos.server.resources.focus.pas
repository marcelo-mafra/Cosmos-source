unit cosmos.server.resources.focus;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
Firedac.Comp.Client,FireDAC.Stan.Param, System.JSON, Data.DB;

type
{$METHODINFO ON}
  Focus = class(TComponent)
  private
    { Private declarations }
  public
    {Focos}
    function GetActiveFocus: TJSONArray;
    function GetFocusDetails(const FocusId: integer): TJsonObject;

    //Regiões administrativas
    function GetFocusRegion(const RegionId: integer): TJSONArray;
    function GetRootRegions: TJSONArray;
    function GetChildRegions(const RootRegionId: integer): TJSONArray;

  end;
{$METHODINFO OFF}

implementation

{ Focus }

uses cosmos.server.dataobjects, cosmos.server.SQLConst;

function Focus.GetActiveFocus: TJSONArray;
 var
  aCosmosData: TCosmosDataObjects;
  aQuery: TFDQuery;
begin
 {Lista o nome e id dos focos ativos.}
  aCosmosData := TCosmosDataObjects.Create;
  aQuery := aCosmosData.CreateDataset;

  try
    aQuery.SQL.Add(TSQLFocusCommands.cmdFocusAtivos);
    aQuery.Params.ParamByName('indati').Value := 'S';
    aQuery.Open();

    Result := aQuery.ToJsonArray(aQuery);

  finally
   aCosmosData.CloseAll;
   FreeAndNil(aCosmosData);
  end;
end;

function Focus.GetChildRegions(const RootRegionId: integer): TJSONArray;
 var
  aCosmosData: TCosmosDataObjects;
  aQuery: TFDQuery;
begin
 {Lista as subregiões administrativas de uma região.}
  aCosmosData := TCosmosDataObjects.Create;
  aQuery := aCosmosData.CreateDataset;

  try
    aQuery.SQL.Add(TSQLFocusCommands.cmdChildRegions);
    aQuery.Params.ParamByName('codpai').Value := RootRegionId;
    aQuery.Open();

    Result := aQuery.ToJsonArray(aQuery);

  finally
   aCosmosData.CloseAll;
   FreeAndNil(aCosmosData);
  end;

end;

function Focus.GetFocusDetails(const FocusId: integer): TJsonObject;
begin

end;

function Focus.GetFocusRegion(const RegionId: integer): TJSONArray;
 var
  aCosmosData: TCosmosDataObjects;
  aQuery: TFDQuery;
begin
 {Lista os focos ativos de uma região administrativas.}
  aCosmosData := TCosmosDataObjects.Create;
  aQuery := aCosmosData.CreateDataset;

  try
    aQuery.SQL.Add(TSQLFocusCommands.cmdFocusRegion);
    aQuery.Params.ParamByName('codreg').Value := RegionId;
    aQuery.Params.ParamByName('indati').Value := 'S';
    aQuery.Open();

    Result := aQuery.ToJsonArray(aQuery);

  finally
   aCosmosData.CloseAll;
   FreeAndNil(aCosmosData);
  end;
end;

function Focus.GetRootRegions: TJSONArray;
 var
  aCosmosData: TCosmosDataObjects;
  aQuery: TFDQuery;
begin
  {Lista as regiões administrativas "raízes".}
  aCosmosData := TCosmosDataObjects.Create;
  aQuery := aCosmosData.CreateDataset;

  try
    aQuery.SQL.Add(TSQLFocusCommands.cmdRootRegions);
    aQuery.Open();

    Result := aQuery.ToJsonArray(aQuery);

  finally
   aCosmosData.CloseAll;
   FreeAndNil(aCosmosData);
  end;
end;

end.

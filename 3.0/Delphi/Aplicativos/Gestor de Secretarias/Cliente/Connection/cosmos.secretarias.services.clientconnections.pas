unit cosmos.secretarias.services.clientconnections;

interface

uses
  Windows, Messages, System.SysUtils, System.Variants, System.Classes,
  cosmos.common.services.clientconnections, Vcl.ExtCtrls, cosmos.system.messages,
  Data.DBXDataSnap, IPPeerClient, Data.DBXCommon, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.DSConnect, Data.SqlExpr, Data.DB, Vcl.AppEvnts, Xml.xmldom, Xml.XMLIntf,
  Xml.Win.msxmldom, Xml.XMLDoc, cosmos.business.focos, Datasnap.Provider,
  Cosmos.Framework.Interfaces.Applications, cosmos.focos.services.serverclass,
  cosmos.secretarias.services.serverclass, cosmos.business.secretariats;

type
  TDMCon = class(TDMBase)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FNewMatriculaMode: TNewMatriculaMode;
    function GetFocosClass: TFocosServerClass;
    function GetSecretariasClass: TSecretariasServerClass;

    procedure ReadMyConfigurations;

  public
    { Public declarations }
    property FocosClass: TFocosServerClass read GetFocosClass;
    property SecretariasClass: TSecretariasServerClass read GetSecretariasClass;

  end;

var
  DMCon: TDMCon;

implementation

{$R *.dfm}

{ TDMCon }

procedure TDMCon.DataModuleCreate(Sender: TObject);
begin
  inherited;
  ReadMyConfigurations;
end;

function TDMCon.GetFocosClass: TFocosServerClass;
begin
 Result := TFocosServerClass.Create;
end;

function TDMCon.GetSecretariasClass: TSecretariasServerClass;
begin
 Result := TSecretariasServerClass.Create;
 Result.SecretariasOptions.NewMatriculaMode := FNewMatriculaMode;
end;

procedure TDMCon.ReadMyConfigurations;
var
 AXMLDoc: TXMLDocument;
 ANode, AChildNode: IXMLNode;
begin
 {L� algumas op��es de configura��o por usu�rio espec�ficas do Gestor de Secretarias.}

  if not FileExists(ICosmosApp.IApplicationPaths.GetUserConfigurationsFile) then
   Exit;

  AXMLDoc := TXMLDocument.Create(self);
  AXMLDoc.Options := [doNodeAutoCreate, doNodeAutoIndent, doAttrNull, doNamespaceDecl];
  AXMLDoc.NodeIndentStr := ''#13'';

 try
  AXMLDoc.FileName := ICosmosApp.IApplicationPaths.GetUserConfigurationsFile;

  AXMLDoc.Active := True;
  ANode := AXMLDoc.DocumentElement;
  ANode := ANode.ChildNodes.FindNode('ModulesOptions');
  ANode := ANode.ChildNodes.FindNode(ICosmosApp.CosmosModuleShortName);
  ANode := ANode.ChildNodes.FindNode('MatriculaOptions');

  //L� a op��o de op��o de l�gica de gera��o de matr�culas novas.
  FNewMatriculaMode := TNewMatriculaMode(ANode.Attributes['GenerationOption']);

  if Assigned(AXMLDoc) then FreeAndNil(AXMLDoc);

 except
  on E: Exception do
   begin
     if Assigned(AXMLDoc) then FreeAndNil(AXMLDoc);
   end;
 end;
end;

initialization
 RegisterClass(TDMCon);

finalization
 UnregisterClass(TDMCon); 

end.

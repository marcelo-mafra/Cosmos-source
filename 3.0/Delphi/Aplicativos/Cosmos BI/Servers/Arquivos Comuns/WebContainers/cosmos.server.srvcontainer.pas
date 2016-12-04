unit cosmos.server.srvcontainer;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSClientMetadata, Datasnap.DSHTTPServiceProxyDispatcher,
  Datasnap.DSAuth;

type
  TDMSrvContainer = class(TDataModule)
    DSServerCosmos: TDSServer;
    DSServerFocusClass: TDSServerClass;
    DSServerPupilsClass: TDSServerClass;
    DSSecurityManager: TDSAuthenticationManager;
    procedure DSServerFocusClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSServerPupilsClassGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure DSSecurityManagerUserAuthenticate(Sender: TObject;
      const Protocol, Context, User, Password: string; var valid: Boolean;
      UserRoles: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  function DSServer: TDSServer;
  function DSAuthenticationManager: TDSAuthenticationManager;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
 cosmos.server.resources.focus, cosmos.server.resources.pupils;

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

{ TDMSrvContainer }

constructor TDMSrvContainer.Create(AOwner: TComponent);
begin
  inherited;
  FDSServer := DSServerCosmos;
  FDSAuthenticationManager := DSSecurityManager;
end;

destructor TDMSrvContainer.Destroy;
begin
  inherited;
  FDSServer := nil;
  FDSAuthenticationManager := nil;
end;

procedure TDMSrvContainer.DSSecurityManagerUserAuthenticate(
  Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
//To do...
  valid := True;
end;

procedure TDMSrvContainer.DSServerFocusClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := cosmos.server.resources.focus.Focus;
end;

procedure TDMSrvContainer.DSServerPupilsClassGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := cosmos.server.resources.pupils.Pupils;
end;

initialization
  FModule := TDMSrvContainer.Create(nil);

finalization
  FModule.Free;

end.

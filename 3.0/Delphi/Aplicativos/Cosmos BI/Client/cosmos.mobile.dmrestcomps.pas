unit cosmos.mobile.dmrestcomps;

interface

uses
  System.SysUtils, System.Classes, IPPeerClient, REST.Client,
  REST.Authenticator.OAuth, Data.Bind.Components, Data.Bind.ObjectScope,
  cosmos.mobile.classes.RestRequestNotifiers, FMX.ListBox;

type
  TCosmosRestResources = (crIndex, crActivities, crFocus, crPupils);

  TDMRestComps = class(TDataModule)
    RESTClient: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    OAuth1Authenticator1: TOAuth1Authenticator;
    procedure DataModuleCreate(Sender: TObject);
    procedure RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FRestRequestObservable: TRestRequestStatusObservable;
    FRestRequestStatus: TOnRequestStatus;
    procedure LoadRestServerInfo;
    procedure SetRestRequestStatus(Value: TOnRequestStatus);
  public
    { Public declarations }
    //Observer/Observable
    property RestRequestObservable: TRestRequestStatusObservable read FRestRequestObservable;
    property RestRequestStatus: TOnRequestStatus read FRestRequestStatus write SetRestRequestStatus;

    //Rest server
    procedure ListRemoteMethods(Resource: TCosmosRestResources; AControl: TListBox);
    procedure StartRestRequest;

  end;

var
  DMRestComps: TDMRestComps;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses cosmos.mobile.constants;

{$R *.dfm}

{ TDMRestComps }

procedure TDMRestComps.DataModuleCreate(Sender: TObject);
begin
 FRestRequestObservable := TRestRequestStatusObservable.Create;
 Self.LoadRestServerInfo;
end;

procedure TDMRestComps.DataModuleDestroy(Sender: TObject);
begin
 FRestRequestObservable.Free;
end;

procedure TDMRestComps.ListRemoteMethods(Resource: TCosmosRestResources; AControl: TListBox);
begin
 case Resource of
   crIndex:
    begin;
     AControl.Clear;
     self.StartRestRequest;
    end;
   crActivities: ;
   crFocus: ;
   crPupils: ;
 end;
end;

procedure TDMRestComps.LoadRestServerInfo;
begin
 RestClient.BaseURL := TRestServerOpt.BaseURL;
 RestClient.ProxyServer := TRestServerOpt.ProxyServer;
 RestClient.ProxyPort := TRestServerOpt.ProxyPort;
 RESTClient.ProxyUsername := TRestServerOpt.ProxyUserName;
 RestClient.ProxyPassword := TRestServerOpt.ProxyPassword;
end;

procedure TDMRestComps.RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
begin
 self.RestRequestStatus := rsExecuted;
end;

procedure TDMRestComps.SetRestRequestStatus(Value: TOnRequestStatus);
begin
  FRestRequestStatus := Value;
  FRestRequestObservable.NotifyObservers(FRestRequestStatus);
end;

procedure TDMRestComps.StartRestRequest;
begin
  self.RestRequestStatus := rsExecuting;
end;

end.

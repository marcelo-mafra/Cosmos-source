program cosmosbi;

uses
  System.StartUpCopy,
  FMX.Forms,
  cosmos.mobile.mainform in 'cosmos.mobile.mainform.pas' {FrmMainForm},
  cosmos.mobile.dmrestcomps in 'cosmos.mobile.dmrestcomps.pas' {DMRestComps: TDataModule},
  cosmos.mobile.constants in 'cosmos.mobile.constants.pas',
  cosmos.mobile.classes.RestRequestNotifiers in 'cosmos.mobile.classes.RestRequestNotifiers.pas',
  cosmos.mobile.classes.network in 'cosmos.mobile.classes.network.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMRestComps, DMRestComps);
  Application.CreateForm(TFrmMainForm, FrmMainForm);
  Application.Run;
end.

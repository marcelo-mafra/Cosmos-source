library mod_cosmos_bi;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.ApacheApp,
  Web.HTTPD24Impl,
  Data.DBXCommon,
  Datasnap.DSSession,
  cosmos.server.webmodule in '..\..\cosmos.server.webmodule.pas' {WebModule1: TWebModule},
  cosmos.server.srvcontainer in '..\..\cosmos.server.srvcontainer.pas' {DMSrvContainer: TDataModule},
  cosmos.server.resources.focus in '..\RestResources\cosmos.server.resources.focus.pas',
  cosmos.server.resources.pupils in '..\RestResources\cosmos.server.resources.pupils.pas',
  cosmos.server.dataobjects in '..\DataAccess\cosmos.server.dataobjects.pas',
  cosmos.server.dmdataaccess in '..\DataAccess\cosmos.server.dmdataaccess.pas' {DmDataAcess: TDataModule},
  cosmos.server.SQLConst in '..\DataAccess\cosmos.server.SQLConst.pas';

{$R *.res}

// httpd.conf entries:
//
(*
 LoadModule cosmos_bi_module modules/mod_cosmos_bi.dll

 <Location /xyz>
    SetHandler mod_cosmos_bi-handler
 </Location>
*)
//
// These entries assume that the output directory for this project is the apache/modules directory.
//
// httpd.conf entries should be different if the project is changed in these ways:
//   1. The TApacheModuleData variable name is changed
//   2. The project is renamed.
//   3. The output directory is not the apache/modules directory
//

// Declare exported variable so that Apache can access this module.
var
  GModuleData: TApacheModuleData;
exports
  GModuleData name 'cosmos_bi_module';

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Web.ApacheApp.InitApplication(@GModuleData);
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TApacheApplication(Application).OnTerminate := TerminateThreads;
  Application.CreateForm(TDmDataAcess, DmDataAcess);
  Application.Run;
end.

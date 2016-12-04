program RestServer;
{$APPTYPE GUI}



{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormUnit1 in 'FormUnit1.pas' {Form1},
  cosmos.server.webmodule in 'Arquivos Comuns\WebContainers\cosmos.server.webmodule.pas' {WebModule1: TWebModule},
  cosmos.server.srvcontainer in 'Arquivos Comuns\WebContainers\cosmos.server.srvcontainer.pas' {DMSrvContainer: TDataModule},
  cosmos.server.dataobjects in 'Arquivos Comuns\DataAccess\cosmos.server.dataobjects.pas',
  cosmos.server.dmdataaccess in 'Arquivos Comuns\DataAccess\cosmos.server.dmdataaccess.pas' {DmDataAcess: TDataModule},
  cosmos.server.SQLConst in 'Arquivos Comuns\DataAccess\cosmos.server.SQLConst.pas',
  cosmos.server.resources.focus in 'Arquivos Comuns\RestResources\cosmos.server.resources.focus.pas',
  cosmos.server.resources.pupils in 'Arquivos Comuns\RestResources\cosmos.server.resources.pupils.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDmDataAcess, DmDataAcess);
  Application.Run;
end.


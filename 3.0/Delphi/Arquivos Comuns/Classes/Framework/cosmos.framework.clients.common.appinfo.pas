unit cosmos.framework.clients.common.appinfo;

interface

uses
 System.Classes, System.SysUtils, Winapi.Windows, Vcl.Forms, Vcl.Dialogs,
 cosmos.system.messages, cosmos.classes.application, cosmos.framework.interfaces.utils,
 cosmos.system.winshell, System.IniFiles, cosmos.system.types;

type
  TCosmosAppInfo = class(TInterfacedPersistent, ICosmosApplicationPaths)

    private
     function OpenFile: TMemIniFile;

    public

     constructor Create;
     destructor Destroy; override;

     //Paths
     function ReadInstallationPath: string;
     function ReadHelpFilesPath: string;
     function ReadReportsFolder(Module: TCosmosModules): string;
     function ReadBufferedDataPath: string;
     function ReadMonitorConnectionPath: string;
     function ReadTasksFilesPath: string;
     function ReadCommonAppDataPath: string;
     function ReadUserAppDataPath: string;
     function ReadUpdatesFolder: string;

     //Files
     function GetHelpFile(CosmosModule: TCosmosModules): string;
     function GetUserConfigurationsFile: string;
     function GetCommonConfigurationsFile: string;
     function GetReportParamsFile: string;
     function GetCentralPesquisaFile: string;
     function GetFormsInfoFile: string;


  end;


implementation

{ TCosmosAppInfo }

constructor TCosmosAppInfo.Create;
begin
 inherited Create;
end;

destructor TCosmosAppInfo.Destroy;
begin
  inherited Destroy;
end;

function TCosmosAppInfo.GetCommonConfigurationsFile: string;
var
  Ini: TMemIniFile;
begin
 {Recupera o caminho completo do arquivo de configura��es comum a todos os
 usu�rios do sistema.}
  Ini := self.OpenFile;

  try
   Result := Ini.ReadString('CosmosFiles', 'CommonConfigurationsFile', '');

  finally
    if Assigned(Ini) then
     FreeAndNil(Ini);
  end;
end;

function TCosmosAppInfo.GetFormsInfoFile: string;
begin
 {Recupera o caminho completo do arquivo de configura��es dos formul�rios do
  Cosmos. Cada usu�rio possui sua c�pia deste arquivo.}
 Result := self.ReadUserAppDataPath + TCosmosFiles.ConfigFormsInfo;
end;

function TCosmosAppInfo.GetCentralPesquisaFile: string;
begin
 {Recupera o caminho completo do arquivo de defini��o das pesquisas disponibilziadas
  na ferramenta "Central de Pesquisas".}
 Result := self.ReadInstallationPath + TCosmosFiles.ConfigCentralPesquisas;
end;

function TCosmosAppInfo.GetUserConfigurationsFile: string;
begin
 {Recupera o caminho completo do arquivo de configura��es dos usu�rios. Cada
  usu�rio possui sua c�pia deste arquivo.}
 Result := self.ReadUserAppDataPath + TCosmosFiles.ConfigUser;
end;

function TCosmosAppInfo.OpenFile: TMemIniFile;
var
 sRootPathsFile: string;
begin
 {Abre o arquivo de configura��es inicial de pastas e arquivos importantes
 dos aplicativos Cosmos.}
  sRootPathsFile := ExtractFilepath(Application.ExeName) +  TCosmosFiles.ConfigFolders;
  Result := TMemIniFile.Create(sRootPathsFile);
end;

function TCosmosAppInfo.GetHelpFile(CosmosModule: TCosmosModules): string;
begin
 {Recupera o caminho completo dos arquivos de ajuda das aplica��es Cosmos.}
 case CosmosModule of
   cmFocos: Result := self.ReadHelpFilesPath +  TCosmosFiles.HelpFileFocos; //do not localize!
   cmSecretarias: Result := self.ReadHelpFilesPath + TCosmosFiles.HelpFileSecretarias; //do not localize!
   cmFinanceiro: Result := self.ReadHelpFilesPath + TCosmosFiles.HelpFileFinanceiro;  //do not localize!
   cmConferencias: Result := self.ReadHelpFilesPath + TCosmosFiles.HelpFileConferencias; //do not localize!
   cmUsuarios: Result := self.ReadHelpFilesPath + TCosmosFiles.HelpFileUsuarios; //do not localize!
 end;
end;

function TCosmosAppInfo.GetReportParamsFile: string;
begin
 {Recupera o caminho completo do arquivo de configura��es de par�metros dos
  relat�rios.}
 Result := ReadInstallationPath + TCosmosFiles.ConfigReportsParams;
end;

function TCosmosAppInfo.ReadBufferedDataPath: string;
var
  Ini: TMemIniFile;
begin
 {Recupera o caminho completo da pasta de buferiza��o de dados.}
  Ini := self.OpenFile;

  try
    Result := Ini.ReadString('CurrentPaths', 'BufferedDataPath', '');

  finally
    if Assigned(Ini) then
     begin
       FreeAndNil(Ini);
     end;
  end;
end;

function TCosmosAppInfo.ReadHelpFilesPath: string;
var
  Ini: TMemIniFile;
begin
 {Recupera o caminho completo da pasta de arquivos de ajuda.}
  Ini := self.OpenFile;

  try
    Result := Ini.ReadString('CurrentPaths', 'HelpPath', '');

  finally
    if Assigned(Ini) then
     begin
       FreeAndNil(Ini);
     end;
  end;
end;

function TCosmosAppInfo.ReadInstallationPath: string;
var
  Ini: TMemIniFile;
begin
//Recupera a pasta de instala��o do sistema Cosmos.
  Ini := self.OpenFile;

  try
    Result := Ini.ReadString('CurrentPaths', 'InstallationPath', '');

  finally
    if Assigned(Ini) then
     begin
       FreeAndNil(Ini);
     end;
  end;
end;

function TCosmosAppInfo.ReadMonitorConnectionPath: string;
var
  Ini: TMemIniFile;
begin
 {Recupera o caminho completo da pasta de buferiza��o de arquivos de monitora��o
  da conex�o com o servidor remoto.}
  Ini := self.OpenFile;

  try
    Result := Ini.ReadString('CurrentPaths', 'MonitorConnectionPath', '');

  finally
    if Assigned(Ini) then
     begin
       FreeAndNil(Ini);
     end;
  end;
end;

function TCosmosAppInfo.ReadCommonAppDataPath: string;
var
  Ini: TMemIniFile;
begin
 {Recupera o caminho completo da pasta comum de arquivos.}
  Ini := self.OpenFile;

  try
   Result := Ini.ReadString('CurrentPaths', 'CommonAppDataPath', '');

  finally
    if Assigned(Ini) then
     FreeAndNil(Ini);
  end;

end;

function TCosmosAppInfo.ReadReportsFolder(Module: TCosmosModules): string;
var
  Ini: TMemIniFile;
  sSection: string;
begin
//Recupera a pasta dos arquivos dos relat�rios de cada m�dulo do sistema Cosmos.
  Ini := self.OpenFile;

  try
   case Module of
     cmFocos: sSection := 'ReportsGFocFilesPath'; //do not localize!
     cmSecretarias: sSection := 'ReportsGSecFilesPath'; //do not localize!
     cmFinanceiro: sSection := 'ReportsGFinFilesPath'; //do not localize!
     cmConferencias: sSection := 'ReportsGConfFilesPath'; //do not localize!
     cmUsuarios: sSection := 'ReportsGUsuFilesPath'; //do not localize!
   end;

    Result := Ini.ReadString('CurrentPaths', sSection, '');

  finally
    if Assigned(Ini) then
     begin
       FreeAndNil(Ini);
     end;
  end;
end;

function TCosmosAppInfo.ReadTasksFilesPath: string;
var
  Ini: TMemIniFile;
begin
//Recupera a pasta dos arquivos de tarefas de cada usu�rio.
  Ini := self.OpenFile;

  try
    Result := Ini.ReadString('CurrentPaths', 'TasksFilesPath', '');

  finally
    if Assigned(Ini) then
     begin
       FreeAndNil(Ini);
     end;
  end;
end;



function TCosmosAppInfo.ReadUpdatesFolder: string;
begin
 {Recupera o caminho completo da pasta onde s�o feitos downloads dos arquivos
 de updates do sistema.}
 Result := self.ReadCommonAppDataPath + TCosmosPaths.UpdatesPath;
end;

function TCosmosAppInfo.ReadUserAppDataPath: string;
begin
{*Recupera o nome da pasta local de arquivos do usu�rio corrente. Este m�todo
somente � chamado por outros m�todos desta classe.*}
 Result := TShellFolders.GetMyAppDataFolder + TCosmosPaths.CommonCosmosPath;
end;

end.

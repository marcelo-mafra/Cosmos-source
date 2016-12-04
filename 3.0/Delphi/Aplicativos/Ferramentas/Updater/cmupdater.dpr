program cmupdater;

uses
  Vcl.Forms, Dialogs,
  cosmos.tools.updater.dm in 'cosmos.tools.updater.dm.pas' {DMUpdater: TDataModule},
  cosmos.tools.updater.main in 'cosmos.tools.updater.main.pas' {FrmUpdateStatus};

{$R *.res}

const
 sCannotRun = 'Esta aplica��o n�o pode ser executada neste modo. O processo ser� encerrado.';

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Cosmos updater';

  {Somente executa a aplica��o caso ela seja executada com par�metros de inicializa��o.
  Caso contr�rio, emite mensagem de aviso e encerra a aplica��o.}
  if ParamStr(1) = '' then
   begin
     ShowMessage(sCannotRun);
     Application.Terminate;
   end
  else
   begin
    Application.CreateForm(TFrmUpdateStatus, FrmUpdateStatus);
    Application.CreateForm(TDMUpdater, DMUpdater);
    // Application.ShowMainForm := False;
    Application.Run;
   end;
end.

unit cosmos.mobile.mainform;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.TabControl, FMX.Controls.Presentation, System.Actions, FMX.ActnList,
  System.ImageList, FMX.ImgList, FMX.ListBox, FMX.Layouts, FMXTee.Engine,
  FMXTee.Series, FMXTee.Procs, FMXTee.Chart, FMX.Controls3D, FMXTee.Chart3D,
  cosmos.mobile.classes.RestRequestNotifiers,Androidapi.Helpers;

type
  TFrmMainForm = class(TForm)
    StyleBook1: TStyleBook;
    ToolBar1: TToolBar;
    BtnExpand: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    AniIndicator: TAniIndicator;
    TabMainDesigner: TTabControl;
    TabListOptions: TTabItem;
    TabShowGraphic: TTabItem;
    TabShowData: TTabItem;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ActNextTab: TNextTabAction;
    ActPreviousTab: TPreviousTabAction;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    Charts: TChart;
    Series1: TBarSeries;
    ActIndex: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ActIndexExecute(Sender: TObject);
  private
    { Private declarations }
    FRestRequestObserver: TRestRequestStatusObserver;
    procedure OnNotifyChangeRestRequestStatus(Status: TOnRequestStatus);

  public
    { Public declarations }
  end;

var
  FrmMainForm: TFrmMainForm;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx  }

uses cosmos.mobile.dmrestcomps;


procedure TFrmMainForm.ActIndexExecute(Sender: TObject);
begin
 DMRestComps.ListRemoteMethods(crIndex, self.ListBox1);
 TabMainDesigner.ActiveTab := TabListOptions;
end;

procedure TFrmMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 DMRestComps.RestRequestObservable.UnregisterObserver(FRestRequestObserver);
end;

procedure TFrmMainForm.FormCreate(Sender: TObject);
begin
 TabMainDesigner.TabPosition := TTabPosition.None;
 TabMainDesigner.ActiveTab := TabListOptions;
 Charts.Series[0].RandomBounds(10);

 //Cria e registra o objeto observador.
 if not Assigned(FRestRequestObserver) then
  begin
    FRestRequestObserver := TRestRequestStatusObserver.Create;
    FRestRequestObserver.OnNotifyChangeRequestStatus := OnNotifyChangeRestRequestStatus;
    DMRestComps.RestRequestObservable.RegisterObserver(FRestRequestObserver);
  end;
end;

procedure TFrmMainForm.FormDestroy(Sender: TObject);
begin
 FRestRequestObserver.Free;
end;

procedure TFrmMainForm.OnNotifyChangeRestRequestStatus(Status: TOnRequestStatus);
begin
 case Status of
  rsExecuting: self.AniIndicator.Enabled := True;
  rsExecuted: self.AniIndicator.Enabled := False;
  rsOnError:
   begin
    self.AniIndicator.Enabled := False;
    //To-do: tratar erros de alguma forma a estudar.
   end;
 end;

 Application.ProcessMessages;
end;

end.

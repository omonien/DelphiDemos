unit DockedWindows.Main.Form;

// Demo: Modern docked windows as an alternative to the legacy MDI mechanism.
//
// Key ingredients (all built-in VCL, no third-party libraries):
//   - The main form contains TPanel dock sites (DockSite = True, UseDockManager = True)
//     placed Left / Right / Bottom around a central client panel.
//   - TSplitter components let the user resize the dock zones at runtime.
//   - Each tool window (Toolbox, Properties, Log) is a regular TForm with
//       DragKind = dkDock and DragMode = dmAutomatic
//     so it can be dragged out of its dock zone, floated freely, or re-docked
//     into any dock site - including stacked / tabbed docking on the same panel.
//   - At startup we ManualDock the tool forms into their initial panels.
//   - The View menu re-shows tool windows that the user has closed.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ToolWin, Vcl.ImgList;

type
  TFormMain = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miFileExit: TMenuItem;
    miView: TMenuItem;
    miViewToolbox: TMenuItem;
    miViewProperties: TMenuItem;
    miViewLog: TMenuItem;
    miViewSep1: TMenuItem;
    miViewResetLayout: TMenuItem;
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    btnToolbox: TToolButton;
    btnProperties: TToolButton;
    btnLog: TToolButton;
    PanelLeft: TPanel;
    SplitterLeft: TSplitter;
    PanelRight: TPanel;
    SplitterRight: TSplitter;
    PanelBottom: TPanel;
    SplitterBottom: TSplitter;
    PanelCenter: TPanel;
    Workspace: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure miFileExitClick(Sender: TObject);
    procedure miViewToolboxClick(Sender: TObject);
    procedure miViewPropertiesClick(Sender: TObject);
    procedure miViewLogClick(Sender: TObject);
    procedure miViewResetLayoutClick(Sender: TObject);
    procedure miViewClick(Sender: TObject);
  private
    procedure ShowToolForm(AForm: TForm; ADockTarget: TWinControl);
    procedure DockInitialLayout;
  public
    procedure Log(const AMessage: string);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  DockedWindows.Toolbox.Form,
  DockedWindows.Properties.Form,
  DockedWindows.Log.Form;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  StatusBar.SimpleText := 'Tipp: Werkzeugfenster an der Titelleiste packen und ziehen - frei schweben oder andocken.';
  DockInitialLayout;
  Log('Anwendung gestartet.');
end;

procedure TFormMain.DockInitialLayout;
begin
  ShowToolForm(FormToolbox,    PanelLeft);
  ShowToolForm(FormProperties, PanelRight);
  ShowToolForm(FormLog,        PanelBottom);
end;

procedure TFormMain.ShowToolForm(AForm: TForm; ADockTarget: TWinControl);
begin
  if not Assigned(AForm) then
    Exit;

  // If the form is currently floating or docked elsewhere, undock it first
  // so ManualDock can place it cleanly into the requested dock site.
  if AForm.HostDockSite <> nil then
    AForm.ManualDock(nil, nil, alNone);

  AForm.ManualDock(ADockTarget, nil, alClient);
  AForm.Show;
end;

procedure TFormMain.Log(const AMessage: string);
begin
  if Assigned(FormLog) then
    FormLog.Append(AMessage);
end;

procedure TFormMain.miFileExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.miViewClick(Sender: TObject);
begin
  miViewToolbox.Checked    := Assigned(FormToolbox)    and FormToolbox.Visible;
  miViewProperties.Checked := Assigned(FormProperties) and FormProperties.Visible;
  miViewLog.Checked        := Assigned(FormLog)        and FormLog.Visible;
end;

procedure TFormMain.miViewToolboxClick(Sender: TObject);
begin
  if FormToolbox.Visible then
    FormToolbox.Hide
  else if FormToolbox.HostDockSite <> nil then
    FormToolbox.Show
  else
    ShowToolForm(FormToolbox, PanelLeft);
end;

procedure TFormMain.miViewPropertiesClick(Sender: TObject);
begin
  if FormProperties.Visible then
    FormProperties.Hide
  else if FormProperties.HostDockSite <> nil then
    FormProperties.Show
  else
    ShowToolForm(FormProperties, PanelRight);
end;

procedure TFormMain.miViewLogClick(Sender: TObject);
begin
  if FormLog.Visible then
    FormLog.Hide
  else if FormLog.HostDockSite <> nil then
    FormLog.Show
  else
    ShowToolForm(FormLog, PanelBottom);
end;

procedure TFormMain.miViewResetLayoutClick(Sender: TObject);
begin
  DockInitialLayout;
  Log('Layout zurueckgesetzt.');
end;

end.

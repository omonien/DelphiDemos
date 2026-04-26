unit DockedWindows.Toolbox.Form;

// Tool window. Becomes dockable through these properties (set in the .dfm):
//   DragKind = dkDock
//   DragMode = dmAutomatic
// The OnClose handler hides the form instead of releasing it, so the user
// can re-show it via the View menu without losing state.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormToolbox = class(TForm)
    Header: TPanel;
    btnNew: TButton;
    btnOpen: TButton;
    btnSave: TButton;
    btnRun: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNewClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
  end;

var
  FormToolbox: TFormToolbox;

implementation

{$R *.dfm}

uses
  DockedWindows.Main.Form;

procedure TFormToolbox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TFormToolbox.btnNewClick(Sender: TObject);
begin
  FormMain.Log('Toolbox: New');
end;

procedure TFormToolbox.btnOpenClick(Sender: TObject);
begin
  FormMain.Log('Toolbox: Open');
end;

procedure TFormToolbox.btnSaveClick(Sender: TObject);
begin
  FormMain.Log('Toolbox: Save');
end;

procedure TFormToolbox.btnRunClick(Sender: TObject);
begin
  FormMain.Log('Toolbox: Run');
end;

end.

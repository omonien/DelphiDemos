unit DockedWindows.Log.Form;

// Bottom tool window. Same docking pattern as the others.

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormLog = class(TForm)
    Header: TPanel;
    Memo: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    procedure Append(const AMessage: string);
  end;

var
  FormLog: TFormLog;

implementation

{$R *.dfm}

procedure TFormLog.Append(const AMessage: string);
begin
  Memo.Lines.Add(FormatDateTime('hh:nn:ss', Now) + '  ' + AMessage);
end;

procedure TFormLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

end.

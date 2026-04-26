/// <summary>
/// DockedWindows.Log.Form
/// Dockable log form for the docking demo.
/// </summary>
///
/// <remarks>
/// Collects runtime messages from the demo and can be docked or floated like
/// the other tool windows.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

unit DockedWindows.Log.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  /// <summary>
  /// Dockable window that displays runtime log messages.
  /// </summary>
  TFormLog = class(TForm)
    Header: TPanel;
    Memo: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    /// <summary>
    /// Adds a timestamped message to the log.
    /// </summary>
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

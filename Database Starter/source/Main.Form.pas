/// <summary>
/// Main.Form
/// Main form for the database starter demo.
/// </summary>
///
/// <remarks>
/// Displays orders from the shared DataModule and exposes a small refresh
/// action for re-opening the FireDAC query.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

unit Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Main.DM, Vcl.StdCtrls, Vcl.AppEvnts;

type
  /// <summary>
  /// Displays the order overview from the database starter DataModule.
  /// </summary>
  TFormMain = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DSOrders: TDataSource;
    ButtonRefresh: TButton;
    LabelDatabase: TLabel;
    procedure ButtonRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.ButtonRefreshClick(Sender: TObject);
begin
  DMMain.RefreshOrders;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  DMMain.RefreshOrders;
  LabelDatabase.Caption := Format('Database: %s', [DMMain.DBConfig]);
end;

end.

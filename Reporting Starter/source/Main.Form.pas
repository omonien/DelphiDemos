/// <summary>
/// Main.Form
/// Main form for the reporting starter demo.
/// </summary>
///
/// <remarks>
/// Shows the order overview and delegates invoice generation to the reporting
/// DataModule when the user double-clicks an order.
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
  /// Displays the order overview and triggers invoice printing.
  /// </summary>
  TFormMain = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DSOrderOverview: TDataSource;
    ButtonRefresh: TButton;
    LabelDatabase: TLabel;
    procedure ButtonRefreshClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
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

procedure TFormMain.DBGrid1DblClick(Sender: TObject);
begin
  DMMain.PrintInvoice;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  DMMain.RefreshOrders;
  LabelDatabase.Caption := Format('Database: %s', [DMMain.DBConfig]);
end;

end.

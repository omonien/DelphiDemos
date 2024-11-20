unit Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Main.DM, Vcl.StdCtrls, Vcl.AppEvnts;

type
  TFormMain = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DSOrders: TDataSource;
    ButtonRefresh: TButton;
    LabelDatabase: TLabel;
    procedure ButtonRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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


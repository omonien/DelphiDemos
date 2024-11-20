unit Main.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDMMain = class(TDataModule)
    Connection: TFDConnection;
    QOrders: TFDQuery;
    QOrdersOrderID: TFDAutoIncField;
    QOrdersCustomerID: TWideMemoField;
    QOrdersEmployeeID: TIntegerField;
    QOrdersOrderDate: TDateTimeField;
    QOrdersRequiredDate: TDateTimeField;
    QOrdersShippedDate: TDateTimeField;
    QOrdersShipVia: TIntegerField;
    QOrdersFreight: TLargeintField;
    QOrdersShipName: TWideMemoField;
    QOrdersShipAddress: TWideMemoField;
    QOrdersShipCity: TWideMemoField;
    QOrdersShipRegion: TWideMemoField;
    QOrdersShipPostalCode: TWideMemoField;
    QOrdersShipCountry: TWideMemoField;
    procedure ConnectionBeforeConnect(Sender: TObject);
  private
    function GetDBConfig: string;
    { Private declarations }
  public
    property DBConfig: string read GetDBConfig;
    procedure RefreshOrders;
  end;

var
  DMMain: TDMMain;

implementation

uses
  System.IOUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMMain.ConnectionBeforeConnect(Sender: TObject);
begin
  //Die Projekt-Optionen haben ein Post-Build Event, dass die DB-Datei aus dem DB-Verzeichnis ins Verzeichnis
  //der EXE kopiert, wenn diese dort noch nicht existiert
  Connection.Params.Database := TPath.Combine(TPath.GetAppPath, 'Northwind.sqlite');
end;

function TDMMain.GetDBConfig: string;
begin
  Result := Connection.Params.Database;
end;

procedure TDMMain.RefreshOrders;
begin
  QOrders.Close;
  QOrders.Open;
end;

end.


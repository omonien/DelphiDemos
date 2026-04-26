/// <summary>
/// Main.DM
/// DataModule for the database starter demo.
/// </summary>
///
/// <remarks>
/// Configures the FireDAC SQLite connection at runtime and provides a focused
/// refresh method for the order overview query.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

unit Main.DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  /// <summary>
  /// Owns the FireDAC SQLite connection and order query.
  /// </summary>
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
  public
    property DBConfig: string read GetDBConfig;
    /// <summary>
    /// Reopens the order query.
    /// </summary>
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
  // The project post-build event copies the database next to the executable.
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

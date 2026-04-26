/// <summary>
/// Main.DM
/// DataModule for the reporting starter demo.
/// </summary>
///
/// <remarks>
/// Connects FireDAC datasets to the embedded FastReport invoice report and
/// exports the selected invoice as a PDF.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

unit Main.DM;

interface

uses
  System.SysUtils, System.Classes,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,

  frxSmartMemo, frCoreClasses, frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF;

type
  /// <summary>
  /// Owns the FireDAC datasets and FastReport invoice definition.
  /// </summary>
  TDMMain = class(TDataModule)
    Connection: TFDConnection;
    QOrderOverview: TFDQuery;
    ReportInvoice: TfrxReport;
    QCustomer: TFDQuery;
    DSOrderOverview: TDataSource;
    frxDBCustomer: TfrxDBDataset;
    QOrder: TFDQuery;
    frxDBOrder: TfrxDBDataset;
    QOrderOrderID: TFDAutoIncField;
    QOrderCustomerID: TWideStringField;
    QOrderEmployeeID: TIntegerField;
    QOrderOrderDate: TDateTimeField;
    QOrderRequiredDate: TDateTimeField;
    QOrderShippedDate: TDateTimeField;
    QOrderShipVia: TIntegerField;
    QOrderFreight: TLargeintField;
    QOrderShipName: TWideStringField;
    QOrderShipAddress: TWideStringField;
    QOrderShipCity: TWideStringField;
    QOrderShipRegion: TWideStringField;
    QOrderShipPostalCode: TWideStringField;
    QOrderShipCountry: TWideStringField;
    QOrderEmployeeName: TWideStringField;
    QOrderEmployeeFirstName: TWideStringField;
    QOrderShipper: TWideStringField;
    QOrderDetails: TFDQuery;
    QOrderDetailsOrderID: TIntegerField;
    QOrderDetailsProductID: TIntegerField;
    QOrderDetailsUnitPrice: TLargeintField;
    QOrderDetailsQuantity: TIntegerField;
    QOrderDetailsDiscount: TFloatField;
    QOrderDetailsProductName: TWideStringField;
    frxDBOrderDetails: TfrxDBDataset;
    PDFExport: TfrxPDFExport;
    procedure ConnectionBeforeConnect(Sender: TObject);
  private
    function GetDBConfig: string;
  public
    property DBConfig: string read GetDBConfig;
    /// <summary>
    /// Reopens the order overview query.
    /// </summary>
    procedure RefreshOrders;
    /// <summary>
    /// Prints and exports the invoice for the currently selected order.
    /// </summary>
    procedure PrintInvoice;
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

procedure TDMMain.PrintInvoice;
begin
  ReportInvoice.PrepareReport;

  // Use ShowReport while designing the report interactively.
  // ReportInvoice.ShowReport;

  // Set ShowDialog to false to print directly to the default printer.
  // ReportInvoice.PrintOptions.ShowDialog := false;
  ReportInvoice.Print;

  PDFExport.ShowDialog := false;
  PDFExport.FileName := TPath.GetAppPath + Format('invoice_%s.pdf', [QOrderOrderID.AsString]);
  ReportInvoice.Export(PDFExport);
end;

procedure TDMMain.RefreshOrders;
begin
  QOrderOverview.Close;
  QOrderOverview.Open;
end;

end.

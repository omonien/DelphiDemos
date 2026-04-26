# Reporting Starter

Materials for the **Reporting with Delphi** webinar from November 21, 2024. This demo builds on the Database Starter and shows how relational data can become a printable report: orders are loaded from SQLite, displayed in a grid, and turned into an invoice with FastReport when the user double-clicks a row.

## What It Shows

The project demonstrates a typical reporting flow in a VCL application:

- FireDAC reads order, customer, and line item data from `northwind.sqlite`.
- An overview query calculates order totals, discounts, and item counts.
- Detail queries are connected to the currently selected order via `MasterSource` and `MasterFields`.
- FastReport receives data through `TfrxDBDataset`.
- `PrintInvoice` prepares the report, prints it, and exports an additional PDF file.

## Project Layout

```text
Reporting Starter/
├── db/
│   └── northwind.sqlite
├── images/
│   ├── Delphi.png
│   ├── Delphi 512.png
│   └── RAD.png
├── source/
│   ├── Company.dpr
│   ├── Company.dproj
│   ├── Main.DM.pas/.dfm
│   └── Main.Form.pas/.dfm
└── Webinar Reporting mit Delphi.pdf
```

## Getting Started

Open `source/Company.dproj` in Delphi and run the project. The included SQLite database is copied to the output directory via a post-build event.

In the running application:

1. Select an order in the grid.
2. Double-click the row.
3. `DMMain.PrintInvoice` prepares the embedded FastReport report.
4. The report is printed and exported as `invoice_<OrderID>.pdf` in the output directory.

## Interesting Code

- `source/Main.DM.pas`: FireDAC queries, FastReport components, and `PrintInvoice`.
- `QOrderOverview`: aggregates order data with `JOIN`, `GROUP BY`, totals, and discounts.
- `QCustomer`, `QOrder`, `QOrderDetails`: master/detail data for the report.
- `frxDBCustomer`, `frxDBOrder`, `frxDBOrderDetails`: the bridge between FireDAC and FastReport.
- `source/Main.Form.pas`: double-clicking the grid triggers invoice creation.

## FastReport Editions

FastReport is available as a free Embarcadero Edition and in extended commercial editions. The exact feature set may vary by Delphi and FastReport version; the table below is meant as a high-level orientation.

| Feature | Embarcadero Edition | Commercial editions |
| --- | --- | --- |
| Visual report designer | Yes | Yes |
| Runtime designer for end users | No | Yes |
| Script engine | No | Yes |
| Supported script languages | None | PascalScript, C++Script, JScript, BasicScript |
| Database support | Limited | Broader, depending on edition and installed components |
| Export formats | PDF, RTF, HTML, TXT, images, CSV | Additional formats depending on edition, such as XLSX, DOCX, PPTX, ODS, ODT, DBF, email |
| Web reporting components | No | Yes |
| Source code access | No | Depending on commercial edition |
| Converters for other report formats | No | Depending on edition, such as QuickReport, Rave Reports, ReportBuilder |

## Things To Try

1. Use `ReportInvoice.ShowReport` instead of `ReportInvoice.Print` to show the preview.
2. Adjust the report in the DFM/FastReport designer.
3. Add more fields from `Customers`, `Employees`, or `Products`.
4. Change the PDF file name or export to another format if your FastReport edition supports it.

## Requirements

- Delphi/RAD Studio for Windows.
- FireDAC with the SQLite driver.
- FastReport components for your Delphi version.

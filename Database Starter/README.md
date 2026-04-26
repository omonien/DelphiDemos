# Database Starter

A lean VCL demo for getting started with database applications in Delphi, FireDAC, and SQLite. The project shows a classic and easy-to-follow structure: a `TDataModule` owns the connection and query, a form displays the data in a `TDBGrid`, and the SQLite database is copied next to the executable during the build.

## What It Shows

This demo is useful if you want to see how little infrastructure is needed to access a local database cleanly from Delphi:

- `TFDConnection` connects to a SQLite database file.
- `TFDQuery` loads orders from the Northwind database.
- `TDataSource` and `TDBGrid` turn the query into a visible VCL UI.
- The DataModule keeps data access separate from UI code.
- A post-build event copies `db/northwind.sqlite` to the output directory.

## Project Layout

```text
Database Starter/
├── db/
│   └── northwind.sqlite
├── source/
│   ├── Company.dpr
│   ├── Company.dproj
│   ├── Main.DM.pas/.dfm
│   └── Main.Form.pas/.dfm
└── Webinar Datenbank-Anwendungen mit Delphi.pdf
```

## Getting Started

Open `source/Company.dproj` in Delphi and run the project. On the first build, the SQLite database from `db/` is copied to the output directory. When the application starts, `TDMMain.RefreshOrders` opens this query:

```sql
select *
from Orders
order by OrderDate desc
```

The form displays the path to the active database and provides a `Refresh` button that reopens the query.

## Interesting Code

- `source/Main.DM.pas`: database connection, query, and `RefreshOrders`.
- `ConnectionBeforeConnect`: sets the runtime database path to `TPath.GetAppPath + Northwind.sqlite`.
- `source/Main.Form.pas`: startup UI logic and refresh button.
- `source/Company.dproj`: post-build event for copying the database file.

## Things To Try

1. Change the SQL query, for example by adding `where ShipCountry = 'Germany'`.
2. Add calculated fields or customize the visible columns in the `TDBGrid`.
3. Add a second query for customers or order details.
4. Move the database file temporarily and observe how the displayed path helps with troubleshooting.

## Requirements

- Delphi/RAD Studio for Windows.
- FireDAC with the SQLite driver.

The demo does not require an external server or a database engine installation. Everything runs locally against the included SQLite file.

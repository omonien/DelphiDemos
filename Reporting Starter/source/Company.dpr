/// <summary>
/// Company
/// Starts the reporting starter demo application.
/// </summary>
///
/// <remarks>
/// Creates the reporting DataModule before the main form so the form can load
/// and print invoice data from the bundled SQLite database.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

program Company;

uses
  Vcl.Forms,
  Main.Form in 'Main.Form.pas' {FormMain},
  Main.DM in 'Main.DM.pas' {DMMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.

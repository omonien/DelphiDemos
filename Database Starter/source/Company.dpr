/// <summary>
/// Company
/// Starts the database starter demo application.
/// </summary>
///
/// <remarks>
/// Creates the shared DataModule first so the main form can open and display
/// order data from the bundled SQLite database.
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

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

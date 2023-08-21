program UDPClient;

uses
  Vcl.Forms,
  UPDClient.Main.Form in 'UPDClient.Main.Form.pas' {FormMainClient};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainClient, FormMainClient);
  Application.Run;
end.

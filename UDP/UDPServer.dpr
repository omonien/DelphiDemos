program UDPServer;

uses
  Vcl.Forms,
  UDPServer.Main.Form in 'UDPServer.Main.Form.pas' {FormMainServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainServer, FormMainServer);
  Application.Run;
end.

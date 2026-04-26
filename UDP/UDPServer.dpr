/// <summary>
/// UDPServer
/// Starts the UDP server demo application.
/// </summary>
///
/// <remarks>
/// The server sends UTF-8 encoded text packets to the local UDP client demo.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

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

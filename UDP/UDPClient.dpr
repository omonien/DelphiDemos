/// <summary>
/// UDPClient
/// Starts the UDP client demo application.
/// </summary>
///
/// <remarks>
/// The client binds to the local UDP demo port and waits for packets sent by
/// the companion UDP server demo.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

program UDPClient;

uses
  Vcl.Forms,
  UDPClient.Main.Form in 'UDPClient.Main.Form.pas' {FormMainClient};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainClient, FormMainClient);
  Application.Run;
end.

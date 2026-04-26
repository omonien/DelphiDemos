/// <summary>
/// UDPClient.Main.Form
/// Main form for the UDP receiver demo.
/// </summary>
///
/// <remarks>
/// Waits for a UDP packet on the local demo port and decodes the payload as
/// UTF-8 text.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

unit UDPClient.Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, Vcl.StdCtrls;

type
  /// <summary>
  /// Receives a local UDP packet and displays its decoded text.
  /// </summary>
  TFormMainClient = class(TForm)
    UDPClient: TIdUDPClient;
    MemoMessages: TMemo;
    ButtonReceive: TButton;
    procedure ButtonReceiveClick(Sender: TObject);
  end;

var
  FormMainClient: TFormMainClient;

implementation

uses
  IdGlobal;

{$R *.dfm}


procedure TFormMainClient.ButtonReceiveClick(Sender: TObject);
var
  LBuffer: TIdBytes;
  LReceivedText: string;
begin
  UDPClient.Active := true;
  SetLength(LBuffer, 1024);
  ButtonReceive.Enabled := false;
  ButtonReceive.Caption := 'waiting ...';
  Application.ProcessMessages;
  try
    UDPClient.ReceiveBuffer(LBuffer);
    LReceivedText := TEncoding.UTF8.GetString(LBuffer);
    MemoMessages.Lines.Add('Received: ' + LReceivedText);
  finally
    ButtonReceive.Enabled := true;
    ButtonReceive.Caption := 'receive';
  end;
end;

end.

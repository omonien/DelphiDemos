/// <summary>
/// UDPServer.Main.Form
/// Main form for the UDP sender demo.
/// </summary>
///
/// <remarks>
/// Encodes text as UTF-8 and sends it to the local client through Indy UDP.
/// </remarks>
///
/// <copyright>
/// Copyright © 2026 Olaf Monien
/// Licensed under MIT
/// </copyright>

unit UDPServer.Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer, Vcl.StdCtrls;

type
  /// <summary>
  /// Sends the entered text as a local UDP packet.
  /// </summary>
  TFormMainServer = class(TForm)
    UDPServer: TIdUDPServer;
    ButtonSend: TButton;
    EditMessage: TEdit;
    procedure ButtonSendClick(Sender: TObject);
  end;

var
  FormMainServer: TFormMainServer;

implementation

uses
  IdGlobal;

{$R *.dfm}


procedure TFormMainServer.ButtonSendClick(Sender: TObject);
var
  LBuffer: TIdBytes;
begin
  LBuffer := TIdBytes(TEncoding.UTF8.GetBytes(EditMessage.Text));
  UDPServer.SendBuffer('127.0.0.1', 7777, LBuffer);
end;

end.

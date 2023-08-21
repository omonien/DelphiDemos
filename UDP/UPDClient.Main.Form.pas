unit UPDClient.Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, Vcl.StdCtrls;

type
  TFormMainClient = class(TForm)
    UDPClient: TIdUDPClient;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainClient: TFormMainClient;

implementation

uses
  IdGlobal;

{$R *.dfm}


procedure TFormMainClient.Button1Click(Sender: TObject);
var
  LBuffer: TIdBytes;
  LReceivedText: string;
begin
  UDPClient.Active := true;
  SetLength(LBuffer, 1024); // chunks of 1k max
  Button1.Enabled := false;
  Button1.Caption := 'waiting ...';
  Application.ProcessMessages;
  try
    UDPClient.ReceiveBuffer(LBuffer);
    LReceivedText := TEncoding.UTF8.GetString(LBuffer);
    Memo1.Lines.Add('Received: ' + LReceivedText);
  finally
    Button1.Enabled := true;
    Button1.Caption := 'receive';
  end;
end;

end.

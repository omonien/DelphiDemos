unit UDPServer.Main.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer, Vcl.StdCtrls;

type
  TFormMainServer = class(TForm)
    UDPServer: TIdUDPServer;
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainServer: TFormMainServer;

implementation

uses
  IdGlobal;

{$R *.dfm}


procedure TFormMainServer.Button1Click(Sender: TObject);
var
  LBuffer: TidBytes;
begin
  // TidBytes is an array of byte, just like TBytes. It just existed earlier.
  LBuffer := TidBytes(TEncoding.UTF8.GetBytes(Edit1.text));
  UDPServer.SendBuffer('127.0.0.1', 7777, LBuffer);
end;

end.

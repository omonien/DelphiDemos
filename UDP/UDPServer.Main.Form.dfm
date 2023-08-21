object FormMainServer: TFormMainServer
  Left = 0
  Top = 0
  Caption = 'Server'
  ClientHeight = 113
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 255
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 241
    Height = 23
    TabOrder = 1
    Text = 'Hello World '#252#246#228' '#1513#1500#1493#1501' '#1506#1493#1500#1501
  end
  object UDPServer: TIdUDPServer
    Bindings = <>
    DefaultPort = 7777
    Left = 24
    Top = 56
  end
end

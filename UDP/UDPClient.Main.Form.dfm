object FormMainClient: TFormMainClient
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 241
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    330
    241)
  TextHeight = 15
  object MemoMessages: TMemo
    Left = 8
    Top = 39
    Width = 314
    Height = 194
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object ButtonReceive: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'receive'
    TabOrder = 1
    OnClick = ButtonReceiveClick
  end
  object UDPClient: TIdUDPClient
    BoundIP = '127.0.0.1'
    BoundPort = 7777
    Port = 0
    Left = 144
    Top = 120
  end
end

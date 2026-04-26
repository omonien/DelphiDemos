object FormToolbox: TFormToolbox
  Left = 0
  Top = 0
  Caption = 'Toolbox'
  ClientHeight = 320
  ClientWidth = 220
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  OnClose = FormClose
  object Header: TPanel
    Left = 0
    Top = 0
    Width = 220
    Height = 28
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '   Tools'
    Color = clMenuBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object btnNew: TButton
    Left = 12
    Top = 40
    Width = 196
    Height = 30
    Caption = 'New'
    TabOrder = 1
    OnClick = btnNewClick
  end
  object btnOpen: TButton
    Left = 12
    Top = 76
    Width = 196
    Height = 30
    Caption = 'Open...'
    TabOrder = 2
    OnClick = btnOpenClick
  end
  object btnSave: TButton
    Left = 12
    Top = 112
    Width = 196
    Height = 30
    Caption = 'Save'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object btnRun: TButton
    Left = 12
    Top = 148
    Width = 196
    Height = 30
    Caption = 'Run'
    TabOrder = 4
    OnClick = btnRunClick
  end
end

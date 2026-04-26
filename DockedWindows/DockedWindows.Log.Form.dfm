object FormLog: TFormLog
  Left = 0
  Top = 0
  Caption = 'Log'
  ClientHeight = 160
  ClientWidth = 600
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
    Width = 600
    Height = 28
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '   Log'
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
  object Memo: TMemo
    Left = 0
    Top = 28
    Width = 600
    Height = 132
    Align = alClient
    BorderStyle = bsNone
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end

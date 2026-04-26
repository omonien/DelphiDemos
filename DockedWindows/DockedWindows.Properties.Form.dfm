object FormProperties: TFormProperties
  Left = 0
  Top = 0
  Caption = 'Properties'
  ClientHeight = 320
  ClientWidth = 240
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
  OnCreate = FormCreate
  object Header: TPanel
    Left = 0
    Top = 0
    Width = 240
    Height = 28
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '   Properties'
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
  object Grid: TStringGrid
    Left = 0
    Top = 28
    Width = 240
    Height = 292
    Align = alClient
    ColCount = 2
    DefaultRowHeight = 22
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor, goThumbTracking]
    TabOrder = 1
  end
end

object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Docked Windows Demo - moderne Alternative zu MDI'
  ClientHeight = 640
  ClientWidth = 1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object SplitterLeft: TSplitter
    Left = 220
    Top = 30
    Width = 4
    Height = 491
    ExplicitLeft = 220
    ExplicitTop = 30
    ExplicitHeight = 491
  end
  object SplitterRight: TSplitter
    Left = 836
    Top = 30
    Width = 4
    Height = 491
    Align = alRight
    ExplicitLeft = 836
    ExplicitTop = 30
    ExplicitHeight = 491
  end
  object SplitterBottom: TSplitter
    Left = 0
    Top = 521
    Width = 1080
    Height = 4
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 521
    ExplicitWidth = 1080
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 1080
    Height = 30
    AutoSize = True
    Caption = 'ToolBar'
    TabOrder = 0
    object btnToolbox: TToolButton
      Left = 0
      Top = 0
      Caption = 'Toolbox'
      ImageIndex = 0
      OnClick = miViewToolboxClick
    end
    object btnProperties: TToolButton
      Left = 65
      Top = 0
      Caption = 'Properties'
      ImageIndex = 1
      OnClick = miViewPropertiesClick
    end
    object btnLog: TToolButton
      Left = 130
      Top = 0
      Caption = 'Log'
      ImageIndex = 2
      OnClick = miViewLogClick
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 30
    Width = 220
    Height = 491
    Align = alLeft
    BevelOuter = bvNone
    DockSite = True
    UseDockManager = True
    TabOrder = 1
  end
  object PanelRight: TPanel
    Left = 840
    Top = 30
    Width = 240
    Height = 491
    Align = alRight
    BevelOuter = bvNone
    DockSite = True
    UseDockManager = True
    TabOrder = 2
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 525
    Width = 1080
    Height = 96
    Align = alBottom
    BevelOuter = bvNone
    DockSite = True
    UseDockManager = True
    TabOrder = 3
  end
  object PanelCenter: TPanel
    Left = 224
    Top = 30
    Width = 612
    Height = 491
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Workspace'
    TabOrder = 4
    object Workspace: TMemo
      Left = 0
      Top = 0
      Width = 612
      Height = 491
      Align = alClient
      BorderStyle = bsNone
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Consolas'
      Font.Style = []
      Lines.Strings = (
        '// Zentrale Arbeitsflaeche'
        '//'
        '// Statt MDI-Childs nutzt diese Demo:'
        '//   - Dock-Panele (Links / Rechts / Unten)'
        '//   - frei verschiebbare Werkzeug-Fenster (Toolbox, Properties, Log)'
        '//   - per Drag&Drop andocken, abdocken, stapeln (Tabs)'
        '//'
        '// Probiere:'
        '//   1. Titelleiste eines Werkzeug-Fensters greifen und herausziehen.'
        '//   2. Auf ein anderes Dock-Panel ziehen oder uebereinander stapeln.'
        '//   3. Menue "Ansicht" -> Layout zuruecksetzen.')
      ParentFont = False
      TabOrder = 0
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 621
    Width = 1080
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 56
    object miFile: TMenuItem
      Caption = '&Datei'
      object miFileExit: TMenuItem
        Caption = '&Beenden'
        ShortCut = 32883
        OnClick = miFileExitClick
      end
    end
    object miView: TMenuItem
      Caption = '&Ansicht'
      OnClick = miViewClick
      object miViewToolbox: TMenuItem
        AutoCheck = True
        Caption = '&Toolbox'
        ShortCut = 16500
        OnClick = miViewToolboxClick
      end
      object miViewProperties: TMenuItem
        AutoCheck = True
        Caption = '&Eigenschaften'
        ShortCut = 16501
        OnClick = miViewPropertiesClick
      end
      object miViewLog: TMenuItem
        AutoCheck = True
        Caption = '&Log'
        ShortCut = 16502
        OnClick = miViewLogClick
      end
      object miViewSep1: TMenuItem
        Caption = '-'
      end
      object miViewResetLayout: TMenuItem
        Caption = 'Layout &zuruecksetzen'
        OnClick = miViewResetLayoutClick
      end
    end
  end
end

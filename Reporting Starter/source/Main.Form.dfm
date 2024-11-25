object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Company'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 624
    Height = 376
    Align = alClient
    DataSource = DSOrderOverview
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'OrderDate'
        Title.Caption = 'Bestelldatum'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerPostalCode'
        Title.Caption = 'PLZ'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustomerName'
        Title.Caption = 'Kunde'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OrderSum'
        Title.Caption = 'Summe'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 376
    Width = 624
    Height = 65
    Align = alBottom
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    DesignSize = (
      624
      65)
    object LabelDatabase: TLabel
      Left = 16
      Top = 28
      Width = 48
      Height = 15
      Caption = 'Database'
    end
    object ButtonRefresh: TButton
      Left = 536
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Refresh'
      TabOrder = 0
      OnClick = ButtonRefreshClick
    end
  end
  object DSOrderOverview: TDataSource
    DataSet = DMMain.QOrderOverview
    Left = 304
    Top = 160
  end
end

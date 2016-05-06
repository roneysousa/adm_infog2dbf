object frmLocalizarBase: TfrmLocalizarBase
  Left = 253
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 341
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 324
    Height = 67
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 84
      Height = 13
      Caption = '&Nome/Descri'#231#227'o:'
      FocusControl = edtConsulta
    end
    object edtConsulta: TEdit
      Left = 8
      Top = 24
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 0
      OnKeyDown = edtConsultaKeyDown
      OnKeyPress = edtConsultaKeyPress
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 67
    Width = 324
    Height = 274
    Align = alClient
    TabOrder = 1
    object dbGridDados: TDBGrid
      Left = 1
      Top = 1
      Width = 322
      Height = 272
      Align = alClient
      DataSource = dsConsulta
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbGridDadosDblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          Visible = True
        end
        item
          Expanded = False
          Visible = True
        end>
    end
  end
  object qryConsulta: TQuery
    DatabaseName = 'ADM'
    Left = 128
    Top = 123
  end
  object dsConsulta: TDataSource
    DataSet = qryConsulta
    Left = 168
    Top = 123
  end
end

object frmLocCliente: TfrmLocCliente
  Left = 273
  Top = 123
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar Cliente'
  ClientHeight = 372
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 67
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = '&Nome:'
      FocusControl = edtNMCLIE
    end
    object edtNMCLIE: TEdit
      Left = 8
      Top = 24
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 40
      TabOrder = 0
      OnChange = edtNMCLIEChange
      OnKeyDown = edtNMCLIEKeyDown
      OnKeyPress = edtNMCLIEKeyPress
    end
  end
  object pnlDados: TPanel
    Left = 0
    Top = 67
    Width = 337
    Height = 305
    Align = alClient
    TabOrder = 1
    object dbGridDados: TDBGrid
      Left = 1
      Top = 1
      Width = 335
      Height = 303
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
          Expanded = False
          FieldName = 'CLI_CDCLIE'
          Title.Caption = 'CODIGO'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLI_NMCLIE'
          Title.Caption = 'CLIENTE'
          Width = 244
          Visible = True
        end>
    end
  end
  object qryConsulta: TQuery
    DatabaseName = 'ADM'
    SQL.Strings = (
      'Select CLI_CDCLIE, CLI_NMCLIE from ADMCLI '
      'Where CLI_NMCLIE like :pNOME order by CLI_NMCLIE')
    Left = 184
    Top = 139
    ParamData = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    object qryConsultaCLI_CDCLIE: TStringField
      FieldName = 'CLI_CDCLIE'
      Origin = 'ADM."ADMCLI.DBF".CLI_CDCLIE'
      Size = 7
    end
    object qryConsultaCLI_NMCLIE: TStringField
      FieldName = 'CLI_NMCLIE'
      Origin = 'ADM."ADMCLI.DBF".CLI_NMCLIE'
      Size = 50
    end
  end
  object dsConsulta: TDataSource
    DataSet = qryConsulta
    Left = 224
    Top = 147
  end
end

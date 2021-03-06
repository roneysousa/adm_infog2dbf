object FrmSendMail: TFrmSendMail
  Left = 237
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enviar Email'
  ClientHeight = 507
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 803
    Height = 413
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 210
      Top = 1
      Width = 592
      Height = 411
      Align = alClient
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 590
        Height = 96
        Align = alTop
        TabOrder = 0
        object Label6: TLabel
          Left = 16
          Top = 8
          Width = 17
          Height = 13
          Caption = 'De:'
          Transparent = True
        end
        object Label2: TLabel
          Left = 17
          Top = 49
          Width = 43
          Height = 13
          Caption = 'Assunto:'
          Color = clBtnFace
          ParentColor = False
        end
        object edtDe: TEdit
          Left = 16
          Top = 24
          Width = 500
          Height = 21
          TabOrder = 0
        end
        object edSubject: TEdit
          Left = 16
          Top = 67
          Width = 500
          Height = 21
          TabOrder = 1
        end
      end
      object pnlBody: TPanel
        Left = 1
        Top = 97
        Width = 590
        Height = 313
        Align = alClient
        TabOrder = 1
        object Label3: TLabel
          Left = 5
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Mensagem:'
          Color = clBtnFace
          ParentColor = False
        end
        object Label5: TLabel
          Left = 368
          Top = 168
          Width = 20
          Height = 13
          Caption = 'LOG'
          Color = clBtnFace
          ParentColor = False
          Visible = False
        end
        object mAltBody: TMemo
          Left = 5
          Top = 24
          Width = 580
          Height = 145
          TabOrder = 0
          WordWrap = False
        end
        object mLog: TMemo
          Left = 370
          Top = 176
          Width = 219
          Height = 148
          TabOrder = 1
          Visible = False
        end
        object listEmails: TListBox
          Left = 7
          Top = 176
          Width = 354
          Height = 137
          ItemHeight = 13
          TabOrder = 2
          Visible = False
        end
      end
    end
    object listaCliente: TListBox
      Left = 1
      Top = 1
      Width = 209
      Height = 411
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 413
    Width = 803
    Height = 53
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 13
      Width = 67
      Height = 13
      Caption = 'Registro(s):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblEnviandoPara: TLabel
      Left = 1
      Top = 39
      Width = 801
      Height = 13
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object ProgressBar1: TProgressBar
      Left = 150
      Top = 10
      Width = 526
      Height = 20
      Max = 11
      Step = 1
      TabOrder = 0
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 466
    Width = 803
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 2
    object bEnviar: TButton
      Left = 24
      Top = 8
      Width = 194
      Height = 25
      Caption = 'Enviar Email'
      TabOrder = 0
      OnClick = bEnviarClick
    end
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    OnBeforeMailProcess = ACBrMail1BeforeMailProcess
    OnMailProcess = ACBrMail1MailProcess
    OnAfterMailProcess = ACBrMail1AfterMailProcess
    OnMailException = ACBrMail1MailException
    Left = 264
    Top = 192
  end
  object MainMenu1: TMainMenu
    Left = 456
    Top = 48
    object Opes1: TMenuItem
      Caption = '&Op'#231#245'es'
      object Configuraes1: TMenuItem
        Caption = 'Configura'#231#245'es'
        OnClick = Configuraes1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Fechar1: TMenuItem
        Caption = 'Fechar'
        OnClick = Fechar1Click
      end
    end
  end
  object cdsListaEnviados: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 643
    Top = 50
    Data = {
      500000009619E0BD010000001800000002000000000003000000500005656D61
      696C0100490000000100055749445448020002009600076172717569766F0100
      4900000001000557494454480200020096000000}
    object cdsListaEnviadosemail: TStringField
      FieldName = 'email'
      Size = 150
    end
    object cdsListaEnviadosarquivo: TStringField
      FieldName = 'arquivo'
      Size = 150
    end
  end
end

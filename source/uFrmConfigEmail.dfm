object FrmConfigEmail: TFrmConfigEmail
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#245'es de Email'
  ClientHeight = 464
  ClientWidth = 602
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 423
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 30
      Height = 13
      Caption = 'SMTP'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 37
      Height = 13
      Caption = 'PORTA'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 33
      Height = 13
      Caption = 'LOGIN'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 16
      Top = 136
      Width = 37
      Height = 13
      Caption = 'SENHA'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 16
      Top = 176
      Width = 53
      Height = 13
      Caption = 'NOME_DE'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 16
      Top = 216
      Width = 52
      Height = 13
      Caption = 'ASSUNTO'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 16
      Top = 256
      Width = 62
      Height = 13
      Caption = 'MENSAGEM'
      FocusControl = DBMemo1
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 390
      Height = 21
      DataField = 'SMTP'
      DataSource = dsDados
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 72
      Width = 134
      Height = 21
      DataField = 'PORTA'
      DataSource = dsDados
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 112
      Width = 390
      Height = 21
      DataField = 'LOGIN'
      DataSource = dsDados
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 152
      Width = 390
      Height = 21
      DataField = 'SENHA'
      DataSource = dsDados
      PasswordChar = '*'
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 192
      Width = 390
      Height = 21
      DataField = 'NOME_DE'
      DataSource = dsDados
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 232
      Width = 390
      Height = 21
      DataField = 'ASSUNTO'
      DataSource = dsDados
      TabOrder = 5
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 272
      Width = 537
      Height = 89
      DataField = 'MENSAGEM'
      DataSource = dsDados
      TabOrder = 6
    end
    object DBCheckBox1: TDBCheckBox
      Left = 16
      Top = 368
      Width = 97
      Height = 17
      Caption = 'SSL'
      DataField = 'SSL'
      DataSource = dsDados
      TabOrder = 7
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 16
      Top = 392
      Width = 97
      Height = 17
      Caption = 'TSL'
      DataField = 'TSL'
      DataSource = dsDados
      TabOrder = 8
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 423
    Width = 602
    Height = 41
    Align = alBottom
    Color = clNavy
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
  object dsDados: TDataSource
    DataSet = dmADM.cdsConfigEmail
    Left = 296
    Top = 224
  end
end

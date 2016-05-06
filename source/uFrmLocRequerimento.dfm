object frmLocReclamacao: TfrmLocReclamacao
  Left = 209
  Top = 133
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 381
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 137
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 35
      Height = 13
      Caption = 'Cliente:'
      Transparent = True
    end
    object spLocCliente: TSpeedButton
      Left = 113
      Top = 23
      Width = 23
      Height = 22
      Hint = 'Localizar Cliente'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777770077777777777770FF077777777777077FF07777
        7777770777FF077777777770777FFF00777777790777F1111077777790771117
        0B77777770799170B77777777709990B77777777770990B77777777777090B77
        777777777770B777777777777777777777777777777777777777}
      OnClick = spLocClienteClick
    end
    object Label2: TLabel
      Left = 16
      Top = 89
      Width = 41
      Height = 13
      Caption = 'Per'#237'odo:'
      FocusControl = edtData
      Transparent = True
    end
    object lblNome: TLabel
      Left = 144
      Top = 32
      Width = 13
      Height = 13
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 141
      Top = 107
      Width = 6
      Height = 13
      Caption = #224
    end
    object Label1: TLabel
      Left = 16
      Top = 48
      Width = 42
      Height = 13
      Caption = 'T'#233'cnico:'
      Transparent = True
    end
    object spLocTecnico: TSpeedButton
      Left = 113
      Top = 63
      Width = 23
      Height = 22
      Hint = 'Localizar T'#233'cnico'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777770077777777777770FF077777777777077FF07777
        7777770777FF077777777770777FFF00777777790777F1111077777790771117
        0B77777770799170B77777777709990B77777777770990B77777777777090B77
        777777777770B777777777777777777777777777777777777777}
      OnClick = spLocTecnicoClick
    end
    object lblTecnico: TLabel
      Left = 144
      Top = 72
      Width = 13
      Height = 13
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 469
      Top = 61
      Width = 75
      Height = 25
      TabOrder = 5
      Visible = False
      Kind = bkOK
    end
    object edtData: TDateEdit
      Left = 16
      Top = 104
      Width = 121
      Height = 21
      Hint = 'Digite a data de requerimento'
      NumGlyphs = 2
      TabOrder = 2
      OnExit = edtDataExit
    end
    object btnConsultar: TBitBtn
      Left = 591
      Top = 104
      Width = 75
      Height = 25
      Hint = 'Consultar dados'
      Caption = '&Consultar'
      TabOrder = 4
      OnClick = btnConsultarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF075507075507FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0755079D
        D9AD47AA22035300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF135F129DD9AD47AA22095B00FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF115E1191
        CE9F41A31F085A00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0F5A0E82CB953CA420075800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF12842325
        BD5014A628047407FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF138A242BD15E19B8420DA12304910B006800FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF18922B3AE76F27CB5918
        B23C0C9E1D038A06008200006900FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF1C992F4DFF8839E97225CB5816B53A0A9E1A018A03008300008700006A
        00FF00FFFF00FFFF00FFFF00FFFF00FF168E2836DA672CC6551BA1380F8E2707
        7F12047304006A00006900006E00007400006400FF00FFFF00FFFF00FF005200
        0466061566001468010176082A9A3A3ACCCB00C4CE05817F20963521A7371996
        2D067A0E045D08FF00FF004C00005E00748904EB9F22E796117D8F0A0AAA2755
        D48136EBFF00D8FF0D9AA440D7762CD85178C79E12811E004C00FF00FF004C00
        D7A560F3E39EE7CC62D08A0A005303005102468C4D38EDFF005F4F0044004370
        44F75FF43C1339FF00FFFF00FFFF00FFD7B48CFFFFEEF0DD8FD19212FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF9EFFFF03FFAB00AB790179FF00FFFF00FF
        FF00FFC2A072C49541FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFBD3
        FBFA2FFA8B008BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFA98FAFF00FFFF00FF}
    end
    object edtCDCLIE: TEdit
      Left = 16
      Top = 24
      Width = 95
      Height = 21
      Hint = 'Digite o c'#243'digo do cliente'
      MaxLength = 7
      TabOrder = 0
      OnChange = edtCDCLIEChange
      OnExit = edtCDCLIEExit
      OnKeyPress = edtCDCLIEKeyPress
    end
    object edtDTFINA: TDateEdit
      Left = 152
      Top = 104
      Width = 121
      Height = 21
      Hint = 'Digite a data de requerimento'
      NumGlyphs = 2
      TabOrder = 3
      OnExit = edtDTFINAExit
    end
    object edtCDFUNC: TEdit
      Left = 16
      Top = 64
      Width = 95
      Height = 21
      Hint = 'Digite o c'#243'digo do T'#233'cnico'
      MaxLength = 5
      TabOrder = 1
      OnChange = edtCDFUNCChange
      OnExit = edtCDFUNCExit
      OnKeyPress = edtCDFUNCKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 674
    Height = 244
    Align = alClient
    TabOrder = 1
    object dbGridDados: TDBGrid
      Left = 1
      Top = 1
      Width = 672
      Height = 242
      Hint = 'Duplo-Clique para selecionar o cliente'
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
      OnDrawColumnCell = dbGridDadosDrawColumnCell
      OnDblClick = dbGridDadosDblClick
      OnKeyPress = dbGridDadosKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'REQ_ID'
          Title.Caption = 'REQUERIMENTO'
          Visible = False
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'REQ_DATA'
          Title.Alignment = taRightJustify
          Title.Caption = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQ_DEFEITO'
          Title.Caption = 'DEFEITO'
          Width = 319
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REQ_NMCLIE'
          Title.Caption = 'CLIENTE'
          Width = 256
          Visible = True
        end>
    end
  end
  object dstConsulta: TSQLDataSet
    CommandText = 
      'select R.REQ_ID, R.REQ_DATA, R.REQ_HORA, R.REQ_CLIENTE, R.REQ_DE' +
      'FEITO, R.REQ_CDFUNC, R.REQ_SITUACAO from REQUERIMENTOS R'#13#10'Where ' +
      '(R.REQ_SITUACAO = '#39'A'#39')'#13#10'Order by R.REQ_DATA, R.REQ_HORA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmADM2.sqlConexao
    Left = 328
    Top = 145
  end
  object dspConsulta: TDataSetProvider
    DataSet = dstConsulta
    Options = [poAllowCommandText]
    Left = 368
    Top = 145
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 408
    Top = 145
    object cdsConsultaREQ_ID: TIntegerField
      FieldName = 'REQ_ID'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultaREQ_DATA: TDateField
      FieldName = 'REQ_DATA'
      Required = True
    end
    object cdsConsultaREQ_HORA: TStringField
      FieldName = 'REQ_HORA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsConsultaREQ_CLIENTE: TStringField
      FieldName = 'REQ_CLIENTE'
      FixedChar = True
      Size = 7
    end
    object cdsConsultaREQ_DEFEITO: TMemoField
      FieldName = 'REQ_DEFEITO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsConsultaREQ_CDFUNC: TStringField
      FieldName = 'REQ_CDFUNC'
      FixedChar = True
      Size = 5
    end
    object cdsConsultaREQ_NMCLIE: TStringField
      FieldKind = fkLookup
      FieldName = 'REQ_NMCLIE'
      LookupDataSet = dmADM.tbClientes
      LookupKeyFields = 'CLI_CDCLIE'
      LookupResultField = 'CLI_NMCLIE'
      KeyFields = 'REQ_CLIENTE'
      Size = 50
      Lookup = True
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 448
    Top = 145
  end
end

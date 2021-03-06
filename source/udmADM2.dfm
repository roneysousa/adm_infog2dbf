object dmADM2: TdmADM2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 250
  Top = 151
  Height = 376
  Width = 423
  object sqlConexao: TSQLConnection
    ConnectionName = 'ADM'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=C:\ADMIN\ADM.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet=win1252'
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'C:\Program Files\Firebird\Firebird_2_1\bin\fbclient.dll'
    Left = 40
    Top = 16
  end
  object dstRequerimento: TSQLDataSet
    CommandText = 'select * from REQUERIMENTOS Where (REQ_ID = :pID)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlConexao
    Left = 40
    Top = 72
    object dstRequerimentoREQ_ID: TIntegerField
      FieldName = 'REQ_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstRequerimentoREQ_DATA: TDateField
      FieldName = 'REQ_DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstRequerimentoREQ_HORA: TStringField
      FieldName = 'REQ_HORA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 5
    end
    object dstRequerimentoREQ_CLIENTE: TStringField
      FieldName = 'REQ_CLIENTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object dstRequerimentoREQ_SOLICITANTE: TStringField
      FieldName = 'REQ_SOLICITANTE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dstRequerimentoREQ_DTPREVISAO: TDateField
      FieldName = 'REQ_DTPREVISAO'
      ProviderFlags = [pfInUpdate]
    end
    object dstRequerimentoREQ_HOPREVISAO: TStringField
      FieldName = 'REQ_HOPREVISAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstRequerimentoREQ_TECNICO: TStringField
      FieldName = 'REQ_TECNICO'
      ProviderFlags = [pfInUpdate]
    end
    object dstRequerimentoREQ_TIPO: TIntegerField
      FieldName = 'REQ_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object dstRequerimentoREQ_SITUACAO: TStringField
      FieldName = 'REQ_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstRequerimentoREQ_CDFUNC: TStringField
      FieldName = 'REQ_CDFUNC'
      FixedChar = True
      Size = 5
    end
    object dstRequerimentoREQ_DEFEITO: TMemoField
      FieldName = 'REQ_DEFEITO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dstAtendimento: TSQLDataSet
    CommandText = 'Select * from ATENDIMENTOS Where (ATE_IDREQUERIMENTO = :pID)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlConexao
    Left = 40
    Top = 128
    object dstAtendimentoATE_IDREQUERIMENTO: TIntegerField
      FieldName = 'ATE_IDREQUERIMENTO'
      Required = True
    end
    object dstAtendimentoATE_ID: TIntegerField
      FieldName = 'ATE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstAtendimentoATE_TIPO: TIntegerField
      FieldName = 'ATE_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object dstAtendimentoATE_DATA: TDateField
      FieldName = 'ATE_DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object dstAtendimentoATE_HORA: TStringField
      FieldName = 'ATE_HORA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object dstAtendimentoATE_DIAGNOSTICO: TMemoField
      FieldName = 'ATE_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object dstAtendimentoATE_SITUACAO: TStringField
      FieldName = 'ATE_SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstAtendimentoATE_CDTECNICO: TStringField
      FieldName = 'ATE_CDTECNICO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
  end
  object dstTiposAtendimentos: TSQLDataSet
    CommandText = 
      'select TPA_CODIGO, TPA_DESCRICAO from TIPOS_ATENDIMENTOS order b' +
      'y TPA_DESCRICAO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 40
    Top = 184
    object dstTiposAtendimentosTPA_CODIGO: TIntegerField
      FieldName = 'TPA_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000'
    end
    object dstTiposAtendimentosTPA_DESCRICAO: TStringField
      FieldName = 'TPA_DESCRICAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsRequerimentos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspRequerimento'
    Left = 216
    Top = 72
    object cdsRequerimentosREQ_ID: TIntegerField
      FieldName = 'REQ_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsRequerimentosREQ_DATA: TDateField
      Alignment = taRightJustify
      FieldName = 'REQ_DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object cdsRequerimentosREQ_HORA: TStringField
      Alignment = taRightJustify
      FieldName = 'REQ_HORA'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsRequerimentosREQ_CLIENTE: TStringField
      FieldName = 'REQ_CLIENTE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 7
    end
    object cdsRequerimentosREQ_SOLICITANTE: TStringField
      FieldName = 'REQ_SOLICITANTE'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsRequerimentosREQ_DTPREVISAO: TDateField
      Alignment = taRightJustify
      FieldName = 'REQ_DTPREVISAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '99/99/9999;1;_'
    end
    object cdsRequerimentosREQ_HOPREVISAO: TStringField
      Alignment = taRightJustify
      FieldName = 'REQ_HOPREVISAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsRequerimentosREQ_TECNICO: TStringField
      FieldName = 'REQ_TECNICO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsRequerimentosREQ_TIPO: TIntegerField
      FieldName = 'REQ_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsRequerimentosREQ_SITUACAO: TStringField
      FieldName = 'REQ_SITUACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object cdsRequerimentosREQ_CDFUNC: TStringField
      FieldName = 'REQ_CDFUNC'
      FixedChar = True
      Size = 5
    end
    object cdsRequerimentosREQ_NMTECNICO: TStringField
      FieldKind = fkLookup
      FieldName = 'REQ_NMTECNICO'
      LookupDataSet = dmADM.tbFuncionarios
      LookupKeyFields = 'FUN_CDFUNC'
      LookupResultField = 'FUN_NMFUNC'
      KeyFields = 'REQ_CDFUNC'
      Size = 50
      Lookup = True
    end
    object cdsRequerimentosREQ_DEFEITO: TMemoField
      FieldName = 'REQ_DEFEITO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dspRequerimento: TDataSetProvider
    DataSet = dstRequerimento
    Options = [poAllowCommandText]
    OnGetTableName = dspRequerimentoGetTableName
    Left = 128
    Top = 72
  end
  object dspAtendimento: TDataSetProvider
    DataSet = dstAtendimento
    Options = [poAllowCommandText]
    OnGetTableName = dspAtendimentoGetTableName
    Left = 128
    Top = 128
  end
  object cdsAtendimento: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspAtendimento'
    Left = 224
    Top = 128
    object cdsAtendimentoATE_IDREQUERIMENTO: TIntegerField
      FieldName = 'ATE_IDREQUERIMENTO'
      Required = True
    end
    object cdsAtendimentoATE_ID: TIntegerField
      FieldName = 'ATE_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsAtendimentoATE_NOMETIPO: TStringField
      FieldKind = fkLookup
      FieldName = 'ATE_NOMETIPO'
      LookupDataSet = cdsTpAtend
      LookupKeyFields = 'TPA_CODIGO'
      LookupResultField = 'TPA_DESCRICAO'
      KeyFields = 'ATE_TIPO'
      Lookup = True
    end
    object cdsAtendimentoATE_TIPO: TIntegerField
      FieldName = 'ATE_TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtendimentoATE_DATA: TDateField
      FieldName = 'ATE_DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtendimentoATE_HORA: TStringField
      FieldName = 'ATE_HORA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
    object cdsAtendimentoATE_DIAGNOSTICO: TMemoField
      FieldName = 'ATE_DIAGNOSTICO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsAtendimentoATE_SITUACAO: TStringField
      FieldName = 'ATE_SITUACAO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cdsAtendimentoATE_CDTECNICO: TStringField
      FieldName = 'ATE_CDTECNICO'
      FixedChar = True
      Size = 5
    end
    object cdsAtendimentoATE_TECNICO: TStringField
      FieldKind = fkLookup
      FieldName = 'ATE_TECNICO'
      LookupDataSet = dmADM.tbFuncionarios
      LookupKeyFields = 'FUN_CDFUNC'
      LookupResultField = 'FUN_NMFUNC'
      KeyFields = 'ATE_CDTECNICO'
      Size = 40
      Lookup = True
    end
  end
  object dspTpAtendimento: TDataSetProvider
    DataSet = dstTiposAtendimentos
    Options = [poAllowCommandText]
    Left = 144
    Top = 184
  end
  object cdsTpAtend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTpAtendimento'
    Left = 240
    Top = 184
    object cdsTpAtendTPA_CODIGO: TIntegerField
      FieldName = 'TPA_CODIGO'
      Required = True
    end
    object cdsTpAtendTPA_DESCRICAO: TStringField
      FieldName = 'TPA_DESCRICAO'
    end
  end
  object dstConfig: TSQLDataSet
    CommandText = 'select * from CONFIG'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 184
    Top = 24
    object dstConfigCFG_REQUERIMENTO: TIntegerField
      FieldName = 'CFG_REQUERIMENTO'
    end
  end
  object dspConfig: TDataSetProvider
    DataSet = dstConfig
    Options = [poAllowCommandText]
    Left = 256
    Top = 24
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfig'
    Left = 320
    Top = 24
    object cdsConfigCFG_REQUERIMENTO: TIntegerField
      FieldName = 'CFG_REQUERIMENTO'
    end
  end
  object dstConsulta: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 40
    Top = 288
  end
  object dspConsulta: TDataSetProvider
    DataSet = cdsConsulta
    Options = [poAllowCommandText]
    Left = 112
    Top = 288
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 192
    Top = 288
  end
end

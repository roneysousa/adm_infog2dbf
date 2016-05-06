inherited frmLocTecnico: TfrmLocTecnico
  Caption = 'Localizar T'#233'cnico'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTopo: TPanel
    inherited edtConsulta: TEdit
      OnChange = edtConsultaChange
    end
  end
  inherited pnlDados: TPanel
    inherited dbGridDados: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'FUN_CDFUNC'
          Title.Caption = 'C'#211'DIGO'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FUN_NMFUNC'
          Title.Caption = 'NOME'
          Width = 250
          Visible = True
        end>
    end
  end
  inherited qryConsulta: TQuery
    SQL.Strings = (
      'Select FUN_CDFUNC, FUN_NMFUNC from "ADMFUN.DBF" '
      'Where (FUN_NMFUNC like :pNMFUNC)')
    ParamData = <
      item
        DataType = ftString
        Name = 'pNMFUNC'
        ParamType = ptInput
        Value = ''
      end>
  end
end

unit uFrmFichaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables, ppDB,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppBands, ppCache;

type
  TfrmFichaClientes = class(TForm)
    pnlTopo: TPanel;
    pnlDados: TPanel;
    pnlInferior: TPanel;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    dbGridDados: TDBGrid;
    qryClientes: TQuery;
    dsClientes: TDataSource;
    qryClientesCLI_CDCLIE: TStringField;
    qryClientesCLI_NMCLIE: TStringField;
    qryClientesCLI_RASOCI: TStringField;
    qryClientesCLI_ENCLIE: TStringField;
    qryClientesCLI_CICLIE: TStringField;
    qryClientesCLI_UFCLIE: TStringField;
    qryClientesCLI_BACLIE: TStringField;
    qryClientesCLI_CEPCLI: TStringField;
    qryClientesCLI_CPFCGC: TStringField;
    qryClientesCLI_INSEST: TStringField;
    qryClientesCLI_DTNASC: TStringField;
    qryClientesCLI_NRFONE: TStringField;
    qryClientesCLI_NRCELU: TStringField;
    qryClientesCLI_NUMFAX: TStringField;
    qryClientesCLI_EMAIL1: TStringField;
    qryClientesCLI_NMCONT: TStringField;
    qryClientesCLI_DTCADA: TStringField;
    ppReport1: TppReport;
    ppBDEPipeline1: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppMemo1: TppMemo;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppMemo2: TppMemo;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel18: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    dsRelatorio: TDataSource;
    qryRelatorio: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    ppMemo3: TppMemo;
    ppLabel10: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLine11: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLabel33: TppLabel;
    txtData: TppLabel;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    btFichaBranco: TBitBtn;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    qryRelatorioCEP: TStringField;
    qryRelatorioFONE: TStringField;
    qryRelatorioFAX: TStringField;
    qryRelatorioCNPJ: TStringField;
    qryRelatorioDATACAD: TStringField;
    qryRelatorioDTNASC: TStringField;
    qryRelatorioCELULAR: TStringField;
    ppReport2: TppReport;
    ppBDEPipeline2: TppBDEPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppImage2: TppImage;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppMemo4: TppMemo;
    ppLabel38: TppLabel;
    ppLine30: TppLine;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppShape1: TppShape;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLabel50: TppLabel;
    ppShape2: TppShape;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine43: TppLine;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLine42: TppLine;
    ppLine44: TppLine;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLine45: TppLine;
    ppLabel61: TppLabel;
    ppShape3: TppShape;
    ppLabel62: TppLabel;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppShape4: TppShape;
    ppLabel63: TppLabel;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppShape5: TppShape;
    ppLabel69: TppLabel;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppShape6: TppShape;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppShape7: TppShape;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppShape8: TppShape;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    Label1: TLabel;
    edtCDCLIE: TEdit;
    Label2: TLabel;
    edtNMCLIE: TEdit;
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btFichaBrancoClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure qryRelatorioCalcFields(DataSet: TDataSet);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtNMCLIEChange(Sender: TObject);
  private
    procedure CONSULTA;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFichaClientes: TfrmFichaClientes;
  M_NRFORM : Integer;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmFichaClientes.btFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmFichaClientes.CONSULTA;
begin
     With qryClientes do
        begin
              SQL.Clear;
              Close;
              SQL.Add('Select CLI_CDCLIE, CLI_NMCLIE, CLI_RASOCI, CLI_ENCLIE, CLI_CICLIE, CLI_UFCLIE,');
              SQL.Add('CLI_BACLIE, CLI_CEPCLI, CLI_CPFCGC, CLI_INSEST, CLI_DTNASC,CLI_NRFONE, CLI_NRCELU,');
              SQL.Add('CLI_NUMFAX, CLI_EMAIL1, CLI_NMCONT, CLI_DTCADA');
              SQL.Add('from ADMCLI order by CLI_NMCLIE');
              Prepare;
              Open;
        End;
end;

procedure TfrmFichaClientes.FormShow(Sender: TObject);
begin
     CONSULTA;
end;

procedure TfrmFichaClientes.btFichaBrancoClick(Sender: TObject);
begin
    If (M_NRFORM = 1) Then
    Begin
         qryRelatorio.Close;
         With ppReport1 do
           begin
               txtData.Caption := uFuncoes.DataExtenso(Date());
               PrintReport;
           End;
    End;
    //
    If (M_NRFORM = 2) Then
    Begin
         qryRelatorio.Close;
         With ppReport2 do
           begin
               PrintReport;
           End;
    End;
end;

procedure TfrmFichaClientes.btImprimirClick(Sender: TObject);
Var
    M_CDCLIE : String;
begin
    //
    M_CDCLIE := qryClientes.FieldByName('CLI_CDCLIE').AsString;
    If (M_NRFORM = 1) Then
    Begin
         With qryRelatorio do
          begin
               Close;
               ParamByName('pCDCLIE').AsString := M_CDCLIE;
               Prepare;
               Open;
          End;
         //
         With ppReport1 do
          begin
               txtData.Caption := uFuncoes.DataExtenso(Date());
               PrintReport;
          End;
    End;
    //
    If (M_NRFORM = 2) Then
    Begin
         With qryRelatorio do
          begin
               Close;
               ParamByName('pCDCLIE').AsString := M_CDCLIE;
               Prepare;
               Open;
          End;
         //
         With ppReport2 do
          begin
               PrintReport;
          End;
    End;
end;

procedure TfrmFichaClientes.qryRelatorioCalcFields(DataSet: TDataSet);
begin
     // Cep
     If not uFuncoes.Empty(qryRelatorio.FieldByName('CLI_CEPCLI').AsString) Then
           qryRelatorio.FieldByName('CEP').AsString :=
                Copy(qryRelatorio.FieldByName('CLI_CEPCLI').AsString,1,5)+'-'
               +Copy(qryRelatorio.FieldByName('CLI_CEPCLI').AsString,6,3);
     // fone
     If not uFuncoes.Empty(qryRelatorio.FieldByName('CLI_NRFONE').AsString) Then
            qryRelatorio.FieldByName('FONE').AsString :=
                uFuncoes.FormataFONE(qryRelatorio.FieldByName('CLI_NRFONE').AsString);
     // Fax
     If not uFuncoes.Empty(qryRelatorio.FieldByName('CLI_NUMFAX').AsString) Then
            qryRelatorio.FieldByName('FAX').AsString :=
                uFuncoes.FormataFONE(qryRelatorio.FieldByName('CLI_NUMFAX').AsString);
     //   CNPJ
     If not uFuncoes.Empty(qryRelatorio.FieldByName('CLI_CPFCGC').AsString) Then
            qryRelatorio.FieldByName('CNPJ').AsString :=
                uFuncoes.FormataCNPJ(qryRelatorio.FieldByName('CLI_CPFCGC').AsString);
    // DT Cadastro
     If not uFuncoes.Empty(qryRelatorio.FieldByName('CLI_DTCADA').AsString) Then
            qryRelatorio.FieldByName('DATACAD').AsString :=
                uFuncoes.FormataData(qryRelatorio.FieldByName('CLI_DTCADA').AsString);
    // Nascimento
     If not uFuncoes.Empty(qryRelatorio.FieldByName('CLI_DTNASC').AsString) Then
            qryRelatorio.FieldByName('DTNASC').AsString :=
                uFuncoes.FormataData(qryRelatorio.FieldByName('CLI_DTNASC').AsString);
    // celular
     If not uFuncoes.Empty(qryRelatorio.FieldByName('CLI_NRCELU').AsString) Then
            qryRelatorio.FieldByName('CELULAR').AsString :=
                Copy(qryRelatorio.FieldByName('CLI_NRCELU').AsString,1,4)+'-'
               +Copy(qryRelatorio.FieldByName('CLI_NRCELU').AsString,5,4);
end;

procedure TfrmFichaClientes.edtCDCLIEChange(Sender: TObject);
begin
      If not uFuncoes.Empty(edtCDCLIE.Text) Then
         qryClientes.Locate('CLI_CDCLIE',uFuncoes.StrZero(edtCDCLIE.Text,7),[loPartialKey]);
end;

procedure TfrmFichaClientes.edtNMCLIEChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNMCLIE.Text) Then
         qryClientes.Locate('CLI_NMCLIE',edtNMCLIE.Text,[loPartialKey]);
end;

end.

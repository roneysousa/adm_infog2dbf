unit uFrmRelClientesContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, StdCtrls, Buttons, ppDB, ppDBPipe,
  ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl,
  ppBands, ppCache, DBClient, DBTables;

type
  TfrmRelClientesContrato = class(TForm)
    pnlTopo: TPanel;
    pnlDados: TPanel;
    pnlInferior: TPanel;
    dbGridDados: TDBGrid;
    dsContratos: TDataSource;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    ppReport1: TppReport;
    ppBDEPipeline1: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    cdsClientes: TClientDataSet;
    qryClientes: TQuery;
    cdsClientesCODIGO: TStringField;
    cdsClientesNOME: TStringField;
    cdsClientesDATACONTRATO: TStringField;
    cdsClientesDATAVENCIMENTO: TStringField;
    cdsClientesDIAFATURA: TStringField;
    cdsClientesVALOR: TCurrencyField;
    cdsClientesSITUACAO: TStringField;
    dsclientes: TDataSource;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel5: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine4: TppLine;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    edtCDCLIE: TEdit;
    edtNMCLIE: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtNMCLIEChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
     procedure CLIENTES;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClientesContrato: TfrmRelClientesContrato;

implementation

uses udmADM, uFuncoes;

{$R *.dfm}

{ TfrmRelClientesContrato }

procedure TfrmRelClientesContrato.CLIENTES;
begin
    With dmADM.qryContratos do
      begin
           Close;
           Prepare;
           Open;
      End;
    //
    If (dmADM.qryContratos.RecordCount > 0) Then
      begin
           With qryClientes do
            begin
                 Close;
                 Prepare;
                 Open;
                 First;
                 //
                 If not (cdsClientes.Active) Then
                      cdsClientes.Open;
                 cdsClientes.EmptyDataSet;
                 //
                 While not (qryClientes.Eof) do
                  begin
                       With cdsClientes do
                        begin
                             Append;
                             FieldByName('CODIGO').AsString := qryClientes.FieldByName('CON_CDCLIE').AsString;
                             FieldByName('NOME').AsString   := qryClientes.FieldByName('CON_NMCLIE').AsString;
                             FieldByName('DATACONTRATO').AsString   := qryClientes.FieldByName('CON_DTCONT').AsString;
                             FieldByName('DATAVENCIMENTO').AsString := qryClientes.FieldByName('CON_DTVENC').AsString;
                             FieldByName('DIAFATURA').AsString := qryClientes.FieldByName('CON_DIAFAT').AsString;
                             FieldByName('VALOR').AsCurrency   := qryClientes.FieldByName('CON_VLCONT').AsCurrency;
                             FieldByName('SITUACAO').AsString  := qryClientes.FieldByName('CON_FLSITU').AsString;
                             Post;
                        End;
                       //
                       qryClientes.Next;
                  End;
            End;
      End;
end;

procedure TfrmRelClientesContrato.FormShow(Sender: TObject);
begin
     CLIENTES;
end;

procedure TfrmRelClientesContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmADM.qryContratos.Close; 
end;

procedure TfrmRelClientesContrato.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelClientesContrato.btImprimirClick(Sender: TObject);
begin
    If (dmADM.qryContratos.RecordCount > 0 ) Then
      With ppReport1 do
        begin
             PrintReport;
        End;
end;

procedure TfrmRelClientesContrato.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmRelClientesContrato.edtCDCLIEChange(Sender: TObject);
begin
      If not uFuncoes.Empty(edtCDCLIE.Text) Then
         dmADM.qryContratos.Locate('CON_CDCLIE',uFuncoes.StrZero(edtCDCLIE.Text,7),[loPartialKey]);
end;

procedure TfrmRelClientesContrato.edtNMCLIEChange(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNMCLIE.Text) Then
         dmADM.qryContratos.Locate('CON_NMCLIE',edtNMCLIE.Text,[loPartialKey]);
end;

procedure TfrmRelClientesContrato.FormActivate(Sender: TObject);
begin
    edtCDCLIE.Clear;
    edtNMCLIE.Clear;
end;

end.

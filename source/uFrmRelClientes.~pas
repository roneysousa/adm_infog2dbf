unit uFrmRelClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, DB, Mask, ToolEdit,
  ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppCtrls, ppPrnabl, ppBands, ppCache;

type
  TfrmRelClientes = class(TForm)
    pnlTopo: TPanel;
    pnlDados: TPanel;
    pnlInferior: TPanel;
    dbGridDados: TDBGrid;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    dsClientes: TDataSource;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    btFiltrar: TBitBtn;
    ppReport1: TppReport;
    ppBDEPipeline1: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine4: TppLine;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    edtDTFINA: TDateEdit;
    Label4: TLabel;
    cmbRamos: TComboBox;
    cmbSituacao: TComboBox;
    txtRamo: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    txtSituacao: TppLabel;
    ppLabel9: TppLabel;
    txtPeriodo: TppLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharClick(Sender: TObject);
    procedure edtRAMOKeyPress(Sender: TObject; var Key: Char);
    procedure edtFLSITUKeyPress(Sender: TObject; var Key: Char);
    procedure btFiltrarClick(Sender: TObject);
    procedure edtDTINICChange(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure cmbRamosChange(Sender: TObject);
    procedure cmbSituacaoChange(Sender: TObject);
    procedure cmbRamosEnter(Sender: TObject);
    procedure cmbSituacaoEnter(Sender: TObject);
    procedure edtDTINICEnter(Sender: TObject);
  private
    Procedure CLIENTES;
    procedure CARREGAR_RAMO;
    Function CODIGO_RAMO(M_NMRAMO : String) : String;
    procedure CARREGAR_SITUACAO;
    Function CODIGO_SITUACAO(M_NMSITU : String) : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClientes: TfrmRelClientes;

implementation

uses udmADM, uFuncoes;

{$R *.dfm}

{ TfrmRelClientes }

procedure TfrmRelClientes.CLIENTES;
begin
     With dmADM.qryClientes do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select CLI_CDCLIE, CLI_NMCLIE, CLI_RASOCI, CLI_ENCLIE,');
           SQL.Add('CLI_NRFONE, CLI_NRCELU, CLI_NMCONT, CLI_CDSITU, CLI_CDRAMO');
           SQL.Add('from ADMCLI order by CLI_NMCLIE');
           Prepare;
           Open;
      End;
end;

procedure TfrmRelClientes.FormShow(Sender: TObject);
begin
     CLIENTES;
     CARREGAR_RAMO;
     CARREGAR_SITUACAO;
end;

procedure TfrmRelClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      dmADM.qryClientes.Close; 
end;

procedure TfrmRelClientes.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmRelClientes.edtRAMOKeyPress(Sender: TObject; var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmRelClientes.edtFLSITUKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmRelClientes.btFiltrarClick(Sender: TObject);
Var
   M_DTINIC, M_DTFINA : String;
begin
     With dmADM.qryClientes do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select CLI_CDCLIE, CLI_NMCLIE, CLI_RASOCI, CLI_ENCLIE,');
           SQL.Add('CLI_NRFONE, CLI_NRCELU, CLI_NMCONT, CLI_CDSITU, CLI_CDRAMO');
           SQL.Add('from ADMCLI ');
           SQL.Add('Where (CLI_DTCADA >= :pDTINIC) AND (CLI_DTCADA <= :pDTFINA)');
           //
           If not uFuncoes.Empty(cmbRamos.Text) Then
           Begin
               SQL.Add('And (CLI_CDRAMO = :pCDRAMO)');
                  ParamByName('pCDRAMO').AsString := CODIGO_RAMO(cmbRamos.Text);
           End;
           //
           If not uFuncoes.Empty(cmbSituacao.Text) Then
           Begin
                  SQL.Add('And (CLI_CDSITU = :pCDSITU)');
                  ParamByName('pCDSITU').AsString := CODIGO_SITUACAO(cmbSituacao.Text);
              End;
           //
           SQL.Add('order by CLI_NMCLIE');
           //
           If (edtDTINIC.Text = '  /  /    ') Then
               M_DTINIC := '01/01/1900'
           Else
               M_DTINIC := edtDTINIC.Text;
           //
           If (edtDTFINA.Text = '  /  /    ') Then
               M_DTFINA := '31/12/2099'
           Else
               M_DTFINA := edtDTFINA.Text;
           //
           ParamByName('pDTINIC').AsString := uFuncoes.FormataData2(M_DTINIC);
           ParamByName('pDTFINA').AsString := uFuncoes.FormataData2(M_DTFINA);
           Prepare;
           Open;
      End;
end;

procedure TfrmRelClientes.edtDTINICChange(Sender: TObject);
begin
     If (edtDTINIC.Text = '  /  /    ') Then
         dmADM.qryClientes.Close;
end;

procedure TfrmRelClientes.btImprimirClick(Sender: TObject);
begin
     If (dmADM.qryClientes.Active)
      and (dmADM.qryClientes.RecordCount > 0) Then
        begin
             With ppReport1 do
              begin
                   If not uFuncoes.Empty(cmbRamos.Text) Then
                       txtRamo.Caption := cmbRamos.Text
                   Else
                       txtRamo.Caption := 'TODOS';
                   If not uFuncoes.Empty(cmbSituacao.Text) Then
                       txtSituacao.Caption := cmbSituacao.Text
                   Else
                       txtSituacao.Caption := 'TODOS';
                   If (edtDTINIC.Text <> '  /  /    ') and (edtDTFINA.Text <> '  /  /    ') Then
                       txtPeriodo.Caption := edtDTINIC.Text + ' à '+ edtDTFINA.Text
                   Else
                       txtPeriodo.Caption := '01/01/1900 à 31/12/2099';
                   //
                   PrintReport;
              End;
        End;
end;

procedure TfrmRelClientes.edtDTINICExit(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTINIC.Date := Date();
             edtDTINIC.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRelClientes.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer periído final!!!','ATENÇÃO',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTFINA.Date := Date();
                edtDTFINA.SetFocus;
                Exit;
            End;
            //
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtDTFINA.Date := Date();
             edtDTFINA.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRelClientes.CARREGAR_RAMO;
begin
     With dmADM.qryRamo do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select RAM_CDRAMO, RAM_NMRAMO from "ADMRAM.DBF" order by RAM_NMRAMO');
           Prepare;
           Open;
           First;
           //
           cmbRamos.Clear;
           cmbRamos.Items.Add('');
           While not (EoF) do
            begin
                cmbRamos.Items.Add(FieldByName('RAM_NMRAMO').AsString);
                //
                next;
            End;
      End;
end;

function TfrmRelClientes.CODIGO_RAMO(M_NMRAMO: String): String;
begin
     With dmADM.qryRamo do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select RAM_CDRAMO, RAM_NMRAMO from "ADMRAM.DBF"');
           SQL.Add('Where (RAM_NMRAMO = :pNMRAMO)');
           ParamByName('pNMRAMO').AsString := M_NMRAMO;
           Prepare;
           Open;
           //
           If (dmADM.qryRamo.RecordCount > 0) Then
              result := dmADM.qryRamo.FieldByname('RAM_CDRAMO').AsString;
      End;
end;

procedure TfrmRelClientes.cmbRamosChange(Sender: TObject);
begin
     If uFuncoes.Empty(cmbRamos.Text) Then
         dmADM.qryClientes.Close;
end;

procedure TfrmRelClientes.CARREGAR_SITUACAO;
begin
     With dmADM.qrySituacao do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select SIT_CDSITU, SIT_NMSITU from "ADMSIT.DBF" order by SIT_NMSITU');
           Prepare;
           Open;
           First;
           //
           cmbSituacao.Clear;
           cmbSituacao.Items.Add('');
           While not (EoF) do
            begin
                cmbSituacao.Items.Add(FieldByName('SIT_NMSITU').AsString);
                //
                next;
            End;
      End;
end;

procedure TfrmRelClientes.cmbSituacaoChange(Sender: TObject);
begin
     If uFuncoes.Empty(cmbSituacao.Text) Then
         dmADM.qryClientes.Close;
end;

function TfrmRelClientes.CODIGO_SITUACAO(M_NMSITU: String): String;
begin
     With dmADM.qrySituacao do
      begin
           SQL.Clear;
           Close;
           SQL.Add('Select SIT_CDSITU, SIT_NMSITU from "ADMSIT.DBF"');
           SQL.Add('Where (SIT_NMSITU = :pNMSITU)');
           ParamByName('pNMSITU').AsString := M_NMSITU;
           Prepare;
           Open;
           //
           If (dmADM.qryRamo.RecordCount > 0) Then
              result := dmADM.qrySituacao.FieldByname('SIT_CDSITU').AsString;
      End;
end;

procedure TfrmRelClientes.cmbRamosEnter(Sender: TObject);
begin
     {edtDTINIC.Clear;
     edtDTFINA.Clear;}
     dmADM.qryClientes.Close;
end;

procedure TfrmRelClientes.cmbSituacaoEnter(Sender: TObject);
begin
     {edtDTINIC.Clear;
     edtDTFINA.Clear;}
     dmADM.qryClientes.Close;
end;

procedure TfrmRelClientes.edtDTINICEnter(Sender: TObject);
begin
     dmADM.qryClientes.Close;
end;

End.

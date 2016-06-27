unit uFrmEnvelopeBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, DB, Grids, DBGrids, RpRender,
  RpRenderPDF, RpBase, RpSystem, RpDefine, RpRave, RpCon, RpConDS;

type
  TFrmEnvelopeBoleto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    edtCDCLIE: TEdit;
    sbLocalizar: TSpeedButton;
    edtNome: TEdit;
    btnIncluir: TBitBtn;
    grdConsultar: TDBGrid;
    dsLista: TDataSource;
    btnVisualizar: TBitBtn;
    BitBtn2: TBitBtn;
    btnExcluir: TBitBtn;
    lblRegistro: TLabel;
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure sbLocalizarClick(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dsListaDataChange(Sender: TObject; Field: TField);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEnvelopeBoleto: TFrmEnvelopeBoleto;

implementation

uses uLocCliente, uFuncoes, udmADM;

{$R *.dfm}

procedure TFrmEnvelopeBoleto.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
 If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (key = #13) and uFuncoes.Empty(edtCDCLIE.Text)  Then
      begin
          key:=#0;
          sbLocalizarClick(Sender);
      End;
end;

procedure TFrmEnvelopeBoleto.sbLocalizarClick(Sender: TObject);
begin
 edtCDCLIE.SetFocus;
 Try
      Application.CreateForm(TfrmLocCliente, frmLocCliente);
      frmLocCliente.ShowModal;
  Finally
      //
      If not uFuncoes.Empty(frmLocCliente.qryConsulta.FieldByName('CLI_CDCLIE').AsString) Then
         edtCDCLIE.Text := frmLocCliente.qryConsulta.FieldByName('CLI_CDCLIE').AsString;
      //
      frmLocCliente.Free;
      btnIncluir.SetFocus;
  End;
end;

procedure TFrmEnvelopeBoleto.edtCDCLIEExit(Sender: TObject);
begin
      If not uFuncoes.Empty(edtCDCLIE.Text) Then
        begin
             If not uFuncoes.LOCALIZAR_CLIENTE(uFuncoes.StrZero(edtCDCLIE.Text,7)) Then
                 Begin
                      Application.MessageBox(PChar('Cliente não cadastro!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      edtCDCLIE.Clear;
                      Exit;
                 End;
             //
             edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
             if (dmADM.SelecionaCliente(edtCDCLIE.Text)) then
              begin
                   edtNome.Text   := dmADM.qryLocClientesCLI_RASOCI.AsString;
              End;
        End;
end;

procedure TFrmEnvelopeBoleto.btnIncluirClick(Sender: TObject);
begin
      if uFuncoes.Empty(edtCDCLIE.Text) Then
      begin
           edtCDCLIE.SetFocus;
           Exit;
      End;

      if not uFuncoes.Empty(edtCDCLIE.Text) Then
      begin
          if (dmADM.SelecionaCliente(edtCDCLIE.Text)) then
           begin
              if (dmADM.AddClientenaLista(edtCDCLIE.Text, edtNome.Text,
                 dmADM.qryLocClientesCLI_NMCLIE.AsString, dmADM.qryLocClientesCLI_CPFCGC.AsString,
                 'T', dmADM.qryLocClientesCLI_ENCLIE.AsString, '0',
                 dmADM.qryLocClientesCLI_BACLIE.AsString,
                 '', dmADM.qryLocClientesCLI_CICLIE.AsString, dmADM.qryLocClientesCLI_UFCLIE.AsString,
                 dmADM.qryLocClientesCLI_CEPCLI.AsString)) then
               begin
                    edtCDCLIE.Clear;
                    edtNome.Clear;
                    edtCDCLIE.SetFocus;
                End;
           End;
      End;
end;

procedure TFrmEnvelopeBoleto.FormShow(Sender: TObject);
begin
     btnExcluir.Enabled    := false;
     btnVisualizar.Enabled := false;
     //
     dmADM.cdsListaClientes.close;
     dmADM.cdsListaClientes.open;
     dmADM.cdsListaClientes.EmptyDataSet;
     edtCDCLIE.SetFocus;
end;

procedure TFrmEnvelopeBoleto.edtCDCLIEChange(Sender: TObject);
begin
   if uFuncoes.Empty(edtCDCLIE.Text) Then
      edtNome.Clear;
end;

procedure TFrmEnvelopeBoleto.btnExcluirClick(Sender: TObject);
begin
     if not (dmADM.cdsListaClientes.IsEmpty)
       and (dmADM.cdsListaClientes.RecordCount > 0) Then
          dmADM.cdsListaClientes.Delete;
end;

procedure TFrmEnvelopeBoleto.dsListaDataChange(Sender: TObject;
  Field: TField);
begin
     btnExcluir.Enabled    := (dsLista.DataSet.Active) and not (dsLista.DataSet.IsEmpty);
     btnVisualizar.Enabled := (dsLista.DataSet.Active) and not (dsLista.DataSet.IsEmpty);
     //
     lblRegistro.Caption := 'Registro(s): '+InttoStr(dsLista.DataSet.RecNo)+'/'+InttoStr(dsLista.DataSet.RecordCount);
end;

procedure TFrmEnvelopeBoleto.btnVisualizarClick(Sender: TObject);
begin
      With dmADM.RvEnvBoleto do
      begin
           SetParam('pEMPRESA', 'INFOG2 TECNOLOGIA LTDA');
           SetParam('pENDERECO','RUA MAGALHÃES FILHO, Nº 1350');
           SetParam('pCOMPLEMENTO',' ');
           SetParam('pBAIRRO','MARQUÊS');
           SetParam('pCEP','64001-300');
           SetParam('pCIDADE','TERESINA-PI');
           //
           dmADM.RvSystem2.DefaultDest := rdPreview;
           Execute;
      End;
end;

end.

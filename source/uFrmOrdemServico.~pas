unit uFrmOrdemServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, DB, StdCtrls, DBCtrls, Mask, ToolEdit,
  RXDBCtrl, Buttons, Grids, DBGrids, FMTBcd, SqlExpr, DBClient, Provider;

type
  TfrmOrdemServico = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dsRequerimento: TDataSource;
    Label2: TLabel;
    dbxDTMOVI: TDBDateEdit;
    Label3: TLabel;
    dbxHOMOVI: TDBEdit;
    Label4: TLabel;
    dbxCDCLIE: TDBEdit;
    Label5: TLabel;
    dbxSolicitante: TDBEdit;
    Label6: TLabel;
    dbxDTPREV: TDBDateEdit;
    dbxHOPREV: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    pnlBotoes1: TPanel;
    btAdicionar: TBitBtn;
    btnPesquisa: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    spLocCliente: TSpeedButton;
    DBText2: TDBText;
    Label7: TLabel;
    DBText3: TDBText;
    dsAtendimento: TDataSource;
    Label11: TLabel;
    dbxTipoAtendimento: TDBLookupComboBox;
    Label12: TLabel;
    Label13: TLabel;
    dbxHora: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    dbmDiagnotisco: TDBMemo;
    Label16: TLabel;
    dbxSituacao: TDBEdit;
    dbxDataAtendimento: TDBDateEdit;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnPesquisa2: TBitBtn;
    btnGravar2: TBitBtn;
    btnCancelar2: TBitBtn;
    dstConsulta: TSQLDataSet;
    cdpConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    cbxTecnico: TDBLookupComboBox;
    dbxDefeito: TDBMemo;
    GroupBox1: TGroupBox;
    DBText1: TDBText;
    DBRadioGroup1: TDBRadioGroup;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    dstAtividades: TSQLDataSet;
    dspAtividades: TDataSetProvider;
    cdsAtividades: TClientDataSet;
    dsAtividades: TDataSource;
    cdsAtividadesATI_ATENDIMENTO: TIntegerField;
    cdsAtividadesATI_ITEM: TIntegerField;
    cdsAtividadesATI_DESCRICAO: TMemoField;
    cdsAtividadesATI_VALOR: TFMTBCDField;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    dbmDescricao: TDBMemo;
    Label10: TLabel;
    dbxValor: TDBEdit;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    spSalvar: TSpeedButton;
    spCancelar: TSpeedButton;
    spNovaAtividade: TSpeedButton;
    dstPecas: TSQLDataSet;
    dstPecasPEC_ATENDIMENTO: TIntegerField;
    dstPecasPEC_ITEM: TIntegerField;
    dstPecasPEC_DESCRICAO: TStringField;
    dstPecasPEC_QUANTIDADE: TFMTBCDField;
    dstPecasPEC_VALOR: TFMTBCDField;
    dstAtividadesATI_ATENDIMENTO: TIntegerField;
    dstAtividadesATI_ITEM: TIntegerField;
    dstAtividadesATI_DESCRICAO: TMemoField;
    dstAtividadesATI_VALOR: TFMTBCDField;
    dspPecas: TDataSetProvider;
    cdsPecas: TClientDataSet;
    dsPecas: TDataSource;
    cdsPecasPEC_ATENDIMENTO: TIntegerField;
    cdsPecasPEC_ITEM: TIntegerField;
    cdsPecasPEC_DESCRICAO: TStringField;
    cdsPecasPEC_QUANTIDADE: TFMTBCDField;
    cdsPecasPEC_VALOR: TFMTBCDField;
    Label18: TLabel;
    dbxDescricaoPeca: TDBEdit;
    Label19: TLabel;
    dbxQuantidade: TDBEdit;
    Label20: TLabel;
    dbxValorPeca: TDBEdit;
    Panel1: TPanel;
    dbGridDados: TDBGrid;
    cdsConsultaATE_IDREQUERIMENTO: TIntegerField;
    cdsConsultaATE_ID: TIntegerField;
    cdsConsultaATE_DATA: TDateField;
    cdsConsultaATE_CDTECNICO: TStringField;
    cdsConsultaREQ_DEFEITO: TMemoField;
    cdsConsultaDEFEITO: TStringField;
    Panel3: TPanel;
    DBNavigator2: TDBNavigator;
    spNovaPeca: TSpeedButton;
    spGravarPeca: TSpeedButton;
    spCancelarPeca: TSpeedButton;
    dbgPecas: TDBGrid;
    cbxNMTECN: TDBLookupComboBox;
    cdsConsultaNMTECNICO: TStringField;
    DBRadioGroup2: TDBRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbxDTMOVIExit(Sender: TObject);
    procedure dbxHOMOVIExit(Sender: TObject);
    procedure dbxHOPREVExit(Sender: TObject);
    procedure dbxDTPREVExit(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure dbxCDCLIEChange(Sender: TObject);
    procedure dbxCDCLIEExit(Sender: TObject);
    procedure dbxCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravar2Click(Sender: TObject);
    procedure btnCancelar2Click(Sender: TObject);
    procedure dspAtividadesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsAtividadesAfterInsert(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure cdsAtividadesAfterPost(DataSet: TDataSet);
    procedure spCancelarClick(Sender: TObject);
    procedure spSalvarClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dsAtividadesStateChange(Sender: TObject);
    procedure spNovaAtividadeClick(Sender: TObject);
    procedure dspPecasGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure cdsPecasAfterPost(DataSet: TDataSet);
    procedure cdsPecasAfterInsert(DataSet: TDataSet);
    procedure spCancelarPecaClick(Sender: TObject);
    procedure spGravarPecaClick(Sender: TObject);
    procedure dsPecasStateChange(Sender: TObject);
    procedure spNovaPecaClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure cdsConsultaCalcFields(DataSet: TDataSet);
    procedure dsAtendimentoStateChange(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure dbxCDTECNKeyPress(Sender: TObject; var Key: Char);
    procedure dsRequerimentoStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbxDefeitoKeyPress(Sender: TObject; var Key: Char);
    procedure dbmDiagnotiscoKeyPress(Sender: TObject; var Key: Char);
    procedure dbmDescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure AtivarBotoes(AEdicao : Boolean);
    procedure AtivarBotoes2(AEdicao : Boolean);
    procedure AbrirDBRequerimento;
    procedure AbrirDBAtendimento(M_NRREQU : Integer);
    procedure AbrirDBAtividades(M_NRREQU : Integer);
    procedure AbrirDBPecas(M_NRREQU : Integer);
    procedure CONSULTA(M_CDREQU : Integer);
    function GetIdAtendimento(M_NRREQU : Integer) : Integer;
    procedure REGISTRO(M_NRREQU : Integer);
    procedure DisplayHint(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmOrdemServico: TfrmOrdemServico;
  M_NRITEM, M_NRPECA : Integer;

implementation

uses udmADM2, uFuncoes, uLocCliente, udmADM, Math, uFrmLocRequerimento;

{$R *.dfm}

procedure TfrmOrdemServico.AtivarBotoes(AEdicao: Boolean);
begin
     btAdicionar.Enabled := not AEdicao;
     btnPesquisa.Enabled := not AEdicao;
     btnGravar.Enabled   := AEdicao;
     btnCancelar.Enabled := AEdicao;
end;

procedure TfrmOrdemServico.FormShow(Sender: TObject);
begin
    PageControl1.ActivePageIndex := 0;
    dmADM.qryLocClientes.close;
    //
    AtivarBotoes(False);
    AtivarBotoes2(False);
    //
end;

procedure TfrmOrdemServico.btAdicionarClick(Sender: TObject);
begin
     AtivarBotoes(True);
     //
     PageControl1.Pages[1].TabVisible := False;
     dmADM2.Parametros;
     AbrirDBRequerimento;
     dmADM2.cdsRequerimentos.Append;
     dmADM2.cdsRequerimentos.FieldByName('REQ_ID').AsInteger :=
          dmADM2.cdsConfigCFG_REQUERIMENTO.AsInteger + 1;
     dmADM2.cdsRequerimentos.FieldByName('REQ_SITUACAO').AsString := 'A';
     dmADM2.cdsRequerimentos.FieldByName('REQ_DATA').AsDateTime := Date();
     dmADM2.cdsRequerimentos.FieldByName('REQ_HORA').AsString   := Copy(TimetoStr(Time),1,5);
     dmADM2.cdsRequerimentos.FieldByName('REQ_DTPREVISAO').AsDateTime := Date();
     dmADM2.cdsRequerimentos.FieldByName('REQ_HOPREVISAO').AsString   := Copy(TimetoStr(Time),1,5);
     dmADM2.cdsRequerimentos.FieldByName('REQ_TIPO').Value := 1;
     dbxDTMOVI.SetFocus;
end;

procedure TfrmOrdemServico.btnGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbxCDCLIE.Text) Then
      begin
          Application.MessageBox(PChar('Digite o código do cliente!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxCDCLIE.SetFocus;
          Exit;
      End;
     //
     If uFuncoes.Empty(dbxSolicitante.Text) Then
      begin
          Application.MessageBox(PChar('Digite o nome do solicitante!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxSolicitante.SetFocus;
          Exit;
      End;
     //
     {If uFuncoes.Empty(cbxTecnico.Text) Then
      begin
          Application.MessageBox(PChar('Selecione o tecnico!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cbxTecnico.SetFocus;
          Exit;
      End;}
     //
     If uFuncoes.Empty(dbxDefeito.Text) Then
      begin
          Application.MessageBox(PChar('Digite o defeito reclamado!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxDefeito.SetFocus;
          Exit;
      End;
     //
     If uFuncoes.Empty(DBRadioGroup1.Value) Then
      begin
          Application.MessageBox(PChar('Selecione o tipo de requerimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          DBRadioGroup1.SetFocus;
          Exit;
      End;
     //
     If (dbxDTMOVI.Text = '  /  /    ') Then
      begin
          Application.MessageBox(PChar('Digite a data do requerimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxDTMOVI.SetFocus;
          Exit;
      End;
     //
     If (dbxHOMOVI.Text = '  :  ') Then
      begin
          Application.MessageBox(PChar('Digite a hora do requerimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxHOMOVI.SetFocus;
          Exit;
      End;
     //
     If (dbxDTPREV.Text = '  /  /    ') Then
      begin
          Application.MessageBox(PChar('Digite a data de previsto de atendimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxDTPREV.SetFocus;
          Exit;
      End;
     //
     If (dbxHOPREV.Text = '  :  ') Then
      begin
          Application.MessageBox(PChar('Digite a hora de previsto de atendimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxHOPREV.SetFocus;
          Exit;
      End;
     //
     AtivarBotoes(False);
     PageControl1.Pages[1].TabVisible := True;
     try
        If (dmADM2.cdsRequerimentos.State = dsInsert) Then
          begin
               dmADM2.Parametros;
               dmADM2.cdsConfig.Edit;
               dmADM2.cdsConfig.FieldByName('CFG_REQUERIMENTO').AsInteger :=
                  dmADM2.cdsConfig.FieldByName('CFG_REQUERIMENTO').AsInteger + 1;
               dmADM2.cdsRequerimentosREQ_ID.AsInteger :=
                  dmADM2.cdsConfig.FieldByName('CFG_REQUERIMENTO').AsInteger;
               dmADM2.cdsConfig.ApplyUpdates(0);

          End;
          //
          dmADM2.cdsRequerimentos.ApplyUpdates(0);
          //
          Application.MessageBox(PChar('Registro gravado com sucesso!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
           dmADM2.cdsRequerimentos.Cancel;            
        End;
     End;
end;

procedure TfrmOrdemServico.btnCancelarClick(Sender: TObject);
begin
     AtivarBotoes(False);
     PageControl1.Pages[1].TabVisible := True;
     //
     dmADM2.cdsRequerimentos.Cancel;
end;

procedure TfrmOrdemServico.AbrirDBRequerimento;
begin
      With dmADM2.cdsRequerimentos do
        begin
             Close;
             Params.ParamByName('pID').AsInteger := -1;
             Open;
        End;
end;

procedure TfrmOrdemServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmADM2.cdsRequerimentos.Close;
     //
     Action := caFree;
end;

procedure TfrmOrdemServico.dbxDTMOVIExit(Sender: TObject);
begin
     If (dbxDTMOVI.Text <> '  /  /    ')
     and (dsRequerimento.State in [dsInsert]) Then
     Begin
        try
            StrToDate(dbxDTMOVI.Text);
            dbxDTMOVI.Date := StrtoDate(dbxDTMOVI.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             dbxDTMOVI.Date := Date();
             dbxDTMOVI.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmOrdemServico.dbxHOMOVIExit(Sender: TObject);
begin
     If uFuncoes.Empty(dbxHOMOVI.Text)
     and (dsRequerimento.State in [dsInsert]) Then
     Begin
        try
            StrToTime(dbxHOMOVI.Text);
            dbxHOMOVI.Text := TimetoStr(StrtoTime(dbxHOMOVI.Text));
        except
          on EConvertError do
          begin
             ShowMessage ('Hora Inválida!');
             dbxHOMOVI.Text := TimetoStr(Time);
             dbxHOMOVI.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmOrdemServico.dbxHOPREVExit(Sender: TObject);
begin
     If uFuncoes.Empty(dbxHOPREV.Text)
     and (dsRequerimento.State in [dsInsert]) Then
     Begin
        try
            StrToTime(dbxHOPREV.Text);
            dbxHOPREV.Text := TimetoStr(StrtoTime(dbxHOPREV.Text));
        except
          on EConvertError do
          begin
             ShowMessage ('Hora Inválida!');
             dbxHOPREV.Text := TimetoStr(Time);
             dbxHOPREV.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmOrdemServico.dbxDTPREVExit(Sender: TObject);
begin
     If (dbxDTPREV.Text <> '  /  /    ')
     and (dsRequerimento.State in [dsInsert]) Then
     Begin
        try
            StrToDate(dbxDTPREV.Text);
            dbxDTPREV.Date := StrtoDate(dbxDTPREV.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             dbxDTPREV.Date := Date();
             dbxDTPREV.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmOrdemServico.spLocClienteClick(Sender: TObject);
Var
    W_CDCLIE : String;
begin
  dbxCDCLIE.Clear; 
  Try
      Application.CreateForm(TfrmLocCliente, frmLocCliente);
      frmLocCliente.ShowModal;
  Finally
      W_CDCLIE := frmLocCliente.qryConsulta.FieldByName('CLI_CDCLIE').AsString;
      frmLocCliente.Free;
      If not uFuncoes.Empty(W_CDCLIE) Then
      Begin
          dbxCDCLIE.Text := W_CDCLIE;
          dbxSolicitante.SetFocus;
      End
      Else    
          dbxCDCLIE.SetFocus;
  End;
end;

procedure TfrmOrdemServico.dbxCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(dbxCDCLIE.Text) Then
     begin
          dmADM.qryLocClientes.Close;
          cdsConsulta.Close;
     End;
end;

procedure TfrmOrdemServico.dbxCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(dbxCDCLIE.Text)
     and (dsRequerimento.State in [dsInsert]) Then
        begin
             If not uFuncoes.LOCALIZAR_CLIENTE(uFuncoes.StrZero(dbxCDCLIE.Text,7)) Then
                 Begin
                      Application.MessageBox(PChar('Cliente não cadastro!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      dbxCDCLIE.Clear;
                      dbxCDCLIE.SetFocus;
                      Exit;
                 End;
             //
             dbxCDCLIE.Text := uFuncoes.StrZero(dbxCDCLIE.Text,7);
             CONSULTA(dmADM2.cdsRequerimentosREQ_ID.AsInteger);
        End;
end;

procedure TfrmOrdemServico.dbxCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (key = #27) Then
      begin
           Key := #0;
           btnCancelarClick(Sender);
      End;
    //
    If (key = #13) and uFuncoes.Empty(dbxCDCLIE.Text)
    and (dmADM2.cdsRequerimentos.State in [dsInsert]) Then
      begin
          key:=#0;
          spLocClienteClick(Sender);
      End;
end;

procedure TfrmOrdemServico.AtivarBotoes2(AEdicao: Boolean);
begin
    btnNovo.Enabled        := not AEdicao;
    btnPesquisa2.Enabled   := not AEdicao;
    btnGravar2.Enabled     := AEdicao;
    btnCancelar2.Enabled   := AEdicao;
end;

procedure TfrmOrdemServico.btnNovoClick(Sender: TObject);
begin
     If (dmADM2.cdsRequerimentos.Active) and not (dmADM2.cdsRequerimentos.IsEmpty) Then
     begin
        If (dmADM2.cdsRequerimentos.FieldByName('REQ_SITUACAO').AsString = 'A' ) Then
        begin
          AtivarBotoes2(True);
          PageControl1.Pages[0].TabVisible := False;
          //
          dmADM2.cdsRequerimentos.Edit;
          //
          dmADM2.Parametros;
          dmADM2.cdsAtendimento.Append;
          dmADM2.cdsAtendimento.FieldByName('ATE_ID').AsInteger :=
             GetIdAtendimento(dmADM2.cdsRequerimentosREQ_ID.AsInteger);
          dmADM2.cdsAtendimento.FieldByName('ATE_DATA').AsDateTime := Date();
          dmADM2.cdsAtendimento.FieldByName('ATE_HORA').AsString   := Copy(TimetoStr(Time),1,5);
          dbxTipoAtendimento.SetFocus;
        End
        Else
           Application.MessageBox(PChar('Requerimento já concluído.'),
                 'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
     End
     Else
     Begin
          PageControl1.ActivePageIndex := 0;
          btAdicionar.SetFocus;
     End;
end;

procedure TfrmOrdemServico.btnGravar2Click(Sender: TObject);
begin
     If uFuncoes.Empty(dbxTipoAtendimento.Text) Then
      begin
          Application.MessageBox(PChar('Selecione o Tipo de Atendimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxTipoAtendimento.SetFocus;
          Exit;
      End;
     //
     If uFuncoes.Empty(cbxNMTECN.Text) Then
      begin
          Application.MessageBox(PChar('Selecione o tecnico!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          cbxNMTECN.SetFocus;
          Exit;
      End;
     //
     If uFuncoes.Empty(dbxSituacao.Text) Then
      begin
          Application.MessageBox(PChar('Digite a situação!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxSituacao.SetFocus;
          Exit;
      End;
     //
     If (dbxDataAtendimento.Text = '  /  /    ') Then
      begin
          Application.MessageBox(PChar('Digite a data do atendimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxDataAtendimento.SetFocus;
          Exit;
      End;
     //
     If (dbxHora.Text = '  :  ') Then
      begin
          Application.MessageBox(PChar('Digite a hora do atendimento!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          dbxHora.SetFocus;
          Exit;
      End;
      //
     AtivarBotoes2(False);
     PageControl1.Pages[0].TabVisible := True;
     //
     try
        If (dmADM2.cdsAtendimento.State = dsInsert) Then
          begin
               dmADM2.Parametros;
               dmADM2.cdsAtendimentoATE_IDREQUERIMENTO.AsInteger :=
                     dmADM2.cdsRequerimentosREQ_ID.AsInteger;
               dmADM2.cdsAtendimentoATE_ID.AsInteger :=
                     GetIdAtendimento(dmADM2.cdsRequerimentosREQ_ID.AsInteger);
          End;
          //
          dmADM2.cdsAtendimento.ApplyUpdates(0);
          dmADM2.cdsRequerimentos.ApplyUpdates(0);
          //
          Application.MessageBox(PChar('Registro gravado com sucesso!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
           dmADM2.cdsAtendimento.Cancel;            
        End;
     End;
end;

procedure TfrmOrdemServico.btnCancelar2Click(Sender: TObject);
begin
     AtivarBotoes2(False);
     PageControl1.Pages[0].TabVisible := True;
     dmADM2.cdsAtendimento.Cancel;
     dmADM2.cdsRequerimentos.Cancel;
     //
     AbrirDBAtendimento(dmADM2.cdsRequerimentosREQ_ID.AsInteger);
end;

procedure TfrmOrdemServico.AbrirDBAtendimento(M_NRREQU : Integer);
begin
      With dmADM2.cdsAtendimento do
        begin
             Close;
             Params.ParamByName('pID').AsInteger := M_NRREQU;
             Open;
        End;
end;

procedure TfrmOrdemServico.CONSULTA(M_CDREQU : Integer);
begin
     With cdsConsulta do
      begin
           Close;
           Params.ParamByName('pREQ').AsInteger := M_CDREQU;
           Open;
      End;
end;

function TfrmOrdemServico.GetIdAtendimento(M_NRREQU: Integer): Integer;
var
    qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select max(ATE_ID) from ATENDIMENTOS Where (ATE_IDREQUERIMENTO = :pREQ)';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dmADM2.sqlConexao;
      sql.Add(texto);
      Params.ParamByName('pREQ').AsInteger := M_NRREQU;
      open;
      result := fields[0].AsInteger + 1;
    finally
      free;
    end;
end;

procedure TfrmOrdemServico.dspAtividadesGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'ATIVIDADES';
end;

procedure TfrmOrdemServico.cdsAtividadesAfterInsert(DataSet: TDataSet);
begin
     M_NRITEM := M_NRITEM + 1;
     cdsAtividadesATI_ATENDIMENTO.AsInteger :=
        dmADM2.cdsRequerimentosREQ_ID.AsInteger;
     cdsAtividadesATI_ITEM.AsInteger := M_NRITEM;  
end;

procedure TfrmOrdemServico.AbrirDBAtividades(M_NRREQU: Integer);
begin
     With cdsAtividades do
      begin
           Close;
           Params.ParamByName('pREQ').AsInteger := M_NRREQU;
           Open;
           //
           If not (IsEmpty) Then
              M_NRITEM := RecordCount
           Else
              M_NRITEM := 0;
      End;
end;

procedure TfrmOrdemServico.PageControl1Change(Sender: TObject);
begin
     If (PageControl1.ActivePageIndex = 1) Then
     begin
         dmADM2.cdsAtendimento.Close;
         cdsAtividades.Close;
         cdsPecas.Close;
         //
         If (dmADM2.cdsRequerimentos.Active) and not (dmADM2.cdsRequerimentos.IsEmpty) Then
         Begin
             AbrirDBAtendimento(dmADM2.cdsRequerimentosREQ_ID.AsInteger);
             AbrirDBAtividades(dmADM2.cdsRequerimentosREQ_ID.AsInteger);
             AbrirDBPecas(dmADM2.cdsRequerimentosREQ_ID.AsInteger);
         End;
     End;
end;

procedure TfrmOrdemServico.cdsAtividadesAfterPost(DataSet: TDataSet);
begin
     cdsAtividades.ApplyUpdates(0); 
end;

procedure TfrmOrdemServico.spCancelarClick(Sender: TObject);
begin
     If (M_NRITEM > 0) Then
        M_NRITEM := M_NRITEM - 1;
     //
     cdsAtividades.Cancel;
end;

procedure TfrmOrdemServico.spSalvarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbmDescricao.Lines.Text) Then
     begin
         dbmDescricao.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(dbxValor.Text) Then
     begin
         dbxValor.SetFocus;
         Exit;
     End;
     //
     try
         cdsAtividades.Post;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
           spCancelarClick(Self);
        End;
     End;
end;

procedure TfrmOrdemServico.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     If (cdsAtividades.State in [dsInsert]) Then
         dbmDescricao.SetFocus;
end;

procedure TfrmOrdemServico.dsAtividadesStateChange(Sender: TObject);
begin
     If (dsAtividades.DataSet.Active) Then
     begin
         spNovaAtividade.Enabled := dsAtividades.State in [dsBrowse];
         spSalvar.Enabled := dsAtividades.State in [dsInsert, dsEdit];
         spCancelar.Enabled := dsAtividades.State in [dsInsert, dsEdit];
     End;
end;

procedure TfrmOrdemServico.spNovaAtividadeClick(Sender: TObject);
begin
     If (dmADM2.cdsRequerimentos.FieldByName('REQ_SITUACAO').AsString = 'A' ) Then
     begin
         cdsAtividades.Append;
         dbmDescricao.SetFocus;
     End
     Else
           Application.MessageBox(PChar('Requerimento já concluído.'),
                      'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
end;

procedure TfrmOrdemServico.dspPecasGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'PECAS';
end;

procedure TfrmOrdemServico.cdsPecasAfterPost(DataSet: TDataSet);
begin
     cdsPecas.ApplyUpdates(0);
end;

procedure TfrmOrdemServico.cdsPecasAfterInsert(DataSet: TDataSet);
begin
     M_NRPECA := M_NRPECA + 1;
     cdsPecasPEC_ATENDIMENTO.AsInteger :=
       dmADM2.cdsRequerimentosREQ_ID.AsInteger;
     cdsPecasPEC_ITEM.AsInteger := M_NRPECA;
end;

procedure TfrmOrdemServico.spCancelarPecaClick(Sender: TObject);
begin
     If (M_NRPECA > 0) Then
        M_NRPECA := M_NRPECA - 1;
     //
     dbgPecas.Visible := True;
     DBNavigator2.Enabled := True;
     cdsPecas.Cancel; 
end;

procedure TfrmOrdemServico.spGravarPecaClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbxDescricaoPeca.Text) Then
     begin
         //dbxDescricaoPeca.SetFocus;
         dbgPecas.SelectedIndex := 1;
         Exit;
     End;
     //
     If uFuncoes.Empty(dbxQuantidade.Text) Then
     begin
         dbxQuantidade.SetFocus;
         Exit;
     End;
     //
     If uFuncoes.Empty(dbxValorPeca.Text) Then
     begin
         dbxValorPeca.SetFocus;
         Exit;
     End;
     //
     dbgPecas.Visible := True;
     DBNavigator2.Enabled := True;
     try
         cdsPecas.Post;
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar gravar registro!!!'),
                      'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
           spCancelarPecaClick(Self);
        End;
     End;
end;

procedure TfrmOrdemServico.dsPecasStateChange(Sender: TObject);
begin
     spNovaPeca.Enabled     := dsPecas.State in [dsBrowse];
     spGravarPeca.Enabled   := dsPecas.State in [dsInsert, dsEdit];
     spCancelarPeca.Enabled := dsPecas.State in [dsInsert, dsEdit];
end;

procedure TfrmOrdemServico.spNovaPecaClick(Sender: TObject);
begin
     If (dmADM2.cdsRequerimentos.FieldByName('REQ_SITUACAO').AsString = 'A' ) Then
     begin
          dbgPecas.Visible     := False;
          DBNavigator2.Enabled := False;
          cdsPecas.Append;
          //cdsPecas.FieldByName('PEC_QUANTIDADE').AsInteger := 1;
          dbxDescricaoPeca.SetFocus;
     End
     Else
           Application.MessageBox(PChar('Requerimento já concluído.'),
                      'ATENÇÃO', MB_OK+MB_ICONWARNING+MB_APPLMODAL);
end;

procedure TfrmOrdemServico.TabSheet2Show(Sender: TObject);
begin
     PageControl2.ActivePageIndex := 0;
end;

procedure TfrmOrdemServico.AbrirDBPecas(M_NRREQU: Integer);
begin
     With cdsPecas do
      begin
           Close;
           Params.ParamByName('pREQ').AsInteger := M_NRREQU;
           Open;
           //
           If not (IsEmpty) Then
              M_NRPECA := RecordCount
           Else
              M_NRPECA := 0;
      End;
end;

procedure TfrmOrdemServico.cdsConsultaCalcFields(DataSet: TDataSet);
begin
      cdsConsultaDEFEITO.AsString :=
         Copy(cdsConsultaREQ_DEFEITO.AsString,1,60);
end;

procedure TfrmOrdemServico.dsAtendimentoStateChange(Sender: TObject);
begin
     If (dsAtendimento.DataSet.Active) Then
      begin
           spNovaAtividade.Enabled := dsAtendimento.DataSet.RecordCount > 0;
           spNovaPeca.Enabled      := dsAtendimento.DataSet.RecordCount > 0;
      End;
end;

procedure TfrmOrdemServico.btnPesquisaClick(Sender: TObject);
Var
    W_NRREQU : Integer;
begin
     frmLocReclamacao := TfrmLocReclamacao.Create(Self);
     try
          if (frmLocReclamacao.ShowModal = mrOK)
          and not (frmLocReclamacao.cdsConsulta.IsEmpty) then
          begin
               W_NRREQU := frmLocReclamacao.cdsConsulta.FieldByName('REQ_ID').AsInteger;
               REGISTRO(W_NRREQU);
               uFuncoes.LOCALIZAR_CLIENTE(dmADM2.cdsRequerimentosREQ_CLIENTE.AsString);
               //getNMCLIENTE(dmADM2.cdsRequerimentosREQ_CLIENTE.AsString);
               AbrirDBAtendimento(W_NRREQU);
               CONSULTA(W_NRREQU);
               LOCALIZAR_FUNCIONARIO(dmADM2.cdsAtendimentoATE_CDTECNICO.AsString);
               AbrirDBAtividades(W_NRREQU);
               AbrirDBPecas(W_NRREQU);
          End;
     Finally
          frmLocReclamacao.Free;
     End;
end;

procedure TfrmOrdemServico.REGISTRO(M_NRREQU: Integer);
begin
     With dmADM2.cdsRequerimentos  do
      begin
           DisableControls;
           Close;
           Params.ParamByName('pID').AsInteger := M_NRREQU;
           Open;
           EnableControls; 
      End;
end;

procedure TfrmOrdemServico.dbxCDTECNKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmOrdemServico.dsRequerimentoStateChange(Sender: TObject);
begin
     spLocCliente.Enabled := dsRequerimento.State in [dsInsert, dsEdit];
end;

procedure TfrmOrdemServico.DisplayHint(Sender: TObject);
begin
     StatusBar1.Panels[0].Text := Application.Hint;
end;

procedure TfrmOrdemServico.FormCreate(Sender: TObject);
begin
     Application.OnHint := DisplayHint;
end;

procedure TfrmOrdemServico.dbxDefeitoKeyPress(Sender: TObject;
  var Key: Char);
begin
      Key:= Upcase(Key);
end;

procedure TfrmOrdemServico.dbmDiagnotiscoKeyPress(Sender: TObject;
  var Key: Char);
begin
      Key:= Upcase(Key);
end;

procedure TfrmOrdemServico.dbmDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     Key := Upcase(Key);
end;

end.

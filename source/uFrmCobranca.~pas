unit uFrmCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, DB,
  DBClient, DBTables, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppBands, ppCache, ppCtrls, ppPrnabl, RpBase, RpSystem,
  RpDefine, RpRave, RpCon, RpConDS, ImgList, DBCtrls, RpRender,
  RpRenderPDF, gbCobranca, Menus, Shellapi;

type
  TfrmCobranca = class(TForm)
    pnlTopo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    pnlDados: TPanel;
    dbGridDados: TDBGrid;
    pnlInferior: TPanel;
    btVisualizar: TBitBtn;
    btFechar: TBitBtn;
    btTodos: TBitBtn;
    btnFiltar: TBitBtn;
    qryReceberClientes: TQuery;
    qryReceberClientesDEB_CDCLIE: TStringField;
    qryReceberClientesCLI_NMCLIE: TStringField;
    qryReceberClientesDEB_NMDESC: TStringField;
    qryReceberClientesDEB_DTVENC: TStringField;
    qryReceberClientesDEB_VLPARC: TFloatField;
    qryReceberClientesDEB_VENCIMENTO: TStringField;
    qryReceberClientesDEB_NMSIST: TStringField;
    dsClientes: TDataSource;
    ppReport1: TppReport;
    ppBDEPipeline1: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    lblPeriodo: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    qryReceberClientesCLI_RASOCI: TStringField;
    qryReceberClientesDEB_NRCRED: TStringField;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    btEnvelopes: TBitBtn;
    qryReceberClientesCLI_ENCLIE: TStringField;
    qryReceberClientesCLI_CEPCLI: TStringField;
    qryReceberClientesCLI_BACLIE: TStringField;
    qryReceberClientesCLI_CICLIE: TStringField;
    qryReceberClientesCLI_UFCLIE: TStringField;

    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel8: TppLabel;
    ppShape1: TppShape;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    rvEnvelopes: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    bntEnvelopeFrete: TBitBtn;
    rvEnvelFrente: TRvProject;
    ImageList1: TImageList;
    Label3: TLabel;
    edtCDCLIE: TEdit;
    sbLocalizar: TSpeedButton;
    DBText1: TDBText;
    cmbTipos: TComboBox;
    Label4: TLabel;
    txtTipo: TppLabel;
    btnGerarRemessa: TBitBtn;
    gbCobranca1: TgbCobranca;
    gbTitulo1: TgbTitulo;
    SaveDialog1: TSaveDialog;
    cdsDados: TClientDataSet;
    cdsDadosVENCIMENTO: TDateField;
    cdsDadosDOCUMENTO: TStringField;
    cdsDadosCODIGO_CLIENTE: TStringField;
    cdsDadosNOME: TStringField;
    cdsDadosSISTEMA: TStringField;
    cdsDadosVALOR: TCurrencyField;
    cdsDadosATRASO: TFloatField;
    cdsDadosDESCRICAO: TStringField;
    cdsDadosSITUACAO: TBooleanField;
    cdsDadosRAZAO: TStringField;
    cdsDadosCREDITO: TStringField;
    cdsDadosENDERECO: TStringField;
    cdsDadosCEP: TStringField;
    cdsDadosBAIRRO: TStringField;
    cdsDadosCIDADE: TStringField;
    cdsDadosUF: TStringField;
    btnRegProtocolo: TBitBtn;
    ppRepProtocolo: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine5: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine6: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel15: TppLabel;
    ppLine7: TppLine;
    btnBoletos: TBitBtn;
    qryReceberClientesDEB_NRPARC: TStringField;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Cedente1: TMenuItem;
    btnImpBoletos: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    cdsDadosDATA_COBRANCA: TDateField;
    qryReceberClientesDEB_DTCOBR: TStringField;
    lblRegistro: TLabel;
    rbgSituacao: TRadioGroup;
    btnPDF: TBitBtn;
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure edtDTINICKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDTFINAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltarClick(Sender: TObject);
    procedure qryReceberClientesCalcFields(DataSet: TDataSet);
    procedure btVisualizarClick(Sender: TObject);
    procedure btTodosClick(Sender: TObject);
    procedure edtDTINICEnter(Sender: TObject);
    procedure edtDTFINAEnter(Sender: TObject);
    procedure btEnvelopesClick(Sender: TObject);
    procedure bntEnvelopeFreteClick(Sender: TObject);
    procedure dbGridDadosCellClick(Column: TColumn);
    procedure dbGridDadosColEnter(Sender: TObject);
    procedure dbGridDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGridDadosEnter(Sender: TObject);
    procedure dbGridDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbGridDadosKeyPress(Sender: TObject; var Key: Char);
    procedure sbLocalizarClick(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEEnter(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTiposExit(Sender: TObject);
    procedure btnGerarRemessaClick(Sender: TObject);
    procedure btnRegProtocoloClick(Sender: TObject);
    procedure btnBoletosClick(Sender: TObject);
    procedure Cedente1Click(Sender: TObject);
    procedure btnImpBoletosClick(Sender: TObject);
    procedure cdsDadosCalcFields(DataSet: TDataSet);
    procedure dsClientesDataChange(Sender: TObject; Field: TField);
    procedure btnPDFClick(Sender: TObject);
  private
    { Private declarations }
    procedure CARREGAR_DADOS;
    procedure PERIODO(aSituacao : String);
    procedure limpar;
    procedure BOTOES;
    procedure HABILITAR;
    Procedure CLIENTE_PERIODO(aSituacao : String);
    Procedure Carregar_Tipos;
    procedure PrepararTitulo(aCliente, aDocumento : String; aDataDoc, aDataVenc : TDatetime; fValor : Double);
    Function TotalReceber(aCDS : TClientDataSet) : Double;
  public
    { Public declarations }
    procedure ExecutePrograma(Nome, Parametros: String);
  end;

var
  frmCobranca: TfrmCobranca;
  W_CDCLIE, M_CDTIPO : String;

implementation

uses uFuncoes, uLocCliente, udmADM, uFrmConfig;

{$R *.dfm}

procedure TfrmCobranca.edtDTINICExit(Sender: TObject);
begin
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
            edtDTINIC.Date := StrtoDate(edtDTINIC.Text);
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

procedure TfrmCobranca.edtDTFINAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text)) Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            edtDTFINA.Date := StrtoDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Período inicial maior quer período final!!!','ATENÇÃO',
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

procedure TfrmCobranca.edtDTINICKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmCobranca.edtDTFINAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmCobranca.btFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmCobranca.FormShow(Sender: TObject);
begin
     edtDTINIC.Date := Date();
     edtDTFINA.Date := edtDTINIC.Date;
     dmADM.qryLocClientes.close;
     Carregar_Tipos;
     //
     dmADM.AbrirConfiguracoesBoleto;
     //
     RvDataSetConnection1.DataSet := cdsDados;
     //
     btnPDF.Visible := False;
 //    rvEnvelopes.ProjectFile :=  ExtractFilePath( Application.ExeName )+ 'Relatorios\prvEnvelopes.rav';
//     rvEnvelFrente.ProjectFile :=  ExtractFilePath( Application.ExeName )+ 'Relatorios\prvEnvelopesFrente.rav';
end;

procedure TfrmCobranca.CARREGAR_DADOS;
begin
     If not (cdsDados.Active) Then
         cdsDados.Open;
     //
     cdsDados.EmptyDataSet;
     cdsDados.DisableControls;
     //
     qryReceberClientes.First;
     While not (qryReceberClientes.Eof) do
        begin
            With cdsDados do
              begin
                   Append;
                   FieldByname('VENCIMENTO').AsDateTime := qryReceberClientes.FieldByName('DEB_VENCIMENTO').AsDateTime;
                   If not uFuncoes.Empty(qryReceberClientes.FieldByName('DEB_DTCOBR').AsString) Then
                        FieldByname('DATA_COBRANCA').AsString := uFuncoes.FormataData(qryReceberClientes.FieldByName('DEB_DTCOBR').AsString);
                   FieldByname('CODIGO_CLIENTE').AsString := qryReceberClientesDEB_CDCLIE.AsString;
                   FieldByname('NOME').AsString         := qryReceberClientes.FieldByName('CLI_NMCLIE').AsString;
                   FieldByname('SISTEMA').AsString      := UpperCase(qryReceberClientes.FieldByName('DEB_NMSIST').AsString);
                   FieldByname('VALOR').AsCurrency      := qryReceberClientes.FieldByName('DEB_VLPARC').AsCurrency;
                   FieldByname('ATRASO').AsFloat        := Date()-FieldByname('VENCIMENTO').AsDateTime;
                   FieldByname('DESCRICAO').AsString    := qryReceberClientes.FieldByName('DEB_NMDESC').AsString;
                   FieldByname('SITUACAO').AsBoolean    := True;
                   FieldByname('RAZAO').AsString        := qryReceberClientes.FieldByName('CLI_RASOCI').AsString;
                   FieldByname('CREDITO').AsString      := qryReceberClientes.FieldByName('DEB_NRCRED').AsString;
                   FieldByname('ENDERECO').AsString     := qryReceberClientes.FieldByName('CLI_ENCLIE').AsString;
                   FieldByname('CEP').AsString          := qryReceberClientes.FieldByName('CLI_CEPCLI').AsString;
                   FieldByname('BAIRRO').AsString       := qryReceberClientes.FieldByName('CLI_BACLIE').AsString;
                   FieldByname('CIDADE').AsString       := qryReceberClientes.FieldByName('CLI_CICLIE').AsString;
                   FieldByname('UF').AsString           := qryReceberClientes.FieldByName('CLI_UFCLIE').AsString;
                   FieldByname('DOCUMENTO').AsString    := uFuncoes.StrZero(qryReceberClientesDEB_NRPARC.AsString,2); // Numero da Parcela
                   Post;
              End;
            //
            qryReceberClientes.Next;
        End;
        cdsDados.EnableControls;
        //
        If not(cdsDados.IsEmpty) Then
        begin
            HABILITAR;
            cdsDados.First;
        End
        Else
            BOTOES;
end;

procedure TfrmCobranca.btnFiltarClick(Sender: TObject);
Var
   aSituacao : String;
begin
   btnFiltar.Enabled := False;
   Application.ProcessMessages;

   Try
     Case rbgSituacao.ItemIndex of
       0 : aSituacao := 'A';
       1 : aSituacao := 'P';
       2 : aSituacao := 'T';
     End;
     //
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) and  not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text))
     AND uFuncoes.Empty(edtCDCLIE.Text) Then
           PERIODO(aSituacao);
     //
     If not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTINIC.Text)) and  not uFuncoes.Empty(uFuncoes.RemoveChar(edtDTFINA.Text))
      AND not uFuncoes.Empty(edtCDCLIE.Text) Then
           CLIENTE_PERIODO(aSituacao);
   Finally
        btnFiltar.Enabled := true;
        If (dsClientes.DataSet.Active) Then
           dsClientes.DataSet.First;
   End;
   Application.ProcessMessages;
end;

procedure TfrmCobranca.PERIODO(aSituacao : String);
begin
     With qryReceberClientes do
        begin
             SQL.Clear;
             Close;
             SQL.Add('Select D.DEB_CDCLIE, CL.CLI_NMCLIE, CL.CLI_RASOCI, D.DEB_NRPARC, ');
             SQL.Add('CL.CLI_ENCLIE, CL.CLI_CEPCLI, CL.CLI_BACLIE, CL.CLI_CICLIE, CL.CLI_UFCLIE, ');
             SQL.Add('D.DEB_NRCRED, D.DEB_NMDESC, D.DEB_DTVENC, D.DEB_DTCOBR, D.DEB_VLPARC, D.DEB_NMSIST, D.DEB_CDCOBR from ADMDEB D ');
             SQL.Add('INNER join ADMCLI CL ON CL.CLI_CDCLIE = D.DEB_CDCLIE');
             SQL.Add('Where (D.DEB_DTVENC >= :pDTINIC) and (D.DEB_DTVENC <= :pDTFINA) ');
             if (aSituacao <> 'T') Then
                 SQL.Add(' and (D.DEB_FLSITU = :pFLSITU) ');
             If not uFuncoes.Empty(M_CDTIPO) Then
                 SQL.Add(' and (D.DEB_CDCOBR = '+QuotedStr(M_CDTIPO)+')');
             SQL.Add('order by CL.CLI_NMCLIE');
             ParamByName('pDTINIC').AsString := uFuncoes.FormataData2(edtDTINIC.Text);
             ParamByName('pDTFINA').AsString := uFuncoes.FormataData2(edtDTFINA.Text);
             if (aSituacao <> 'T') Then
                 ParamByName('pFLSITU').AsString := aSituacao;
             Prepare;
             Open;
             //
             If (qryReceberClientes.RecordCount > 0 ) Then
             begin
                  CARREGAR_DADOS;
                  HABILITAR;
             End
             Else
             Begin
                 Application.MessageBox(PChar('Não há movimento no período!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 //
                 qryReceberClientes.Close;
                 cdsDados.Close;
                 BOTOES;
                 edtDTFINA.SetFocus; 
             End;
        End;
end;

procedure TfrmCobranca.qryReceberClientesCalcFields(DataSet: TDataSet);
begin
      qryReceberClientes.FieldByName('DEB_VENCIMENTO').AsString :=
             uFuncoes.FormataData(qryReceberClientes.FieldByName('DEB_DTVENC').AsString);
end;

procedure TfrmCobranca.btVisualizarClick(Sender: TObject);
begin
     If (cdsDados.Active) and not (cdsDados.IsEmpty) Then
      begin
           With ppReport1 do
            begin
                 lblPeriodo.Caption := 'PERÍODO..: '+edtDTINIC.Text + ' À '+edtDTFINA.Text;
                 If not uFuncoes.Empty(cmbTipos.Text) Then
                     txtTipo.Caption    := cmbTipos.Text
                 Else
                     txtTipo.Caption    := 'TODAS';
                 PrintReport;
            End;
      End;
end;

procedure TfrmCobranca.btTodosClick(Sender: TObject);
begin
     If (cdsDados.Active) and not (cdsDados.IsEmpty) Then
      begin
        BOTOES;
        Try
           With ppReport1 do
            begin
                 lblPeriodo.Caption := 'PERÍODO..: '+edtDTINIC.Text + ' À '+edtDTFINA.Text;
                 If not uFuncoes.Empty(cmbTipos.Text) Then
                     txtTipo.Caption    := cmbTipos.Text
                 Else
                     txtTipo.Caption    := 'TODAS';
                 Print;
            End;
        Finally
           HABILITAR;
        End;
      End;
end;

procedure TfrmCobranca.edtDTINICEnter(Sender: TObject);
begin
     limpar;
end;

procedure TfrmCobranca.limpar;
begin
     If (cdsDados.Active) and (cdsDados.RecordCount > 0)  Then
     begin
          cdsDados.EmptyDataSet;
          BOTOES;
     End;     
end;

procedure TfrmCobranca.edtDTFINAEnter(Sender: TObject);
begin
      limpar;
end;

procedure TfrmCobranca.BOTOES;
begin
     btVisualizar.Enabled := False;
     btTodos.Enabled      := False;
     btEnvelopes.Enabled  := False;
     bntEnvelopeFrete.Enabled  := False;
     btnGerarRemessa.Enabled  := False;
     btnRegProtocolo.Enabled  := false;
     btnBoletos.Enabled  := false;
     btnImpBoletos.Enabled  := false;
end;

procedure TfrmCobranca.HABILITAR;
begin
     btVisualizar.Enabled := True;
     btTodos.Enabled      := True;
     btEnvelopes.Enabled  := True;
     bntEnvelopeFrete.Enabled  := True;
     btnGerarRemessa.Enabled  := True;
     btnRegProtocolo.Enabled  := True;
     btnBoletos.Enabled       := True;
     btnImpBoletos.Enabled    := True;
end;

procedure TfrmCobranca.btEnvelopesClick(Sender: TObject);
begin
     If (cdsDados.Active) and not (cdsDados.IsEmpty) Then
      begin
           {With ppReport2 do
              PrintReport;}
           rvEnvelopes.Execute;
      End;
end;

procedure TfrmCobranca.bntEnvelopeFreteClick(Sender: TObject);
begin
     If (cdsDados.Active) and not (cdsDados.IsEmpty) Then
          rvEnvelFrente.Execute;
end;

procedure TfrmCobranca.dbGridDadosCellClick(Column: TColumn);
begin
{ If (cdsDados.Active = True) and not(cdsDados.IsEmpty) Then
  if Column.Field = cdsDadosSITUACAO then
  begin
       cdsDados.Edit;
       cdsDadosSITUACAO.AsBoolean := not cdsDadosSITUACAO.AsBoolean;
       cdsDados.Post;
  end;}
end;

procedure TfrmCobranca.dbGridDadosColEnter(Sender: TObject);
begin
{ If (cdsDados.Active = True) Then
    if dbGridDados.SelectedField = cdsDadosSITUACAO then
        dbGridDados.Options := dbGridDados.Options - [dgEditing]
    else
        dbGridDados.Options := dbGridDados.Options + [dgEditing];
 dbGridDados.SelectedIndex := 3;}
end;

procedure TfrmCobranca.dbGridDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  R: TRect;
begin
  {pinta checkbox}
{ If (cdsDados.Active = True) Then
  if Column.Field = cdsDadosSITUACAO  then
  begin
    dbGridDados.Canvas.FillRect(Rect);
    ImageList1.Draw(dbGridDados.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
    if cdsDadosSITUACAO.AsBoolean then
      ImageList1.Draw(dbGridDados.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else
      ImageList1.Draw(dbGridDados.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;}
end;

procedure TfrmCobranca.dbGridDadosEnter(Sender: TObject);
begin
     If (cdsDados.Active = True)
     and not (cdsDados.IsEmpty) Then
          dbGridDados.SelectedIndex := 3;
end;

procedure TfrmCobranca.dbGridDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
    If ((KEY = 38) or  (key = 40)) and (cdsDados.Active = True)
      And (cdsDados.Eof) Then
    Begin
         KEY := 0;
         cdsDados.First;
    End;
end;

procedure TfrmCobranca.dbGridDadosKeyPress(Sender: TObject; var Key: Char);
begin
{ If (cdsDados.Active = True) Then
     If (Key = #8) or (Key = #13)
       and  (dbGridDados.SelectedField = cdsDadosSITUACAO) Then
     begin
          Key := #0;
          cdsDados.Edit;
          cdsDadosSITUACAO.AsBoolean := not cdsDadosSITUACAO.AsBoolean;
          cdsDados.Next;
     End;}
end;

procedure TfrmCobranca.CLIENTE_PERIODO(aSituacao : String);
begin
     With qryReceberClientes do
        begin
             SQL.Clear;
             Close;
             SQL.Add('Select D.DEB_CDCLIE, CL.CLI_NMCLIE, CL.CLI_RASOCI, ');
             SQL.Add('CL.CLI_ENCLIE, CL.CLI_CEPCLI, CL.CLI_BACLIE, CL.CLI_CICLIE, CL.CLI_UFCLIE, ');
             SQL.Add('D.DEB_NRCRED, D.DEB_NRPARC, D.DEB_NMDESC, D.DEB_DTVENC, D.DEB_DTCOBR, D.DEB_VLPARC, D.DEB_NMSIST, D.DEB_CDCOBR from ADMDEB D ');
             SQL.Add('INNER join ADMCLI CL ON CL.CLI_CDCLIE = D.DEB_CDCLIE');
             SQL.Add('Where (D.DEB_CDCLIE = :pCDCLIE)');
             SQL.Add('And (D.DEB_DTVENC >= :pDTINIC) and (D.DEB_DTVENC <= :pDTFINA)');
             if (aSituacao <> 'T') Then
                 SQL.Add(' and (D.DEB_FLSITU = '+QuotedStr(aSituacao)+') ');
             If not uFuncoes.Empty(M_CDTIPO) Then
                 SQL.Add(' and (D.DEB_CDCOBR = '+QuotedStr(M_CDTIPO)+')');
             SQL.Add('order by CL.CLI_NMCLIE');
             ParamByName('pCDCLIE').AsString := uFuncoes.StrZero(edtCDCLIE.Text,7);
             ParamByName('pDTINIC').AsString := uFuncoes.FormataData2(edtDTINIC.Text);
             ParamByName('pDTFINA').AsString := uFuncoes.FormataData2(edtDTFINA.Text);
             Prepare;
             Open;
             //
             If (qryReceberClientes.RecordCount > 0 ) Then
                CARREGAR_DADOS
             Else
             Begin
                 Application.MessageBox(PChar('Não há movimento no período para cliente!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 //
                 qryReceberClientes.Close;
                 cdsDados.Close;
                 edtCDCLIE.Clear;
                 edtCDCLIE.SetFocus;  
             End;
        End;
end;

procedure TfrmCobranca.sbLocalizarClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmLocCliente, frmLocCliente);
      frmLocCliente.ShowModal;
  Finally
      W_CDCLIE := frmLocCliente.qryConsulta.FieldByName('CLI_CDCLIE').AsString;
      frmLocCliente.Free;
      If not uFuncoes.Empty(W_CDCLIE) Then
      begin
          edtCDCLIE.Text := W_CDCLIE;
          btnFiltar.SetFocus;
      End
      Else
          edtCDCLIE.SetFocus;
  End;
end;

procedure TfrmCobranca.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.Text) Then
      Begin
           dmADM.qryLocClientes.Close;
           //
           BOTOES;
           //
           If (cdsDados.Active) then
               cdsDados.Close; 
      End;
      //
     If (edtDTINIC.Text = '  /  /    ')
      and (edtDTFINA.Text = '  /  /    ')
         and uFuncoes.Empty(edtCDCLIE.Text) Then
            BOTOES;
     //
end;

procedure TfrmCobranca.edtCDCLIEEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.Text) Then
     begin
          cdsDados.Close;
          dmADM.qryLocClientes.close;
     End;
end;

procedure TfrmCobranca.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
        begin
             If not uFuncoes.LOCALIZAR_CLIENTE(uFuncoes.StrZero(edtCDCLIE.Text,7)) Then
                 Begin
                      Application.MessageBox(PChar('Cliente não cadastro!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      edtCDCLIE.Clear;
                      edtCDCLIE.SetFocus; 
                      Exit;
                 End;
             //
             edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
        End;
end;

procedure TfrmCobranca.edtCDCLIEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key = VK_RETURN)
     And not uFuncoes.Empty(edtCDCLIE.Text) then
        Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmCobranca.edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCobranca.Carregar_Tipos;
begin
     cmbTipos.Clear;
     With dmADM.tblTipoCobranca do
      begin
           Close;
           Open;
           First;
           cmbTipos.Items.Add('');
           While not (Eof) do
            begin
                 cmbTipos.Items.Add(FieldByName('TCO_NMCOBR').AsString);
                 //
                 Next;
            End;
      end;
end;

procedure TfrmCobranca.cmbTiposExit(Sender: TObject);
begin
      If Not uFuncoes.Empty(cmbTipos.Text) Then
           M_CDTIPO := dmADM.GetCodigoTipo(cmbTipos.Text)
      Else
           M_CDTIPO := '';
end;

procedure TfrmCobranca.btnGerarRemessaClick(Sender: TObject);
{Objetivo: Gerar arquivo para banco contendo os títulos mostrados na tela}
Var
    M_ARQUIVO, M_ARQREM : TextFile;
    M_NMARQU, LINHA, M_NRCONV, M_DIGCED : String;
    M_QTREGI, M_VLTOTA, M_ARQGER, aDocumento : String;
    M_QTLINH : Integer;
    M_NRDOCU : Integer;
    W_VLTOTA : Double;
begin
   //
   If not (dmADM.GerarArquivo(1, cdsDados)) Then
        MessageDlg('Erro na geração de arquivo.' ,mtInformation,[mbOk],0);
   {M_NRCONV := '1444729';
   M_DIGCED := '7';
   M_QTREGI := '';
   M_VLTOTA := '';
   M_NRDOCU := 1;
   W_VLTOTA := 0;
   //
   //Dados da remessa
   with gbCobranca1 do
   begin
      NumeroArquivo := 1;
      DataArquivo := Now;
      Titulos.Clear;
      //
      SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName) + '\Remessa';
      SaveDialog1.FileName := 'REM'+uFuncoes.StrZero(InttoStr(NumeroArquivo), 5)+'.txt';
      //
      SaveDialog1.Title := 'Salvar arquivo remessa em';
      if SaveDialog1.Execute then
         NomeArquivo := SaveDialog1.FileName
      else
         Exit;
      //
      // Inclui todos os títulos
      cdsDados.DisableControls;
      cdsDados.First;
      while not (cdsDados.Eof) do
      begin
         aDocumento := uFuncoes.StrZero(InttoStr(M_NRDOCU),10);
         PrepararTitulo(cdsDadosCODIGO_CLIENTE.AsString, aDocumento, Date(), cdsDadosVENCIMENTO.AsDateTime, cdsDadosVALOR.AsFloat);
         gbTitulo1.NossoNumero := M_NRCONV + aDocumento;
         //
         Titulos.Add(gbTitulo1);
         M_NRDOCU := M_NRDOCU + 1;
         cdsDados.Next;
      end;
      cdsDados.EnableControls;
     //
     if GerarRemessa then
     begin
       //
       Try
          M_QTREGI := uFuncoes.StrZero(InttoStr(cdsDados.RecordCount),6);
          W_VLTOTA := TotalReceber(cdsDados);
          M_VLTOTA := uFuncoes.StrZero(uFuncoes.RemoveChar(FloattoStr(W_VLTOTA)),17);
          //
          M_NMARQU := ExtractFilePath(Application.ExeName)+'\remessa\temp.txt';
          AssignFile(M_ARQREM, SaveDialog1.FileName);
          //
          if FileExists(M_NMARQU ) then
             DeleteFile(M_NMARQU);
          //
          AssignFile(M_ARQUIVO, M_NMARQU);
          Rewrite(M_ARQUIVO, M_NMARQU);
          //
          M_QTLINH := 1;
          Reset(M_ARQREM);
          Readln(M_ARQREM, LINHA);
          While not Eof(M_ARQREM) do
            begin
                 If (LINHA[8] = '0') Then
                 begin
                      Writeln(M_ARQUIVO, Copy(LINHA,1,18)+uFuncoes.Replicate('0',16)+
                          M_NRCONV+'001417019  '+Copy(LINHA,53,18)+M_DIGCED+Copy(LINHA,72,169));
                 End;
                 //
                 If (LINHA[9] = 'R') Then
                 begin
                      Writeln(M_ARQUIVO, Copy(LINHA,1,19)+uFuncoes.Replicate('0',16)+
                          M_NRCONV+'001417019  '+Copy(LINHA,54,18)+M_DIGCED+Copy(LINHA,73,127)+
                          uFuncoes.Replicate('0',8)+Copy(LINHA,208,33));
                 End;
                 //
                 If (LINHA[14] = 'P') Then
                 begin
                      Writeln(M_ARQUIVO, Copy(LINHA,1,35)+M_DIGCED+Copy(LINHA,37,69)+'0'+Copy(LINHA,107,11)
                      +'1'  // 1 diario - 2 Mensal - 3 Isento
                      +Copy(LINHA,119,103)+'02200009'+copy(LINHA,196,10)+uFuncoes.Replicate(' ',1));
                 End;
                 //
                 If (LINHA[14] = 'Q') Then
                 begin
                      Writeln(M_ARQUIVO, Copy(LINHA,1,209)
                      +'001'
                      +Copy(LINHA,213,28));
                 End;
                 //
                 If (LINHA[8] = '5') Then
                 begin
                      Writeln(M_ARQUIVO, Copy(LINHA,1,23)
                      +M_QTREGI+M_VLTOTA
                      +M_QTREGI+M_VLTOTA
                      +M_QTREGI+M_VLTOTA
                      +M_QTREGI+M_VLTOTA
                      +Copy(LINHA,116,125));
                 End;
                 // Proximo
                 M_QTLINH := M_QTLINH  + 1;
                 Readln(M_ARQREM, LINHA);
            End;   /// fim-do-enquanto
            //
            If (LINHA[8] = '9') Then
              Writeln(M_ARQUIVO, Copy(LINHA,1,23)
                      +uFuncoes.StrZero(InttoStr(M_QTLINH),6)
                      +Copy(LINHA,30,211));
       Finally
           CloseFile(M_ARQUIVO);
           CloseFile(M_ARQREM);
       End;
       //
       DeleteFile(SaveDialog1.FileName);
       M_ARQGER := 'REM'+uFuncoes.StrZero(InttoStr(NumeroArquivo), 5)+'.001';
       RenameFile(M_NMARQU, M_ARQGER);
       //
       MessageDlg('Gerou remessa ' + IntToStr(NumeroArquivo) + ' no arquivo ' + M_ARQGER,mtInformation,[mbOk],0);
     End; // fim-do-se
   end; //  with Remessa   }
end;

procedure TfrmCobranca.PrepararTitulo(aCliente, aDocumento : String; aDataDoc, aDataVenc : TDatetime; fValor : Double);
{
   Objetivo:
      Preencher as propriedades do componente gbTitulo1 com os dados da conta selecionada.
      Servirá de apoio para diveras outras rotinas
}
Var
    M_CDCLIE, M_COMPLE : String;
begin

   {Dados do titulo}
   with gbTitulo1 do
   begin
      SeuNumero      := aDocumento;
      NossoNumero    := uFuncoes.StrZero(aDocumento,17);
      Carteira       := 'CR';
      //
      DataDocumento  := aDataDoc;
      DataVencimento := aDataVenc;
      ValorDocumento := fValor;

      {Dados do cedente}
      with Cedente do
      begin
         Nome := 'INFOG2 TECNOLOGIA LTDA';
         NumeroCPFCGC := '07042296000152';
         //
         TipoInscricao := tiPessoaJuridica; //CNPJ
         If (Carteira = 'SR') Then
         Begin
           CodigoCedente       := '00005765';
           DigitoCodigoCedente := '7'
         End
         Else
         Begin
             CodigoCedente       := '1444729'+
                                    uFuncoes.StrZero('00005765',8);
             DigitoCodigoCedente := '7';
         End;
         {Endereço do cedente}
         with Endereco do
         begin
            Rua := 'AV. JOSE DOS SANTOS E SILVA';
            Endereco.Numero := '1769';
            Complemento := 'ED. TALISMÃ SALA 108';
            Bairro := 'CENTRO';
            Cidade := 'TERESINA';
            Estado := 'PI';
            CEP    := '64000100';
            Email  := 'sac@infog2.com.br';
         end; {with Endereco}

         {Dados bancários do cedente}
         with ContaBancaria do
         begin
                Banco.Codigo  := '001';
                CodigoAgencia := '4710';
                DigitoAgencia := '4';
                NumeroConta   := '00005765';
                DigitoConta   := '7';
            //
            If (Banco.Codigo = '000') Then
                Banco.Codigo := '001';
            //DigitoConta := '7';
         end; {with Banco}
      end; {with Cedente}

     //Dados do sacado do título
      with Sacado do
      begin
         dmADM.SelecionaCliente(aCliente);
         Nome := cdsDadosNOME.AsString;
         {If (dmCartao.qryACCBOL.FieldByName('BOL_TPPESS').AsString = 'F') Then
             TipoInscricao := tiPessoaFisica
         Else}
             TipoInscricao := tiPessoaJuridica;
         //
         NumeroCPFCGC := uFuncoes.RemoveChar(dmADM.qryLocClientes.FieldByName('CLI_CPFCGC').AsString);
         //Endereço do sacado do título
         with Endereco do
         begin
            Rua := dmADM.qryLocClientesCLI_ENCLIE.AsString;
            //Complemento := dmADM.qryLocClientes
            Bairro := cdsDadosBAIRRO.AsString;
            Cidade := cdsDadosCIDADE.AsString;
            Estado := cdsDadosUF.AsString;
            CEP    := dmADM.qryLocClientesCLI_CEPCLI.AsString;
            //cdsDadosCEP.AsString;
         end; //with Endereco

      end; //with Sacado
   end; //with Titulo
   //
end;

function TfrmCobranca.TotalReceber(aCDS: TClientDataSet): Double;
Var
    M_VLTOTA : Double;
begin
     M_VLTOTA := 0;
     With aCDS do
      begin
           DisableControls;
           First;
           While not (Eof) do
            begin
                 M_VLTOTA := M_VLTOTA + FieldByName('VALOR').AsFloat;
                 //
                 Next;
            End;
           First;
           EnableControls;
           //
           Result := M_VLTOTA;
      End;
end;

procedure TfrmCobranca.btnRegProtocoloClick(Sender: TObject);
begin
     If (cdsDados.Active) and not (cdsDados.IsEmpty) Then
      begin
            With ppRepProtocolo do
            begin
                  PrintReport;
            End;
      End;
end;

procedure TfrmCobranca.btnBoletosClick(Sender: TObject);
Var
    aMsg, aMsgMultaJuro : String;
begin
    If (dsClientes.DataSet.Active) and not (dsClientes.DataSet.IsEmpty) then
    begin
       dbGridDados.SetFocus;
       BOTOES;
       try
          //
            aMsg := 'N';
            aMsgMultaJuro := 'S';
            If Application.MessageBox('Imprimir verso do boleto?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
             begin
                   // dmADM.RvSystem1.SystemSetups := dmADM.RvSystem1.SystemSetups - [ssAllowPrinterSetup];
                   dmADM.GerarBoletoComVerso(dsClientes.DataSet.FieldByName('CODIGO_CLIENTE').AsString, dsClientes.DataSet.FieldByName('CREDITO').AsString,
                           dsClientes.DataSet.FieldByName('DOCUMENTO').AsString,
                              'V', aMsg, aMsgMultaJuro, 'S');
             End
             Else
                   dmADM.GerarBoleto(dsClientes.DataSet.FieldByName('CODIGO_CLIENTE').AsString, dsClientes.DataSet.FieldByName('CREDITO').AsString,
                           dsClientes.DataSet.FieldByName('DOCUMENTO').AsString,
                              'V', aMsg, aMsgMultaJuro);
       Finally
          HABILITAR;
          dbGridDados.SetFocus;
       End;
    End;
end;

procedure TfrmCobranca.Cedente1Click(Sender: TObject);
begin
     Application.CreateForm(TFrmConfig, FrmConfig);
     try
           FrmConfig.ShowModal;
     Finally
           FrmConfig.Free;
            dmADM.AbrirConfiguracoesBoleto;
     End;
end;

procedure TfrmCobranca.btnImpBoletosClick(Sender: TObject);
Var
   aNomeImpressora, aFlVerso, aPrimImp : String;
   iCont : integer;
begin
  If (dsClientes.DataSet.Active) and not (dsClientes.DataSet.IsEmpty) then
    begin
       dbGridDados.SetFocus;
       BOTOES;
       try
            aFlVerso := 'N';
            //
           If Application.MessageBox('Imprimir verso do boleto?',
             'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                aFlVerso := 'S';
             //
          If not (dmADM.cdsListaClientes.Active) Then
              dmADM.RefreshCDS(dmADM.cdsListaClientes);
              
          With cdsDados do
          begin
              // dmADM.RvSystem1.SystemSetups := dmADM.RvSystem1.SystemSetups + [ssAllowSetup];
              {if (PrinterSetupDialog1.Execute) Then
                 aNomeImpressora := PrinterSetupDialog1.GetNamePath;}
              dmADM.RvSystem1.SystemSetups    := RvSystem1.SystemSetups + [ssAllowSetup];

              //

              iCont := 1;
              First;
              While not (Eof) do
               begin
                   if (iCont = 1) Then
                      aPrimImp := 'S'
                   Else
                      aPrimImp := 'N';
                   //
                   If (aFlVerso = 'S') then
                    begin
                         dmADM.GerarBoletoComVerso(dsClientes.DataSet.FieldByName('CODIGO_CLIENTE').AsString, dsClientes.DataSet.FieldByName('CREDITO').AsString,
                           dsClientes.DataSet.FieldByName('DOCUMENTO').AsString,
                              'I', 'N', 'S', aPrimImp);
                         //RvSystem1.SystemSetups    := RvSystem1.SystemSetups - [ssAllowSetup];
                    End
                    Else
                         dmADM.GerarBoleto(dsClientes.DataSet.FieldByName('CODIGO_CLIENTE').AsString, dsClientes.DataSet.FieldByName('CREDITO').AsString,
                            dsClientes.DataSet.FieldByName('DOCUMENTO').AsString,
                              'I', 'N', 'S');
                   //
                   iCont := iCont + 1;
                   Next;
               End;
          End;
       Finally
          HABILITAR;
          dbGridDados.SetFocus;
       End;
    End;
end;

procedure TfrmCobranca.cdsDadosCalcFields(DataSet: TDataSet);
begin
     { If (cdsDados.State in [dsInternalCalc]) then
      begin
           cdsDadosDATA_COBRANCA.AsString := DatetoStr(Date);
      End;}
end;

procedure TfrmCobranca.dsClientesDataChange(Sender: TObject;
  Field: TField);
begin
    if (dsClientes.DataSet.Active) and not (dsClientes.DataSet.IsEmpty) Then
     begin
         btnPDF.Visible := true;
         lblRegistro.Caption := 'Registro(s): '+InttoStr(dsClientes.DataSet.RecNo)+'/'+
                                           InttoStr(dsClientes.DataSet.RecordCount);
     End
     Else
         btnPDF.Visible := False;
end;

procedure TfrmCobranca.btnPDFClick(Sender: TObject);
Var
    aMsg, aMsgMultaJuro : String;
    iCont : Integer;
begin
   dmADM.ExcluirArquivoLista();
   btnPDF.Enabled := False;
   Application.ProcessMessages;
   Try
     Screen.Cursor := crHourGlass;
     //
     dbGridDados.SetFocus;
     aMsg := 'N';
     aMsgMultaJuro := 'S';
     //
     iCont := 1;
     dsClientes.DataSet.First;
     // While (iCont < 11) do
     While not (dsClientes.DataSet.Eof) do
     begin
          dmADM.GerarBoleto(dsClientes.DataSet.FieldByName('CODIGO_CLIENTE').AsString, dsClientes.DataSet.FieldByName('CREDITO').AsString,
                           dsClientes.DataSet.FieldByName('DOCUMENTO').AsString,
                              'A', aMsg, aMsgMultaJuro);
          //
          dsClientes.DataSet.Next;
          //
          iCont := iCont + 1;                    
     End;
     //
  Finally
       btnPDF.Enabled := true;
       Screen.Cursor := crDefault;
  End;
  Application.ProcessMessages;
  //
  Application.MessageBox(PChar('Arquivos gerandos com sucesso.'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
  //
  if FileExists('EnvioEmail.exe') Then
     ExecutePrograma('EnvioEmail.exe', '')
  Else
     Raise Exception.Create('Módulo de envio de email não encontrado!!!');
end;

procedure TfrmCobranca.ExecutePrograma(Nome, Parametros: String);
Var
 Comando: Array[0..1024] of Char;
 Parms: Array[0..1024] of Char;
begin
  StrPCopy (Comando, Nome);
  StrPCopy (Parms, Parametros);
  ShellExecute (0, Nil, Comando, Parms, Nil, SW_SHOWNORMAL);
end;

End.


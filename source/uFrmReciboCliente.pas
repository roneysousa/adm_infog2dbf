unit uFrmReciboCliente;
     
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, ToolEdit, DBCtrls,
  Buttons, DB, DBTables, DBClient, ImgList, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, ppCache,
  ppStrtch, ppMemo, OleServer, WordXP;

// Replace Flags
type TWordReplaceFlags = set of (wrfReplaceAll, wrfMatchCase, wrfMatchWildcards);

type
  TfrmRecibos = class(TForm)
    pnlTopo: TPanel;
    pnlDados: TPanel;
    pnlInferior: TPanel;
    dbGridDados: TDBGrid;
    Label1: TLabel;
    edtDTINIC: TDateEdit;
    edtDTFINA: TDateEdit;
    Label2: TLabel;
    edtCDCLIE: TEdit;
    Label3: TLabel;
    DBText1: TDBText;
    btMarcar: TBitBtn;
    btDesmarcar: TBitBtn;
    btVisualizar: TBitBtn;
    btFechar: TBitBtn;
    qryReceberClientes: TQuery;
    dsClientes: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosVENCIMENTO: TDateField;
    cdsDadosNOME: TStringField;
    cdsDadosVALOR: TCurrencyField;
    cdsDadosATRASO: TFloatField;
    cdsDadosDESCRICAO: TStringField;
    cdsDadosSITUACAO: TBooleanField;
    ImageList1: TImageList;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLine1: TppLine;
    ppMemo1: TppMemo;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppmemTexto: TppMemo;
    txtData: TppLabel;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    btTodos: TBitBtn;
    sbLocalizar: TSpeedButton;
    btFiltrar: TBitBtn;
    qryReceberClientesDEB_CDCLIE: TStringField;
    qryReceberClientesCLI_NMCLIE: TStringField;
    qryReceberClientesDEB_NMDESC: TStringField;
    qryReceberClientesDEB_DTVENC: TStringField;
    qryReceberClientesDEB_VLPARC: TFloatField;
    qryReceberClientesDEB_VENCIMENTO: TStringField;
    qryReceberClientesDEB_NMSIST: TStringField;
    cdsDadosSISTEMA: TStringField;
    pnlMensagem: TPanel;
    mmoMensagem: TMemo;
    btMensagem: TBitBtn;
    Label4: TLabel;
    rbgSituacao: TRadioGroup;
    cbxMultaJuros: TCheckBox;
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure qryReceberClientesCalcFields(DataSet: TDataSet);
    procedure dbGridDadosCellClick(Column: TColumn);
    procedure dbGridDadosColEnter(Sender: TObject);
    procedure dbGridDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGridDadosEnter(Sender: TObject);
    procedure dbGridDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbGridDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure edtDTFINAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDTINICKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCDCLIEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btVisualizarClick(Sender: TObject);
    procedure btMarcarClick(Sender: TObject);
    procedure btDesmarcarClick(Sender: TObject);
    procedure btTodosClick(Sender: TObject);
    procedure sbLocalizarClick(Sender: TObject);
    procedure btWordClick(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure edtDTINICChange(Sender: TObject);
    procedure edtDTFINAChange(Sender: TObject);
    procedure edtCDCLIEEnter(Sender: TObject);
    procedure dsClientesDataChange(Sender: TObject; Field: TField);
    procedure btMensagemClick(Sender: TObject);
  private
     procedure PERIODO;
     procedure CLIENTE;
     procedure CLIENTE_PERIODO;
     procedure CARREGAR_DADOS;
     procedure BOTOES;
     procedure VISUALIZACAO;
     procedure IMPRIMIR;
     function Word_StringReplace(ADocument: TFileName; SearchString, ReplaceString: string; Flags: TWordReplaceFlags; SendToPrint:Boolean=False): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecibos: TfrmRecibos;
  W_CDCLIE : String;

implementation

uses udmADM, uFuncoes, uLocCliente, ComObj;

{$R *.dfm}

procedure TfrmRecibos.edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmRecibos.edtCDCLIEChange(Sender: TObject);
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

procedure TfrmRecibos.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
        begin
             If not uFuncoes.LOCALIZAR_CLIENTE(uFuncoes.StrZero(edtCDCLIE.Text,7)) Then
                 Begin
                      Application.MessageBox(PChar('Cliente n�o cadastro!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      edtCDCLIE.Clear;
                      Exit;
                 End;
             //
             edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
        End;
end;

procedure TfrmRecibos.btFecharClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmRecibos.PERIODO;
begin
     With qryReceberClientes do
        begin
             SQL.Clear;
             Close;
             SQL.Add('Select D.DEB_CDCLIE, CL.CLI_NMCLIE, D.DEB_NMDESC, D.DEB_DTVENC, D.DEB_VLPARC, D.DEB_NMSIST from ADMDEB D');
             SQL.Add('INNER join ADMCLI CL ON CL.CLI_CDCLIE = D.DEB_CDCLIE');
             SQL.Add('Where (D.DEB_DTVENC >= :pDTINIC) and (D.DEB_DTVENC <= :pDTFINA)');
             If (rbgSituacao.ItemIndex = 0 ) Then
                SQL.Add('and (D.DEB_FLSITU = '+QuotedStr ('A')+')');
             If (rbgSituacao.ItemIndex = 1 ) Then
                SQL.Add('and (D.DEB_FLSITU = '+QuotedStr ('P')+')');
             SQL.Add('order by CL.CLI_NMCLIE');
             ParamByName('pDTINIC').AsString := uFuncoes.FormataData2(edtDTINIC.Text);
             ParamByName('pDTFINA').AsString := uFuncoes.FormataData2(edtDTFINA.Text);
             Prepare;
             Open;
             //
             If (qryReceberClientes.RecordCount >0 ) Then
                CARREGAR_DADOS
             Else
             Begin
                 Application.MessageBox(PChar('N�o h� movimento no per�odo!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 qryReceberClientes.Close;
                 cdsDados.Close;
             End;
        End;
end;

procedure TfrmRecibos.qryReceberClientesCalcFields(DataSet: TDataSet);
begin
      qryReceberClientes.FieldByName('DEB_VENCIMENTO').AsString :=
             uFuncoes.FormataData(qryReceberClientes.FieldByName('DEB_DTVENC').AsString);
end;

procedure TfrmRecibos.CARREGAR_DADOS;
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
                   FieldByname('NOME').AsString         := qryReceberClientes.FieldByName('CLI_NMCLIE').AsString;
                   FieldByname('SISTEMA').AsString      := UpperCase(qryReceberClientes.FieldByName('DEB_NMSIST').AsString);
                   FieldByname('VALOR').AsCurrency      := qryReceberClientes.FieldByName('DEB_VLPARC').AsCurrency;
                   FieldByname('ATRASO').AsFloat        := Date()-FieldByname('VENCIMENTO').AsDateTime;
                   FieldByname('DESCRICAO').AsString    := qryReceberClientes.FieldByName('DEB_NMDESC').AsString;
                   FieldByname('SITUACAO').AsBoolean    := True;
                   Post;
              End;
            //
            qryReceberClientes.Next;
        End;
        cdsDados.EnableControls;
        //
        If not(cdsDados.IsEmpty) Then
        begin
            btDesmarcar.Enabled := True;
            btVisualizar.Enabled  := True;
            btTodos.Enabled     := True;
            //
            cdsDados.First;
        End
        Else
        begin
            btDesmarcar.Enabled := False;
            btVisualizar.Enabled  := False;
            btTodos.Enabled     := False;
        End;
end;

procedure TfrmRecibos.dbGridDadosCellClick(Column: TColumn);
begin
 If (cdsDados.Active = True) Then
  if Column.Field = cdsDadosSITUACAO then
  begin
       cdsDados.Edit;
       cdsDadosSITUACAO.AsBoolean := not cdsDadosSITUACAO.AsBoolean;
       cdsDados.Post;
  end;
end;

procedure TfrmRecibos.dbGridDadosColEnter(Sender: TObject);
begin
 If (cdsDados.Active = True) Then
    if dbGridDados.SelectedField = cdsDadosSITUACAO then
        dbGridDados.Options := dbGridDados.Options - [dgEditing]
    else
        dbGridDados.Options := dbGridDados.Options + [dgEditing];
 dbGridDados.SelectedIndex := 5;
end;

procedure TfrmRecibos.dbGridDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  R: TRect;
begin
  {pinta checkbox}
 If (cdsDados.Active = True) Then
  if Column.Field = cdsDadosSITUACAO  then
  begin
    dbGridDados.Canvas.FillRect(Rect);
    ImageList1.Draw(dbGridDados.Canvas, Rect.Left + 10, Rect.Top + 1, 0);
    if cdsDadosSITUACAO.AsBoolean then
      ImageList1.Draw(dbGridDados.Canvas, Rect.Left + 10, Rect.Top + 1, 2)
    else
      ImageList1.Draw(dbGridDados.Canvas, Rect.Left + 10, Rect.Top + 1, 1);
  end;

end;

procedure TfrmRecibos.dbGridDadosEnter(Sender: TObject);
begin
     dbGridDados.SelectedIndex := 5;
end;

procedure TfrmRecibos.dbGridDadosKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmRecibos.dbGridDadosKeyPress(Sender: TObject; var Key: Char);
begin
 If (cdsDados.Active = True) Then
     If (Key = #8) or (Key = #13)
       and  (dbGridDados.SelectedField = cdsDadosSITUACAO) Then
     begin
          Key := #0;
          cdsDados.Edit;
          cdsDadosSITUACAO.AsBoolean := not cdsDadosSITUACAO.AsBoolean;
          cdsDados.Next;
     End;
end;

procedure TfrmRecibos.FormShow(Sender: TObject);
begin
    pnlMensagem.Visible := False;
    //
    edtDTINIC.Date := Date();
    edtDTFINA.Date := Date();
    //
    cdsDados.Close;
    //
    btMarcar.Enabled    := False;
    btDesmarcar.Enabled := False;
    btVisualizar.Enabled  := False;
    btTodos.Enabled     := False;
end;

procedure TfrmRecibos.edtDTINICExit(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTINIC.Text);
            edtDTINIC.Date := StrtoDate(edtDTINIC.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inv�lida!');
             edtDTINIC.Date := Date();
             edtDTINIC.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRecibos.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            edtDTFINA.Date := StrtoDate(edtDTFINA.Text);
            //
            If (edtDTINIC.Date > edtDTFINA.Date) Then
            Begin
                Application.MessageBox('Per�odo inicial maior quer peri�do final!!!','ATEN��O',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                edtDTFINA.Date := Date();
                edtDTFINA.SetFocus;
                Exit;
            End;
            //
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inv�lida!');
             edtDTFINA.Date := Date();
             edtDTFINA.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmRecibos.edtDTFINAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dmADM.qryLocClientes.Close;
     cdsDados.Close;
     //
     Action := caFree;
end;


procedure TfrmRecibos.CLIENTE;
begin
     With qryReceberClientes do
        begin
             SQL.Clear;
             Close;
             SQL.Add('Select D.DEB_CDCLIE, CL.CLI_NMCLIE, D.DEB_NMDESC, D.DEB_DTVENC, D.DEB_VLPARC, D.DEB_NMSIST from ADMDEB D');
             SQL.Add('INNER join ADMCLI CL ON CL.CLI_CDCLIE = D.DEB_CDCLIE');
             SQL.Add('Where (D.DEB_CDCLIE = :pCDCLIE)');
             If (rbgSituacao.ItemIndex = 0 ) Then
                SQL.Add('and (D.DEB_FLSITU = '+QuotedStr ('A')+')');
             If (rbgSituacao.ItemIndex = 1 ) Then
                SQL.Add('and (D.DEB_FLSITU = '+QuotedStr ('P')+')');
             SQL.Add('order by CL.CLI_NMCLIE');
             ParamByName('pCDCLIE').AsString := uFuncoes.StrZero(edtCDCLIE.Text,7);
             Prepare;
             Open;
             //
             If (qryReceberClientes.RecordCount >0 ) Then
                CARREGAR_DADOS
             Else
             Begin
                 Application.MessageBox(PChar('N�o h� movimento no per�odo para cliente!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 qryReceberClientes.Close;
                 cdsDados.Close;
             End;
        End;
end;

procedure TfrmRecibos.edtDTINICKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmRecibos.edtCDCLIEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key = VK_RETURN)
     And not uFuncoes.Empty(edtCDCLIE.Text) then
        Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmRecibos.btVisualizarClick(Sender: TObject);
begin

     If (cdsDados.Active)
      and (cdsDados.FieldByName('SITUACAO').AsBoolean) Then
        begin
             VISUALIZACAO;
             {With ppReport1 do
                begin
                     ppmemTexto.Lines.Clear;
                     ppmemTexto.Lines.Add('     Recebemos da empresa, '+cdsDados.FieldByName('NOME').AsString
                                         +',  a import�ncia supra mencionada, referente a pagamento de manuten��o do software INFOG2 AUTOMA��O 2005, referente ao m�s de '
                                         +UpperCase(uFuncoes.MesExtenso(cdsDados.FieldByName('VENCIMENTO').AsDateTime))
                                         +'/'+Copy(DatetoStr(Date),7,4)+'.');
                     txtData.Text := 'Teresina(PI), '
                                     +Copy(DatetoStr(cdsDados.FieldByName('VENCIMENTO').AsDateTime),1,2)+' de '
                                     +uFuncoes.MesExtenso(cdsDados.FieldByName('VENCIMENTO').AsDateTime)
                                     +' de '+Copy(DatetoStr(Date),7,4)+'.';
                     PrintReport;
                End;}
        End;
end;

procedure TfrmRecibos.btMarcarClick(Sender: TObject);
begin
   If (cdsDados.Active) Then
   begin
     With cdsDados do
        begin
             DisableControls;
             First;
             While not (Eof) do
                begin
                     Edit;
                     FieldByName('SITUACAO').AsBoolean := true;
                     //
                     Next;
                End;
             //
             EnableControls;
        End;
        //
        btMarcar.Enabled    := False;
        btDesmarcar.Enabled := True;
        btVisualizar.Enabled := True;
        btTodos.Enabled      := True;
End;
end;

procedure TfrmRecibos.btDesmarcarClick(Sender: TObject);
begin
   If (cdsDados.Active) Then
   begin
     With cdsDados do
        begin
             DisableControls;
             First;
             While not (Eof) do
                begin
                     Edit;
                     FieldByName('SITUACAO').AsBoolean := False;
                     //
                     Next;
                End;
             //
             EnableControls;
        End;
        //
        btMarcar.Enabled    := True;
        btDesmarcar.Enabled := False;
        btVisualizar.Enabled := False;
        btTodos.Enabled := False;
   End;
end;

procedure TfrmRecibos.btTodosClick(Sender: TObject);
begin
     If (cdsDados.Active) Then
     Begin
          dmADM.tbConfig.Close;
          dmADM.tbConfig.Open;
          //
          cdsDados.DisableControls;
          cdsDados.First;
          //
          While not (cdsDados.Eof)do
          Begin
               If (cdsDados.FieldByName('SITUACAO').AsBoolean) Then
                   IMPRIMIR;
               // Proximo
               cdsDados.Next;
          End;
          //
          cdsDados.EnableControls;
     End;
end;

procedure TfrmRecibos.sbLocalizarClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmLocCliente, frmLocCliente);
      frmLocCliente.ShowModal;
  Finally
      uFrmReciboCliente.W_CDCLIE := frmLocCliente.qryConsulta.FieldByName('CLI_CDCLIE').AsString;
      //
      If not uFuncoes.Empty(uFrmReciboCliente.W_CDCLIE) Then
         edtCDCLIE.Text := uFrmReciboCliente.W_CDCLIE;
      //
      frmLocCliente.Free;
      edtCDCLIE.SetFocus;
  End;
end;

procedure TfrmRecibos.BOTOES;
begin
     btDesmarcar.Enabled := False;
     btVisualizar.Enabled  := False;
     btTodos.Enabled     := False;
     btMarcar.Enabled    := False;
end;

procedure TfrmRecibos.btWordClick(Sender: TObject);
Var
      MSWord: Variant;
      i : integer;
begin
      MSWord:= CreateOleObject ('Word.Basic'); //cria o objeto
      MSWord.AppShow; //mostra o word
      MSWord.FileOpen(ExtractFilePath( Application.ExeName )+'TEMP.DOC');
      For i := 1 to 8 do
          MSWord.insert(#13);
      MSWord.Font('Arial'); //muda a fonte usada
      MSWord.bold; //coloca negrito
      MSWord.FontSize(16); //muda o tamanho da fonte
      MSWord.CenterPara; //alinha ao centro
      MSWord.insert('RECIBO'); //Escreve algo
      MSWord.bold(false);
      MSWord.insert(#13);
      MSWord.Font('Arial'); //muda a fonte usada
      MSWord.bold; //coloca negrito
      MSWord.FontSize(14); //muda o tamanho da fonte
      MSWord.RightPara;
      MSWord.insert(#13+'R$ '+FormatFloat('###,##0.00',cdsDados.FieldByName('VALOR').AsFloat));
      MSWord.insert(#13);
      MSWord.bold(false);
      For i := 1 to 5 do
          MSWord.insert(#13);
      //
      MSWord.Font('Arial');
      MSWord.FontSize(12); //muda o tamanho da fonte
      MSWord.JustifyPara;  //alinha justificado
      MSWord.insert(#13+#9+'Recebemos da empresa, ');
      MSWord.bold;
      MSWord.insert(cdsDados.FieldByName('NOME').AsString);
      MSWord.bold(false);
      MSWord.insert(', a import�ncia supra mencionada, referente a pagamento de manuten��o do software INFOG2 AUTOMA��O 2005, referente ao m�s de '
                   +UpperCase(uFuncoes.MesExtenso(IncMonth(cdsDados.FieldByName('VENCIMENTO').AsDateTime,-1)))
                   +'/'+Copy(DatetoStr(Date),7,4)+'.');
      //
      For i := 1 to 7 do
          MSWord.insert(#13);
      MSWord.Font('Arial');
      MSWord.FontSize(12); //muda o tamanho da fonte
      MSWord.LeftPara;  //alinha esquerda
      MSWord.insert(#13+'Teresina (PI), '
                   +Copy(DatetoStr(cdsDados.FieldByName('VENCIMENTO').AsDateTime),1,2)+' de '
                   +lowercase(uFuncoes.MesExtenso(cdsDados.FieldByName('VENCIMENTO').AsDateTime))
                   +' de '+Copy(DatetoStr(Date),7,4)+'.');
      //
      MSWord.insert(#13);
      MSWord.insert(#13);
      //
      MSWord.Font('Arial');
      MSWord.FontSize(12); //muda o tamanho da fonte
      MSWord.insert(#13+'_____________________________');
      MSWord.insert(#13+'InfoG2 Tecnologia Ltda.');
      MSWord.FileSaveAs(ExtractFilePath( Application.ExeName )+'INFOG2.DOC', 1); //Salva o arquivo
      //PostMessage(FindWindow(nil, 'INFOG2 - Microsoft Word'), WM_CLOSE,0,0);
end;

procedure TfrmRecibos.btFiltrarClick(Sender: TObject);
begin
     If (edtDTINIC.Text <> '  /  /    ') and  (edtDTFINA.Text <> '  /  /    ')
      AND uFuncoes.Empty(edtCDCLIE.Text) Then
           PERIODO;
     //
     If (edtDTINIC.Text = '  /  /    ') and  (edtDTFINA.Text = '  /  /    ')
      AND not uFuncoes.Empty(edtCDCLIE.Text) Then
           CLIENTE;
     If (edtDTINIC.Text <> '  /  /    ') and  (edtDTFINA.Text <> '  /  /    ')
      AND not uFuncoes.Empty(edtCDCLIE.Text) Then
           CLIENTE_PERIODO;
end;

procedure TfrmRecibos.CLIENTE_PERIODO;
begin
     With qryReceberClientes do
        begin
             SQL.Clear;
             Close;
             SQL.Add('Select D.DEB_CDCLIE, CL.CLI_NMCLIE, D.DEB_NMDESC, D.DEB_DTVENC, D.DEB_VLPARC, D.DEB_NMSIST from ADMDEB D');
             SQL.Add('INNER join ADMCLI CL ON CL.CLI_CDCLIE = D.DEB_CDCLIE');
             SQL.Add('Where (D.DEB_CDCLIE = :pCDCLIE)');
             SQL.Add('And (D.DEB_DTVENC >= :pDTINIC) and (D.DEB_DTVENC <= :pDTFINA)');
             If (rbgSituacao.ItemIndex = 0 ) Then
                SQL.Add('and (D.DEB_FLSITU = '+QuotedStr ('A')+')');
             If (rbgSituacao.ItemIndex = 1 ) Then
                SQL.Add('and (D.DEB_FLSITU = '+QuotedStr ('P')+')');
             SQL.Add('order by CL.CLI_NMCLIE');
             ParamByName('pCDCLIE').AsString := uFuncoes.StrZero(edtCDCLIE.Text,7);
             ParamByName('pDTINIC').AsString := uFuncoes.FormataData2(edtDTINIC.Text);
             ParamByName('pDTFINA').AsString := uFuncoes.FormataData2(edtDTFINA.Text);
             Prepare;
             Open;
             //
             If (qryReceberClientes.RecordCount >0 ) Then
                CARREGAR_DADOS
             Else
             Begin
                 Application.MessageBox(PChar('N�o h� movimento no per�odo para cliente!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                 qryReceberClientes.Close;
                 cdsDados.Close;
             End;
        End;
end;

procedure TfrmRecibos.VISUALIZACAO;
Var
      MSWord: Variant;
      i : integer;
      M_DATA : String;
      M_PEMULT, M_PEJURO, M_VLMULT, M_VLJURO, M_TOTAL : Double;
begin
      dmADM.tbConfig.Close;
      dmADM.tbConfig.Open;
      //
      M_VLMULT := 0;
      M_VLJURO := 0;
      //
      M_PEMULT := dmADM.tbConfigPAR_PEMULT.AsFloat;
      M_PEJURO := dmADM.tbConfigPAR_PEJURO.AsFloat;
      //
      PostMessage(FindWindow(nil, 'TEMP - Microsoft Word'), WM_CLOSE,0,0);
      PostMessage(FindWindow(nil, 'INFOG2.DOC - Microsoft Word'), WM_CLOSE,0,0);
      If (fileexists(ExtractFilePath( Application.ExeName )+'INFOG2.DOC')) Then
          DeleteFile(ExtractFilePath( Application.ExeName )+'INFOG2.DOC');
      MSWord:= CreateOleObject ('Word.Basic'); //cria o objeto
      MSWord.AppShow; //mostra o word
      MSWord.FileOpen(ExtractFilePath( Application.ExeName )+'TEMP.DOC');
      //
      MSWord.Font('Arial'); //muda a fonte usada
      MSWord.FontSize(14); //muda o tamanho da fonte
      MSWord.CenterPara; //alinha ao centro
      //MSWord.insert(cdsDados.FieldByName('NOME').AsString+#9+'VENCIMENTO : '+DatetoStr(cdsDados.FieldByName('VENCIMENTO').AsDateTime));
      //
      For i := 1 to 10 do
          MSWord.insert(#13);
      MSWord.Font('Arial'); //muda a fonte usada
      MSWord.bold; //coloca negrito
      MSWord.FontSize(16); //muda o tamanho da fonte
      MSWord.CenterPara; //alinha ao centro
      MSWord.insert('RECIBO'); //Escreve algo
      MSWord.bold(false);
      MSWord.insert(#13);
      MSWord.Font('Arial'); //muda a fonte usada
      MSWord.bold; //coloca negrito
      MSWord.FontSize(14); //muda o tamanho da fonte
      MSWord.RightPara;
      MSWord.insert(#13+'R$ '+FormatFloat('###,##0.00',cdsDados.FieldByName('VALOR').AsFloat));
      MSWord.insert(#13);
      MSWord.bold(false);
      For i := 1 to 2 do
          MSWord.insert(#13);
      //
      MSWord.Font('Arial');
      MSWord.FontSize(12); //muda o tamanho da fonte
      MSWord.JustifyPara;  //alinha justificado
      MSWord.insert(#13+#9+'Recebemos da empresa, ');
      MSWord.bold;
      MSWord.insert(cdsDados.FieldByName('NOME').AsString);
      MSWord.bold(false);
      M_DATA := Copy(DatetoStr(IncMonth(cdsDados.FieldByName('VENCIMENTO').AsDateTime,-1)),7,4);
      //MSWord.insert(', a import�ncia supra mencionada, referente a pagamento de manuten��o do software '+cdsDados.FieldByName('SISTEMA').AsString+', referente ao m�s de '
      MSWord.insert(', a import�ncia supra mencionada, referente a pagamento de manuten��o do software '+cdsDados.FieldByName('SISTEMA').AsString+', referente a titulo vencido em '
                   +cdsDados.FieldByName('VENCIMENTO').AsString+'.');
                   {+UpperCase(uFuncoes.MesExtenso(IncMonth(cdsDados.FieldByName('VENCIMENTO').AsDateTime,-1)))
                   +'/'+M_DATA+'.');}
      //
      if (cbxMultaJuros.Checked) Then
      begin
          MSWord.insert(#13);
          MSWord.insert(#13);
          MSWord.insert(#13);
          M_VLMULT := uFuncoes.Gerapercentual(cdsDados.FieldByName('VALOR').AsFloat, M_PEMULT);
          M_VLJURO := uFuncoes.Gerapercentual(cdsDados.FieldByName('VALOR').AsFloat, M_PEJURO);
          M_TOTAL := cdsDados.FieldByName('VALOR').AsFloat +  M_VLMULT + M_VLJURO;
          //
          if (M_VLMULT > 0) Then
          begin
              MSWord.Font('Arial');
              MSWord.FontSize(12); //muda o tamanho da fonte
              MSWord.insert('Multa: '+'R$ '+FormatFloat('###,##0.00',M_VLMULT)+#13);
          End;
          if (M_VLJURO > 0) Then
          begin
              MSWord.Font('Arial');
              MSWord.FontSize(12); //muda o tamanho da fonte
              MSWord.insert('Juros: '+'R$ '+FormatFloat('###,##0.00',M_VLJURO)+#13);
          End;
          MSWord.bold;
          MSWord.Font('Arial');
          MSWord.FontSize(12); //muda o tamanho da fonte
          MSWord.insert('TOTAL: '+'R$ '+FormatFloat('###,##0.00',M_TOTAL)+#13);
          MSWord.bold(false);
      End;
      //
      For i := 1 to 3 do
          MSWord.insert(#13);
      MSWord.Font('Arial');
      MSWord.FontSize(12); //muda o tamanho da fonte
      MSWord.LeftPara;  //alinha esquerda
      MSWord.insert(#13+'Teresina (PI), '
                   +Copy(DatetoStr(Date()),1,2)+' de '
                   +lowercase(uFuncoes.MesExtenso(Date()))
                   +' de '+Copy(DatetoStr(Date),7,4)+'.');
                   {+Copy(DatetoStr(cdsDados.FieldByName('VENCIMENTO').AsDateTime),1,2)+' de '
                   +lowercase(uFuncoes.MesExtenso(cdsDados.FieldByName('VENCIMENTO').AsDateTime))
                   +' de '+Copy(DatetoStr(Date),7,4)+'.');}
      //
      MSWord.insert(#13);
      MSWord.insert(#13);
      //
      MSWord.Font('Arial');
      MSWord.FontSize(12); //muda o tamanho da fonte
      MSWord.insert(#13+'_____________________________');
      MSWord.insert(#13+'InfoG2 Tecnologia Ltda.');
      //
      If not uFuncoes.Empty (mmoMensagem.Lines.Text) then
      begin
          MSWord.insert(#13);
          MSWord.insert(#13);
          {MSWord.insert(#13);
          MSWord.insert(#13);
          MSWord.insert(#13);
          MSWord.insert(#13);}
          //
          MSWord.Font('Arial');
          MSWord.FontSize(12); //muda o tamanho da fonte
          MSWord.LeftPara;  //alinha esquerda
          MSWord.insert(uFuncoes.Replicate('_',70)+#13);
          MSWord.Font('Arial');
          MSWord.FontSize(12); //muda o tamanho da fonte
          MSWord.LeftPara;  //alinha esquerda
          MSWord.italic;
          MSWord.insert(mmoMensagem.Lines.Text+#13);
          MSWord.italic(false);
          MSWord.Font('Arial');
          MSWord.FontSize(12); //muda o tamanho da fonte
          MSWord.insert(uFuncoes.Replicate('_',70));
      End;
      //
      //Word_StringReplace(ExtractFilePath( Application.ExeName )+'TEMP.DOC','<<nome>>',cdsDados.FieldByName('NOME').AsString,[wrfReplaceAll]);
      //Word_StringReplace(ExtractFilePath( Application.ExeName )+'TEMP.DOC','<<vencimento>>','VENCIMENTO : '+ cdsDados.FieldByName('VENCIMENTO').AsString,[wrfReplaceAll]);
      MSWord.FileSaveAs(ExtractFilePath( Application.ExeName )+'INFOG2.DOC', 1); //Salva o arquivo
end;

procedure TfrmRecibos.IMPRIMIR;
Var
      MSWord: Variant;
      i : integer;
      M_DATA : String;
      M_PEMULT, M_PEJURO, M_VLMULT, M_VLJURO, M_TOTAL : Double;
begin
      M_VLMULT := 0;
      M_VLJURO := 0;
      //
      M_PEMULT := dmADM.tbConfigPAR_PEMULT.AsFloat;
      M_PEJURO := dmADM.tbConfigPAR_PEJURO.AsFloat;
      //
      PostMessage(FindWindow(nil, 'TEMP - Microsoft Word'), WM_CLOSE,0,0);
      If (fileexists(ExtractFilePath( Application.ExeName )+'INFOG2.DOC')) Then
          DeleteFile(ExtractFilePath( Application.ExeName )+'INFOG2.DOC');
      //
      MSWord:= CreateOleObject ('Word.Basic'); //cria o objeto
      //MSWord.AppShow;
      MSWord.FileOpen(ExtractFilePath( Application.ExeName )+'TEMP.DOC');
      For i := 1 to 8 do
          MSWord.insert(#13);
      MSWord.Font('Arial'); //muda a fonte usada
      MSWord.bold; //coloca negrito
      MSWord.FontSize(16); //muda o tamanho da fonte
      MSWord.CenterPara; //alinha ao centro
      MSWord.insert('RECIBO'); //Escreve algo
      MSWord.bold(false);
      MSWord.insert(#13);
      MSWord.Font('Arial'); //muda a fonte usada
      MSWord.bold; //coloca negrito
      MSWord.FontSize(14); //muda o tamanho da fonte
      MSWord.RightPara;
      MSWord.insert(#13+'R$ '+FormatFloat('###,##0.00',cdsDados.FieldByName('VALOR').AsFloat));
      MSWord.insert(#13);
      MSWord.bold(false);
      For i := 1 to 5 do
          MSWord.insert(#13);
      //
      MSWord.Font('Arial');
      MSWord.FontSize(12); //muda o tamanho da fonte
      MSWord.JustifyPara;  //alinha justificado
      MSWord.insert(#13+#9+'Recebemos da empresa, ');
      MSWord.bold;
      MSWord.insert(cdsDados.FieldByName('NOME').AsString);
      MSWord.bold(false);
      M_DATA := Copy(DatetoStr(IncMonth(cdsDados.FieldByName('VENCIMENTO').AsDateTime,-1)),7,4);
      MSWord.insert(', a import�ncia supra mencionada, referente a pagamento de manuten��o do software '+cdsDados.FieldByName('SISTEMA').AsString+', referente a titulo vencido em '
                   +cdsDados.FieldByName('VENCIMENTO').AsString+'.');
      {MSWord.insert(', a import�ncia supra mencionada, referente a pagamento de manuten��o do software '+cdsDados.FieldByName('SISTEMA').AsString+', referente ao m�s de '
                   +UpperCase(uFuncoes.MesExtenso(IncMonth(cdsDados.FieldByName('VENCIMENTO').AsDateTime,-1)))
                   +'/'+M_DATA+'.');}
      //
      if (cbxMultaJuros.Checked) Then
      begin
          MSWord.insert(#13);
          MSWord.insert(#13);
          MSWord.insert(#13);
          M_VLMULT := uFuncoes.Gerapercentual(cdsDados.FieldByName('VALOR').AsFloat, M_PEMULT);
          M_VLJURO := uFuncoes.Gerapercentual(cdsDados.FieldByName('VALOR').AsFloat, M_PEJURO);
          M_TOTAL := cdsDados.FieldByName('VALOR').AsFloat +  M_VLMULT + M_VLJURO;
          //
          if (M_VLMULT > 0) Then
          begin
              MSWord.Font('Arial');
              MSWord.FontSize(12); //muda o tamanho da fonte
              MSWord.insert('Multa: '+'R$ '+FormatFloat('###,##0.00',M_VLMULT)+#13);
          End;
          if (M_VLJURO > 0) Then
          begin
              MSWord.Font('Arial');
              MSWord.FontSize(12); //muda o tamanho da fonte
              MSWord.insert('Juros: '+'R$ '+FormatFloat('###,##0.00',M_VLJURO)+#13);
          End;
          MSWord.bold;
          MSWord.Font('Arial');
          MSWord.FontSize(12); //muda o tamanho da fonte
          MSWord.insert('TOTAL: '+'R$ '+FormatFloat('###,##0.00',M_TOTAL)+#13);
          MSWord.bold(false);
      End;
      //
      For i := 1 to 5 do
          MSWord.insert(#13);
      MSWord.Font('Arial');
      MSWord.FontSize(12); //muda o tamanho da fonte
      MSWord.LeftPara;  //alinha esquerda
      MSWord.insert(#13+'Teresina (PI), '
                   +Copy(DatetoStr(Date()),1,2)+' de '
                   +lowercase(uFuncoes.MesExtenso(Date()))
                   +' de '+Copy(DatetoStr(Date),7,4)+'.');
                   {+Copy(DatetoStr(cdsDados.FieldByName('VENCIMENTO').AsDateTime),1,2)+' de '
                   +lowercase(uFuncoes.MesExtenso(cdsDados.FieldByName('VENCIMENTO').AsDateTime))
                   +' de '+Copy(DatetoStr(Date),7,4)+'.');}
      //
      MSWord.insert(#13);
      MSWord.insert(#13);
      //

      //
      MSWord.Font('Arial');
      MSWord.FontSize(12); //muda o tamanho da fonte
      MSWord.insert(#13+'_____________________________');
      MSWord.insert(#13+'InfoG2 Tecnologia Ltda.');
      If not uFuncoes.Empty (mmoMensagem.Lines.Text) then
      begin
          MSWord.insert(#13);
          MSWord.insert(#13);
          MSWord.insert(#13);
          MSWord.insert(#13);
          MSWord.insert(#13);
          MSWord.insert(#13);
          //
          MSWord.LeftPara;  //alinha esquerda
          MSWord.insert(uFuncoes.Replicate('_',80)+#13);
          MSWord.Font('Arial');
          MSWord.FontSize(12); //muda o tamanho da fonte
          MSWord.italic;
          MSWord.insert(mmoMensagem.Lines.Text+#13);
          MSWord.italic(false);
          MSWord.Font('Arial');
          MSWord.FontSize(12); //muda o tamanho da fonte
          MSWord.insert(uFuncoes.Replicate('_',70));
      End;
      //
      MSWord.FileSaveAs(ExtractFilePath( Application.ExeName )+'INFOG2.DOC', 1); //Salva o arquivo
      MsWord.FilePrint;
      PostMessage(FindWindow(nil, 'INFOG2 [Modo de Compatibilidade] - Microsoft Word'), WM_CLOSE,0,0);
      //PostMessage(FindWindow(nil, 'INFOG2 - Microsoft Word'), WM_CLOSE,0,0);
end;

procedure TfrmRecibos.edtDTINICChange(Sender: TObject);
begin
     If (edtDTINIC.Text = '  /  /    ') Then
         cdsDados.Close;
     If (edtDTINIC.Text = '  /  /    ')
      and (edtDTFINA.Text = '  /  /    ')
         and uFuncoes.Empty(edtCDCLIE.Text) Then
            BOTOES;
end;

procedure TfrmRecibos.edtDTFINAChange(Sender: TObject);
begin
     If (edtDTFINA.Text = '  /  /    ') Then
         cdsDados.Close;
     If (edtDTINIC.Text = '  /  /    ')
      and (edtDTFINA.Text = '  /  /    ')
         and uFuncoes.Empty(edtCDCLIE.Text) Then
            BOTOES;         
end;

procedure TfrmRecibos.edtCDCLIEEnter(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.Text) Then
         cdsDados.Close;
end;

procedure TfrmRecibos.dsClientesDataChange(Sender: TObject; Field: TField);
begin
     If (cdsDados.FieldByName('SITUACAO').AsBoolean) Then
     begin
          btVisualizar.Enabled := True;
          btTodos.Enabled      := True;
     End
     Else
     Begin
          btVisualizar.Enabled := False;
          btTodos.Enabled      := False;
     End;
end;

procedure TfrmRecibos.btMensagemClick(Sender: TObject);
begin
      pnlMensagem.Visible := not pnlMensagem.Visible;
      //
      If (pnlMensagem.Visible) Then
          mmoMensagem.SetFocus
      Else
          mmoMensagem.Clear;  
end;

function TfrmRecibos.Word_StringReplace(ADocument: TFileName; SearchString,
  ReplaceString: string; Flags: TWordReplaceFlags;
  SendToPrint: Boolean): Boolean;

const wdFindContinue = 1;
     wdReplaceOne = 1;
     wdReplaceAll = 2;
     wdDoNotSaveChanges = 0;
var
   WordApp: OLEVariant;
begin
     Result := False;
     if not FileExists(ADocument) then
     begin
        ShowMessage('Documento n�o encontrado');
        Exit;
     end;
     //
     try
          WordApp := CreateOLEObject('Word.Application');
     except
          on E: Exception do
          begin
                E.Message := 'Microsoft Word n�o dispon�vel';
                raise;
          end;
     end;
     //
    try
         WordApp.Visible := False;
         WordApp.Documents.Open(ADocument);
         WordApp.Selection.Find.ClearFormatting;
         WordApp.Selection.Find.Text := SearchString;
         WordApp.Selection.Find.Replacement.Text := ReplaceString;
         WordApp.Selection.Find.Forward := True;
         WordApp.Selection.Find.Wrap := wdFindContinue;
         WordApp.Selection.Find.Format := False;
         WordApp.Selection.Find.MatchCase := wrfMatchCase in Flags;
         WordApp.Selection.Find.MatchWholeWord := False;
         WordApp.Selection.Find.MatchWildcards := wrfMatchWildcards in Flags;
         WordApp.Selection.Find.MatchSoundsLike := False;
         WordApp.Selection.Find.MatchAllWordForms := False;
         if wrfReplaceAll in Flags then
         Begin
              WordApp.Selection.Find.Execute(Replace := wdReplaceAll)
         End
         else
         Begin
              WordApp.Selection.Find.Execute(Replace := wdReplaceOne);
         End;
         WordApp.ActiveDocument.SaveAs(ADocument);
         //
         If SendToPrint Then
         Begin
              WordApp.PrintOut;
              while WordApp.BackgroundPrintingStatus > 0 do
                   Application.ProcessMessages;
         End;
         //
         Result := True;
         WordApp.ActiveDocument.Close(wdDoNotSaveChanges);
     finally
         WordApp.Quit;
         WordApp := Unassigned;
     end;
End;

End.


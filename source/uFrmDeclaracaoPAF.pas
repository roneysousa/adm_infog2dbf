unit uFrmDeclaracaoPAF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, OleServer, WordXP, ComObj;

type
  TFrmDeclaracoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    edtCDCLIE: TEdit;
    sbLocalizar: TSpeedButton;
    btVisualizar: TBitBtn;
    btFechar: TBitBtn;
    edtNome: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtMarca: TEdit;
    edtModelo: TEdit;
    edtNumOrdem: TEdit;
    edtVersao: TEdit;
    procedure btFecharClick(Sender: TObject);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure sbLocalizarClick(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure VISUALIZACAO(aCodCliente : String);
  end;

var
  FrmDeclaracoes: TFrmDeclaracoes;
  W_CDCLIE : String;

implementation

uses uFuncoes, uLocCliente, udmADM;

{$R *.dfm}

procedure TFrmDeclaracoes.btFecharClick(Sender: TObject);
begin
       Close;
end;

procedure TFrmDeclaracoes.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
        begin
             edtNome.Clear;
             //
             If not uFuncoes.LOCALIZAR_CLIENTE(uFuncoes.StrZero(edtCDCLIE.Text,7)) Then
                 Begin
                      Application.MessageBox(PChar('Cliente não cadastro!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      edtCDCLIE.Clear;

                      Exit;
                 End;
             //
             edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7);
             edtNome.Text   := dmADM.GetNomeCliente(edtCDCLIE.Text);
             //
             btVisualizar.SetFocus;
        End;
end;

procedure TFrmDeclaracoes.edtCDCLIEKeyPress(Sender: TObject;
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
     //
     If (key = #13) and not uFuncoes.Empty(edtCDCLIE.Text)  Then
      begin
          key:=#0;
          edtMarca.SetFocus;
      End;
end;

procedure TFrmDeclaracoes.sbLocalizarClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmLocCliente, frmLocCliente);
      frmLocCliente.ShowModal;
  Finally
      uFrmDeclaracaoPAF.W_CDCLIE := frmLocCliente.qryConsulta.FieldByName('CLI_CDCLIE').AsString;
      //
      If not uFuncoes.Empty(uFrmDeclaracaoPAF.W_CDCLIE) Then
         edtCDCLIE.Text := uFrmDeclaracaoPAF.W_CDCLIE;
      //
      frmLocCliente.Free;
      edtCDCLIE.SetFocus;
  End;
end;

procedure TFrmDeclaracoes.VISUALIZACAO(aCodCliente: String);
Var
      MSWord: Variant;
      i : integer;
      M_DATA : String;
      aRazao, aCAGEP, aEnderecoCli, aEndNumCli, aEndCompCli,aBairroCli, aCidadeCli, aUfCLie, aCepCli, aFoneCli, aCnpjCli : String;
begin       
      //
 Try
   If (dmADM.SelecionaCliente(aCodCliente)) then
   begin
        aRazao       := dmADM.qryLocClientesCLI_RASOCI.AsString;
        aEnderecoCli := dmADM.qryLocClientesCLI_ENCLIE.AsString;
        aCAGEP       := '';
        aEndNumCli   := '';
        aEndCompCli  := '';
        aBairroCli   := dmADM.qryLocClientesCLI_BACLIE.AsString;
        aCidadeCli   := dmADM.qryLocClientesCLI_CICLIE.AsString;
        aUfCLie      := dmADM.qryLocClientesCLI_UFCLIE.AsString;
        aCepCli      := dmADM.qryLocClientesCLI_CEPCLI.AsString;
        aFoneCli     := ufuncoes.FormataFONE( dmADM.qryLocClientesCLI_NRFONE.AsString);
        aCnpjCli     := ufuncoes.FormataCNPJ(dmADM.qryLocClientesCLI_CPFCGC.AsString);
   End;
   //
   IF not FileExists(ExtractFIlePath(Application.ExeName) + 'declaracao.doc') then
      raise Exception.Create('Arquivo de declaração não encontrado!');
   try
      PostMessage(FindWindow(nil, 'TEMP - Microsoft Word'), WM_CLOSE,0,0);
      PostMessage(FindWindow(nil, 'declaracao.DOC - Microsoft Word'), WM_CLOSE,0,0);
      PostMessage(FindWindow(nil, 'Microsoft Office Word (32 bits)'), WM_CLOSE,0,0);
      If (fileexists(ExtractFilePath( Application.ExeName )+'INFOG2.DOC')) Then
          DeleteFile(ExtractFilePath( Application.ExeName )+'INFOG2.DOC');
      MSWord := CreateOleObject ('Word.Application'); //cria o objeto
     // MSWord.AppShow; //mostra o word
      MSWord.Documents.Open(ExtractFIlePath(Application.ExeName) + 'declaracao.doc');
      MSWord.Visible := True;
      //MSWord.FileOpen(ExtractFilePath( Application.ExeName )+'declaracao.DOC');
      //Word_StringReplace(ExtractFilePath( Application.ExeName )+'TEMP.DOC','<<nome>>',cdsDados.FieldByName('NOME').AsString,[wrfReplaceAll]);
      //Word_StringReplace(ExtractFilePath( Application.ExeName )+'TEMP.DOC','<<vencimento>>','VENCIMENTO : '+ cdsDados.FieldByName('VENCIMENTO').AsString,[wrfReplaceAll]);
      // campos IDENTIFICAÇÃO DA EMPRESA REQUERENTE 
      // campo 01 Razão social
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<RAZAO>', ReplaceWith := aRazao);
      // campo 02 CAGEP
      //MSWord.ActiveDocument.Content.Find.Execute(FindText := '<CAGEP>', ReplaceWith := 'CAGEP');
      // campo 03 <ENDERECO>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<ENDERECO>', ReplaceWith := aEnderecoCli);
      // campo 04 <NUM>
      // campo 05 <COMPLEMENTO>
      // campo 06 <BAIRRO>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<BAIRRO>', ReplaceWith := aBairroCli);
      // campo 07 <CIDADE>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<CIDADE>', ReplaceWith := aCidadeCli);
      // campo 08 <UF>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<UF>', ReplaceWith := aUfCLie);
      // campo 09 <CEP>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<CEP>', ReplaceWith := aCepCli);
      // campo 10 <FONE>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<FONE>', ReplaceWith := aFoneCli);
      // campo 11 <CNPJ>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<CNPJ>', ReplaceWith := aCnpjCli);
      //  IDENTIFICAÇÃO DO REPRESENTANTE LEGAL DA REQUERENTE  
      // campo 12  <NOME>
      // campo 13  <EMAIL>
      // campo 14  <ENDERECO_REP>
      // campo 15  <NU_R>
      // campo 16  <COMPLEMENTO_REP>
      // campo 17  <BAIRRO_REP>
      // campo 18  <CIDADE_REP>
      // campo 19  <UF_R>
      // campo 20  <CEP_REP>
      // campo 21  <FONE_REP>
      // campo 22  <CPF_REP>
      // campo 23  <RG_REP>
      // campo 24  <ORG_R>
      // campos DADOS DO ECF
      // campo 25 <MARCA_IMP>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<MARCA_IMP>', ReplaceWith := edtMarca.Text);
      // campo 26 <MODEL_IMP>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<MODEL_IMP>', ReplaceWith := edtModelo.Text);
      // campo 27 <NUM_ORDEM>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<NUM_ORDEM>', ReplaceWith := edtNumOrdem.Text);
      // campo 28 <VERSAO_SOFT>
      MSWord.ActiveDocument.Content.Find.Execute(FindText := '<VERSAO_SOFT>', ReplaceWith := edtVersao.Text);

      //MSWord.FileSaveAs(ExtractFilePath( Application.ExeName )+'INFOG2.DOC', 1); //Salva o arquivo
      // MSWord.ActiveDocument.SaveAs('INFOG2.DOC',0); ;
       //MsWord.ActiveDocument.SaveAs(FileName := 'INFOG2.doc');    //Salva o arquivo

   Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar visualizar documento!!!'+#13
                      + Exc.Message), 'ATENÇÃO', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
        End;
   End;
  Finally
    //  MsWord.ActiveDocument.Close(SaveChanges := 0);    //Fecha documento
     // MsWord.Quit;         // Fecha o Word
  End;
end;

procedure TFrmDeclaracoes.btVisualizarClick(Sender: TObject);
begin
      //

      if not uFuncoes.Empty(edtCDCLIE.Text) then
       begin
            btVisualizar.Enabled := false;
            Try
               VISUALIZACAO(edtCDCLIE.Text);
            Finally;
                btVisualizar.Enabled := True;
            End;
       End;
end;

end.

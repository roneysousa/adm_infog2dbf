unit uFrmLocRequerimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, FMTBcd, DB, SqlExpr,
  DBClient, Provider, DBCtrls, Mask, ToolEdit;

type
  TfrmLocReclamacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbGridDados: TDBGrid;
    btnOK: TBitBtn;
    dstConsulta: TSQLDataSet;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    cdsConsultaREQ_ID: TIntegerField;
    cdsConsultaREQ_DATA: TDateField;
    cdsConsultaREQ_HORA: TStringField;
    cdsConsultaREQ_CLIENTE: TStringField;
    cdsConsultaREQ_DEFEITO: TMemoField;
    cdsConsultaREQ_CDFUNC: TStringField;
    cdsConsultaREQ_NMCLIE: TStringField;
    Label4: TLabel;
    spLocCliente: TSpeedButton;
    edtData: TDateEdit;
    Label2: TLabel;
    btnConsultar: TBitBtn;
    edtCDCLIE: TEdit;
    lblNome: TLabel;
    edtDTFINA: TDateEdit;
    Label3: TLabel;
    Label1: TLabel;
    edtCDFUNC: TEdit;
    spLocTecnico: TSpeedButton;
    lblTecnico: TLabel;
    procedure dbGridDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtDefeitoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDefeitoKeyPress(Sender: TObject; var Key: Char);
    procedure dbGridDadosDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure edtDataExit(Sender: TObject);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtDTFINAExit(Sender: TObject);
    procedure edtCDFUNCExit(Sender: TObject);
    procedure edtCDFUNCChange(Sender: TObject);
    procedure edtCDFUNCKeyPress(Sender: TObject; var Key: Char);
    procedure spLocTecnicoClick(Sender: TObject);
    procedure dbGridDadosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Procedure CONSULTA(M_DEFEITO : String);
    Procedure CONSULTA_TODOS;
  public
    { Public declarations }
  end;

var
  frmLocReclamacao: TfrmLocReclamacao;

implementation

uses udmADM2, udmADM, uFuncoes, uLocCliente, uFrmLocTecnico;

{$R *.dfm}

procedure TfrmLocReclamacao.CONSULTA(M_DEFEITO: String);
begin
     with cdsConsulta do
      begin
           Close;
           Params.ParamByName('pDEFEITO').AsString := M_DEFEITO + '%';
           Open;
      End;
end;

procedure TfrmLocReclamacao.dbGridDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
    R : TRect;
begin
    R:=Rect;
    Dec(R.Bottom,2);
    if Column.Field = cdsConsulta.FieldByName('REQ_DEFEITO') then
     begin
          if not (gdSelected in State) then
             dbGridDados.Canvas.FillRect(Rect);
          dbGridDados.Canvas.TextRect(R,R.Left,R.Top,
          cdsConsulta.FieldByName('REQ_DEFEITO').AsString);
     end;
end;

procedure TfrmLocReclamacao.edtDefeitoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If (cdsConsulta.Active) and not(cdsConsulta.IsEmpty) Then
   Begin
     If (KEY = VK_LEFT) or (KEY = vk_Up)  Then
        cdsConsulta.Prior;
     If (KEY = VK_RIGHT) OR (KEY = vk_down) Then
        cdsConsulta.Next;
   End;
end;

procedure TfrmLocReclamacao.edtDefeitoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #27) Then
       begin
           Key := #0;
           Close;
       End;
end;

procedure TfrmLocReclamacao.dbGridDadosDblClick(Sender: TObject);
begin
     If not (cdsConsulta.IsEmpty)
     and (cdsConsulta.RecordCount > 0) Then
        btnOK.Click;
end;

procedure TfrmLocReclamacao.CONSULTA_TODOS;
begin
     with cdsConsulta do
      begin
           Close;
           Open;
      End;
end;

procedure TfrmLocReclamacao.FormShow(Sender: TObject);
begin
     CONSULTA_TODOS;
     //
     //btnConsultar.Enabled := False;
     //
     edtData.Date   := Date();
     edtDTFINA.Date := Date();
     //
     lblNome.Caption    := '';
     lblTecnico.Caption := '';
end;

procedure TfrmLocReclamacao.btnConsultarClick(Sender: TObject);
begin
      With cdsConsulta do
        begin
             DisableControls;
             Active := False;
             CommandText := 'Select R.REQ_ID, R.REQ_DATA, R.REQ_HORA, R.REQ_CLIENTE, R.REQ_DEFEITO, R.REQ_CDFUNC, R.REQ_SITUACAO from REQUERIMENTOS R ';
             CommandText := CommandText + ' Where (R.REQ_SITUACAO = '+QuotedStr('A')+') ';
             If not uFuncoes.Empty(edtCDCLIE.Text) Then
                 CommandText := CommandText + ' and (R.REQ_CLIENTE = '+QuotedStr(edtCDCLIE.Text)+') ';
             If not uFuncoes.Empty(edtCDFUNC.Text) Then
                 CommandText := CommandText + ' and (R.REQ_CDFUNC = '+QuotedStr(edtCDFUNC.Text)+') ';
             If (edtData.Text <> '  /  /    ') and (edtDTFINA.Text <> '  /  /    ') Then
                 CommandText := CommandText + ' and (R.REQ_DATA >= :pDATA) and (R.REQ_DATA <= :pDTFINA) ';
             CommandText := CommandText + ' Order by R.REQ_DATA, R.REQ_HORA ';
             If (edtData.Text <> '  /  /    ') and (edtDTFINA.Text <> '  /  /    ') Then
             begin
                  Params.ParamByName('pDATA').AsDate   := edtData.Date;
                  Params.ParamByName('pDTFINA').AsDate := edtDTFINA.Date;
             End;
             Active := true;
             EnableControls;
        End;
end;

procedure TfrmLocReclamacao.spLocClienteClick(Sender: TObject);
Var
    W_CDCLIE : String;
begin
  edtCDCLIE.Clear;
  edtCDCLIE.SetFocus;
  //
  Try
      Application.CreateForm(TfrmLocCliente, frmLocCliente);
      frmLocCliente.ShowModal;
  Finally
      W_CDCLIE := frmLocCliente.qryConsulta.FieldByName('CLI_CDCLIE').AsString;
      frmLocCliente.Free;
      If not uFuncoes.Empty(W_CDCLIE) Then
      Begin
          edtCDCLIE.Text := W_CDCLIE;
          edtData.SetFocus;
      End
      Else
          edtCDCLIE.SetFocus;
  End;
end;

procedure TfrmLocReclamacao.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.Text) Then
          lblNome.Caption := ''
     Else
          btnConsultar.Enabled := true;
end;

procedure TfrmLocReclamacao.edtDataExit(Sender: TObject);
begin
     If (edtData.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtData.Text);
            edtData.Date := StrtoDate(edtData.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inválida!');
             edtData.Date := Date();
             edtData.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmLocReclamacao.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
      begin
          key:=#0;
          spLocClienteClick(Sender);
      End;
end;

procedure TfrmLocReclamacao.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
        begin
             If not uFuncoes.LOCALIZAR_CLIENTE(uFuncoes.StrZero(edtCDCLIE.Text,7)) Then
                 Begin
                      Application.MessageBox(PChar('Cliente não cadastro!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      edtCDCLIE.Clear;
                      edtCDCLIE.SetFocus;
                      lblNome.Caption := '';
                      Exit;
                 End;
             //
             edtCDCLIE.Text  := uFuncoes.StrZero(edtCDCLIE.Text,7);
             lblNome.Caption := dmADM.qryLocClientes.FieldByName('CLI_NMCLIE').AsString;
        End;
end;

procedure TfrmLocReclamacao.edtDTFINAExit(Sender: TObject);
begin
     If (edtDTFINA.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(edtDTFINA.Text);
            If (edtDTFINA.Date < edtData.Date) Then
                edtDTFINA.SetFocus;
            //
            edtDTFINA.Date := StrtoDate(edtDTFINA.Text);
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

procedure TfrmLocReclamacao.edtCDFUNCExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDFUNC.Text) Then
        begin
             If not uFuncoes.LOCALIZAR_FUNCIONARIO(uFuncoes.StrZero(edtCDFUNC.Text,5)) Then
                 Begin
                      Application.MessageBox(PChar('Técnico não cadastro!!!'),
                         'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                      edtCDFUNC.Clear;
                      edtCDFUNC.SetFocus;
                      lblTecnico.Caption := '';
                      Exit;
                 End;
             //
             edtCDFUNC.Text     := uFuncoes.StrZero(edtCDFUNC.Text,5);
             lblTecnico.Caption := dmADM.qryConsulta.FieldByName('FUN_NMFUNC').AsString;
        End;
end;

procedure TfrmLocReclamacao.edtCDFUNCChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDFUNC.Text) Then
          lblTecnico.Caption := '';
end;

procedure TfrmLocReclamacao.edtCDFUNCKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
    //
    If (key = #13) and uFuncoes.Empty(edtCDFUNC.Text) Then
      begin
          key:=#0;
          spLocTecnicoClick(Sender);
      End;
end;

procedure TfrmLocReclamacao.spLocTecnicoClick(Sender: TObject);
Var
    M_CDFUNC : String;
begin
  edtCDFUNC.Clear;
  edtCDFUNC.SetFocus;
  //
  Try
      Application.CreateForm(TfrmLocTecnico, frmLocTecnico);
      frmLocTecnico.ShowModal;
  Finally
      M_CDFUNC := frmLocTecnico.qryConsulta.FieldByName('FUN_CDFUNC').AsString;
      frmLocTecnico.Free;
      If not uFuncoes.Empty(M_CDFUNC) Then
      Begin
          edtCDFUNC.Text := M_CDFUNC;
          edtData.SetFocus;
      End
      Else
          edtCDFUNC.SetFocus;
  End;
end;

procedure TfrmLocReclamacao.dbGridDadosKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not (cdsConsulta.IsEmpty) Then
     begin
         Key := #0;
         dbGridDadosDblClick(Sender);
     End;
end;

end.

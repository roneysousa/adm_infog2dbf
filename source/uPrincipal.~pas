// Sistema : InfoADM
// Empresa : InfoG2 Sistemas
// Administração de Controle Administrativo
// PROGRAMADOR : Roney Erdemann
// Date : 21/02/2005
// Hora : 14:30

unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin,typinfo,ImgList, StdCtrls, 
  ExtCtrls, RXShell, Buttons, ActnList;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuRelatorio: TMenuItem;
    mnuSobre: TMenuItem;
    StatusBar1: TStatusBar;
    barraFerram: TToolBar;
    mnuClienteItem: TMenuItem;
    mnuProdutosItem: TMenuItem;
    mnuNotasFiscaisItem: TMenuItem;
    N1: TMenuItem;
    mnuSair: TMenuItem;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    mnuJanela: TMenuItem;
    mnuCascataItem: TMenuItem;
    mnuLadoaLadoItem: TMenuItem;
    mnuMinimizarTodasItem: TMenuItem;
    mnuFecharTodasItem: TMenuItem;
    mnuNavegacao: TMenuItem;
    mnuPrimeiroItem: TMenuItem;
    mnuAnteriorItem: TMenuItem;
    mnuProximoItem: TMenuItem;
    mnuUltimo: TMenuItem;
    N2: TMenuItem;
    mnuAdicionarItem: TMenuItem;
    mnuEditarItem: TMenuItem;
    mnuExcluirItem: TMenuItem;
    N3: TMenuItem;
    mnuGravarItem: TMenuItem;
    mnuCancelarItem: TMenuItem;
    N4: TMenuItem;
    mnuLocalizarItem: TMenuItem;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    RxTrayIcon1: TRxTrayIcon;
    mnuFornecedoresItem: TMenuItem;
    mnuProdutosClientesItem: TMenuItem;
    mnuFuncionariosItem: TMenuItem;
    mnuVendedoresItem: TMenuItem;
    mnuContatosItem: TMenuItem;
    mnuRelFinanceiroItem: TMenuItem;
    mnuRelFinReciboItem: TMenuItem;
    mnuRelCadastroItem: TMenuItem;
    mnuClientescomContratoItem: TMenuItem;
    mnuRelClientesItem: TMenuItem;
    mnuClienteporRotaItem: TMenuItem;
    FichadeInstalao1: TMenuItem;
    RegistrodeAtendimento1: TMenuItem;
    mnuCobrancaSubItem: TMenuItem;
    mnuMovimento: TMenuItem;
    mnuOrdemdeServicoItem: TMenuItem;
    mnuCedenteItem: TMenuItem;
    mnuEnvelopeBoletoItem: TMenuItem;
    DeclaraesPAF1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ToolButton2: TToolButton;
    SpeedButton4: TSpeedButton;
    ActionList1: TActionList;
    actFechar: TAction;
    actRecibo: TAction;
    actCobranca: TAction;
    actDeclaracaoPAF: TAction;
    procedure mnuSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure mnuCascataItemClick(Sender: TObject);
    procedure mnuLadoaLadoItemClick(Sender: TObject);
    procedure mnuMinimizarTodasItemClick(Sender: TObject);
    procedure mnuFecharTodasItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuSobreClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mnuMovNaturezaSubItemClick(Sender: TObject);
    procedure mnuMovCaixaModaSubItemClick(Sender: TObject);
    procedure mnuClientescomContratoItemClick(Sender: TObject);
    procedure mnuRelClientesItemClick(Sender: TObject);
    procedure mnuClienteporRotaItemClick(Sender: TObject);
    procedure FichadeInstalao1Click(Sender: TObject);
    procedure RegistrodeAtendimento1Click(Sender: TObject);
    procedure mnuOrdemdeServicoItemClick(Sender: TObject);
    procedure mnuCedenteItemClick(Sender: TObject);
    procedure mnuEnvelopeBoletoItemClick(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actReciboExecute(Sender: TObject);
    procedure actCobrancaExecute(Sender: TObject);
    procedure actDeclaracaoPAFExecute(Sender: TObject);
  private
    function DataExtenso(Data:TDateTime): String;
    procedure DisplayHint(Sender: TObject);
    Procedure Autenticar;
    { Private declarations }
  public
    { Public declarations }
    Function ExisteForm(pForm:TForm):boolean;
    Function PasswordInputBox(const ACaption, APrompt:string): string;
    Function Acesso(M_CDACES, M_NMFORM: String): Boolean;
    Procedure ATUALIZAR_ACESSOS;
  end;

Const
    M_USERMASTER = 'ADMIN';
    M_SNMASTER   = 'ADMIN';
    M_AUTEN      = 'SuperSonic';

var
  JanelaAtiva:String;
  M_CDUSUA,M_NMUSUA, M_NMEMPR : String;
  frmPrincipal: TfrmPrincipal;

implementation

uses uFrmReciboCliente, uFrmRelClientesContrato, uFrmRelClientes,
  uFrmRelClienteBairro, uFrmFichaClientes, uFrmCobranca, uFrmOrdemServico,
  uFrmCadCedentes, uFrmEnvelopeBoleto, uFrmDeclaracaoPAF;

//uses udmInfoADM;

const
ScreenWidth: LongInt  = 1024; {I designed my form in 800x600 mode.}
ScreenHeight: LongInt = 768;


{$R *.dfm}

procedure TfrmPrincipal.mnuSairClick(Sender: TObject);
begin
     If Application.MessageBox('Sair do Sistema?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          Application.Terminate;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  If Application.MessageBox('Sair do Sistema?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
        Canclose:=False;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
     ATUALIZAR_ACESSOS;
     //
     mnuNavegacao.Enabled :=  False;
     // Barra de status
     StatusBar1.Panels[3].Text := M_CDUSUA + ' - '+ M_NMUSUA;
     //DataExtenso(Date);
     StatusBar1.Panels[0].Text := ExtractFilePath( Application.ExeName );
end;

function TfrmPrincipal.DataExtenso(Data: TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terça-feira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result := DiaDaSemana[NoDia] + ', ' +
  IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
end;

function TfrmPrincipal.ExisteForm(pForm: TForm): boolean;
Var
    I:integer;
begin
    ExisteForm := False;
    For I:= 0 to Screen.FormCount -1 do
        If Screen.Forms[I] = pForm Then
        begin
            ExisteForm := True;
            Break;
        End;
end;

procedure TfrmPrincipal.mnuCascataItemClick(Sender: TObject);
begin
      //Coloca todas as janelas abertas em cascata.
       Cascade;
end;

procedure TfrmPrincipal.mnuLadoaLadoItemClick(Sender: TObject);
begin
      //Coloca todas as janelas abertas em lado a lado.
        Tile;
end;

procedure TfrmPrincipal.mnuMinimizarTodasItemClick(Sender: TObject);
//minimizar todas as janelas abertas.
Var
   I:integer;
begin
   For I:=MdiChildCount-1 downto 0 do
        MdiChildren[I].WindowState:=wsMinimized;
end;

procedure TfrmPrincipal.mnuFecharTodasItemClick(Sender: TObject);
//Fechar todas as janelas abertas.
var
  I: Integer;
begin
  with frmPrincipal do
    for I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close;
end;

procedure TfrmPrincipal.DisplayHint(Sender: TObject);
begin
     StatusBar1.Panels[1].Text := Application.Hint;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     Application.OnHint := DisplayHint;
     //
     Image1.Left := (FrmPrincipal.Width Div 2) - (Image1.Width Div 2);
     Image1.Top := (FrmPrincipal.Height Div 2) - (Image1.Height Div 2 + StatusBar1.Height);
end;

function TfrmPrincipal.PasswordInputBox(const ACaption,
  APrompt: string): string;
// InputBox para entrada de Senhas (com caracter *)
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  Result := '';
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
    DialogUnits.X := DialogUnits.X div 52;
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    ClientHeight := MulDiv(63, DialogUnits.Y, 8);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      AutoSize := True;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Caption := APrompt;
    end;
    Edit := TEdit.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := MulDiv(19, DialogUnits.Y, 8);
      Width := MulDiv(164, DialogUnits.X, 4);
      MaxLength := 255;
      PasswordChar := '*';
      SelectAll;
    end;
    ButtonTop := MulDiv(41, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'OK';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'Cancel';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    if ShowModal = mrOk then
    begin
      Value := Edit.Text;
      Result := Value;
    end;
  finally
    Form.Free;
    Form:=nil;
  end;
end;

procedure TfrmPrincipal.Autenticar;
Var
   Masters: textfile;
begin
     If PasswordInputBox('Registro','Digite senha de registro') = M_AUTEN then
     begin
             try
                AssignFile(Masters, 'c:\Windows\CFGNS2005.G2');
                if not FileExists('c:\Windows\CFGNS2005.G2') then Rewrite(Masters,'c:\Windows\CFGNS2005.G2');
                    Append(Masters);
                    WriteLn(Masters, 'Sistema legalmente registrado. '+DatetoStr(Date)+' - '+TimeToStr(Time));
                    WriteLn(Masters, 'Copyright NetCart por InfoG2 © - Tecnologia em Sistemas...');
                    WriteLn(Masters, '2005 - Todos os direitos reservados - OK.');
                    // Mensagem para o usuário
                    Application.MessageBox('Registro do sistema registrado com sucesso!!!',
                                  'ATENÇÃO', MB_OK+MB_ICONINFORMATION);
                    Exit;
             finally
                    CloseFile(Masters);
             End;
     End
     Else
     begin
           Application.MessageBox('Este sistema não está registrado!!!',
                                  'Senha incorreta...', MB_OK+MB_ICONSTOP);
           Application.Terminate;
     end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //
     Action := caFree;
end;


function TfrmPrincipal.Acesso(M_CDACES, M_NMFORM: String): Boolean;
begin

end;


procedure TfrmPrincipal.mnuSobreClick(Sender: TObject);
begin
{  Try
      Application.CreateForm(TfrmSobre, frmSobre);
      frmSobre.ShowModal;
  Finally
      frmSobre.Free;
  End;}
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
     //
     Image1.Left := (FrmPrincipal.Width Div 2) - (Image1.Width Div 2);
     Image1.Top := (FrmPrincipal.Height Div 2) - (Image1.Height Div 2 + StatusBar1.Height);
end;

procedure TfrmPrincipal.mnuMovNaturezaSubItemClick(Sender: TObject);
begin
     ShowMessage('Modulo não concluído...');
end;

procedure TfrmPrincipal.mnuMovCaixaModaSubItemClick(Sender: TObject);
begin
     ShowMessage('Modulo não concluído...');
end;

procedure TfrmPrincipal.ATUALIZAR_ACESSOS;
begin

end;

procedure TfrmPrincipal.mnuClientescomContratoItemClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmRelClientesContrato, frmRelClientesContrato);
      frmRelClientesContrato.ShowModal;
  Finally
      frmRelClientesContrato.Free;
  End;
end;

procedure TfrmPrincipal.mnuRelClientesItemClick(Sender: TObject);
begin
  Application.CreateForm(TfrmRelClientes, frmRelClientes);
  Try
      frmRelClientes.ShowModal;
  Finally
      frmRelClientes.Free;
  End;
end;

procedure TfrmPrincipal.mnuClienteporRotaItemClick(Sender: TObject);
begin
  Try
      Application.CreateForm(TfrmClienteBairro, frmClienteBairro);
      frmClienteBairro.ShowModal;
  Finally
      frmClienteBairro.Free;
  End;
end;

procedure TfrmPrincipal.FichadeInstalao1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmFichaClientes, frmFichaClientes);
  Try
      uFrmFichaClientes.M_NRFORM := 1;
      frmFichaClientes.ShowModal;
  Finally
      frmFichaClientes.Free;
  End;
end;

procedure TfrmPrincipal.RegistrodeAtendimento1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmFichaClientes, frmFichaClientes);
  Try
      uFrmFichaClientes.M_NRFORM := 2;
      frmFichaClientes.ShowModal;
  Finally
      frmFichaClientes.Free;
  End;
end;

procedure TfrmPrincipal.mnuOrdemdeServicoItemClick(Sender: TObject);
begin
     frmOrdemServico := TfrmOrdemServico.Create(Self);
     try
          frmOrdemServico.ShowModal;
     Finally
          frmOrdemServico.Free;
     End;
end;

procedure TfrmPrincipal.mnuCedenteItemClick(Sender: TObject);
begin
     frmCadCedentes := TfrmCadCedentes.Create(Self);
     try
          frmCadCedentes.ShowModal;
     Finally
          frmCadCedentes.Free;
     End;
end;

procedure TfrmPrincipal.mnuEnvelopeBoletoItemClick(Sender: TObject);
begin
      FrmEnvelopeBoleto := TFrmEnvelopeBoleto.create(Self);
      try
             FrmEnvelopeBoleto.ShowModal;
      Finally
             FrmEnvelopeBoleto.Free;
      End;
end;

procedure TfrmPrincipal.actFecharExecute(Sender: TObject);
begin
     If Application.MessageBox('Sair do Sistema?',
         'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          Application.Terminate;
end;

procedure TfrmPrincipal.actReciboExecute(Sender: TObject);
begin
   Try
        Application.CreateForm(TfrmRecibos, frmRecibos);
        frmRecibos.ShowModal;
   Finally
        frmRecibos.Free;
   End;
end;

procedure TfrmPrincipal.actCobrancaExecute(Sender: TObject);
begin
//Application.CreateForm(TfrmCobranca, frmCobranca);
  frmCobranca := TfrmCobranca.Create(Self);
  Try
      frmCobranca.ShowModal;
  Finally
      frmCobranca.Free;
  End;
end;

procedure TfrmPrincipal.actDeclaracaoPAFExecute(Sender: TObject);
begin
     FrmDeclaracoes := TFrmDeclaracoes.create(Self);
      try
             FrmDeclaracoes.ShowModal;
      Finally
             FrmDeclaracoes.Free;
      End;
end;

end.

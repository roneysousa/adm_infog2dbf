unit uFrmCadCedentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, DB, DBTables, ComCtrls, Grids, DBGrids, Buttons,
  StdCtrls, ExtCtrls, DBCtrls, Mask, ExtDlgs;

type
  TfrmCadCedentes = class(TfrmCadastro)
    Label2: TLabel;
    dbeNome: TDBEdit;
    rbnTipo: TDBRadioGroup;
    Label3: TLabel;
    dbeCPFCGC: TDBEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    dbeNMBanco: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    imgLogo: TDBImage;
    GroupBox2: TGroupBox;
    OpenPictureDialog1: TOpenPictureDialog;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    cmbUFCLIE: TDBComboBox;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure imgLogoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAdicionarClick(Sender: TObject);
    procedure dbeCPFCGCEnter(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure dbeCPFCGCExit(Sender: TObject);
    procedure DBEdit15KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit10KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCedentes: TfrmCadCedentes;

implementation

uses udmADM, uFuncoes;

{$R *.dfm}

procedure TfrmCadCedentes.imgLogoClick(Sender: TObject);
begin
  inherited;
  If (dsCadastro.State in [dsInsert, dsEdit]) Then
  Begin
     Try
          If (OpenPictureDialog1.Execute) Then
             imgLogo.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar abrir imagem!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
  End;
end;

procedure TfrmCadCedentes.FormShow(Sender: TObject);
begin
  inherited;
     dmADM.tbCedentes.Open;
     dmADM.tbCedentes.First;
     //
     if (dmADM.tbCedentes.IsEmpty) Then
        BtAdicionarClick(Sender);
end;

procedure TfrmCadCedentes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     dmADM.tbCedentes.Close;
end;

procedure TfrmCadCedentes.BtAdicionarClick(Sender: TObject);
begin
  inherited;
     if (dsCadastro.DataSet.State in [dsBrowse]) Then
      begin
          With dsCadastro.DataSet do
            begin
                 Append;
                 FieldByName('CED_CODIGO').AsInteger   :=
                      dmADM.tbCedentes.RecordCount + 1;
            End;
            //
            dbeNome.SetFocus;
      End;
end;

procedure TfrmCadCedentes.dbeCPFCGCEnter(Sender: TObject);
begin
  inherited;
    if not (dsCadastro.DataSet.IsEmpty) Then
      If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
      begin
        If (rbnTipo.ItemIndex = -1) Then
        begin
            rbnTipo.SetFocus;
            Exit;
        End;
        //
        If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
            If (rbnTipo.ItemIndex = 0) Then
                dsCadastro.DataSet.FieldByName('CED_NRINSCRICAO').EditMask := '999.999.999-99;0;_'
            Else
                dsCadastro.DataSet.FieldByName('CED_NRINSCRICAO').EditMask := '99.999.999/9999-99;0;_';
      End;
end;

procedure TfrmCadCedentes.BtEditarClick(Sender: TObject);
begin
  inherited;
    if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
      Begin
           dsCadastro.DataSet.Edit;
           dbeNome.setfocus;
      End;
end;

procedure TfrmCadCedentes.BtExcluirClick(Sender: TObject);
begin
  inherited;
   if  not (dsCadastro.DataSet.IsEmpty) and (dsCadastro.DataSet.RecordCount > 0) then
   begin
       //
       If Application.MessageBox('Deseja excluir esta cedente?' , 'Exclusão de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
            dmADM.tbCedentes.Delete
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadCedentes.BtGravarClick(Sender: TObject);
begin
     If uFuncoes.Empty(dbeNome.Text) Then
       Begin
           Application.MessageBox('Digite o nome do cedente.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNome.SetFocus;
           Exit;
       End;
      //
      if (rbnTipo.ItemIndex = -1) Then
       begin
            rbnTipo.SetFocus;
            Application.MessageBox('Selecione o tipo de pessoa.','ATENÇÃO',
                MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             Exit;
       End;
      //
      try
          //
          If (dsCadastro.DataSet.State in [dsInsert]) Then
            begin
                 dmADM.tbCedentes.FieldByName('CED_CODIGO').AsInteger   :=
                      dmADM.tbCedentes.RecordCount + 1;
            End;
          //
          dmADM.tbCedentes.Post;
          //
          Application.MessageBox(PChar('Registro gravado com sucesso.'),
              'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
     Except
          on Exc:Exception do
            begin
               Application.MessageBox(PChar('Erro ao tentar gravar registro.'+#13+Exc.Message),
                 'Erro', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
               BtCancelarClick(Sender);
               //
            End;
     End;
  inherited;
end;

procedure TfrmCadCedentes.BtCancelarClick(Sender: TObject);
begin
     dmADM.tbCedentes.Cancel;
  inherited;

end;

procedure TfrmCadCedentes.dbeCPFCGCExit(Sender: TObject);
begin
  inherited;
      If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) and
         not uFuncoes.Empty(dbeCPFCGC.Text) Then
        begin
           // Verificar validade do cnpj
           If not uFuncoes.CGC(dbeCPFCGC.Text) Then
            begin
                Application.MessageBox(PChar('CNPJ inválido.'),
                    'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                dbeCPFCGC.SetFocus;
                Exit;
            End;
        End;
end;

procedure TfrmCadCedentes.DBEdit15KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmCadCedentes.DBEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmCadCedentes.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmCadCedentes.DBEdit8KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmCadCedentes.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmCadCedentes.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmCadCedentes.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TfrmCadCedentes.DBEdit10KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

end.

unit uFrmConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, Mask;

type
  TFrmConfig = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    dbeCNPJ: TDBEdit;
    dsCadastro: TDataSource;
    Label2: TLabel;
    dbeRazao: TDBEdit;
    Label3: TLabel;
    dbeFantasia: TDBEdit;
    Label4: TLabel;
    txtEndereco: TDBMemo;
    Label5: TLabel;
    dbeMsg1: TDBEdit;
    Label6: TLabel;
    dbeMsg2: TDBEdit;
    Label7: TLabel;
    DBImage1: TDBImage;
    Label8: TLabel;
    dbeCarteira: TDBEdit;
    Label9: TLabel;
    dbeCodCedente: TDBEdit;
    dbeDigCedente: TDBEdit;
    Label10: TLabel;
    dbeBanco: TDBEdit;
    Label11: TLabel;
    dbeAgencia: TDBEdit;
    dbeDigAgencia: TDBEdit;
    Label13: TLabel;
    dbeConvenio: TDBEdit;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeRazaoExit(Sender: TObject);
    procedure dbeFantasiaExit(Sender: TObject);
    procedure txtEnderecoExit(Sender: TObject);
    procedure dbeMsg1Exit(Sender: TObject);
    procedure dbeMsg2Exit(Sender: TObject);
    procedure dbeCarteiraKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodCedenteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDigCedenteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeConvenioKeyPress(Sender: TObject; var Key: Char);
    procedure dbeBancoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDigAgenciaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation

uses uFuncoes, udmADM;

{$R *.dfm}

procedure TFrmConfig.BitBtn2Click(Sender: TObject);
begin
    dmADM.cdsConfig.Cancel;
end;

procedure TFrmConfig.BitBtn1Click(Sender: TObject);
begin
   If (dmADM.cdsConfig.State in [dsInsert, dsEdit]) Then
   begin
     dmADM.cdsConfig.Post;
     dmADM.cdsConfig.SaveToFile('Config.xml');
     dmADM.RefreshCDS(dmADM.cdsConfig);
   End;
end;

procedure TFrmConfig.FormShow(Sender: TObject);
begin
    If (dmADM.cdsConfig.IsEmpty) Then
    begin
        dmADM.cdsConfig.Append;
        dmADM.cdsConfigID.AsInteger := 1;
    End;
    //
    dbeCNPJ.SetFocus;
end;

procedure TFrmConfig.dbeRazaoExit(Sender: TObject);
begin
   { if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
       if not uFuncoes.Empty(dbeRazao.Text) then
            dbeRazao.Text := uFuncoes.AnsiToAscii(dbeRazao.Text);}
end;

procedure TFrmConfig.dbeFantasiaExit(Sender: TObject);
begin
    if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
       if not uFuncoes.Empty(dbeFantasia.Text) then
            dbeFantasia.Text := uFuncoes.AnsiToAscii(dbeFantasia.Text);
end;

procedure TFrmConfig.txtEnderecoExit(Sender: TObject);
begin
    if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
       if not uFuncoes.Empty(txtEndereco.Text) then
            txtEndereco.Text := uFuncoes.AnsiToAscii(txtEndereco.Text);
end;

procedure TFrmConfig.dbeMsg1Exit(Sender: TObject);
begin
    if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
       if not uFuncoes.Empty(dbeMsg1.Text) then
            dbeMsg1.Text := uFuncoes.AnsiToAscii(dbeMsg1.Text);
end;

procedure TFrmConfig.dbeMsg2Exit(Sender: TObject);
begin
    if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
       if not uFuncoes.Empty(dbeMsg2.Text) then
            dbeMsg2.Text := uFuncoes.AnsiToAscii(dbeMsg2.Text);
end;

procedure TFrmConfig.dbeCarteiraKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
       key:=#0;
end;

procedure TFrmConfig.dbeCodCedenteKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TFrmConfig.dbeDigCedenteKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TFrmConfig.dbeConvenioKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TFrmConfig.dbeBancoKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;

end;

procedure TFrmConfig.dbeAgenciaKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;

end;

procedure TFrmConfig.dbeDigAgenciaKeyPress(Sender: TObject; var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

End.

unit uFrmConfigEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, DB, Mask, Buttons, DBClient;

type
  TFrmConfigEmail = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsDados: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfigEmail: TFrmConfigEmail;

implementation

uses udmADM;

{$R *.dfm}

procedure TFrmConfigEmail.BitBtn1Click(Sender: TObject);
begin
      if (dsDados.DataSet.State = dsEdit) Then
       begin
         dmADM.cdsConfigEmail.post;
         dmADM.cdsConfigEmail.SaveToFile('ConfigEmail.xml', dfXML);
         // dmADM.cdsConfigEmail. LoadFromFile('ConfigEmail.xml');
       End;
end;

procedure TFrmConfigEmail.BitBtn2Click(Sender: TObject);
begin
      if (dsDados.DataSet.State = dsEdit) Then
         dmADM.cdsConfigEmail.Cancel;
end;

end.

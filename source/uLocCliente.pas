unit uLocCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, DBTables;

type
  TfrmLocCliente = class(TForm)
    pnlTopo: TPanel;
    pnlDados: TPanel;
    edtNMCLIE: TEdit;
    Label1: TLabel;
    dbGridDados: TDBGrid;
    qryConsulta: TQuery;
    dsConsulta: TDataSource;
    qryConsultaCLI_CDCLIE: TStringField;
    qryConsultaCLI_NMCLIE: TStringField;
    procedure edtNMCLIEChange(Sender: TObject);
    procedure edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridDadosDblClick(Sender: TObject);
    procedure edtNMCLIEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocCliente: TfrmLocCliente;

implementation

uses uFuncoes, uFrmReciboCliente;

{$R *.dfm}

procedure TfrmLocCliente.edtNMCLIEChange(Sender: TObject);
begin
   If not uFuncoes.Empty(edtNMCLIE.Text) Then
   Begin
        with qryConsulta do
        begin
            //
            Close;
            Params[0].AsString := edtNMCLIE.Text + '%';
            Open;
            //
        End;
   End
   Else
       qryConsulta.Close;
end;

procedure TfrmLocCliente.edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
begin
     If (Key = #13)
       and not uFuncoes.Empty(edtNMCLIE.Text) Then
     Begin
          Key := #0;
          uFrmReciboCliente.W_CDCLIE := qryConsulta.FieldByName('CLI_CDCLIE').AsString; 
          Close;
     End;
end;

procedure TfrmLocCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     //qryConsulta.Close;
     //
     Action := caFree;
end;

procedure TfrmLocCliente.dbGridDadosDblClick(Sender: TObject);
begin
     If (qryConsulta.Active)
     and (qryConsulta.RecordCount > 0 ) Then
        Close;
end;

procedure TfrmLocCliente.edtNMCLIEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If (qryConsulta.Active) and (qryConsulta.RecordCount > 0) Then
   Begin
     If (KEY = VK_LEFT) or (KEY = vk_Up)  Then
        qryConsulta.Prior;
     If (KEY = VK_RIGHT) OR (KEY = vk_down) Then
        qryConsulta.Next;
   End;
end;

end.

unit uFrmLocalizarBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBTables;

type
  TfrmLocalizarBase = class(TForm)
    pnlTopo: TPanel;
    Label1: TLabel;
    edtConsulta: TEdit;
    pnlDados: TPanel;
    dbGridDados: TDBGrid;
    qryConsulta: TQuery;
    dsConsulta: TDataSource;
    procedure dbGridDadosDblClick(Sender: TObject);
    procedure edtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizarBase: TfrmLocalizarBase;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmLocalizarBase.dbGridDadosDblClick(Sender: TObject);
begin
     If (qryConsulta.Active)
     and (qryConsulta.RecordCount > 0 ) Then
        Close;
end;

procedure TfrmLocalizarBase.edtConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If (qryConsulta.Active) and (qryConsulta.RecordCount > 0) Then
   Begin
     If (KEY = VK_LEFT) or (KEY = vk_Up)  Then
        qryConsulta.Prior;
     If (KEY = VK_RIGHT) OR (KEY = vk_down) Then
        qryConsulta.Next;
   End;
end;

procedure TfrmLocalizarBase.edtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (Key = #13)
       and not uFuncoes.Empty(edtConsulta.Text) Then
     Begin
          Key := #0;
          Close;
     End;
end;

end.

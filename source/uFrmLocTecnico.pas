unit uFrmLocTecnico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmLocalizarBase, DB, DBTables, Grids, DBGrids, StdCtrls,
  ExtCtrls;

type
  TfrmLocTecnico = class(TfrmLocalizarBase)
    procedure edtConsultaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocTecnico: TfrmLocTecnico;

implementation

uses uFuncoes;

{$R *.dfm}

procedure TfrmLocTecnico.edtConsultaChange(Sender: TObject);
begin
  inherited;
   If not uFuncoes.Empty(edtConsulta.Text) Then
   Begin
        with qryConsulta do
        begin
            //
            Close;
            Params[0].AsString := edtConsulta.Text + '%';
            Open;
            //
        End;
   End
   Else
       qryConsulta.Close;

end;

end.

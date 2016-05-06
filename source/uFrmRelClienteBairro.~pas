unit uFrmRelClienteBairro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBTables, Grids, DBGrids, ppDB,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls,
  ppPrnabl, ppBands, ppCache;

type
  TfrmClienteBairro = class(TForm)
    pnlTopo: TPanel;
    pnlDados: TPanel;
    pnlInferior: TPanel;
    dbGridDados: TDBGrid;
    qryClientes: TQuery;
    dsClientes: TDataSource;
    qryClientesCLI_CDCLIE: TStringField;
    qryClientesCLI_NMCLIE: TStringField;
    qryClientesCLI_BACLIE: TStringField;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    Label1: TLabel;
    edtROTA: TEdit;
    ppReport1: TppReport;
    ppBDEPipeline1: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtROTAKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimirClick(Sender: TObject);
  private
    Procedure CLIENTES;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteBairro: TfrmClienteBairro;

implementation

{$R *.dfm}

procedure TfrmClienteBairro.btFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmClienteBairro.CLIENTES;
begin
     With qryClientes do
        begin
             Close;
             Prepare;
             Open;
        End;
end;

procedure TfrmClienteBairro.FormShow(Sender: TObject);
begin
     CLIENTES;
end;

procedure TfrmClienteBairro.edtROTAKeyPress(Sender: TObject;
  var Key: Char);
begin
      If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmClienteBairro.btImprimirClick(Sender: TObject);
begin
     If (qryClientes.Active)
      and (qryClientes.RecordCount > 0) Then
        begin
             With ppReport1 do
                PrintReport; 
        End;
end;

end.

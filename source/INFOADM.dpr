program INFOADM;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uFrmReciboCliente in 'uFrmReciboCliente.pas' {frmRecibos},
  uFuncoes in 'uFuncoes.pas',
  udmADM in 'udmADM.pas' {dmADM: TDataModule},
  uFrmRelClientesContrato in 'uFrmRelClientesContrato.pas' {frmRelClientesContrato},
  uFrmRelClientes in 'uFrmRelClientes.pas' {frmRelClientes},
  uFrmRelClienteBairro in 'uFrmRelClienteBairro.pas' {frmClienteBairro},
  uFrmFichaClientes in 'uFrmFichaClientes.pas' {frmFichaClientes},
  uLocCliente in 'uLocCliente.pas' {frmLocCliente},
  uFrmCobranca in 'uFrmCobranca.pas' {frmCobranca},
  udmADM2 in 'udmADM2.pas' {dmADM2: TDataModule},
  uFrmOrdemServico in 'uFrmOrdemServico.pas' {frmOrdemServico},
  uFrmLocRequerimento in 'uFrmLocRequerimento.pas' {frmLocReclamacao},
  uFrmLocalizarBase in 'uFrmLocalizarBase.pas' {frmLocalizarBase},
  uFrmLocTecnico in 'uFrmLocTecnico.pas' {frmLocTecnico},
  uFrmCadastro in 'uFrmCadastro.pas' {frmCadastro},
  uFrmCadCedentes in 'uFrmCadCedentes.pas' {frmCadCedentes},
  uFrmEnvelopeBoleto in 'uFrmEnvelopeBoleto.pas' {FrmEnvelopeBoleto},
  uCodBarras in 'uCodBarras.pas',
  uFrmConfig in 'uFrmConfig.pas' {FrmConfig},
  uFrmDeclaracaoPAF in 'uFrmDeclaracaoPAF.pas' {FrmDeclaracoes},
  uFrmSendEmail in 'uFrmSendEmail.pas' {FrmSendMail},
  uFrmConfigEmail in 'uFrmConfigEmail.pas' {FrmConfigEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmADM, dmADM);
  Application.CreateForm(TdmADM2, dmADM2);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

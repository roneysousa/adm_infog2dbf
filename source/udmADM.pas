unit udmADM;

interface

uses
  SysUtils, Classes, DB, DBTables, forms, Windows, DBClient, gbCobranca,
  Dialogs, MidasLib, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave,
  RpRender, RpRenderPDF;

type
  TTypeLocalizar = (fsInteger, fsString);
  TdmADM = class(TDataModule)
    qryLocClientes: TQuery;
    dsLocCliente: TDataSource;
    qryContratos: TQuery;
    qryContratosCON_NRCONT: TStringField;
    qryContratosCON_CDCLIE: TStringField;
    qryContratosCON_NMCLIE: TStringField;
    qryContratosCON_DTCONT: TStringField;
    qryContratosCON_DTVENC: TStringField;
    qryContratosCON_DIAFAT: TStringField;
    qryContratosCON_VLCONT: TFloatField;
    qryContratosCON_FLSITU: TStringField;
    qryClientes: TQuery;
    qryClientesCLI_CDCLIE: TStringField;
    qryClientesCLI_NMCLIE: TStringField;
    qryClientesCLI_RASOCI: TStringField;
    qryClientesCLI_ENCLIE: TStringField;
    qryClientesCLI_NRFONE: TStringField;
    qryClientesCLI_NRCELU: TStringField;
    qryClientesCLI_NMCONT: TStringField;
    qryClientesCLI_CDSITU: TStringField;
    qryClientesCLI_CDRAMO: TStringField;
    qryClientesFONE: TStringField;
    qryClientesCELULAR: TStringField;
    qryRamo: TQuery;
    qryRamoRAM_CDRAMO: TStringField;
    qryRamoRAM_NMRAMO: TStringField;
    qrySituacao: TQuery;
    qrySituacaoSIT_CDSITU: TStringField;
    qrySituacaoSIT_NMSITU: TStringField;
    tbFuncionarios: TTable;
    tbFuncionariosFUN_CDFUNC: TStringField;
    tbFuncionariosFUN_NMFUNC: TStringField;
    tbClientes: TTable;
    tbClientesCLI_CDCLIE: TStringField;
    tbClientesCLI_NMCLIE: TStringField;
    tbClientesCLI_RASOCI: TStringField;
    qryConsulta: TQuery;
    tblTipoCobranca: TTable;
    tblTipoCobrancaTCO_CDCOBR: TStringField;
    tblTipoCobrancaTCO_NMCOBR: TStringField;
    qryLocTipo: TQuery;
    qryLocClientesCLI_CDCLIE: TStringField;
    qryLocClientesCLI_NMCLIE: TStringField;
    qryLocClientesCLI_RASOCI: TStringField;
    qryLocClientesCLI_ENCLIE: TStringField;
    qryLocClientesCLI_CEPCLI: TStringField;
    qryLocClientesCLI_BACLIE: TStringField;
    qryLocClientesCLI_CICLIE: TStringField;
    qryLocClientesCLI_UFCLIE: TStringField;
    qryLocClientesCLI_NRFONE: TStringField;
    qryLocClientesCLI_NRRAMA: TStringField;
    qryLocClientesCLI_NUMFAX: TStringField;
    qryLocClientesCLI_NRCELU: TStringField;
    qryLocClientesCLI_CPFCGC: TStringField;
    qryLocClientesCLI_INSEST: TStringField;
    qryLocClientesCLI_NMCONT: TStringField;
    qryLocClientesCLI_VLDEBI: TFloatField;
    qryLocClientesCLI_CDSITU: TStringField;
    qryLocClientesCLI_DTNASC: TStringField;
    gbCobranca1: TgbCobranca;
    gbTitulo1: TgbTitulo;
    SaveDialog1: TSaveDialog;
    tbCedentes: TTable;
    tbCedentesCED_CODIGO: TIntegerField;
    tbCedentesCED_NOME: TStringField;
    tbCedentesCED_CDCODIGO: TStringField;
    tbCedentesCED_DIGCEDENTE: TIntegerField;
    tbCedentesCED_CDBANCO: TStringField;
    tbCedentesCED_NMBANCO: TStringField;
    tbCedentesCED_AGENCIA: TStringField;
    tbCedentesCED_DIGAGE: TStringField;
    tbCedentesCED_NRCONTA: TStringField;
    tbCedentesCED_DIGCONTA: TStringField;
    tbCedentesCED_CARTEIRA: TStringField;
    tbCedentesCED_NOSSO_NUMERO: TIntegerField;
    tbCedentesCED_TPINSCRICAO: TStringField;
    tbCedentesCED_NRINSCRICAO: TStringField;
    tbCedentesCED_ENDERECO: TStringField;
    tbCedentesCED_NUMERO: TIntegerField;
    tbCedentesCED_COMPLEMENTO: TStringField;
    tbCedentesCED_BAIRRO: TStringField;
    tbCedentesCED_CIDADE: TStringField;
    tbCedentesCED_UF: TStringField;
    tbCedentesCED_NUMCEP: TStringField;
    tbCedentesCED_EMAIL: TStringField;
    tbCedentesCED_NRCONVENIO: TStringField;
    tbCedentesCED_ACEITE: TStringField;
    tbCedentesCED_TPBOLETO: TIntegerField;
    tbCedentesCED_LOGO_BANCO: TGraphicField;
    cdsListaClientes: TClientDataSet;
    cdsListaClientesCDS_CODCLI: TStringField;
    cdsListaClientesCDS_RAZAO: TStringField;
    cdsListaClientesCDS_FANTASIA: TStringField;
    cdsListaClientesCDS_CPF_CNPJ: TStringField;
    cdsListaClientesCDS_TPPESSOA: TStringField;
    cdsListaClientesCDS_ENDERECO: TStringField;
    cdsListaClientesCDS_NUMERO: TIntegerField;
    cdsListaClientesCDS_BAIRRO: TStringField;
    cdsListaClientesCDS_COMPLEMENTO: TStringField;
    cdsListaClientesCDS_CIDADE: TStringField;
    cdsListaClientesCDS_UF: TStringField;
    cdsListaClientesCDS_CEP: TStringField;
    tbConfig: TTable;
    tbConfigPAR_NMEMPR: TStringField;
    tbConfigPAR_ENEMPR: TStringField;
    tbConfigPAR_BAEMPR: TStringField;
    tbConfigPAR_CIEMPR: TStringField;
    tbConfigPAR_CEPEMP: TStringField;
    tbConfigPAR_UFEMPR: TStringField;
    tbConfigPAR_CGCEMP: TStringField;
    tbConfigPAR_INSEST: TStringField;
    tbConfigPAR_NRFONE: TStringField;
    tbConfigPAR_QTATRA: TSmallintField;
    tbConfigPAR_PEMULT: TFloatField;
    tbConfigPAR_PEJURO: TFloatField;
    tbConfigPAR_DIAJUR: TSmallintField;
    cds2Boletos: TClientDataSet;
    cds2BoletosCDS_SEQUENCIA: TIntegerField;
    cds2BoletosCDS_CLIENTE: TIntegerField;
    cds2BoletosCDS_NMCLIENTE: TStringField;
    cds2BoletosCDS_CPF: TStringField;
    cds2BoletosCDS_ENDERECO: TStringField;
    cds2BoletosCDS_CIDADE: TStringField;
    cds2BoletosCDS_BAIRRO: TStringField;
    cds2BoletosCDS_DESCRICAO: TMemoField;
    cds2BoletosCDS_DOCUMENTO: TStringField;
    cds2BoletosCDS_NOSSONUMERO: TStringField;
    cds2BoletosCDS_DTDOCU: TDateField;
    cds2BoletosCDS_DTPROCESSAMENTO: TDateField;
    cds2BoletosCDS_DTVENCIMENTO: TDateField;
    cds2BoletosCDS_CARTEIRA: TStringField;
    cds2BoletosCDS_VALOR: TFloatField;
    cds2BoletosCDS_CEP: TStringField;
    cds2BoletosCDS_BOXMESA: TStringField;
    cds2BoletosCDS_LINHA_DIGITAVEL: TStringField;
    cds2BoletosCDS_CODIGO_BARRAS: TStringField;
    cds2BoletosCDS_AGENCIA: TStringField;
    cds2BoletosCDS_DIAGEN: TStringField;
    cds2BoletosCDS_CDCEDENTE: TStringField;
    cds2BoletosCDS_DG_NNUMERO: TStringField;
    cds2BoletosCDS_NRITEM: TIntegerField;
    cds2BoletosCDS_TOTREG: TIntegerField;
    rv2Boletos: TRvProject;
    RvSystem3: TRvSystem;
    rvdst2Boletos: TRvDataSetConnection;
    RvBoleto: TRvProject;
    RvSystem1: TRvSystem;
    QryDebito: TQuery;
    QryDebitoDEB_NRCRED: TStringField;
    QryDebitoDEB_NRPARC: TStringField;
    QryDebitoDEB_QTPARC: TSmallintField;
    QryDebitoDEB_NRVEND: TStringField;
    QryDebitoDEB_NRCONT: TStringField;
    QryDebitoDEB_CDCLIE: TStringField;
    QryDebitoDEB_NMDESC: TStringField;
    QryDebitoDEB_NMSIST: TStringField;
    QryDebitoDEB_DTMOVI: TStringField;
    QryDebitoDEB_DTVENC: TStringField;
    QryDebitoDEB_DTCOBR: TStringField;
    QryDebitoDEB_DTPAGA: TStringField;
    QryDebitoDEB_PEJURO: TFloatField;
    QryDebitoDEB_VLJURO: TFloatField;
    QryDebitoDEB_VLDESC: TFloatField;
    QryDebitoDEB_VLPARC: TFloatField;
    QryDebitoDEB_VLPAGO: TFloatField;
    QryDebitoDEB_VLREST: TFloatField;
    QryDebitoDEB_FLSITU: TStringField;
    QryDebitoDEB_CDCOBR: TStringField;
    cdsConfig: TClientDataSet;
    cdsConfigID: TIntegerField;
    cdsConfigCNPJ: TStringField;
    cdsConfigRAZAO: TStringField;
    cdsConfigFANTASIA: TStringField;
    cdsConfigENDERECO: TMemoField;
    cdsConfigMENSAGEM1: TStringField;
    cdsConfigMENSAGEM2: TStringField;
    cdsConfigLOGO: TGraphicField;
    cdsConfigCARTEIRA: TStringField;
    cdsConfigCEDENTE: TStringField;
    cdsConfigCEDENTE_DIG: TStringField;
    cdsConfigAGENCIA: TIntegerField;
    cdsConfigAGENCIA_DIG: TStringField;
    cdsConfigCONVENIO: TStringField;
    cdsConfigCOD_BANCO: TStringField;
    cdsConfigINSTRUCOES_BOLETO: TMemoField;
    RvRenderPDF1: TRvRenderPDF;
    rvdsBoleto: TRvDataSetConnection;
    QryDebitoaDataVencimento: TDateField;
    qryLocClientesCLI_EMAIL1: TStringField;
    RvEnvBoleto: TRvProject;
    RvSystem2: TRvSystem;
    rvdListaClientes: TRvDataSetConnection;
    RvBoletoFrenteVerso: TRvProject;
    QryDebitoaDataCobranca: TDateField;
    QryDebitoDEB_VLPROM: TFloatField;
    qryLocClientesCLI_NUMERO: TStringField;
    procedure qryClientesCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QryDebitoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Function GetCodigoTipo(aNome : String) : String;
    Function SelecionaCliente(aCodigo : String): boolean;
    Function GerarArquivo(iCedente : Integer; aCDS : TClientDataSet): Boolean;
    Function AddClientenaLista(
            aCODCLI, aRAZAO , aFANTASIA, aCPF_CNPJ , aTPPESSOA , aENDERECO,
            aNUMERO, aBAIRRO, aCOMPLEMENTO, aCIDADE, aUF, aCEP : String ): Boolean;
    //
    procedure PrepararTitulo(idContaBancaria : integer);
    procedure CONFIGURA_BOLETO(idNumDocumento : Integer; M_FLSEGU : String);
    Function GerarBoleto(aCodCliente, aIdDebito, aNrParcela, aTipo, aMsg, aMsgMultaJuros : String) : Boolean;
    Function GerarBoletoComVerso(aCodCliente, aIdDebito, aNrParcela, aTipo, aMsg, aMsgMultaJuros, aPrimeiraImp : String) : Boolean;
    procedure SelecionarCliente(aCodCliente : String);
    Function AddBoletoCliente(iSEQUENCIA, iCLIENTE : Integer;
           aNMCLIENTE, aCPF, aENDERECO, aCIDADE, aBAIRRO,
           aDOCUMENTO, aNOSSONUMERO, aCARTEIRA, aCEP, aBOXMESA,
           aLINHA_DIGITAVEL, aCODIGO_BARRAS, aAGENCIA, aDIAGEN, aCDCEDENTE, aDG_NNUMERO : String;
           aDESCRICAO : TStrings; aDTDOCU, aDTPROCESSAMENTO, aDTVENCIMENTO : TDatetime; fVALOR: Double; aNrParcela, aNrFicha : String) : Boolean;
    Procedure FilterCDS(aCds : TClientDataSet; aType : TTypeLocalizar ; aBusca : String);
    procedure RefreshCDS(aDateSet : TClientDataSet);
    Procedure GetError(DataSet: TCustomClientDataSet;
         E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    Procedure AbrirConfiguracoesBoleto();
    Function GetNomeCliente(aCodCliente : String): String;
    procedure ImprimirVersoBoleto(aOpcao : String);
    //
    Procedure ExcluirArquivoLista();
    Procedure ApagarArquivoPDF();
    Procedure AddEmailLista(aEmail, aArquivo, aCodCliente, aNomeCliente : String);

    Function GetEmailCliente(aCodCliente : String):String;
  end;

var
  dmADM: TdmADM;
  M_CODIGOBARRAS, M_DIGITOCODIGO : String;
  aArquivoLogoRel : String;
  NomeDoLista, ListaNomeCliente : string;

implementation

uses uFuncoes, uCodBarras;

{$R *.dfm}

procedure TdmADM.qryClientesCalcFields(DataSet: TDataSet);
begin
     If not uFuncoes.Empty(qryClientes.FieldByName('CLI_NRFONE').AsString) Then
         qryClientes.FieldByName('FONE').AsString :=
                  uFuncoes.FormataFONE(qryClientes.FieldByName('CLI_NRFONE').AsString);
    If not uFuncoes.Empty(qryClientes.FieldByName('CLI_NRCELU').AsString) Then
         qryClientes.FieldByName('CELULAR').AsString :=
                  Copy(qryClientes.FieldByName('CLI_NRCELU').AsString,1,4)+'-'
                  +Copy(qryClientes.FieldByName('CLI_NRCELU').AsString,5,4);
end;

procedure TdmADM.DataModuleCreate(Sender: TObject);
begin
  try
      { se o alias n�o existir... }
      if not Session.IsAlias('ADM') then
      begin
          { Adiciona o alias }
          Session.AddStandardAlias('ADM', ExtractFilePath(ParamStr(0)), 'DBASE');
          { Salva o arquivo de configura��o do BDE }
          Session.SaveConfigFile;
      end;
      //
      NomeDoLista      := ExtractFilePath( Application.ExeName )+'listaemail.txt';
      ListaNomeCliente := ExtractFilePath( Application.ExeName )+'listaclientes.txt';
  Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar criar Alias!!!'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
           Application.Terminate;
        End;
  End;
end;

function TdmADM.GetCodigoTipo(aNome: String): String;
begin
     Result := '';
     With qryLocTipo do
      begin
           Close;
           ParamByName('pNOME').AsString := aNome;
           Open;
           //
           If not (IsEmpty) Then
             Result := FieldByName('TCO_CDCOBR').AsString;
           //
           Close;  
      End;
end;

function TdmADM.SelecionaCliente(aCodigo: String): boolean;
begin
     Result := false;
     With qryLocClientes do
      begin
           Close;
           ParamByName('pCDCLIE').AsString := aCodigo;
           Open;
           //
           if not (IsEmpty) Then
              Result := True;
      End;
end;

function TdmADM.GerarArquivo(iCedente : Integer; aCDS: TClientDataSet): Boolean;
{Objetivo: Gerar arquivo para banco contendo os t�tulos mostrados na tela}
Var
    M_ARQUIVO, M_ARQREM : TextFile;
    M_NMARQU, LINHA, M_NRCONV, M_DIGCED : String;
    M_QTREGI, M_VLTOTA, M_ARQGER, aDocumento : String;
    M_QTLINH : Integer;
    M_NRDOCU : Integer;
    W_VLTOTA : Double;
    M_DTATUA, M_DTVENC, M_NMCEDE, M_VLTITU : String;
    M_VLJURO, M_VLMORA, M_NRCNPJ : String;
begin
   //
   Result := false;
   M_QTREGI := '';
   M_VLTOTA := '';
   M_NRDOCU := 1;
   W_VLTOTA := 0;
   M_NRCNPJ := '07229866000118';
   //  99 / 99 / 9999
   M_DTATUA := Copy( DatetoStr(Date),1,2 )+ Copy( DatetoStr(Date),4,2 ) + Copy( DatetoStr(Date), 9,2 );
   //
   tbCedentes.Close;
   tbCedentes.Open;
   tbCedentes.Locate('CED_CODIGO', iCedente , []);
   //
   M_NRCONV := tbCedentesCED_NRCONVENIO.AsString;
   M_DIGCED := tbCedentesCED_DIGCEDENTE.AsString;
   M_NMCEDE := tbCedentesCED_NOME.AsString;
   //
   If Length(M_NMCEDE) > 30 Then
       M_NMCEDE := Copy(M_NMCEDE, 1, 30)
   Else
       M_NMCEDE := M_NMCEDE + uFuncoes.Replicate(' ', 30 - Length(M_NMCEDE));
   //
   {Dados da remessa}
   with gbCobranca1 do
   begin
      NumeroArquivo := 1;
      DataArquivo := Now;
      Titulos.Clear;
      //
      SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName) + '\Remessa';
      SaveDialog1.FileName := 'TES'+uFuncoes.StrZero(InttoStr(NumeroArquivo), 5)+'.txt';
      //
      SaveDialog1.Title := 'Salvar arquivo remessa em';
      if SaveDialog1.Execute then
         NomeArquivo := SaveDialog1.FileName
      else
         Exit;
      //
      M_NMARQU := ExtractFilePath(Application.ExeName)+'remessa\temp.txt';
      try
           AssignFile(M_ARQREM, SaveDialog1.FileName);
           //
           if FileExists(M_NMARQU) then
              DeleteFile(PChar(M_NMARQU));
           //
           AssignFile(M_ARQUIVO, M_NMARQU);
           Rewrite(M_ARQUIVO, M_NMARQU);
           //
           M_QTLINH := 1;
           // Registro Header de Arquivo-Remessa
           // Identifica��o do Registro Header: �0� (zero)
           Write(M_ARQUIVO, '0');
           // Tipo de Opera��o: �1� (um)
           Write(M_ARQUIVO, '1');
           // Identifica��o por Extenso do Tipo de Opera��o
           Write(M_ARQUIVO, 'TESTE  ');
           // Identifica��o do Tipo de Servi�o: �01�
           Write(M_ARQUIVO, '01');
           // Identifica��o por Extenso do Tipo de Servi�o: �COBRANCA�
           Write(M_ARQUIVO, 'COBRANCA');
           //(007) Complemento do Registro: �Brancos�
           Write(M_ARQUIVO, uFuncoes.Replicate(' ', 7));
           // Prefixo da Ag�ncia: N�mero da Ag�ncia onde est� cadastrado o conv�nio l�der da empresa
           Write(M_ARQUIVO, tbCedentesCED_AGENCIA.AsString);
           //D�gito Verificador - D.V. - do Prefixo da Ag�ncia.
           Write(M_ARQUIVO, tbCedentesCED_DIGAGE.AsString);
           // N�mero da Conta Corrente: N�mero da conta onde est� cadastrado o Conv�nio L�der da empresa
           Write(M_ARQUIVO, tbCedentesCED_NRCONTA.AsString);
           // D�gito Verificador - D.V. - da Conta Corrente da empresa
           Write(M_ARQUIVO, tbCedentesCED_DIGCONTA.AsString);
           // Complemento do Registro: �000000�
           Write(M_ARQUIVO, '000000');
           // X(030) Nome da empresa
           Write(M_ARQUIVO, M_NMCEDE);
           // X(018) 001BANCODOBRASIL
           Write(M_ARQUIVO, '001BANCODOBRASIL  ');
           // Data da Grava��o: Informe no formado �DDMMAA� 21
           Write(M_ARQUIVO, M_DTATUA);
           // Seq�encial da Remessa - falta fazer sequencia
           Write(M_ARQUIVO, '0000001');
           // X(22) Complemento do Registro: �Brancos�
           Write(M_ARQUIVO, uFuncoes.Replicate(' ', 22));
           // (007) N�mero do Conv�nio L�der 03
           Write(M_ARQUIVO, M_NRCONV);
           //  X(258) Complemento do Registro: �Brancos�
           Write(M_ARQUIVO, uFuncoes.Replicate(' ', 258));
           // (006) Seq�encial do Registro:�000001�
           Writeln(M_ARQUIVO, uFuncoes.StrZero(InttoStr(M_QTLINH),6));
           //
           M_QTLINH := M_QTLINH + 1;
           // Registro Detalhe de Arquivo-Remessa
           With aCDS do
           begin
               DisableControls;
               first;
               While not (aCDS.Eof) do
                begin
                    // 01.7 001 a 001 9(001) Identifica��o do Registro Detalhe: 7 (sete)
                    Write(M_ARQUIVO, '7');
                    // 02.7 002 a 003 9(002) Tipo de Inscri��o da empresa
                    If (tbCedentesCED_TPINSCRICAO.AsString = 'F') Then
                    begin
                        Write(M_ARQUIVO, '01');
                        // 03.7 004 a 017 9(014) N�mero do CPF/CNPJ da empresa
                        Write(M_ARQUIVO, tbCedentesCED_NRINSCRICAO.AsString);
                    End
                    Else
                    begin
                        Write(M_ARQUIVO, '02');
                        // 03.7 004 a 017 9(014) N�mero do CPF/CNPJ da empresa
                        Write(M_ARQUIVO, tbCedentesCED_NRINSCRICAO.AsString);
                    End;
                    // 04.7 018 a 021 9(004) Prefixo da Ag�ncia
                    Write(M_ARQUIVO, tbCedentesCED_AGENCIA.AsString);
                    // D�gito Verificador - D.V. - do Prefixo da Ag�ncia.
                    Write(M_ARQUIVO, tbCedentesCED_DIGAGE.AsString);
                    // 06.7 023 a 030 9(008) N�mero da Conta Corrente da empresa 02
                    Write(M_ARQUIVO, tbCedentesCED_NRCONTA.AsString);
                    // 07.7 031 a 031 X(001) D�gito Verificador - D.V. - do N�mero da Conta Corrente da empresa
                    Write(M_ARQUIVO, tbCedentesCED_DIGAGE.AsString);
                    // 08.7 032 a 038 9(007) N�mero do Conv�nio de Cobran�a da empresa 02
                    Write(M_ARQUIVO, M_NRCONV);
                    // 09.7 039 a 063 X(025) N�mero de Controle do Participante. 23
                    Write(M_ARQUIVO, uFuncoes.StrZero(aCDS.FieldByName('CREDITO').AsString,25));
                    // 10.7 064 a 080 9(017) Nosso-N�mero
                    Write(M_ARQUIVO, M_NRCONV + uFuncoes.StrZero(aCDS.FieldByName('CREDITO').AsString,10));
                    // 11.7 081 a 082 9(002) N�mero da Presta��o: �00� (Zeros)
                    Write(M_ARQUIVO, '00');
                    // 12.7 083 a 084 9(002) Grupo de Valor: �00� (Zeros)
                    Write(M_ARQUIVO, '00');
                    // 13.7 085 a 087 X(003) Complemento do Registro: �Brancos�
                    Write(M_ARQUIVO, uFuncoes.Replicate(' ',3));
                    // 14.7 088 a 088 X(001) Indicativo de Mensagem ou Sacador/Avalista 25
                    Write(M_ARQUIVO, 'A');
                    // 15.7 089 a 091 X(003) Prefixo do T�tulo: �Brancos�
                    Write(M_ARQUIVO, uFuncoes.Replicate(' ',3));
                    // 16.7 092 a 094 9(003) Varia��o da Carteira 02
                    Write(M_ARQUIVO, uFuncoes.StrZero(tbCedentesCED_CARTEIRA.AsString,3));
                    // 17.7 095 a 095 9(001) Conta Cau��o: �0� (Zero)
                    Write(M_ARQUIVO, '0');
                    // 18.7 096 a 101 9(006) N�mero do Border�: �000000� (Zeros)
                    Write(M_ARQUIVO, '000000');
                    // 19.7 102 a 106 X(005) Tipo de Cobran�a
                    Write(M_ARQUIVO, uFuncoes.Replicate(' ',5));
                    // 20.7 107 a 108 9(002) Carteira de Cobran�a
                    Write(M_ARQUIVO, tbCedentesCED_CARTEIRA.AsString);
                    // 21.7 109 a 110 9(002) Comando
                    Write(M_ARQUIVO, '01');
                    // 22.7 111 a 120 X(010) Seu N�mero/N�mero Atribu�do pela empresa
                    Write(M_ARQUIVO, uFuncoes.StrZero(aCDS.FieldByName('CREDITO').AsString,10));
                    // 23.7 121 a 126 9(006) Data de Vencimento
                    M_DTVENC := Copy(aCDS.FieldByName('VENCIMENTO').AsString, 1,2)
                               +Copy(aCDS.FieldByName('VENCIMENTO').AsString, 4,2)
                               +Copy(aCDS.FieldByName('VENCIMENTO').AsString, 9,2);
                    Write(M_ARQUIVO, M_DTVENC);
                    // 24.7 127 a 139 9(011)v99 Valor do T�tulo 20
                    M_VLTITU := uFuncoes.RemoveChar( FormatFloat('###,##0.#0',aCDS.FieldByName('VALOR').AsFloat));
                    Write(M_ARQUIVO, uFuncoes.StrZero(M_VLTITU,13));
                    // 25.7 140 a 142 9(003) N�mero do Banco: �001�
                    Write(M_ARQUIVO, '001');
                    // 26.7 143 a 146 9(004) Prefixo da Ag�ncia Cobradora: �0000� .
                    Write(M_ARQUIVO, '0000');
                    // 27.7 147 a 147 X(001) D�gito Verificador do Prefixo da Ag�ncia Cobradora: �Brancos�
                    Write(M_ARQUIVO, '0');
                    // 28.7 148 a 149 9(002) Esp�cie de Titulo
                    {ESP�CIE DE T�TULO
                    01 - Duplicata Mercantil
                    02 - Nota Promiss�ria
                    03 - Nota de Seguro
                    05 � Recibo
                    08 - Letra de C�mbio
                    09 � Warrant
                    10 � Cheque
                    12 - Duplicata de Servi�o
                    13 - Nota de D�bito
                    15 - Ap�lice de Seguro
                    25 - D�vida Ativa da Uni�o
                    26 - D�vida Ativa de Estado
                    27 - D�vida Ativa de Munic�pio
                    Observa��es:
                    As esp�cies 25-D�vida Ativa da Uni�o, 26-D�vida Ativa de Estado, 27-D�vida Ativa de Munic�pio
                    somente s�o admiss�veis nas Carteiras 11 e 17, na modalidade Simples
                    }
                    Write(M_ARQUIVO, '12');
                    // 29.7 150 a 150 X(001) Aceite do T�tulo:
                    If uFuncoes.Empty(tbCedentesCED_ACEITE.asString) Then
                        Write(M_ARQUIVO, 'N')
                    Else
                        Write(M_ARQUIVO, tbCedentesCED_ACEITE.asString);
                    // 30.7 151 a 156 9(006) Data de Emiss�o: Informe no formato �DDMMAA�
                    Write(M_ARQUIVO, M_DTATUA);
                    // 31.7 157 a 158 9(002) Primeira Instru��o Codificada
                    { INSTRU��O CODIFICADA
                    a) Para Comando 01 - Registro de T�tulo (posi��o 109-110)
                    - 00 - Sem de instru��es
                    - 01 - Cobrar juros (Dispens�vel se informado o valor a ser cobrado por dia de atraso).
                    - 03 - Protestar no 3� dia �til ap�s vencido
                    - 04 - Protestar no 4� dia �til ap�s vencido
                    - 05 - Protestar no 5� dia �til ap�s vencido
                    - 10 - Protestar no 10� dia corrido ap�s vencido
                    - 15 - Protestar no 15� dia corrido ap�s vencido
                    - 20 - Protestar no 20� dia corrido ap�s vencido
                    - 25 - Protestar no 25� dia corrido ap�s vencido
                    - 30 - Protestar no 30� dia corrido ap�s vencido
                    - 45 - Protestar no 45� dia corrido ap�s vencido
                    - 06 - Indica Protesto em dias corridos, com prazo de 6 a 29, 35 ou 40 dias Corridos.
                    - Obrigat�rio impostar, nas posi��es 392 a 393 o prazo de protesto desejado: 6 a 29, 35 ou 40 dias.
                    - 07 - N�o protestar
                    - 22 - Conceder desconto s� at� a data estipulada}
                    // Primeira Instru��o Codificada
                    Write(M_ARQUIVO, '06');
                    // 32.7 159 a 160 9(002) Segunda Instru��o Codificada
                    Write(M_ARQUIVO, '06');
                    // 33.7 161 a 173 9(011)v99 Juros de Mora por Dia de Atraso
                    M_VLJURO := '0000000000000';
                    M_VLMORA := '00000000000';
                    Write(M_ARQUIVO, M_VLJURO);
                    // 34.7 174 a 179 9(006) Data Limite para Concess�o de Desconto/Data de Opera��o do BBVendor:
                    Write(M_ARQUIVO, '000000');
                    // 35.7 180 a 192 9(011)v99 Valor do Desconto
                    Write(M_ARQUIVO, '0000000000000');
                    // 36.7 193 a 205 9(011)v99 Valor do IOF/Qtde de Moeda Vari�vel 30
                    Write(M_ARQUIVO, '0000000000000');
                    // 37.7 206 a 218 9(011)v99 Valor do Abatimento
                    Write(M_ARQUIVO, '0000000000000');
                    // 38.7 219 a 220 9(002) Tipo de Inscri��o do Sacado
                    Write(M_ARQUIVO, '02');
                    // 39.7 221 a 234 9(014) N�mero do CNPJ ou CPF do Sacado
                    Write(M_ARQUIVO, M_NRCNPJ);
                    // 40.7 235 a 271 X(037) Nome do Sacado
                    If Length(aCDS.FieldByName('NOME').AsString) > 37 Then
                        Write(M_ARQUIVO, Copy(aCDS.FieldByName('NOME').AsString,1,37))
                    Else
                        Write(M_ARQUIVO, aCDS.FieldByName('NOME').AsString + uFuncoes.Replicate(' ', 37 - Length(aCDS.FieldByName('NOME').AsString)));
                    // 41.7 272 a 274 X(003) Complemento do Registro: �Brancos�
                    Write(M_ARQUIVO, uFuncoes.replicate(' ', 3));
                    // 42.7 275 a 311 X(037) Endere�o do Sacado
                    // Write(M_ARQUIVO, aCDS.FieldByName('ENDERECO').AsString);
                    If Length(aCDS.FieldByName('ENDERECO').AsString) > 37 Then
                        Write(M_ARQUIVO, Copy(aCDS.FieldByName('ENDERECO').AsString,1,37))
                    Else
                        Write(M_ARQUIVO, aCDS.FieldByName('ENDERECO').AsString + uFuncoes.Replicate(' ', 37 - Length(aCDS.FieldByName('ENDERECO').AsString)));
                    // 43.7 312 a 326 X(015) Complemento do Registro: �Brancos�
                    Write(M_ARQUIVO, uFuncoes.replicate(' ', 15));
                    // 44.7 327 a 334 9(008) CEP do Endere�o do Sacado
                    Write(M_ARQUIVO, aCDS.FieldByName('CEP').AsString);
                    // 45.7 335 a 349 X(015) Cidade do Sacado
                    If Length(aCDS.FieldByName('CIDADE').AsString) > 15 Then
                        Write(M_ARQUIVO, Copy(aCDS.FieldByName('CIDADE').AsString,1,15))
                    Else
                        Write(M_ARQUIVO, aCDS.FieldByName('CIDADE').AsString+uFuncoes.Replicate(' ', 15 - Length(aCDS.FieldByName('CIDADE').AsString)));
                    // 46.7 350 a 351 X(002) UF da Cidade do Sacado
                    Write(M_ARQUIVO, aCDS.FieldByName('UF').AsString);
                    // 47.7 352 a 391 X(040) Observa��es/Mensagem ou Sacador/Avalista 13
                    //Write(M_ARQUIVO, uFuncoes.replicate(' ', 40));
                    // 40.7 235 a 271 X(037) Nome do Sacado
                    If Length(aCDS.FieldByName('NOME').AsString) > 24 Then
                        Write(M_ARQUIVO, Copy(aCDS.FieldByName('NOME').AsString,1,24))
                    Else
                        Write(M_ARQUIVO, aCDS.FieldByName('NOME').AsString + uFuncoes.Replicate(' ', 24 - Length(aCDS.FieldByName('NOME').AsString)));
                    //
                    Write(M_ARQUIVO, '02');
                    // 9(014) N�mero do CNPJ ou CPF do Sacado
                    Write(M_ARQUIVO, M_NRCNPJ);
                    // 48.7 392 a 393 X(002) N�mero de Dias Para Protesto
                    Write(M_ARQUIVO, '06');
                    // 49.7 394 a 394 X(001) Complemento do Registro: �Brancos�
                    Write(M_ARQUIVO, uFuncoes.replicate(' ', 1));
                    // 50.7 395 a 400 9(006) Seq�encial de Registro
                    Writeln(M_ARQUIVO, uFuncoes.StrZero(InttoStr(M_QTLINH),6));
                    //
                    M_QTLINH := M_QTLINH + 1;
                    Next;
                End;
                EnableControls;
           End;
           //
           //M_QTLINH := M_QTLINH + 1;
           // 01.9 001 a 001 9(001) Identifica��o do Registro Trailer: �9�
           Write(M_ARQUIVO, '9');
           // 02.9 002 a 394 X(393) Complemento do Registro: �Brancos�
           Write(M_ARQUIVO, uFuncoes.Replicate(' ', 393));
           // 03.9 395 a 400 9(006) N�mero Seq�encial do Registro no Arquivo
           Writeln(M_ARQUIVO, uFuncoes.StrZero(InttoStr(M_QTLINH),6));
       Finally
           CloseFile(M_ARQUIVO);
           //CloseFile(M_ARQREM);
       End;
       //
       DeleteFile(PChar(SaveDialog1.FileName));
       M_ARQGER := 'TES'+uFuncoes.StrZero(InttoStr(NumeroArquivo), 5)+'.TXT';
       RenameFile(M_NMARQU, M_ARQGER);
       //
       MessageDlg('Gerou remessa ' + IntToStr(NumeroArquivo) + ' no arquivo ' + M_ARQGER,mtInformation,[mbOk],0);
       Result := true;
   end; {with Remessa}
end;

function TdmADM.AddClientenaLista(aCODCLI, aRAZAO, aFANTASIA, aCPF_CNPJ,
  aTPPESSOA, aENDERECO, aNUMERO, aBAIRRO, aCOMPLEMENTO, aCIDADE, aUF,
  aCEP: String): Boolean;
begin
     Result := false;
      With cdsListaClientes do
      begin
           if not Locate('CDS_CODCLI', aCODCLI,[]) Then
               Append
           Else
               Edit;
           FieldByName('CDS_CODCLI').AsString   := aCODCLI;
           FieldByName('CDS_RAZAO').AsString    := aRAZAO;
           FieldByName('CDS_FANTASIA').AsString := aFANTASIA;
           FieldByName('CDS_CPF_CNPJ').AsString := aCPF_CNPJ;
           FieldByName('CDS_TPPESSOA').AsString := aTPPESSOA;
           FieldByName('CDS_ENDERECO').AsString := aENDERECO;
           if not uFuncoes.Empty(aNUMERO) Then
              FieldByName('CDS_NUMERO').AsString   := aNUMERO;
           FieldByName('CDS_BAIRRO').AsString   := aBAIRRO;
           FieldByName('CDS_COMPLEMENTO').AsString := aCOMPLEMENTO;
           FieldByName('CDS_CIDADE').AsString   := aCIDADE;
           FieldByName('CDS_UF').AsString       := aUF;
           FieldByName('CDS_CEP').AsString      := aCEP;
           //
           Post;
      End;
      //
      Result := true;
end;

function TdmADM.AddBoletoCliente(iSEQUENCIA, iCLIENTE: Integer; aNMCLIENTE,
  aCPF, aENDERECO, aCIDADE, aBAIRRO, aDOCUMENTO, aNOSSONUMERO, aCARTEIRA,
  aCEP, aBOXMESA, aLINHA_DIGITAVEL, aCODIGO_BARRAS, aAGENCIA, aDIAGEN,
  aCDCEDENTE, aDG_NNUMERO: String; aDESCRICAO: TStrings; aDTDOCU,
  aDTPROCESSAMENTO, aDTVENCIMENTO: TDatetime; fVALOR: Double; aNrParcela,
  aNrFicha: String): Boolean;
Var
   M_NRDOCU : String;
begin
     result := false;
      //
      With cds2Boletos do
        begin
             Append;
             FieldByName('CDS_SEQUENCIA').AsInteger := iSEQUENCIA;
             FieldByName('CDS_CLIENTE').AsInteger   := iCLIENTE;
             FieldByName('CDS_NMCLIENTE').AsString  := aNMCLIENTE;
             FieldByName('CDS_CPF').AsString        := uFuncoes.FormataCPF(aCPF);
             If not uFuncoes.Empty(aENDERECO) Then
                 FieldByName('CDS_ENDERECO').AsString   := aENDERECO
             Else
                 FieldByName('CDS_ENDERECO').AsString   := '...';
             FieldByName('CDS_CIDADE').AsString     := aCIDADE;
             FieldByName('CDS_BAIRRO').AsString     := aBAIRRO;
             FieldByName('CDS_DESCRICAO').Assign(aDESCRICAO);
             // FieldByName('CDS_DOCUMENTO').AsString  := copy(aDOCUMENTO, 8, 10);
             FieldByName('CDS_DOCUMENTO').AsString  := aNrFicha+'/'+aNrParcela;
             //
             FieldByName('CDS_NOSSONUMERO').AsString := aNOSSONUMERO;
             FieldByName('CDS_DTDOCU').AsDateTime   := aDTDOCU;
             FieldByName('CDS_DTPROCESSAMENTO').AsDateTime := aDTPROCESSAMENTO;
             FieldByName('CDS_DTVENCIMENTO').AsDateTime := aDTVENCIMENTO;
             FieldByName('CDS_CARTEIRA').AsString   := aCARTEIRA;
             FieldByName('CDS_VALOR').AsFloat       := fVALOR;
             If not uFuncoes.Empty(aCEP) Then
                FieldByName('CDS_CEP').AsString      := uFuncoes.FormataCep(aCEP)
             Else
                FieldByName('CDS_CEP').AsString      := '64000-000';
             FieldByName('CDS_BOXMESA').AsString    := aBOXMESA;
             FieldByName('CDS_AGENCIA').AsString    := aAGENCIA;
             FieldByName('CDS_DIAGEN').AsString     := aDIAGEN;
             FieldByName('CDS_CDCEDENTE').AsString  := aCDCEDENTE;
             FieldByName('CDS_DG_NNUMERO').AsString := aDG_NNUMERO;
             FieldByName('CDS_LINHA_DIGITAVEL').AsString := aLINHA_DIGITAVEL;
             FieldByName('CDS_CODIGO_BARRAS').AsString   := aCODIGO_BARRAS;
             FieldByName('CDS_NRITEM').AsString     := aNrParcela;
             //
             Post;
        End;
      //
      Result := true;
end;

procedure TdmADM.CONFIGURA_BOLETO(idNumDocumento: Integer;
  M_FLSEGU: String);
Var
     M_NOSNUM, M_CPFCNPJ, M_NRCONV, M_CARTEIRA, W_DTVENC : String;
     W_CDBANC, W_DVBANC, W_NRAGEN, W_CDCEDE, x , M_DTVCJU: String;
     M_NRCEP, M_CDCEDE : String;
     M_TPBOLE, M_BANC_PADRAO : Integer;
     M_DTVENC : TDateTime;
     M_VLDOCU : DOuble;
     M_CEDENTE_NOSSO_NUMERO, M_DIG_VER_CAMPO_LIVRE, M_DIG_CEDENTE, aNOSSO_NUMERO : String;
     M_NSPRIM, M_NSSEGU, M_CDCARTEIRA, M_DVBANC : String;
begin
      //
      if not (QryDebito.IsEmpty) Then
      begin
            M_CDCARTEIRA := cdsConfigCARTEIRA.AsString;
            W_CDBANC := uFuncoes.StrZero( cdsConfigCOD_BANCO.AsString, 3);
            M_BANC_PADRAO := StrtoInt(W_CDBANC);
            W_DVBANC := '';
            W_NRAGEN := gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia+'-'+gbTitulo1.Cedente.ContaBancaria.fDigitoAgencia;
            W_CDCEDE := gbTitulo1.Cedente.CodigoCedente+'-'+gbTitulo1.Cedente.DigitoCodigoCedente;
            // N�mero conta
            M_NRCONV := cdsConfigCONVENIO.AsString;
            M_CARTEIRA := cdsConfigCARTEIRA.AsString;
            M_DVBANC := cdsConfigAGENCIA_DIG.AsString;
            //
            M_VLDOCU := QryDebitoDEB_VLPARC.AsFloat;
            If uFuncoes.Empty(QryDebitoDEB_DTCOBR.AsString) Then
            begin
                 M_DTVENC := StrtoDate(uFuncoes.FormataData( QryDebitoDEB_DTVENC.asString));
                 W_DTVENC := uFuncoes.FormataData( QryDebitoDEB_DTVENC.asString);
            End
            Else
            begin
                 M_DTVENC := StrtoDate(uFuncoes.FormataData( QryDebitoDEB_DTCOBR.asString));
                 W_DTVENC := uFuncoes.FormataData( QryDebitoDEB_DTCOBR.asString);
            End;
            aNOSSO_NUMERO := uFuncoes.StrZero(QryDebitoDEB_NRCRED.AsString, 7)+ uFuncoes.StrZero(QryDebitoDEB_NRPARC.AsString,2);
            //
            If (M_CARTEIRA = '02') Then
            begin
                M_NSPRIM := '9000';
                M_NSSEGU := '0009';
                //
                M_DIG_CEDENTE := uCodBarras.Modulo11(M_NRCONV,9);
                M_DIG_VER_CAMPO_LIVRE := uCodBarras.Modulo11(M_NRCONV+M_DIG_CEDENTE
                                         +M_NSPRIM + M_NSSEGU+aNOSSO_NUMERO,9);
                // codigo de barras
                M_CODIGOBARRAS := '1049'+CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0',M_VLDOCU)),10)
                          +M_NRCONV+M_CDCARTEIRA
                          +M_NSPRIM + M_NSSEGU+aNOSSO_NUMERO+M_DIG_VER_CAMPO_LIVRE;
                          //gbTitulo1.NossoNumero
                          // +'1'+StrZero(Copy(M_NRCONV,1,5),5)
                // digito do codigo
                //M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
                {M_CEDENTE_NOSSO_NUMERO := ZQryContaBancarianumero_conta.AsString+uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9)
                                         +'00010004'+uFuncoes.StrZero(ZQryBoletoid.AsString, 9);}
                M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
                //M_DIGITOCODIGO := uCodBarras.Modulo11(ZQryContaBancarianumero_conta.AsString,9);
                If M_DIGITOCODIGO = '0' then
                    M_DIGITOCODIGO := '1';
                //
                M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                                +M_DIGITOCODIGO
                                +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);

             End;
             //
             If (M_CARTEIRA = '18') Then
             begin
                  gbTitulo1.NossoNumero := M_NRCONV+uFuncoes.StrZero(aNOSSO_NUMERO, 10);
                  //aDocumento;
                  M_DVBANC := '9';
                  //
                  M_NOSNUM := uFuncoes.StrZero(gbTitulo1.NossoNumero,17) +
                        '-' + uCodBarras.Modulo11(gbTitulo1.NossoNumero,9);
                  // codigo de barras
                  M_CODIGOBARRAS := W_CDBANC+M_DVBANC
                          +CalcularFatorVencimento(M_DTVENC)
                          +StrZero(RemoveChar(FormatFloat('##,###,##0.#0', QryDebitoDEB_VLPARC.AsFloat)),10)
                          + '000000'
                          +gbTitulo1.NossoNumero+M_CARTEIRA;
                  // digito do codigo
                  M_DIGITOCODIGO := uCodBarras.Modulo11(M_CODIGOBARRAS,9);
                  If M_DIGITOCODIGO = '0' then
                      M_DIGITOCODIGO := '1';
                  //
                  M_CODIGOBARRAS := Copy(M_CODIGOBARRAS,1,4)
                          +M_DIGITOCODIGO
                          +Copy(M_CODIGOBARRAS,5,length(M_CODIGOBARRAS)-4);
              End;
      End;
end;

function TdmADM.GerarBoleto(aCodCliente, aIdDebito, aNrParcela,
  aTipo, aMsg, aMsgMultaJuros: String): Boolean;
Var
   idDocumento, M_IDCLIE, idFatura : Integer;
   W_NRDOCU, M_CDCLIE, X: String;
   M_PEMULT, M_VLMULT, M_PEJURO, M_VLJURO, M_VLDOCU, fTotalTaxa, M_VLPROMOCAO  : Double;
   W_DATA : TDatetime;
   aNomePasta, aNomeArquivo, aLinhaTaxa, aValorTaxa : String;
   aNomeTaxa, aPlacaCPF_CNPJ, aDataVenc, aNomeFantasia, aMensagemDesconto, aEmail : String;
begin
     Result := False;
     if not (dmADM.tbConfig.Active) Then
          dmADM.tbConfig.Open;
     //
     If uFuncoes.Empty(cdsConfigCARTEIRA.AsString) Then
     begin
          ShowMessage('Campo c�digo carteira est� vazio.');
          Exit;
     End;
     //
     try
         try
             RefreshCDS(cdsConfig);
             //
             With QryDebito do
              begin
                   Active := False;
                   Params[0].AsString := uFuncoes.StrZero(aIdDebito,7);
                   Params[1].AsString := aNrParcela;
                   Prepare;
                   Active := True;
                   //
                   if not (IsEmpty) Then
                   begin
                        idDocumento := StrtoInt(aIdDebito+aNrParcela);
                        M_VLDOCU    := FieldByName('DEB_VLPARC').AsFloat;
                        M_VLPROMOCAO:= FieldByName('DEB_VLPROM').AsFloat;
                        aMensagemDesconto := '';
                        If (M_VLPROMOCAO > 0) then
                          aMensagemDesconto := #13+'DESCONTO DE R$ '+FormatFloat('###,##0.#0', M_VLPROMOCAO)+' AT� O VENCIMENTO.';
                        //  
                        if uFuncoes.Empty(QryDebito.FieldByName('DEB_DTCOBR').AsString) Then
                            aDataVenc   := uFuncoes.FormataData(FieldByName('DEB_DTVENC').AsString)
                        Else
                            aDataVenc   := uFuncoes.FormataData(FieldByName('DEB_DTCOBR').AsString);
                        //    
                        M_CDCLIE    := FieldByName('DEB_CDCLIE').AsString;
                        //
                        SelecionarCliente(M_CDCLIE);
                   End;
              end;
             //
             If FileExists(ExtractFilePath( Application.ExeName )+'logo.bmp') Then
                 aArquivoLogoRel := ExtractFilePath( Application.ExeName )+'logo.bmp';
             //
             PrepararTitulo(cdsConfigCEDENTE.AsInteger);
             //
             {idContaBancaria, idNumDocumento: Integer; M_FLSEGU: String}
             CONFIGURA_BOLETO(idDocumento, 'N');
             // Param.NRDOCU
             W_NRDOCU := uFuncoes.StrZero(aIdDebito,7)+'/'+uFuncoes.StrZero(aNrParcela,2);
             //
             //RPDev.Orientation := poPortrait;
             RVSystem1.SystemPrinter.Orientation   := poPortrait;
             {RPDev.SetPaperSize(DMPAPER_A4,0,0);
             RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);}
             aNomeFantasia := cdsConfigFANTASIA.AsString;
             //
             With RvBoleto do
             begin
                  SetParam('pMSN_VENCIMENTO', '');
                  if not uFuncoes.Empty(QryDebito.FieldByName('DEB_DTCOBR').AsString) Then
                   Begin
                      SetParam('pData_Vencimento', uFuncoes.FormataData(QryDebito.FieldByName('DEB_DTCOBR').AsString));
                      if (QryDebito.FieldByName('DEB_DTVENC').AsString <> QryDebito.FieldByName('DEB_DTCOBR').AsString) Then
                         SetParam('pMSN_VENCIMENTO', 'VENCIMENTO ORIGINAL : '+uFuncoes.FormataData(QryDebito.FieldByName('DEB_DTVENC').AsString));
                   End
                  Else
                      SetParam('pData_Vencimento', uFuncoes.FormataData(QryDebito.FieldByName('DEB_DTVENC').AsString));
                  //
                  M_PEMULT := dmADM.tbConfigPAR_PEMULT.AsFloat;
                  M_VLMULT := uFuncoes.Arredondar((uFuncoes.Gerapercentual(M_VLDOCU, M_PEMULT)),2);


                  M_PEJURO := dmADM.tbConfigPAR_PEJURO.AsFloat;
                  // valorparcela, juros, multa, dias, parcelas
                  M_VLJURO := uFuncoes.Arredondar((uFuncoes.Gerapercentual(M_VLDOCU + M_VLMULT, M_PEJURO)/30),2);
                  //
                  // X := StrtoDate(aDataVenc);
                  W_DATA := uFuncoes.Acrescentar_Dias_Data(StrtoDate(aDataVenc));
                  // QryDebito.FieldByName('aDataVencimento').AsDateTime
                  //uFuncoes.Datafinal(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime, 10);
                  //
                  If ( aMsg = 'N') Then
                  begin
                       If (aMsgMultaJuros = 'S') Then
                       begin
                            SetParam('INSTRUCOES1','MULTA..: '+ FormatFloat('##0.#0', M_PEMULT) +'%  :: DE R$:  '+FormatFloat('##0.#0', M_VLMULT) +' APOS : '+aDataVenc+#13+
                                                   'JUROS..: '+ FormatFloat('##0.#0', M_PEJURO)+ '%  :: DE R$:  '+FormatFloat('##0.#0', M_VLJURO) +' AO DIA '+#13+#13+
                                         'SUJEITO A PROTESTO AP�S 3 DIAS DE ATRASO'+aMensagemDesconto);
                                         {'N�O RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia);}
                       End
                       Else
                       begin
                            SetParam('INSTRUCOES1',
                                         'N�O RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia+aMensagemDesconto);
                       End;
                  End
                  Else
                  begin
                        SetParam('INSTRUCOES1', cdsConfigINSTRUCOES_BOLETO.AsString+aMensagemDesconto);
                  End;
                  // Taxas
                  SetParam('aTexto', ' ');
                  SetParam('aTextoValor',' ');
                  SetParam('aTaxas', ' ');
                  SetParam('pValorTaxa', ' ');
                  //
                  if uFuncoes.Empty(cdsConfigMENSAGEM1.AsString) Then
                      SetParam('INSTRUCOES2','Pague somente na Rede Banc�ria ou na Administradora')
                  Else
                      SetParam('INSTRUCOES2',cdsConfigMENSAGEM1.AsString);
                  //
                  SetParam('ESPECIE','R$');
                  SetParam('ESPECIEDOC','DM');
                  SetParam('pACEITE','N');
                  //
                  SetParam('NUM_BANCO', uFuncoes.StrZero(cdsConfigCOD_BANCO.AsString,3)+ '-'+gbTitulo1.Cedente.ContaBancaria.Banco.Digito);
                  SetParam('NOME_BANCO', 'BANCO DO BRASIL');
                  SetParam('LINDIG', uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CODIGOBARRAS));
                  SetParam('CODIGO', M_CODIGOBARRAS);
                  SetParam('DTPROC', DatetoStr(Date()));
                  if uFuncoes.Empty(cdsConfigMENSAGEM2.AsString) Then
                      SetParam('LOCAL_PAG', 'ATE O VENCIMENTO PAGAV�L EM QUALQUER BANCO')
                  Else
                      SetParam('LOCAL_PAG', cdsConfigMENSAGEM2.AsString);
                  //
                  SetParam('NMCEDE', cdsConfigRAZAO.AsString+ '    -    CNPJ: '+uFuncoes.FormataCNPJ(cdsConfigCNPJ.AsString));
                  //
                  SetParam('VLDOCU', FormatFloat('###,##0.#0', M_VLDOCU));
                  //
                  SetParam('VLDOCU1', FormatFloat('###,##0.#0',M_VLDOCU));
                  // Dados cliente
                  SetParam('NMSACA', qryLocClientesCLI_RASOCI.AsString);
                  if uFuncoes.Empty(qryLocClientesCLI_NUMERO.AsString) Then
                      SetParam('ENDCLIE', qryLocClientesCLI_ENCLIE.AsString+' - '+qryLocClientesCLI_BACLIE.AsString)
                  Else
                      SetParam('ENDCLIE', qryLocClientesCLI_ENCLIE.AsString+', N�.'+qryLocClientesCLI_NUMERO.AsString+' - '+qryLocClientesCLI_BACLIE.AsString);
                  //
                  SetParam('pCIDADEUF', qryLocClientesCLI_BACLIE.AsString);
                  SetParam('CEPCIDUF', uFuncoes.FormataCep(qryLocClientesCLI_CEPCLI.AsString)+' - ' +qryLocClientesCLI_CICLIE.AsString+'/'+qryLocClientesCLI_UFCLIE.AsString );
                  //
                  {If (qryLocClientesCLI_.AsString = 'F') Then
                      SetParam('CPFCNPJ', uFuncoes.FormataCPF(qryLocClientesCLI_CPFCGC.AsString))
                  Else    }
                      SetParam('CPFCNPJ', qryLocClientesCLI_CPFCGC.AsString);
                  //
                  SetParam('pEMPRESA', cdsConfigFANTASIA.AsString);
                  //
                  SetParam('pEND_NOVO', cdsConfigENDERECO.AsString);   // texto
                  //SetParam('TEXTO_BOL', 'MENSAGEM DE TESTE');
                  SetParam('pEMPRESA', 'INFOG2 TECNOLOGIA LTDA');
                  SetParam('pENDERECO','AVENIDA JOS� DOS SANTOS E SILVA, N� 1769');
                  SetParam('pCOMPLEMENTO','ED. TALISM�, SALA 108, TERREO');
                  SetParam('pBAIRRO','CENTRO');
                  SetParam('pCEP','64001-300');
                  SetParam('pCIDADE','TERESINA-PI');
                  //
                  With gbTitulo1 do
                  begin
                       // Aqui
                       SetParam('NOSSONUM', gbTitulo1.NossoNumero + '-'+uCodBarras.Modulo11(gbTitulo1.NossoNumero,9));
                       //
                       SetParam('AGE_CEDENTE', Cedente.ContaBancaria.fCodigoAgencia+'-'+  Cedente.ContaBancaria.fDigitoAgencia
                                             +'/'+cdsConfigCEDENTE.AsString
                                             +'-'+uCodBarras.Modulo11(cdsConfigCEDENTE.AsString,9));
                                {+uCodBarras.Modulo11(NossoNumero
                                               +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                                               +gbTitulo1.Cedente.ContaBancaria.fNumeroConta));}
                       //
                       SetParam('Carteira', gbTitulo1.Carteira);
                       if (cdsConfigCOD_BANCO.AsString = '001')
                         and (cdsConfigCARTEIRA.AsString = '18') Then
                            SetParam('Carteira', gbTitulo1.Carteira);  // +'/19'
                       SetParam('NRDOCU', Copy(W_NRDOCU,1,8)+Copy(W_NRDOCU,9,2));  // NumeroDocumento  +'/'
                       //SetParam('NRDOCU', W_NRDOCU);  // NumeroDocumento
                       //
                       If FileExists(aArquivoLogoRel) Then
                        begin
                            SetParam('pIMG', aArquivoLogoRel);
                            SetParam('pIMG2', aArquivoLogoRel);
                        End;
                  End;
                  //
                  If (aTipo = 'V') Then
                  begin
                       RvSystem1.DefaultDest := rdPreview;
                       RvSystem1.DoNativeOutput  := true;
                       Execute;
                  End;
                  //
                  If (aTipo = 'I') Then
                   begin
                       RvSystem1.DefaultDest := rdPrinter;
                       RvSystem1.SystemSetups    := RvSystem1.SystemSetups - [ssAllowSetup];
                       RvSystem1.DoNativeOutput  := true;
                       Execute;
                   End;
                  //
                  If (aTipo = 'A') Then
                    begin
                      aNomePasta := ExtractFilePath( Application.ExeName )+'PDF';
                      if not DirectoryExists(aNomePasta) then
                         ForceDirectories(aNomePasta);
                      //
                      aDataVenc := uFuncoes.RemoveChar(aDataVenc);
                      aNomeArquivo   := aCodCliente+'_'+uFuncoes.StrZero(IntToStr(idDocumento),9)+'_'+aDataVenc+'.PDF';
                      //
                      aEmail := dmADM.GetEmailCliente(aCodCliente);
                      if not uFuncoes.Empty(aEmail) Then
                          AddEmailLista(LowerCase(aEmail), aNomeArquivo, aCodCliente, qryLocClientesCLI_NMCLIE.AsString);
                      //
                      try
                         // Adicionar Arquivo na lista para email

                         aNomePasta := aNomePasta+'\'+aNomeArquivo;
                         RvSystem1.DefaultDest     := rdFile;
                         RvSystem1.SystemSetups    := RvSystem1.SystemSetups - [ssAllowSetup];
                         RvSystem1.DoNativeOutput  := False;
                         RvSystem1.OutputFileName  := aNomePasta;
                         RvSystem1.RenderObject    := RvRenderPDF1;
                         //
                         {SaveDialog1.Filter       := 'Acrobat Reader|PDF';
                         SaveDialog1.DefaultExt   := 'PDF';
                         SaveDialog1.FileName     := aArquivo;
                         RvSystem2.OutputFileName := SaveDialog1.FileName;}
                         //
                         Execute;
                      Except
                         Application.MessageBox(Pchar('Erro ao tentar exportar!'),
                            'Exporta��o',MB_OK + MB_ICONERROR);
                      End;
                   End;
             end;
         Except
               on e: exception do
             begin
                 Application.MessageBox(PChar('Erro ao tentar visualizar boleto!!! Erro:'+#13
                        + E.Message), 'ATEN��O', MB_OK+MB_ICONSTOP+MB_APPLMODAL);

             End;
         End;
     Finally

     End;
end;

procedure TdmADM.PrepararTitulo(idContaBancaria: integer);
Var
    M_CDCLIE, M_COMPLE, aDigito : String;
    M_ININSN, aNossoNumero : String;
    M_BANC_PADRAO : integer;
begin
      M_BANC_PADRAO := idContaBancaria;
      // FilterDataSet(ZQryContaBancaria, fsInteger, InttoStr(M_BANC_PADRAO));
      M_ININSN := '9';
      aNossoNumero := QryDebitoDEB_NRCRED.AsString+QryDebitoDEB_NRPARC.AsString;
      //qryBoletoAtualREC_NRRECE.AsString;
      {Dados do titulo}
      with gbTitulo1 do
       begin
             //
             SeuNumero   := uFuncoes.StrZero(aNossoNumero,10);
             Carteira    := cdsConfigCARTEIRA.AsString;
             //
             If (M_ININSN = '82') Then
             Begin
                   NossoNumero    := '82'+Copy(uFuncoes.StrZero(aNossoNumero,8),3,8);
                   Carteira := 'SR';
             End;
             //
             If (M_ININSN = '9') and (Carteira = '1') Then
             begin
                    gbTitulo1.NossoNumero    :=
                      uFuncoes.StrZero(aNossoNumero,17);
                    gbTitulo1.Carteira := cdsConfigCARTEIRA.AsString;
             End;
             //
             If (M_ININSN = '9') and (Carteira = '18') Then
                Begin
                    gbTitulo1.Carteira       := cdsConfigCARTEIRA.AsString;
                    //
                    gbTitulo1.NossoNumero    := cdsConfigCONVENIO.AsString +uFuncoes.StrZero(aNossoNumero, 10);
                    //dmAdmDados.cdsbancosBAN_CONVENIO.AsString
                End;
              //
              If (Carteira = 'CNR') Then
               begin
                    gbTitulo1.NossoNumero    := aNossoNumero;
               End;
               //
              If (Carteira = '57') Then
                Begin
                     gbTitulo1.NossoNumero := aNossoNumero;
                End;
              //
             aDigito := uCodBarras.Modulo11(gbTitulo1.NossoNumero,9);
             DataDocumento  := Date();
             DataVencimento := StrtoDate( uFuncoes.FormataData(QryDebitoDEB_DTVENC.AsString));
             ValorDocumento := QryDebitoDEB_VLPARC.AsFloat;
             //
             {Dados do cedente}
             with Cedente do
             begin

                TipoInscricao := tiPessoaJuridica; //CNPJ
                If (Carteira = 'SR') Then
                Begin
                  CodigoCedente := cdsConfigCEDENTE.AsString;
                  DigitoCodigoCedente := cdsConfigCEDENTE_DIG.AsString;
                End;
                //
                If (Carteira = 'CR') or (Carteira = '1') Then
                Begin
                    CodigoCedente       := uFuncoes.StrZero(cdsConfigCEDENTE.AsString,6);
                    DigitoCodigoCedente := cdsConfigCEDENTE_DIG.AsString;
                End;
                //
                If (Carteira = '18') Then
                Begin
                    CodigoCedente       := uFuncoes.StrZero(cdsConfigCEDENTE.AsString,6);
                    DigitoCodigoCedente := cdsConfigCEDENTE_DIG.AsString;
                End;
                //
                If (Carteira = '57') Then
                Begin
                    CodigoCedente       := uFuncoes.StrZero(cdsConfigCEDENTE.AsString,7);
                    DigitoCodigoCedente := cdsConfigCEDENTE_DIG.AsString;
                End;
               {Endere�o do cedente}
              //
              with Endereco do
              begin
                 Rua := 'ENDERE�O';
                 Endereco.Numero := '0000';
                 Complemento := 'Complemento';
                 Bairro := 'BAIRRO';
                 Cidade := 'TERESINA';
                 Estado := 'PI';
                 CEP    := '64000000';
                 //
              end; {with Endereco}
              {Dados banc�rios do cedente}
              with ContaBancaria do
              begin
                   Banco.Codigo  := uFuncoes.StrZero(cdsConfigCOD_BANCO.AsString,3);
                   CodigoAgencia := cdsConfigAGENCIA.AsString;
                   DigitoAgencia := cdsConfigAGENCIA_DIG.AsString;
                   NumeroConta    := cdsConfigCONVENIO.AsString;
                  //
                  If (Banco.Codigo = '000') Then
                      Banco.Codigo := '104';
              end;
           end;

          //Dados do sacado do t�tulo
           with Sacado do
           begin
              {If (qryLocClientes.FieldByName('CLI_TPPESS').AsString = 'F') Then
                 NumeroCPFCGC := uFuncoes.FormataCPF(qryCliente.FieldByName('CLI_CPFCGC').AsString)
              Else}
                 NumeroCPFCGC := uFuncoes.FormataCNPJ(qryLocClientes.FieldByName('CLI_CPFCGC').AsString);
              //
              Nome := qryLocClientes.FieldByName('CLI_NMCLIE').AsString;
              //Endere�o do sacado do t�tulo
              with Endereco do
              begin
                 Rua         := qryLocClientesCLI_ENCLIE.AsString;
                 Complemento := '';
                 Bairro      := qryLocClientesCLI_BACLIE.AsString;
                 //Cidade      := qryCliente.FieldByName('CLI_CIDEMP').AsString;
                 Estado      := qryLocClientesCLI_UFCLIE.AsString;
              end; //with Endereco
           end; //with Sacado
           //
      end; //with Titulo
end;

procedure TdmADM.SelecionarCliente(aCodCliente: String);
begin
      With qryLocClientes do
      begin
           Close;
           Params[0].AsString := aCodCliente;
           Open;
      End;
end;

procedure TdmADM.FilterCDS(aCds: TClientDataSet; aType: TTypeLocalizar;
  aBusca: String);
begin
     aCds.close;
     case aType of
          fsInteger : aCds.Params[0].AsInteger := StrtoInt(aBusca);
          fsString  : aCds.Params[0].AsString  := UpperCase(aBusca);
     end;
     aCds.Open;
end;

procedure TdmADM.GetError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Application.MessageBox(PChar('Ocorreu um erro ao tentar gravar o registro. '+#13+
                  'Mensagem Original : '+ E.Message), 'Aten��o',MB_OK+MB_ICONSTOP);
end;

procedure TdmADM.RefreshCDS(aDateSet: TClientDataSet);
begin
     aDateSet.Close;
     aDateSet.Open;
end;

procedure TdmADM.AbrirConfiguracoesBoleto;
begin
     dmADM.cdsConfig.close;
     if FileExists('Config.xml') Then
        dmADM.cdsConfig.LoadFromFile('Config.xml');
     dmADM.RefreshCDS(dmADM.cdsConfig);
end;

procedure TdmADM.QryDebitoCalcFields(DataSet: TDataSet);
begin
     if not uFuncoes.Empty(QryDebitoDEB_DTVENC.AsString) Then
       QryDebitoaDataVencimento.AsString := uFuncoes.FormataData(QryDebitoDEB_DTVENC.AsString);
     //
     if not uFuncoes.Empty(QryDebitoDEB_DTCOBR.AsString) Then
       QryDebitoaDataCobranca.AsString := uFuncoes.FormataData(QryDebitoDEB_DTCOBR.AsString);

end;

function TdmADM.GetNomeCliente(aCodCliente: String): String;
Var
    QryAux : TQuery;
    aTexto : String;
begin
     Result := '';
     aTexto := 'Select CLI_CDCLIE, CLI_NMCLIE, CLI_RASOCI from "ADMCLI.DBF" Where (CLI_CDCLIE = :pCDCLIE)';
     QryAux := TQuery.Create(nil);
     try
        With QryAux do
         begin
              DatabaseName := 'ADM';
              Close;
              SQL.Add(aTexto);
              ParamByName('pCDCLIE').AsString := aCodCliente;
              Open;
              //
              if not (IsEmpty) Then
                Result := FieldByName('CLI_NMCLIE').AsString;
          End;
     Finally
          QryAux.Free;
     End;
end;

procedure TdmADM.ImprimirVersoBoleto(aOpcao : String);
begin
     With dmADM.RvEnvBoleto do
      begin
           SetParam('pEMPRESA', 'INFOG2 TECNOLOGIA LTDA');
           SetParam('pENDERECO','AVENIDA JOS� DOS SANTOS E SILVA, N� 1769');
           SetParam('pCOMPLEMENTO','ED. TALISM�, SALA 108, TERREO');
           SetParam('pBAIRRO','CENTRO');
           SetParam('pCEP','64001-300');
           SetParam('pCIDADE','TERESINA-PI');
           //
           if (aOpcao = 'V') Then
              RvSystem2.DefaultDest := rdPreview
           Else
              RvSystem2.DefaultDest := rdPrinter;
           Execute;
      End;
end;

function TdmADM.GerarBoletoComVerso(aCodCliente, aIdDebito, aNrParcela, aTipo, aMsg,
  aMsgMultaJuros, aPrimeiraImp: String): Boolean;
Var
   idDocumento, M_IDCLIE, idFatura : Integer;
   W_NRDOCU, M_CDCLIE, X: String;
   M_PEMULT, M_VLMULT, M_PEJURO, M_VLJURO, M_VLDOCU, fTotalTaxa, M_VLPROMOCAO  : Double;
   W_DATA : TDatetime;
   aNomePasta, aNomeArquivo, aLinhaTaxa, aValorTaxa : String;
   aNomeTaxa, aPlacaCPF_CNPJ, aDataVenc, aNomeFantasia, aMensagemDesconto : String;
begin
     Result := False;
     if not (dmADM.tbConfig.Active) Then
        dmADM.tbConfig.open;
     //
     If uFuncoes.Empty(cdsConfigCARTEIRA.AsString) Then
     begin
          ShowMessage('Campo c�digo carteira est� vazio.');
          Exit;
     End;
     //
     try
         try
             RefreshCDS(cdsConfig);
             //
             M_VLPROMOCAO := 0;
             With QryDebito do
              begin
                   Active := False;
                   Params[0].AsString := uFuncoes.StrZero(aIdDebito,7);
                   Params[1].AsString := aNrParcela;
                   Prepare;
                   Active := True;
                   //
                   if not (IsEmpty) Then
                   begin
                        idDocumento := StrtoInt(aIdDebito+aNrParcela);
                        M_VLDOCU    := FieldByName('DEB_VLPARC').AsFloat;
                        M_VLPROMOCAO:= FieldByName('DEB_VLPROM').AsFloat;
                        aMensagemDesconto := '';
                        If (M_VLPROMOCAO > 0) then
                          aMensagemDesconto := #13+'DESCONTO DE R$ '+FormatFloat('###,##0.#0', M_VLPROMOCAO)+' AT� O VENCIMENTO.';
                        //aDataVenc   := uFuncoes.FormataData(FieldByName('DEB_DTVENC').AsString);
                        if uFuncoes.Empty(QryDebito.FieldByName('DEB_DTCOBR').AsString) Then
                            aDataVenc   := uFuncoes.FormataData(FieldByName('DEB_DTVENC').AsString)
                        Else
                            aDataVenc   := uFuncoes.FormataData(FieldByName('DEB_DTCOBR').AsString);
                        //
                        M_CDCLIE    := FieldByName('DEB_CDCLIE').AsString;
                        //
                        SelecionarCliente(M_CDCLIE);
                   End;
              end;
             //
             If FileExists(ExtractFilePath( Application.ExeName )+'logo.bmp') Then
                 aArquivoLogoRel := ExtractFilePath( Application.ExeName )+'logo.bmp';
             //
             PrepararTitulo(cdsConfigCEDENTE.AsInteger);
             //
             {idContaBancaria, idNumDocumento: Integer; M_FLSEGU: String}
             CONFIGURA_BOLETO(idDocumento, 'N');
             // Param.NRDOCU
             W_NRDOCU := uFuncoes.StrZero(aIdDebito,7)+'/'+uFuncoes.StrZero(aNrParcela,2);
             //
             //RPDev.Orientation := poPortrait;
             RVSystem1.SystemPrinter.Orientation   := poPortrait;
             {RPDev.SetPaperSize(DMPAPER_A4,0,0);
             RPDev.SelectPaper('A4 small sheet, 210- by 297-millimeters',false);}
             aNomeFantasia := cdsConfigFANTASIA.AsString;
             //
             //With RvBoleto do
             With RvBoletoFrenteVerso do
             begin
                  SetParam('pMSN_VENCIMENTO', '');
                  if not uFuncoes.Empty(QryDebito.FieldByName('DEB_DTCOBR').AsString) Then
                   Begin
                      SetParam('pData_Vencimento', uFuncoes.FormataData(QryDebito.FieldByName('DEB_DTCOBR').AsString));
                      if (QryDebito.FieldByName('DEB_DTVENC').AsString <> QryDebito.FieldByName('DEB_DTCOBR').AsString) Then
                           SetParam('pMSN_VENCIMENTO', 'VENCIMENTO ORIGINAL : '+uFuncoes.FormataData(QryDebito.FieldByName('DEB_DTVENC').AsString));
                   End
                  Else
                      SetParam('pData_Vencimento', uFuncoes.FormataData(QryDebito.FieldByName('DEB_DTVENC').AsString));
                  //    
                  {M_VLMULT := 0;
                  M_PEJURO := 0;}
                  M_PEMULT := dmADM.tbConfigPAR_PEMULT.AsFloat;
                  M_VLMULT := uFuncoes.Arredondar((uFuncoes.Gerapercentual(M_VLDOCU, M_PEMULT)),2);
                  M_PEJURO := dmADM.tbConfigPAR_PEJURO.AsFloat;

                  // valorparcela, juros, multa, dias, parcelas
                  M_VLJURO := uFuncoes.Arredondar((uFuncoes.Gerapercentual(M_VLDOCU + M_VLMULT, M_PEJURO)/30),2);
                  //
                  // X := StrtoDate(aDataVenc);
                  W_DATA := uFuncoes.Acrescentar_Dias_Data(StrtoDate(aDataVenc));
                  // QryDebito.FieldByName('aDataVencimento').AsDateTime
                  //uFuncoes.Datafinal(dmRelatorios.cdsConsultaCotaREC_DTVENC.AsDateTime, 10);
                  //
                  If ( aMsg = 'N') Then
                  begin
                       If (aMsgMultaJuros = 'S') Then
                       begin
                            SetParam('INSTRUCOES1','MULTA..: '+ FormatFloat('##0.#0', M_PEMULT) +'%  :: DE R$:  '+FormatFloat('##0.#0', M_VLMULT) +' APOS : '+aDataVenc+#13+
                                                   'JUROS..: '+ FormatFloat('##0.#0', M_PEJURO)+ '%  :: DE R$:  '+FormatFloat('##0.#0', M_VLJURO) +' AO DIA '+#13+#13+
                                         'SUJEITO A PROTESTO AP�S 3 DIAS DE ATRASO'+aMensagemDesconto);
                                         {'N�O RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia);}
                       End
                       Else
                       begin
                            SetParam('INSTRUCOES1',
                                         'N�O RECEBER APOS 5 DIAS DO VENCIMENTO'+#13+
                                         'APOS CINCO DIAS DO VENCIMENTO PAGAVEL'+#13+
                                         'SOMENTE NA '+ aNomeFantasia+aMensagemDesconto);
                       End;
                  End
                  Else
                  begin
                        SetParam('INSTRUCOES1', cdsConfigINSTRUCOES_BOLETO.AsString+aMensagemDesconto);
                  End;
                  // Taxas
                  SetParam('aTexto', ' ');
                  SetParam('aTextoValor',' ');
                  SetParam('aTaxas', ' ');
                  SetParam('pValorTaxa', ' ');
                  //
                  if uFuncoes.Empty(cdsConfigMENSAGEM1.AsString) Then
                      SetParam('INSTRUCOES2','Pague somente na Rede Banc�ria ou na Administradora')
                  Else
                      SetParam('INSTRUCOES2',cdsConfigMENSAGEM1.AsString);
                  //
                  SetParam('ESPECIE','R$');
                  SetParam('ESPECIEDOC','DM');
                  SetParam('pACEITE','N');
                  //
                  SetParam('NUM_BANCO', uFuncoes.StrZero(cdsConfigCOD_BANCO.AsString,3)+ '-'+gbTitulo1.Cedente.ContaBancaria.Banco.Digito);
                  SetParam('NOME_BANCO', 'BANCO DO BRASIL');
                  SetParam('LINDIG', uCodBarras.TgbCobCodBar.Create.GetLinhaDigitavel(M_CODIGOBARRAS));
                  SetParam('CODIGO', M_CODIGOBARRAS);
                  SetParam('DTPROC', DatetoStr(Date()));
                  if uFuncoes.Empty(cdsConfigMENSAGEM2.AsString) Then
                      SetParam('LOCAL_PAG', 'ATE O VENCIMENTO PAGAV�L EM QUALQUER BANCO')
                  Else
                      SetParam('LOCAL_PAG', cdsConfigMENSAGEM2.AsString);
                  //
                  SetParam('NMCEDE', cdsConfigRAZAO.AsString+ '    -    CNPJ: '+uFuncoes.FormataCNPJ(cdsConfigCNPJ.AsString));
                  //
                  SetParam('VLDOCU', FormatFloat('###,##0.#0', M_VLDOCU));
                  //
                  SetParam('VLDOCU1', FormatFloat('###,##0.#0',M_VLDOCU));
                  // Dados cliente
                  SetParam('NMSACA', qryLocClientesCLI_RASOCI.AsString);
                  SetParam('NOME_CLIENTE', qryLocClientesCLI_NMCLIE.AsString);
                  // SetParam('ENDCLIE', qryLocClientesCLI_ENCLIE.AsString+' - '+qryLocClientesCLI_BACLIE.AsString);
                  if uFuncoes.Empty(qryLocClientesCLI_NUMERO.AsString) Then
                      SetParam('ENDCLIE', qryLocClientesCLI_ENCLIE.AsString+' - '+qryLocClientesCLI_BACLIE.AsString)
                  Else
                      SetParam('ENDCLIE', qryLocClientesCLI_ENCLIE.AsString+', N�.'+qryLocClientesCLI_NUMERO.AsString+' - '+qryLocClientesCLI_BACLIE.AsString);
                  //
                  SetParam('pCIDADEUF', qryLocClientesCLI_BACLIE.AsString);
                  SetParam('CEPCIDUF', uFuncoes.FormataCep(qryLocClientesCLI_CEPCLI.AsString)+' - ' +qryLocClientesCLI_CICLIE.AsString+'/'+qryLocClientesCLI_UFCLIE.AsString );
                  //
                  {If (qryLocClientesCLI_.AsString = 'F') Then
                      SetParam('CPFCNPJ', uFuncoes.FormataCPF(qryLocClientesCLI_CPFCGC.AsString))
                  Else    }
                      SetParam('CPFCNPJ', qryLocClientesCLI_CPFCGC.AsString);
                  //
                  SetParam('pEMPRESA', cdsConfigFANTASIA.AsString);
                  //
                  SetParam('pEND_NOVO', cdsConfigENDERECO.AsString);   // texto
                  //SetParam('TEXTO_BOL', 'MENSAGEM DE TESTE');
                  SetParam('pEMPRESA', 'INFOG2 TECNOLOGIA LTDA');
                  SetParam('pENDERECO','AVENIDA JOS� DOS SANTOS E SILVA, N� 1769');
                  SetParam('pCOMPLEMENTO','ED. TALISM�, SALA 108, TERREO');
                  SetParam('pBAIRRO','CENTRO');
                  SetParam('pCEP','64001-300');
                  SetParam('pCIDADE','TERESINA-PI');
                  //
                  With gbTitulo1 do
                  begin
                       // Aqui
                       SetParam('NOSSONUM', gbTitulo1.NossoNumero + '-'+uCodBarras.Modulo11(gbTitulo1.NossoNumero,9));
                       //
                       SetParam('AGE_CEDENTE', Cedente.ContaBancaria.fCodigoAgencia+'-'+  Cedente.ContaBancaria.fDigitoAgencia
                                             +'/'+cdsConfigCEDENTE.AsString
                                             +'-'+uCodBarras.Modulo11(cdsConfigCEDENTE.AsString,9));
                                {+uCodBarras.Modulo11(NossoNumero
                                               +uFuncoes.StrZero(gbTitulo1.Cedente.ContaBancaria.fCodigoAgencia,4)
                                               +gbTitulo1.Cedente.ContaBancaria.fNumeroConta));}
                       //
                       SetParam('Carteira', gbTitulo1.Carteira);
                       if (cdsConfigCOD_BANCO.AsString = '001')
                         and (cdsConfigCARTEIRA.AsString = '18') Then
                            SetParam('Carteira', gbTitulo1.Carteira);  // +'/19'
                       SetParam('NRDOCU', Copy(W_NRDOCU,1,8)+Copy(W_NRDOCU,9,2));  // NumeroDocumento  +'/'
                       //SetParam('NRDOCU', W_NRDOCU);  // NumeroDocumento
                       //
                       If FileExists(aArquivoLogoRel) Then
                        begin
                            SetParam('pIMG', aArquivoLogoRel);
                            SetParam('pIMG2', aArquivoLogoRel);
                        End;
                  End;
                  //
                  If (aTipo = 'V') Then
                  begin
                       RvSystem1.DefaultDest := rdPreview;
                       RvSystem1.DoNativeOutput  := true;
                       Execute;
                  End;
                  //
                  If (aTipo = 'I') Then
                   begin                                            
                       RvSystem1.DefaultDest := rdPrinter;
                       // RvSystem1.SystemPrinter.Duplex := dupHorizontal;
                       if (aPrimeiraImp = 'S') Then
                           RvSystem1.SystemSetups    := RvSystem1.SystemSetups + [ssAllowSetup]
                       Else
                           RvSystem1.SystemSetups    := RvSystem1.SystemSetups - [ssAllowSetup];
                       RvSystem1.DoNativeOutput  := true;
                       Execute;
                   End;
                  //
                  If (aTipo = 'A') Then
                    begin
                      aNomePasta := ExtractFilePath( Application.ExeName )+'PDF';
                      if not DirectoryExists(aNomePasta) then
                         ForceDirectories(aNomePasta);
                      //
                      aDataVenc := uFuncoes.RemoveChar(aDataVenc);
                      aNomeArquivo   := aCodCliente+'_'+uFuncoes.StrZero(IntToStr(idDocumento),9)+'_'+aDataVenc+'.PDF';
                      //
                      try
                         aNomePasta := aNomePasta+'\'+aNomeArquivo;
                         RvSystem1.DefaultDest     := rdFile;
                         RvSystem1.SystemSetups    := RvSystem1.SystemSetups - [ssAllowSetup];
                         RvSystem1.DoNativeOutput  := False;
                         RvSystem1.OutputFileName  := aNomePasta;
                         RvSystem1.RenderObject    := RvRenderPDF1;
                         //
                         {SaveDialog1.Filter       := 'Acrobat Reader|PDF';
                         SaveDialog1.DefaultExt   := 'PDF';
                         SaveDialog1.FileName     := aArquivo;
                         RvSystem2.OutputFileName := SaveDialog1.FileName;}
                         //
                         Execute;
                      Except
                         Application.MessageBox(Pchar('Erro ao tentar exportar!'),
                            'Exporta��o',MB_OK + MB_ICONERROR);
                      End;
                   End;
             end;
         Except
               on e: exception do
             begin
                 Application.MessageBox(PChar('Erro ao tentar visualizar boleto!!! Erro:'+#13
                        + E.Message), 'ATEN��O', MB_OK+MB_ICONSTOP+MB_APPLMODAL);

             End;
         End;
     Finally

     End;

end;

procedure TdmADM.ApagarArquivoPDF;
var
    SR: TSearchRec;
    I: integer;
    aPasta : String;
begin
    aPasta := ExtractFilePath( Application.ExeName )+'PDF\';
    I := FindFirst(aPasta + '*.PDF', faAnyFile, SR);
    while I = 0 do
    begin
        if (SR.Attr and faDirectory) <> faDirectory then
            if not DeleteFile(PChar(aPasta + SR.Name)) then
                ShowMessage('N�o foi poss�vel excluir '+aPasta+ SR.Name);
        I := FindNext(SR);
    end;
end;

procedure TdmADM.ExcluirArquivoLista;
begin
     if FileExists(NomeDoLista) then
        DeleteFile(PChar(NomeDoLista));
     if FileExists(ListaNomeCliente) Then
        DeleteFile(PChar(ListaNomeCliente));
     // Apagar Arquivos PDF da pasta
     ApagarArquivoPDF;
end;

procedure TdmADM.AddEmailLista(aEmail, aArquivo, aCodCliente, aNomeCliente: String);
var
  Arquivo, ArqCliente : TextFile;
  aNomeFantasia : String;
begin
  //ChangeFileExt('Admin_'+ufuncoes.RemoveChar(DatetoStr(Date)), '.log');
  AssignFile(Arquivo, NomeDoLista);
  if FileExists(NomeDoLista) then
    Append(arquivo) { se existir, apenas adiciona linhas }
  else
    ReWrite(arquivo); { cria um novo se n�o existir }
  try
    WriteLn(arquivo, aEmail+'::'+aArquivo);

  finally
    CloseFile(arquivo)
  end;
  //
  // aNomeFantasia := GetNomeCliente(aCodCliente);
  AssignFile(ArqCliente, ListaNomeCliente);
  if FileExists(ListaNomeCliente) then
    Append(ArqCliente) { se existir, apenas adiciona linhas }
  else
    ReWrite(ArqCliente); { cria um novo se n�o existir }
  try
    WriteLn(ArqCliente, aCodCliente+'::'+aNomeCliente);
  finally
    CloseFile(ArqCliente)
  end;  
end;

function TdmADM.GetEmailCliente(aCodCliente: String): String;
Var
    QryAux : TQuery;
    aTexto : String;
begin
     Result := '';
     aTexto := 'Select CLI_CDCLIE, CLI_EMAIL1 from "ADMCLI.DBF" Where (CLI_CDCLIE = :pCDCLIE)';
     QryAux := TQuery.Create(nil);
     try
        With QryAux do
         begin
              DatabaseName := 'ADM';
              Close;
              SQL.Add(aTexto);
              ParamByName('pCDCLIE').AsString := aCodCliente;
              Open;
              //
              if not (IsEmpty) Then
                if not uFuncoes.Empty(FieldByName('CLI_EMAIL1').AsString) then
                   if (uFuncoes.ValidarEMail(FieldByName('CLI_EMAIL1').AsString)) Then
                        Result := FieldByName('CLI_EMAIL1').AsString;
          End;
     Finally
          QryAux.Free;
     End;
end;

end.

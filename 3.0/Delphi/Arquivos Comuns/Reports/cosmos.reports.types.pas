unit cosmos.reports.types;

interface

uses
  winapi.windows;

type
  {Mode de abertura de um arquivo de um relat�rio externo:
   omOpen = abre o arquivo.
   omPrint = impress�o do arquivo.}
  TOpenMode = (omOpen, omPrint);

  TPrintMode = (pmPreview, pmPrint);

  {Modo de execu��o da central de relat�rios:
   emExecuteCentral = abertura da central de relat�rios normal, para escolha do relat�rio a imprimir.
   emExecuteReport = Central de Relat�rios n�o � exibida, mas apenas executa um relat�rio.}
  TExecutionMode = (emExecuteCentral, emExecuteReport);

  TReportType = (rtCategory, rtReport, rtExternalReport, rtNone);

  TReportTool = (rtRave, rtFastReport);

  //Tipo de folha de presen�a: uma ou duas colunas
  TTipoFolhaPresenca = (tfSimples, tfDupla);

  //Lista de relat�rios do m�dulo secretarias.
  TReportsSecretarias = (rsMarcacaoPresenca = 1, rsEnderecosAlunos, rsFichaAluno, rsCarteirinhaAluno,
    rsRelacaoGeralAlunos, rsEntregaCirculares, rsFolhaPresenca, rsCadastradosDiscipulado,
    rsTotaisAlunos, rsHistoricoAluno, rsBoletimInformativo, rsEscalasAtividade,
    rsFolhaPresencaEI, rsTempoDiscipulado, rsListaProfissoes,  rsListaFuncoes, rsFichaJovemTM,
    rsEnderecosJovensTM, rsListaJovensTM, rsContabilizarFrequencia, rsContabilizarFrequenciaDiscipulado,
    rsCirculosEI, rsAniversariantesMes, rsFolhaPresencaMensal,
    rsEnderecosPesquisadores, rsListaPesquisadores, rsFichaPesquisador,
    rsRelatorioOrigem, rsSumarioEstatistico, rsMalaDiretaPimaco6280,
    rsMalaDiretaPimaco6281, rsOcorrenciasMes,
    rsFolhaPresencaConferencia, rsFolhaPresencaAtividade, rsEnvelope220x115,
    rsEnvelope250x175, rsFrequenciaPeriodo, rsEnderecosMembrosCirculos,
    rsListaTarefasSimples, rsListaTarefasAgrupada, rsFrequenciaPeriodoDiscipulado,
    rsFrequenciaTipoAtividade, rsFrequenciaCirculoEI, rsListaGeralAlunos,
    rsQuadroTotalizacaoRa, rsQuadroTotalizacaoRaTM, rsSumarioEstatisticoRa,
    rsFichasAlunos);

  //Lista de relat�rios do m�dulo confer�ncias.
  TReportsConferencias = (rcCrachas = 101, rcCrachaInscrito, rcListarTarefas,
   rcInscritosConferencia, rcInscritosDesalojados, rcMapaAlojamento, rcInfoInscritos,
   rcListaStaff, rcFolhasQuartos, rcProgramacao, rcAreasTarefasStaff, rcAlojadosQuartos);

  //Lista de relat�rios do m�dulo de usu�rios.
  TReportsUsuarios = (ruListaPerfis = 201, ruListaUsuarios);

  //Lista de relat�rios do m�dulo financeiro.
  TReportsFinanceiro = (rfSumarioCaixas = 250);




implementation

end.

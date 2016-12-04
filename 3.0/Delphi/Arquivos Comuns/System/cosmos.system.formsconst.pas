unit cosmos.system.formsconst;

interface

uses Windows;

type
  //Descri��o dos formul�rios embutidos (TDockedForm);
  TDockedFormDesc = class
    const
     FormAlunos = 'Janela principal de manipula��o dos dados cadastrais dos ' +
       'alunos do Lectorium Rosicrucianum.';
     FormAlocucoes = 'Disponibiliza recursos para cadastro de alocu��es.';
     FormTurmasTP = 'Janela principal de manipula��o dos dados das turmas de ' +
       'cursistas do Trabalho P�blico.';
     FormCirculosEI = 'Janela principal de manipula��o de dados dos c�rculos ' +
       'da Escola Interna e seus membros.';
     FormAgendaAtividades = 'Disponibiliza recursos para manipula��o da agenda ' +
       'de atividades promovidas por todo o campo de trabalho.';
     FormAlojamentos = 'Disponibiliza recursos para a gest�o dos alojamentos ' +
       'dos Centros de Confer�ncia.';
     FormClassificadores = 'Disponibiliza o cadastro geral de classificadores de leitos ' +
       'dos alojamentos.';
     FormTabAcessorias = 'Disponibiliza recursos para a edi��o de dados ' +
       'acess�rios.';
     FormHistorico = 'Disponibiliza recursos para a an�lise do hist�rico ' +
       'discipular de um aluno, jovem do TM, membro ou pesquisador.';
     FormControleFrequencia = 'Disponibiliza recursos para o controle da ' +
       'freq��ncia dos cadastrados nas atividades promovidas.';
     FormLivrosLicoesEI = 'Disponibiliza recursos para cadastro de ' +
       'refer�ncias a livros e li��es da Escola Interna.';
     FormPesquisadoresTP = 'Disponibiliza recursos para trabalho com ' +
       'informa��es sobre pesquisadores do Trabalho P�blico.';
     FormTarefas = 'Disponibiliza recursos para agendamento de tarefas a ' +
       'se executar.';
     FormMessages = 'Disponibiliza recursos para envio de mensagens a outros ' +
       'usu�rios do Cosmos.';
     FormInscricoes = 'Disponibiliza recursos para a inscri��o em confer�ncias.';
     FormDetalhamentoInscricoes = 'Disponibiliza recursos para cadastro de itens ' +
       'de detalhamento de inscri��es em confer�ncias.';
     FormTM = 'Janela principal de manipula��o dos dados cadastrais das ' +
       'crian�as e jovens do Trabalho da Mocidade.';
     FormTMB = 'Janela principal de manipula��o dos dados cadastrais dos ' +
       'membros do Trabalho da Membros.';
     FormInstalacoes = 'Disponibiliza informa��es sobre turmas de instalandos.';
     FormConferencias = 'Disponibiliza os recursos para a cria��o de confer�ncias ' +
       'e a montagem da sua programa��o.';
     FormCosmosUsers = 'Disponibiliza os recursos para a gest�o de informa��es ' +
       'sobre os usu�rios dos aplicativos Cosmos.';
     FormPlanoContas = 'Disponibiliza os recursos de cadastro de contas no ' +
       'plano de contas nacional da Escola Internacional da Rosacruz �urea.';
     FormRecebimentos = 'Disponibiliza os recursos de registro de recebimentos de ' +
        'mensalidades e outros valores de pessoas vinculadas � Escola Internacional ' +
        'da Rosacruz �urea.';
     FormCentroCustos = 'Disponibiliza informa��es sobre os centros de custos ' +
        'usados nas transa��es financeiras.';
     FormSimpatizantes = 'Disponibiliza informa��es sobre simpatizantes do ' +
        'Trabalho P�blico.';
     FormTransacoes = 'Disponibiliza informa��es sobre transa��es de cr�dito e ' +
        'd�bito.';
     FormMailTool = 'Ferramenta para envio de correio eletr�nico para alunos, ' +
        'jovens, membros e pesquisadores.';
     FormPerfis = 'Ferramenta para a configura��o dos direitos dos perfis de ' +
        'usu�rios do Cosmos.';
     FormAreasStaff = 'Disponibiliza recursos para o cadastro de �reas de staff ' +
        'do Centro de Confer�ncias.';
     FormStaff = 'Disponibiliza informa��es sobre o staff que atua em uma ' +
        'confer�ncias.';
     FormCentralPesquisas = 'Disponibiliza recursos de pesquisas para todas as ' +
        'aplica��es Cosmos.';
     FormUpdatesHistoric = 'Disponibiliza informa��es sobre as atualiza��es feitas ' +
        'nos aplicativos Cosmos.';
     FormFocos = 'Disponibiliza o cadastro de focos e regi�es administrativas.';
     FormOrgaosGestores = 'Disponibiliza o cadastro de �rg�os gestores.';
  end;

  TVersionInfo = class
    const
      VendorName = 'Vendedor: %s';
      CalculatorTitle = 'Calculadora';
      EXE = 'Execut�vel';
      DLL = 'Biblioteca';
      BPL = 'Extens�o de aplicativo';
      Unknown = 'Desconhecido';
      Descricao = 'Descri��o';
      FileVersion = 'Vers�o do Arquivo';
      ModuleCount = 'Total de m�dulos: %d';
  end;

//------Descri��es de p�ginas de configura��o----------------------------
  TConfigurationPagesDesc = class
    const
      ConfGerais = 'Configura��es diversas, v�lidas para todas as aplica��es ' +
        'do Cosmos.';
      ConfConexoes = 'Configura��es relativas �s conex�es estabelecidas com o ' +
        'servidor remoto, tais como protocolos de conex�o, endere�o do servidor etc.';
      ConfSistema = 'Configura��es relativas ao funcionamento do sistema, tais como ' +
        'a apar�ncia de elementos da tela, formato da ajuda instant�nea e logs do Cosmos.';
      ConfMessages = 'Configura��es relativas � ferramenta de envio e recebimento ' +
        'de mensagens do Cosmos.';
      ConfReceiptOptions = 'Configura��es necess�rias para a impress�o de recibos ' +
        'de recebimentos aceitos pela Tesouraria.';
      ConfMatriculasOptions = 'Configura��es necess�rias para a gera��o de novas ' +
        'matr�culas no Cosmos Gestor de Secretarias.';
      ConfConnectionsPool = 'Configura��es do pool de conex�es das aplica��es Cosmos. ';
  end;


implementation

end.

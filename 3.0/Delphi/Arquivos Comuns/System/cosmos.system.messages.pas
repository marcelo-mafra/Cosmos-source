unit cosmos.system.messages;

interface

uses Winapi.Windows;

const



//aSucessfullLogin = 'A autentica��o foi feita com sucesso!';
//sSearchServers = 'Buscando os servidores remotos...';

//Confer�ncias
sRepNameCrachasInscricao = 'Crach�s de Inscri��o';
sRepNameCrachaInscrito = 'Crach� de Inscrito';
sRepNameListaInscritos = 'Lista de Inscritos';

//Constantes usadas nos assistentes
sUsuario = 'Usu�rio: %s';
sLogin = 'Login (deve ser �nico): %s';
sRole = 'Grupo: %s';

//Itens de op��es usadas nas TaskDialogs
//sCancelarInscricao = 'Cancelar a inscri��o selecionada!';
//sCancelarOperacao = 'Cancelar a opera��o corrente!';

 type
  //Constantes relacionadas a caixas de mensagens.
  TMessagesConst = class
    const
     //C�digos de mensagens
     IdMsg_UnregisteredApp = 1;
     IdMsg_FalhaRegistro = 2;
     IdMsg_ConfigPageNotFound = 3;
     //Cardinais
     RES_SUCESS = 0;
     RES_NO_PARTICIPANTES = 1;
     RES_ERROR = 2;
     //Bot�es de caixas de di�logo
     TitleInfo = 'Informa��o';
     TitleConf = 'Confirma��o';
     TitleError = 'Erro';
     TitleWarn = 'Aviso';
     BtOK = '&OK';
     BtCancel = '&Cancelar';
     BtYes = '&Sim';
     BtNo = '&N�o';
     BtIgnore = '&Ignorar';
     BtRetry = '&Retentar';
     BtHelp = '&Ajuda';
  end;


  //Conex�o
  TConnectionsConst = class
    const
     TCP = 'TCP/IP';
     HTTP = 'HTTP';
     HTTPS = 'HTTPS';
  end;

  //Seguran�a
  TSecurityConst = class
    const
     WriteRight = 'Escrita';
     ReadRight = 'Leitura';
     AdministratorUser = 'Administrador do sistema';
     NormalUser = 'Usu�rio regular';
  end;

  //Certificados
  TCertificateConst = class
    const
     certType = 'Tipo';
     Owner = 'Requerente';
     Website = 'Website';
     Email = 'Email';
     Country = 'Pa�s';
     State  = 'Estado';
     Location = 'Cidade';
     SigAlgName = 'SigAlgName';
     Assinatura = 'Assinatura';
     Algoritm = 'Algoritmo de assinatura';
     NotBefore = 'V�lido a partir de';
     NotAfter = 'V�lido at�';
     SerialNumber = 'N�mero de s�rie';
  end;

  //Caminhos da registry do windows.
  TRegistryPaths = class
    const
     LocalMachineKey = HKEY_LOCAL_MACHINE;
     CurrentUserKey = HKEY_CURRENT_USER;
     AllUsersKey = HKEY_USERS;
     RegRoot = 'software\Lectorium Rosicrucianum\Cosmos\3.5';
     CosmosOptions = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Opcoes';
     GFocosOptions = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Focos Manager\Opcoes';
     SecretariasOptions = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Secretarias\Opcoes';
     FinanceiroOptions = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Financeiro\Opcoes';
     UsuariosOptions = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Usuarios\Opcoes';
     ConferenciasOptions = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Conferencias\Opcoes';
     RootUpdates = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Updates';
     MailTool = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Cosmos\Opcoes\MailTool';
     Searchs = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Cosmos\Opcoes\Searchs';
     Windows = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Cosmos\Opcoes\Janelas';
     Logs = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Cosmos\Opcoes\Logs';
     Messages = 'software\Lectorium Rosicrucianum\Cosmos\3.5\Cosmos\Opcoes\Messages';
  end;

  //Pastas de sistema usadas pelo Cosmos.
  TCosmosPaths = class
    const
      FocosReportsFolder = 'Focos';
      SecretariasReportsFolder = 'Secretarias';
      FinanceiroReportsFolder = 'Financeiro';
      UsuariosReportsFolder = 'Usuarios';
      ConferenciasReportsFolder = 'Conferencias';
      //Pastas do sistema
      CommonCosmosPath = '\Lectorium Rosicrucianum\Cosmos\3.5\';  //do not localize!
      UpdatesPath = 'Updates\';  //do not localize!
  end;


  //Arquivos usados pelo Cosmos, tais como arquivos de relat�rios, dicas etc.
  TCosmosFiles = class
    const
     //Execut�veis do sistema
     LogsReader = 'logrdr.exe';
     //Arquivo de vers�o de tabelas buferizadas.
     BufTab = 'buftab.info';
     //Relat�rios
     FocosReportFile = 'gfocos.rav';
     SecretariasReportFile = 'gsec.rav';
     FinanceiroReportFile = 'gfin.rav';
     UsuariosReportFile = 'gusers.rav';
     ConferenciasReportFile = 'gconf.rav';
     //Arquivos de dicas (tips)
     TipsSecretarias = 'gsec.tips';//Arquivo de dicas do Gestor de Secretarias
     TipsGFocos = 'gfocos.tips';//Arquivo de dicas do Gestor de Focos
     TipsFinanceiro = 'gfin.tips';//Arquivo de dicas do Gestor de Secretarias
     TipsGUsuarios = 'gusers.tips';//Arquivo de dicas do Gestor de Focos
     TipsGConferencias = 'gconf.tips';//Arquivo de dicas do Gestor de Confer�ncias
     ToolsGFocos = 'gfocos.tools';
     ToolsSecretarias = 'gsec.tools';
     ToolsFinanceiro  = 'gfin.tools';
     ToolsConferencias = 'gconf.tools';
     ToolsUsuarios = 'gusers.tools';
     ReportsParamsValues  = 'reports.conf';
     //Filtros de caixas de di�logo para sele��o de arquivos.
     ExcelFilter = 'Arquivos Excel (*.xlsx)|*.xlsx';
     XmlFilter = 'Arquivos XML (*.xml)|*.xml';
     CsvFilter = 'Arquivos CSV (*.csv)|*.csv';
     DocFilter = 'Documentos do MSWord (*.docx)|*.docx';
     HTMLFilter = 'Arquivos HTML (*.htm, *.html)|*.htm; *.html';
     TXTFilter = 'Arquivos Texto (*.txt)|*.txt';
     OpenOfficeFilter = 'Arquivos ODT (*.odt)|*.odt';
     //Arquivos buferizados
     BufAptidoes = 'aptidoes.buf';
     BufCargos = 'cargos.buf';
     BufDiscipulados = 'discipulados.buf';
     BufEnfermidades = 'enfermidades.buf';
     BufFuncoes = 'funcoes.buf';
     BufMentors = 'viw_mentores_ra.buf';
     BufFocos = 'focos.buf';
     BufEnderecosFocos = 'viw_enderecos_focos.buf';
     BufDirecoes = 'direcoes.buf';
     BufExternalReports = 'extreports.buf';
     BufPerfis = 'perfis.buf';
     BufProfissoes = 'profissoes.buf';
     SiglasEventos = 'siglas_eventos.buf';
     BufTiposEventos = 'tipos_eventos.buf';
     //Arquivos de tarefas
     TaskFile = '%s.tasks';
     //Arquivos do sistema de ajuda.
     HelpFileFocos = 'gfocos.chm';
     HelpFileSecretarias = 'gsec.chm';
     HelpFileFinanceiro = 'gfin.chm';
     HelpFileUsuarios = 'gusers.chm';
     HelpFileConferencias = 'gconf.chm';
     ManualCosmos = 'Cosmos.pdf'; //do not localize!
     //Arquivos de configura��o
     ConfigFormsInfo  = 'FormsInfo.xml';
     ConfigCentralPesquisas = 'CentralPesquisa.xml';
     ConfigUserDefault = 'ConfigurationsUsers(Default).xml';
     ConfigUser = 'ConfigurationsUsers.xml';
     ConfigFolders =  'CosmosFolders.ini';
     ConfigReportsParams = 'ReportsParams.xml';
     CosmosRoot = 'CosmosRoot.ini';
     dbxconnections = 'dbxconnections.ini';
     RolesPermissions = 'RolesPermissions.xml';
     FieldsInfo = 'FieldsInfo.xml';
     ReportsParams = 'ReportsParams.xml';
     CentralPesquisas = 'CentralPesquisas.xml';
  end;


  //Nomes dos aplicativos Cosmos
  TCosmosAppName = class
    const
      CosmosCommonId = 'cmAll';
      CosmosSecretariasId = 'cmSecretarias';
      CosmosFocosId = 'cmFocos';
      CosmosUsuariosId = 'cmUsuarios';
      CosmosFinanceiroId = 'cmFinanceiro';
      CosmosConferenciasId = 'cmConferencias';
      CosmosSecretarias = 'Cosmos Gestor de Secretarias';
      CosmosFocos = 'Cosmos Gestor de Focos';
      CosmosUsuarios = 'Cosmos Gestor de Usu�rios';
      CosmosFinanceiro = 'Cosmos Gestor Financeiro';
      CosmosConferencias = 'Cosmos Gestor de Confer�ncias';
      CosmosSecretariasShort = 'gsec';
      CosmosFocosShort = 'gfoc';
      CosmosUsuariosShort = 'gusu';
      CosmosFinanceiroShort = 'gfin';
      CosmosConferenciasShort = 'gcon';
  end;

  //Ajuda
  TCosmosHelp = class
    const
      CosmosSuportUrl = 'http://www.lectoriumrosicrucianum.org.br';
  end;

  //Chaves de criptografia.
  TCosmosCriptography = class
    const
      EKey = '8517536429'; //do not localize!
      CipherKey = '8954605'; //do not localize!
  end;

  //Registro dos aplicativos
  TCosmosRegister = class
    const
      InvalidCosmosLicence = 'O arquivo de registro de licen�a n�o pode ser usado ' +
        'para registrar uma c�pia do %s!';
      InvalidFile = 'O arquivo de registro de licen�a do Cosmos n�o � v�lido';
      InvalidFileToComputer = 'O arquivo de registro de licen�a do Cosmos n�o � ' +
        'v�lido para este computador!';
      NotValidateKey =  'Os dados de registro n�o foram validados! O registro ' +
        'n�o pode ser efetuado! Use outro arquivo de registro.';
      NotRegistered = 'A aplica��o n�o pode ser registrada. Entre em contato com ' +
        'o fornecedor do aplicativo para obter suporte!';
      //Guids usadas para o registro
      GUID_GFocos = '{3504F0B1-C475-4CCB-96D7-E8EC58861C0D}'; //do not localize!
      GUID_Secretarias = '{F22DB419-DD5B-4076-A59C-71DA28CC2C40}'; //do not localize!
      GUID_Financeiro = '{D490AD04-7E5F-43CC-9CAA-E9F5BECE2FE2}';//do not localize!
      GUID_Conferencias = '{F2BFD094-035F-4251-AD15-6BD95B172C23}';//do not localize!
      GUID_Usuarios = '{7B295BA9-DA5C-4EB9-B286-3C4F81FBA86C}';//do not localize!
      RegisteredCopy = 'Aplicativo registrado!';
      UnregisteredCopy = '[c�pia n�o registrada]';
      InfoRegisterFocusName = 'Voc� deve informar o nome do foco!';
      InfoRegisterUserName = 'Voc� deve informar o nome do usu�rio!';
      InfoRegisterEmail = 'Voc� deve informar o correio eletr�nico!';
      InfoRegisterIncorrectEmail = 'O correio eletr�nico fornecido parece n�o estar correto!';
      InfoCloseUnregisteredApp = 'Esta aplica��o n�o se encontra licenciada. ' +
        'Apenas aplica��es licenciadas da su�te Cosmos podem ser executadas. A aplica��o ser� encerrada.';
  end;

  TEmailConst = class
   const
      NewEmailSubject = 'Nova mensagem';
      NewEmailBody = 'Escreva aqui a sua mensagem';
  end;

    ///<summary>
   ///  Classe que ordena pequenas strings usadas como parte de registros de
   /// logs. </summary>
   TCosmosLogs =  class
    const
      CommandId             = 'N�mero do comando: %d';
      SQLCommand            = 'Comando executado: %s';
      SQLStoredProc         = 'Stored procedure: %s';
      SQLParamsInfo         = 'Par�metro: %s: Valor: %s';
      SequenceName          = 'Sequence: %';
      ExecutedRemoteCommand = 'Comando remoto executado com sucesso: %s';
      ExecutedRemoteCommandFail = 'Falha na execu��o do comando remoto: %s';
      ExecuteScriptBegin    = 'Inicianado a execu��o de script de comandos. Script: %s';
      ExecuteScriptEnd      = 'T�rmino da execu��o de script de comandos. Script: %s';
      LogSystemStarted          = 'O servi�o de registro de logs foi inicializado com sucesso!';
      //Tipos de logs
      InfoLogType               = 'Informa��o';
      ErrorLogType              = 'Erro';
      WarnLogType               = 'Aviso';
      PrepareLogType            = 'Prepare';
      TraceLogType              = 'Trace';
      AuthLogType               = 'Autentica��o';
      AuthFailLogType           = 'Autentica��o inv�lida';
      AutLogType                = 'Autoriza��o';
      ConLogType                = 'Conex�o';
      ConErrorLogType           = 'Falha na conex�o';
      ConCloseLogType           = 'Conex�o encerrada';
      DatabasePoolCreated       = 'Database pool criado com sucesso.';
      RemoteCallLogType         = 'Chamada remota';
      RemoteCallErrorLogType    = 'Falha na chamada remota';
      UnknownLogType            = 'Desconhecido';
      InitializedServer         = 'Servidor inicializado.';
      AuthorizationsMethods     = 'Autoriza��es de acesso a m�todos remotos carregada com sucesso!';
      ErrorCode                 = 'C�digo do erro: %d';
      ContextInfoSession        = 'Se��o: %d';
      ContextInfoUser           = 'Usu�rio: %s';
      ContextInfoRoles          = 'Perfis: %s';
      ContextInfoProtocol       = 'Protocolo: %s';
      ConnectedUser             = 'Usu�rio %s conectado ao Cosmos com sucesso!';
      DisconnectedUser          = 'Usu�rio %s desconectado do Cosmos com sucesso!';
      AutenticatedUser          = 'Usu�rio %s autenticado com sucesso!';
      InactivedUser             = 'O usu�rio %s est� inativo. Ele n�o pode acessar as aplica��es Cosmos.';
      IncorrectLogin            = 'Falha na tentativa de login. Usu�rio: %s. Mensagem: %s';
      IncorrectStatment         = 'Falha na execu��o de comando sql: %s';
      InvalidAuthentication     = 'Autentica��o inv�lida de usu�rio! Login: %s';
      BlockedUser               = 'O usu�rio %s est� bloqueado. Ele n�o pode acessar as aplica��es Cosmos.';
      AuthorizedRoles           = 'Perfis autorizadas a acessar o m�todo: %s';
      DeniedAuthorization       = 'O usu�rio %s n�o est� autorizado a acessar o m�todo "%s"!';
      CantAcessCosmosModule     = 'Usu�rio n�o est� autorizado a acessar este aplicativo ' +
          'do Cosmos. Procure um administrador do sistema para solicitar a permiss�o de acesso.';
      AppMethod                 = 'AppMethod: %s';
      NetOnConnectEvent         = 'Recebendo solicita��o de conex�o de rede.';
      NetOnDisconnectEvent      = 'Conex�o do usu�rio encerrada.';
      NetTransportClientIp      = 'Client IP: %s';
      NetTransportClientPort    = 'Porta de comunica��o: %s';
      NetTransportProtocol      = 'Protocolo de comunica��o: %s';
      ConnectingToHost          = 'Conectando ao servidor remoto em %s ...';
      PrepareConnect            = 'Preparando a conex�o do usu�rio %s...';
      PrepareDisconnect         = 'Preparando a desconex�o do usu�rio %s...';
      Preparing                 = 'Preparando a execu��o do m�todo %s...';
      VerifyingIdentity         = 'Verificando identidade do usu�rio %s...';
      GettingAuthorizations      = 'Obtendo permiss�es do usu�rio %s...';
      ApplyPermissions          = 'Aplicando as permiss�es do usu�rio e montando o ambiente. Por favor, aguarde.';
      LoadingData               = 'Carregando dados do servidor para in�cio da se��o...';
      CheckingCertificate       = 'Verificando validade do certificado digital recebido...';
      CreatingConnectionsPool   = 'Criando o pool de conex�es e ativando-o. Por favor, agarde um momento.';
      BufferingData             = 'Recuperando dados do servidor para utiliza��o durante a se��o de trabalho...';
      //Indicadores de sensibilidade dos logs
      Baixa = 'Baixa';
      Media = 'M�dia';
      Alta = 'Alta';
      SettingFolders            = 'As configura��es de pastas do sistema foram lidas com sucesso.';
      //T�tulos usados apenas no sistema de logs.
      TitlePrepare= 'Prepare';
      TitleTrace= 'TraceInfo';
      TitleAuthenticate='Authenticate';
      TitleAuthorize='Authorization';
   end;

   TCosmosReportsNames = class
    const
      //Nomes de relat�rios
      {sRepNameCarteiraLEC = 'Carteirinha do Aluno';
      sRepNameCarteiraTMB = 'Carteirinha do Membro';
      sRepNameFichaCadastralLEC = 'Ficha do aluno';
      sRepNameFichaCadastralTM = 'Ficha do jovem';
      sRepNameFichaCadastralTMB = 'Ficha do membro';
      sRepNameFichaCadastralTP = 'Ficha do pesquisador';
      sRepNameHistorico = 'Hist�rico Discipular';
      sRepBoletimInformativo = 'Boletim Informativo';
      sRepFolhaPresenca = 'Folha de Presen�a (2 colunas)';
      sRepFolhaPresencaSimples = 'Folha de Presen�a';
      sRepFolhaPresencaCirculo = 'Folha de Presen�a da Escola Interna';
      sRepMembrosCirculos = 'Membros dos C�rculos';
      sRepCadastradosByDiscipulado = 'Cadastrados por discipulados'; }
      EscalasAtividades = 'Escalas de Atividades';
      ExternalReports = 'Relat�rios Externos';

   end;

  TCosmosSearchsInfo = class
    const
     //Searchs Names
     SearchFocoRegiao = 'Regi�es Administrativas';
     SearchFocosFocos = 'Rela��o de Focos Cadastrados';
     SearchFocosAtivos = 'Focos Ativos';
     SearchMeiosContatos = 'Meios de Contatos';
     SearchPaises = 'Pa�ses Cadastrados';
     SearchEstados = 'Estados';
     SearchCidades = 'Cidades';
     SearchBairros = 'Bairros de Cidades';
     SearchLogradouros = 'Logradouros';
     SearchOrgaosGestores = '�rg�os Gestores';
     SearchCargos = 'Cargos';
     SearchDiscipuladosEE = 'Discipulados da Escola Externa';
     SearchDiscipuladosEI = 'Discipulados da Escola Interna';
     SearchDiscipuladosLEC = 'Discipulados do Lectorium Rosicrucianum';
     SearchDiscipuladosTM = 'Grupos do Trabalho da Mocidade';
     SearchDiscipuladosTMB = 'Grupos do Trabalho de Membros';
     SearchEnfermidades = 'Enfermidades';
     SearchFocos = 'Lista de focos ativos';
     SearchLicoesEI = 'Li��es da Escola Interna';
     SearchProfissoes = 'Profiss�es';
     SearchFuncoes = 'Fun��es Exercidas';
     SearchEventosDiscipulares = 'Eventos Discipulares do TP';
     SearchAptidoes = 'Aptid�es';
     SearchRegioesAdministrativas = 'Regi�es Administrativas do Lectorium Rosicrucianum';
     SearchCartasTP = 'Cartas informativas do trabalho P�blico';
     SearchClassificadoresLeito = 'Classificadores de leitos';
     SearchClassificadores = 'Classificadores';
     SearchAlojamentos = 'Alojamentos';
     SearchLeitosAlojamentos = 'Leitos';
     SearchFlagsInscricoes = 'Informa��es de Inscri��es';

     //Searchs Descriptions
     SearchDescDiscipuladosEI = 'Lista os discipulados da Escola Interna.';
     SearchDescDiscipuladosEE = 'Lista os discipulados da Escola Externa.';
     SearchDescDiscipuladosLEC = 'Lista os discipulados do Lectorium Rosicrucianum.';
     SearchDescDiscipuladosTM = 'Lista os grupos do Trabalho da Mocidade.';
     SearchDescDiscipuladosTMB = 'Lista os grupos do Trabalho de Membros.';
     SearchDescEnfermidades = 'Lista as enfermidades cadastradas.';
     SearchDescFocos = 'Lista os focos atualmente ativos.';
     SearchDescFocosWithPupils = 'Lista os n�cleos, n�cleos e centros de ' +
      'confer�ncias e sedes atualmente ativos.';
     SearchDescFocosPesquisadores = 'Lista os n�cleos, n�cleos e centros de ' +
      'confer�ncias, sedes e salas e locais do Trabalho P�blico atualmente ativos.';
     SearchDescLicoesEI = 'Lista as li��es dos discipulados da Escola Interna.';
     SearchDescProfissoes = 'Lista as profiss�es atualmente cadastradas.';
     SearchDescMeiosContatos = 'Lista os tipos de meios de contatos cadastrados.';
     SearchDescTipoAtuacao = 'Lista as fun��es exercidas por escalados em atividades.';
     SearchDescTipoEvento = 'Lista os tipos de eventos discipulares do hist�rico ' +
      'discipular de um cadastrado.';
     SearchDescCargos = 'Lista os cargos cadastrados.';
     SearchDescFuncoes = 'Lista as fun��es cadastradas.';
     SearchDescAptidoes = 'Lista as aptid�es dispon�veis para um aluno.';
     SearchDescRegioesAdministrativas = 'Lista as regi�es e subregi�es administrativas ' +
       'do Lectorium Rosicrucianum';
     SearchDescCartasTP = 'Lista as cartas informativas do Trabalho P�blico';
     SearchDescClassificadoresLeito = 'Lista os classificadores que podem ser atribu�dos ' +
       'a leitos de um alojamento.';
     SearchDescClassificadoresCadastrado = 'Lista os classificadores que podem ser atribu�dos ' +
       'a pessoas que s�o alojadas durante uma confer�ncia.';
     SearchDescAlojamentos = 'Lista os alojamentos dispon�veis para o foco atual.' ;
     SearchDescLeitosAlojamentos = 'Lista os leitos dispon�veis nos diversos ' +
       'alojamentos do foco atual.' ;
     SearchDescFlagsInscricoes = 'Lista as informa��es de inscri��es que podem ' +
       'ser utilizadas para confer�ncias promovidas por qualquer centro de confer�ncia.' ;
  end;



  //Constantes usadas em diversos pontos da interface gr�fica do usu�rio.

  TCosmosGUIElements = class
   const
    //sBtSaveTasks = 'Salvar as altera��es nas minha lista de tarefas';
    //sBtNoSaveTasks = 'Abandonar as altera��es feitas';
    BtImportarInscritos = 'Importar inscri��es.';
    BtNaoImportarInscritos = 'N�o importar!';
    SelectFolder = 'Selecione um pasta.';
    //Itens de caixas de di�logo
    MSWordCaption = 'Cosmos: Ata de Posse';
    NovaTarefa = 'Nova tarefa';
    TurmasAno = 'Turmas de instala��o em %d';
    ConferencesCalendar = 'Calend�rio de Confer�ncias para %d';
    TodosFocos = '(Todos os focos...)';
    //Esferas de atua��o dos �rg�os gestores
    EsferaInternacional = 'Internacional';
    EsferaNacional = 'Nacional';
    EsferaRegional = 'Regional';
    EsferaLocal = 'Local';
  end;


  //Textos da janela de personaliza��o de menus e barras de ferramentas
   TCustomizeDlgMsg =  class
    const
      Caption                        = 'Personalizar';
      CloseBtnCaption                = '&Fechar';
      ToolbarsTabCaption             = '&Barra de Ferramentas';
      ActionsTabCaption              = '&Comandos';
      OptionsTabCaption              = '&Op��es';
      ToolbarsLblCaption             = 'Barras de Ferramentas';
      LargeIconsChkCaption           = 'Usar �cones grandes';
      DescGroupBoxCaption            = 'Descri��o';
      CaptionOptionsGrpCaption       = 'Op��es';
      SeparatorBtnCaption            = 'Separadores...';
      SeparatorBtnHint               = 'Separadores...|Arraste para criar separadores';
      Label4Caption                  = 'Op��es de T�tulos';
      ApplyToAllActnCaption          = 'Todas as barras de ferramentas';
      ActionsCatLblCaption           = 'Categorias';
      ActionsActionsLblCaption       = 'Comandos';
      InfoLblCaption                 = 'Para adicionar comandos, arraste e solte um item de Categorias ou Comandos para uma barra de ferramenta.';
      PersonalizeLblCaption          = 'Personaliza��es';
      RecentlyUsedActnCaption        = 'Exibir primeiro itens usados recentemente';
      ShowHintsActnCaption           = 'Exibir hints de ajuda';
      ShowShortCutsInTipsActnCaption = 'Exibir atalhos nos hints';
      Label1Caption                  = 'Anima��es';
      ResetUsageDataActnCaption      = 'Reset...';
      OtherLblCaption                = 'Outros';
   end;

   //Constantes dos assistentes do Cosmos
   TWizardsConst = class
     const
      NextPage = '&Pr�ximo';
      Finish = '&Concluir';
   end;

   TAlojamentosConst = class
    const
      AlojamentoProprio = 'Pr�prio';
      AlojamentoExterno = 'Externo';
      QuartoBloqueado = 'Bloqueado';
      QuartoEmUso = 'Em uso';
      Quarto = 'Quarto %s (Ala: %s)';
      Leito = 'Leito %d';
   end;

   ///<summary>
   ///  Classe que ordena os t�tulos das mensagens de caixas de di�logo.
   ///</summary>
   TCosmosTitles =  class
    const
      SystemFailure       = 'Falha de sistema';
      HelpSystem          = 'Sistema de ajuda';
      Security            = 'Seguran�a';
      ServerConection     = 'Conex�o com o servidor';
      SelectData          = 'Sele��o de dados';
      UpdateData          = 'Salvamento de dados';
      UpdateSystem        = 'Atualiza��o do Sistema';
      ExportData          = 'Exporta��o de dados';
      ServerDateTime      = 'Data/hora do servidor';
      Atenttion           = 'Aten��o!';
      UnregisteredApp     = 'Registre esta aplica��o!';
      FalhaRegistro       = 'Falha no registro!';
      DeleteTipoAtividade = 'Exclus�o de tipos de atividades';
      Autentication       = 'Autentica��o de usu�rio';
      Users               = 'Gest�o de Usu�rios';
      Permissoes          = 'Gest�o de Permiss�es';
      CanceledAutentication = 'Autentica��o cancelada!';
      InvalidAutentication = 'Autentica��o inv�lida!';
      ErrorAutentication  = 'Falha durante a autentica��o!';
      OpenFocus           = 'Abertura de foco';
      TM                  = 'Trabalho da Mocidade';
      TMB                 = 'Trabalho de Membros';
      TP                  = 'Trabalho P�blico';
      Frequencia          = 'Controle de freq��ncia';
      ErrorSelectData     = 'Falha na obten��o dos dados!';
      EI                  = 'Escola Interna';
      EIBook              = 'Livros da Escola Interna';
      EILesson            = 'Li��es da Escola Interna';
      CadastradosSearch   = 'Pesquisa de cadastrados';
      NovaTurmaTP         = 'Nova turma do Trabalho P�blico';
      NovoCirculoEI       = 'Novo c�rculo da Escola Interna';
      DesligarCadastrado  = 'Desligamento de cadastrados';
      TransferirCadastrado = 'Transfer�ncia de cadastrados';
      ReativarCadastrado  = 'Reativa��o de cadastrados';
      RetrogradarCadastrado = 'Retrograda��o de cadastrado';
      BatizarCadastrado   = 'Batismo';
      CasarCadastrados    = 'Casamento';
      CartaFrequencia     = 'Carta de freq��ncia';
      ExecuteScript       = 'Falha na escrita de dados!';
      ExecuteDML          = 'Falha na execu��o de comando!';
      NovaMatricula       = 'Nova matr�cula';
      InstalarMembro      = 'Instala��o de membros';
      HistoricoDiscipular = 'Hist�rico discipular';
      LivrosEI            = 'Livros da Escola Interna';
      ControleFrequencia  = 'Controle de freq��ncia';
      TurmasInstalacao    = 'Turmas de instala��o';
      TurmasTP            = 'Turmas do Trabalho P�blico';
      DiscipuladosTM      = 'Discipulados do Trabalho da Mocidade';
      GJA                 = 'Grupo de Jovens Alunos';
      AgendaAtividades    = 'Agenda de atividades';
      Escalas             = 'Escalas de Atividades';
      GetCommands         = 'Recupera��o de comandos';
      Conferencias        = 'Gest�o de confer�ncias';
      Classificadores     = 'Classificadores';
      PesquisaDados       = 'Pesquisa de dados';
      TasksTool           = 'Tarefas';
      InscricoesConferencia = 'Inscri��es para confer�ncia';
      AreasStaff          = '�reas de Staff';
      ReportParams        = 'Par�metros de Relat�rios';
      PlanoContas         = 'Plano de Contas';
      Recebimentos        = 'Recebimentos';
      CentrosCusto        = 'Centros de Custo';
      NovoFoco            = 'Novo Foco';
      ExcluirFoco         = 'Exclus�o de Foco';
      RAs                 = 'Regi�es Administrativas';
      ExcluirRA           = 'Exclus�o de Regi�o Administrativa';
      FocosUpdate         = 'Altera��o de Foco';
      FocosSearch         = 'Pesquisa de Focos';
      RaSearch            = 'Pesquisa de Regi�es Administrativas';
      MentoresRa          = 'Mentores de RA' + '''' + 's';
      Alojamentos         = 'Alojamentos';
      Alunos              = 'Alunos';
      CirculosEI          = 'C�rculos da Escola Interna';
      Bairros             = 'Bairros';
      Logradouros         = 'Logradouros';
      Cidades             = 'Cidades';
      Estados             = 'Estados';
      Staff               = 'Staff de Confer�ncias';
      Enderecos           = 'Endere�os';
      OrgaosGestores      = '�rg�os Gestores';
      Gestoes             = 'Mandatos';
      Dirigentes          = 'Dirigentes';
      Alocucoes           = 'Alocu��es';
      DataValidation      = 'Valida��o de dados';
      CentralPesquisas    = 'Central de Pesquisas';
      Familiares          = 'Familiares';
      InformacoeMedicas   = 'Informa��es M�dicas';
      Funcoes             = 'Fun��es';
      Aptidoes            = 'Aptid�es';
      LogsCosmos          = 'Logs do Cosmos';
      ConfConexoes        = 'Conex�es';
      ConfServidores      = 'Servidores';
      ConfPool            = 'Pool de Conex�es';
      ConfGerais          = 'Configura��es Gerais';
      ConfEmail           = 'Correio Eletr�nico';
      ConfGUI             = 'Apar�ncia do Aplicativo';
      ConfElements        = 'Elementos Centrais';
      ConfMenuLateral     = 'Menu Lateral';
      ConfMatriculas      = 'Gera��o de Matr�culas';
      Messages            = 'Mensagens';
      ConfMessages        = 'Mensages do Usu�rio';
      ConfAtualizacoes    = 'Atualiza��es';
      ConfSecretarias     = 'Secretarias';
      ConfFinanceiro      = 'Financeiro';
      ConfReceiptsOptions = 'Impress�o de Recibos';
      ReportsCenter       = 'Central de Relat�rios';
      MeiosContato        = 'Meios de Contato';
      Caixa               = 'Caixa';
      IdentificaoAtiva    = 'Identifica��o Ativa';
      ContasBancarias     = 'Contas Banc�rias';
      Focos               = 'Focos';
      NewRA               = 'Nova RA';
      NewSubRa            = 'Nova Subregi�o Administrativa';
      RenameRA            = 'Renomear RA';

 end;


   ///<summary>
   ///  Classe que ordena as mensagens de informa��o de caixas de di�logo.
   ///</summary>
   TCosmosInfoMsg = class
     const
       NoFocusAcess = 'Voc� n�o possui direitos de acesso a qualquer foco cadastrado! ' +
           'Entre em contato com um membro da Comiss�o Nacional de Inform�tica para obter ' +
            'privil�gios de acesso aos dados do seu foco.';
       FrequenciaComputada = 'O levantamento de freq��ncia para esta atividade j� ' +
           'foi iniciado. Agora voc� pode continuar a apura��o.';
       TransferenciaRegistrada = 'A transfer�ncia foi registrada com sucesso no hist�rico discipular!';
       BatismoRegistrado = 'O batismo foi registrado com sucesso no hist�rico discipular!';
       CasamentoRegistrado = 'O casamento foi registrado com sucesso nos hist�ricos discipulares dos nubentes!';
       RetrogradacaoRegistrada = 'A retrograda��o foi registrada com sucesso no hist�rico discipular!';
       RetrogradacaoImpossivel = 'O cadastrado "%s" n�o pode ser retrogradado para um discipulado anterior ao ' +
           'que atualmente est� vinculado!';
       CartaFrequenciaRegistrada = 'A carta de freq��ncia foi registrada com sucesso no hist�rico discipular do aluno!';
       DesligamentoRegistrado = 'O desligamento foi registrado com sucesso no hist�rico discipular!';
       ReligamentoRegistrado = 'O religamento do cadastrado foi registrado com sucesso no hist�rico discipular!';
       EncerrarTurmaTP = 'Deseja realmente encerrar a turma selecionada?';
       DelTurmaTP = 'Deseja realmente excluir a turma de cursistas selecionada? Aten��o! A exclus�o somente ' +
           'poder� ser feita se n�o houverem dados de atividades promovidas para a turma.';
       SenhaAlterada = 'A senha do usu�rio foi alterada com sucesso!';
       TemporaryPassword = 'A sua senha atual � provis�ria e n�o pode ser usada para acessar as aplica��es Cosmos. ' +
           'Troque a sua senha para continuar a autentica��o.';
       ResetedPassword = 'A senha do usu�rio %s foi regerada como a seguinte senha provis�ria: %s';
       CannotUseGUsers = 'O Cosmos Gestor de Usu�rios � uma ferramenta destinada exclusivamente aos usu�rios que s�o ' +
           'administradores dos sistemas Cosmos. A autentica��o foi cancelada.';
       CantDeleteClassificador = 'N�o � poss�vel excluir o classificador selecionado. Ele est� sendo usado na categoriza��o de leitos e pessoas.';
       CantDelAreaStaff = 'N�o � poss�vel excluir esta �rea de staff, pois existem tarefas a ela ligadas que est�o sendo utilizadas na confer�ncia corrente ou em confer�ncias passadas.';
       CantDeleteFlagInscricoes = 'N�o � poss�vel excluir o item de inscri��o selecionado. Ele est� sendo usado por outro centro de confer�ncia ou j� foi utilizado no passado.';
       CantDelInscrito = 'N�o � poss�vel cancelar esta inscri��o. A secretaria j� apurou a freq��ncia deste inscrito nesta confer�ncia.';
       ConferenciaCriada = 'A nova confer�ncia foi criada com sucesso!';
       AlojamentosNaoCadastrados = 'N�o existem alojamentos cadastrados para o foco corrente. Cadastre alojamentos, quartos e leitos antes de prosseguir com a opera��o.';
       CannotDelFlagInscricao = 'Esta informa��o n�o pode ser exclu�da pelos usu�rios. Consulte um administrador do sistema sobre a exclus�o.';
       InscricoesArquivoDesconhecido = 'Antes de prosseguir com esta opera��o � necess�rio informar qual o arquivo que ser� usado como fonte dos dados da importa��o de inscritos.';
       InscricoesArquivoInexistente = 'O Cosmos Gestor de Confer�ncias n�o localizou o arquivo que ser� usado como fonte dos dados da importa��o de inscritos. Talvez o endere�o do arquivo esteja informado de forma incorreta.';
       InscricoesFonteDestino = 'A confer�ncia usada como fonte dos dados dos inscritos � a mesma confer�ncia selecionada como destino das importa��es de inscri��es!';
       StaffTarefaRegistrado = 'O inscrito %s j� est� escalado como staff da tarefa "%s"';
       HoraTarefaStaff = 'As informa��es sobre a hora de in�cio e t�rmino da tarefa de staff est�o incorretas ou n�o foram fornecidas.';
       NoHelpFound = 'N�o foi fornecido um item de ajuda para este recurso!';
       ProtocoloAberto = 'Existem passos neste protocolo que ainda n�o foram cumpridos. A instala��o n�o poder� ser confirmada at� que todos os passos do protocolo estejam marcados como "conclu�dos".';
       PromotorConferencia = 'Esta confer�ncia � promovida por outro foco. Para trabalhar com qualquer informa��o referente a esta confer�ncia, � necess�rio que voc� abra a sua secretaria. A opera��o ser� cancelada.';
       IncompleteData = 'Os dados requeridos nesta etapa do assistente n�o foram fornecidos. Preencha todas as informa��es antes de prosseguir.';
       MembrosCirculo = 'Antes de prosseguir com o assistente � preciso indicar quais pessoas far�o parte do novo c�rculo!';
       SelectBook = 'Selecione o livro antes de criar esta nova li��o!';
       TitularInexistente = 'N�o existe um titular definido para o aluno atual. A opera��o foi cancelada.';
       TitularJovemTMInexistente = 'N�o existe um titular definido para o jovem atual. A opera��o foi cancelada.';
       ValoresContribuicaoFoco = 'Os valores de contribui��o deste contribuinte somente podem ser alterados por usu�rios com acesso ao foco ao qual ele pertence.';
       RecebimentoCancelado = 'O Recebimento foi cancelado com sucesso. As totaliza��es do caixa foram recalculadas.';
       InstalandosCarteirinha = 'N�o � poss�vel recuperar os dados dos instalandos da turma selecionada. Expanda a turma para visualizar os seus membros.';
       GoodNetActivity = 'O sistema detectou boa conectividade com a Internet e com o servidor do Cosmos!';
       OpenBrowserConnection = 'O sistema acessar� uma interface do servidor Cosmos que pode ser interpretada por um navegador. Verifique se o navegador abrir� uma p�gina com dados leg�veis emitidos pelo servidor Cosmos.';
       CaixaAberto = 'Novo caixa aberto: %s';
       ExportEmpty = 'N�o foram encontrados dados para exportar!';
       AlreadyRootFocus = 'O foco atual n�o est� ligado a nenhum foco!';
       FocoCriado = 'O novo foco foi criado com sucesso!';
       RACriada = 'A nova Regi�o Administrativa foi criada com sucesso!';
       ConferenciaPromotor = 'N�o � poss�vel editar os dados desta confer�ncia, ' +
           'pois ela � promovida por um foco que n�o se encontra aberto. Para editar ' +
           'seus dados, voc� deve abrir a secretaria deste foco.';
       ClosedDataset = 'N�o foi poss�vel realizar esta opera��o: os dados n�o ' +
         'est�o dispon�veis.';
       CepNotFound = 'O logradouro "%s" n�o est� cadastrado!';
       AlreadyRootOrgao = 'O �rg�o gestor atual n�o possui informa��es de subordina��o!';
       NoSelectedDirigente = 'Nenhum dirigente foi selecionado. A opera��o ser� cancelada.';
       UndefiniedUser = 'O usu�rio cadastrador ainda n�o foi definido!';
       IncorrectPassword = 'A senha do contato n�o foi confirmada. Informe e ' +
         'confirme novamente a senha do contato.';
       DetalheHistoricoVazio = 'N�o existem outras informa��es sobre este ' +
         'evento discipular!';
       InstalledTurmaInstalacao = 'os membros desta turma de instala��o foram  ' +
         'instalados com sucesso em seu novo discipulado!';
       PromotorAtividade = 'Esta atividade � promovida por outro foco. Para ' +
         'trabalhar com qualquer informa��o referente a esta atividade, � necess�rio ' +
         'que voc� abra a sua secretaria. A opera��o ser� cancelada.';
       ParticipantesGrupoEI = 'Esta atividade � destinada a um c�rculo da ' +
         'Escola Interna. N�o � poss�vel cadastrar participantes para as atividades ' +
         'que s�o destinadas a um c�rculo da Escola Interna.';
       DelAtividade = 'Esta atividade � promovida por um campo de trabalho ' +
         'para o qual voc� n�o possui privil�gios de acesso. A opera��o ser� cancelada.';
       FrequenciaCadastrado = 'J� foi levantada a frequ�ncia do cadastrado "%s" ' +
         'para esta atividade!';
       CanDelTableData = 'Em fun��o da manuten��o da integeridade das informa��es ' +
         'do sistema Cosmos, n�o � permitido excluir estes dados. A opera��o ser� ' +
         'abortada.';
       EndWork = 'A mensagem foi enviada com sucesso!';
       DelecaoPlanoConta = 'A exclus�o da conta do plano de contas foi feita com ' +
         'sucesso.';
       NoCosmosSearchs = 'N�o foi poss�vel recuperar nehuma pesquisa com os argumentos correntes!';
       DelTipoAtividade = 'A exclus�o do tipo de atividade foi conclu�da com sucesso!';
       AddMembroTurmaInstalacao = 'O novo membro desta turma de isntala��o foi ' +
         'adicionado com sucesso!';
       FrequenciaConfComputada = 'O levantamento de freq��ncia para esta confer�ncia j� ' +
         'foi iniciado. Agora voc� pode continuar a apura��o.';
       ConferenciaTP = 'O Trabalho P�blico n�o � um Campo de Trabalho promotor de ' +
         'confer�ncias. Voc� n�o pode criar uma confer�ncia promovida por este campo ou ' +
         'trabalhar com a programa��o de atividades do Trabalho P�blico em uma confer�ncia.';
       ConferenciaPromotorInvalido = 'O Cosmos Gestor de Confer�ncias n�o conhece ' +
         'como trabalhar com uma confer�ncia promovida por este Campo de Trabalho. ' +
          'Procure um administrador do sistema e relate este problema.';
       ConferenciaNoAddAtividade = 'Esta atividade j� est� associada a uma confer�ncia. ' +
         'A opera��o foi cancelada.';
       SalvamentoTarefas = 'A sua lista de tarefas foi alterada. Selecione uma ' +
         'das op��es para prosseguir.';
       PesquisaFocoNoRa = 'Nesta pesquisa voc� deve selecionar um foco e n�o uma ' +
         'Regi�o Administrativa.';
       PesquisaRaNoFoco = 'Nesta pesquisa voc� deve selecionar uma Regi�o Administrativa ' +
         'e n�o um foco de trabalho.';
       PesquisaNoArguments = 'Para efetuar esta opera��o voc� deve informar um argumento ' +
         'de pesquisa!';
       EmptyParam = '� preciso informar um valor para o par�metro "%s"!';
       CannotFindTaskFile = 'N�o foi poss�vel localizar tarefas criadas por voc�. ' +
         'O relat�rio n�o poder� ser gerado.';

   end;


   ///<summary>
   ///  Classe que ordena as mensagens de confirma��o de caixas de di�logo.
   ///</summary>
   TCosmosConfMsg = class
     const
       CancelSection = 'Deseja realmente cancelar a autentica��o recentemente feita?';
       DeleteLogFiles = 'Deseja realmente excluir os arquivos de logs selecionados? Aten��o, esta ' +
              'opera��o n�o poder� ser revertida.';
       TransferirCadastrado = 'Deseja realmente transferir o cadastrado para o foco indicado?';
       TransferirAluno = 'Deseja realmente transferir o aluno para o foco indicado?';
       RetrogradarCadastrado = 'Deseja realmente retrogradar? Aten��o, esta opera��o n�o poder� ser revertida!';
       DesligarCadastrado = 'Deseja confirmar a opera��o de desligamento do cadastrado?';
       ConfDelete = 'Deseja realmente apagar esta informa��o?';
       EcerrarTurmaTP = 'Deseja realmente encerrar essa turma de cursista do Trabalho P�blico?';
       ReativarTurmaTP = 'Ao reativar uma turma j� encerrada, a data de ' +
              'encerramento cadastrada ser� eliminada. Deseja realmente executar esta opera��o?';
       LockUser = 'Confirma o bloqueio do usu�rio "%s"?';
       UnlockUser = 'Confirma o desbloqueio do usu�rio "%s"?';
       DelPrivilegioFoco = 'Deseja retirar o privil�gio de acesso ao foco "%s" para o usu�rio "%s"?';
       DeleteUsuario = 'Confirma a exclus�o do usu�rio "%s"? ATEN��O! Esta a��o n�o poder� ser desfeita.';
       SetAdministrator = 'Deseja tornar o usu�rio "%s" um administrador do sistema?';
       UnsetAdministrator = 'Deseja retirar do usu�rio "%s" o privil�gio de administrador do sistema?';
       DelPerfil = 'Deseja realmente excluir o perfil selecionado?';
       ResetPassword = 'Deseja realmente gerar uma nova senha tempor�ria para o usu�rio %s?';
       DelFocoParticipanteConf = 'Deseja realmente excluir este foco da lista de participantes da confer�ncia?';
       DelParticipanteConf = 'Deseja realmente excluir este discipulado da lista de participantes da confer�ncia?';
       CancelarInscricao = 'Esta opera��o ir� cancelar permanentemente esta inscri��o. Deseja prosseguir com a opera��o?';
       AtualizarAtributosInscricao = 'Esta opera��o ir� atualizar as inscri��es da confer�ncia corrente com as ' +
        'informa��es de detalhes da inscri��o recentemente definidas para as confer�ncias deste foco. Deseja prosseguir com a opera��o?';
       DesalojarInscrito = 'Deseja realmente desalojar o inscrito de seu leito atual?';
       DelDetalhesInscricao = 'Deseja realmente excluir este item de informa��o de inscri��o?';
       ImportarInscritos = 'Esta a��o ir� iniciar o processo de importa��o destes dados. Deseja continuar com a opera��o de importa��o?';
       DelAreaStaff = 'Deseja realmente excluir a �rea de staff selecionada?';
       DelStaffConferencia = 'Deseja realmente excluir esta tarefa do inscrito na confer�ncia?';
       CalcularCandidatos = 'Deseja que o Cosmos Gestor de Secretarias liste as pessoas que poderiam ser instaladas no discipulado "%s"?';
       ClearFrequencia = 'ATEN��O! Voc� est� prestes a eliminar permanentemente todos os registros de freq��ncia para a atividade corrente. Esta a��o n�o poder� ser desfeita. Deseja prosseguir com esta opera��o?';
       DelFrequencia = 'Deseja realmente excluir o registro de freq��ncia do cadastrado "%s" para esta atividade? ATEN��O: esta a��o n�o poder� ser desfeita!';
       DesativarCirculo = 'Esta a��o ir� desativar o c�rculo atual, desligando todos os seus atuais membros deste c�rculo. Deseja realmente continuar com esta a��o?';
       DelContatoCirculo = 'O aluno "%s" j� � o contato do c�rculo atual. Deseja retirar deste aluno esta fun��o?';
       DefContatoCirculo = 'Deseja definir o aluno "%s" como contato deste c�rculo?';
       DelMembroCirculoEI = 'Deseja realmente excluir este membro do c�rculo da Escola Interna atual? ATEN��O: esta a��o n�o desligar� o membro do seu discipulado atual.';
       AssociarLivroDiscipulado = 'Deseja realmente associar o livro "%s" ao discipulado "%s"?';
       AlterarOrdemLivro = 'Deseja realmente alterar a ordem do livro "%s"?';
       VincularLicao = 'Deseja realmente vincular a li��o "%s"  ao livro "%s"?';
       AlterarOrdemLicao = 'Deseja realmente alterar a ordem da li��o "%s"?';
       DelLivroEI = 'Deseja realmente excluir este livro e todas as suas li��es? ATEN��O: esta a��o n�o poder� ser desfeita!';
       DelLicaoEI = 'Deseja realmente excluir esta li��o? ATEN��O: esta a��o n�o poder� ser desfeita!';
       DeleteTitular = 'Esta opera��o ir� retirar a rela��o de titularidade do aluno atual. Deseja prosseguir com a opera��o?';
       DelTitularJovemTM = 'Esta opera��o ir� retirar a rela��o de titularidade do jovem do TM atual. Deseja prosseguir com a opera��o?';
       ClearFocoCentroCusto = 'Isto ir� retirar a informa��o sobre o foco propriet�rio deste centro de custo. Deseja prosseguir com a opera��o?';
       CaixaAbertoSair = 'Existe um caixa aberto no sistema. Ao encerrar o sistema esse caixa ser� automaticamente fechado. Deseja realmente encerrar o sistema?';
       InstalarTurma = 'Esta a��o ir� instalar a turma de instala��o selecionada. Deseja prosseguir com a opera��o?';
       DelInstalando = 'Esta a��o ir� excluir permanentemente o candidato "%s" da atual turma de instala��o. Deseja prosseguir com a opera��o?';
       DelContaBancaria = 'Deseja realmente excluir esta conta banc�ria? Aten��o! Uma conta somente pode ser exclu�da caso n�o existam lan�amentos a ela associados.';
       DesativarContaBancaria = 'Deseja realmente desativar esta conta banc�ria? Aten��o! Uma conta banc�ria inativa n�o poder� mais ser usada para lan�amentos.';
       ReativarContaBancaria = 'Deseja realmente reativar esta conta banc�ria?';
       ExitCaixaAberto = 'Existe um caixa aberto no momento. N�o � poss�vel desconectar a aplica��o com um caixa aberto. Deseja encerr�-lo antes de desconectar?';
       ConfDelConta = 'Deseja realmente excluir a conta "%s" do plano de contas? ' +
           'ATEN��O! Esta opera��o somente poder� ser feita com sucesso caso a conta ' +
           'n�o esteja sendo referenciada por nenhuma transa��o financeira.';
       VinculeFocusToRA = 'Deseja vincular o foco "%s" � regi�o administrativa "%s"?';
       ChangeTitularFocus = 'Aten��o. Voc� est� prestes a alterar o foco titular ' +
           'do foco selecionado. Deseja prosseguir com esta opera��o?';
       DeleteRa = 'Deseja realmente excluir a regi�o administrativa selecionada?';
       ActiveFocus = 'Deseja prosseguir com a ativa��o do foco "%s"?';
       RemoveTitularLink = 'Confirma a opera��o de retirada da liga��o do foco ' +
           'atual como o foco titular indicado?';
       DelMentorRA = 'Confirma a exclus�o permanente do mentor de RA selecionado?';
       DeleteAddress = 'Deseja realmente apagar este endere�o?';
       DeleteCity = 'Deseja realmente apagar esta cidade?';
       DeleteUF = 'Deseja realmente apagar este Estado?';
       AssuntoAlocucao = 'Deseja realmente apagar este assunto de alocu��o?';
       DeleteFuncao = 'Deseja realmente apagar esta fun��o do cadastrado?';
       DeleteInfoMedica = 'Deseja realmente apagar esta informa��o m�dica do cadastrado?';
       DeleteAptidao = 'Deseja realmente apagar esta aptid�o do cadastrado?';
       DeleteContato = 'Deseja realmente apagar este meio de contato?';
       DeleteFamiliar = 'Deseja realmente apagar este familiar do cadastrado?';
       ClearCirculoEI = 'Isto eliminar� a informa��o sobre o c�rculo da Escola ' +
           'Interna para o qual esta atividade � destinada. Deseja prosseguir com a opera��o?';
       ClearLicaoEI = 'Isto eliminar� a informa��o sobre a li��o proferida nesta ' +
           'atividades da Escola Interna. Deseja prosseguir com a opera��o?';
       ClearAlocucao = 'Isto ir� eliminar a informa��o sobre a alocu��o proferida ' +
           'nesta atividade. Deseja prosseguir com a a��o?';
       ClearConferencia = 'Isto ir� eliminar a vincula��o desta atividade com  ' +
           'a confer�ncia. Deseja prosseguir com a a��o?';
       ClearTurmaTP = 'Isto ir� eliminar a informa��o sobre a turma do Trabalho ' +
           'P�blico para a qual a atividade � destinada. Deseja prosseguir com a a��o?';
       DelFuncao = 'Deseja realmente excluir este escalado para a atividade corrente?';
       DelFocoParticipante = 'Deseja realmente excluir este foco da lista de participantes da atividade?';
       DelParticipante = 'Deseja realmente excluir este discipulado da lista de ' +
           'participantes da atividade?';
       DelProgramacaoConferencia = 'Deseja realmente excluir esta atividade da ' +
           'programa��o da confer�ncia selecionada? ATEN��O! Esta atividade n�o ser� ' +
           'exclu�da da agenda da atividades, mas apenas retirada da programa��o da ' +
           'confer�ncia selecionada.';
       DelDispensa = 'Deseja realmente excluir esta dispensa concedida?';
       DelFocoUser = 'Deseja realmente excluir a permiss�o para acessar este foco?';
       DelOrgaoGestor = 'Deseja realmente excluir o �rg�o gestor selecionado? ' +
           'ATEN��O: um �rg�o gestor somente pode ser exclu�do caso n�o existam dados ' +
           'das gest�es e membros das gest�es do referido �rg�o gestor.';
       DelGestao = 'Deseja realmente excluir esta gest�o? Aten��o: somente ' +
           'gest�es que n�o tenham membros a ela associados podem ser exclu�das.';
       EndMandate = 'Esta a��o ir� encerrar o mandato do dirigente "%s", do ' +
            '�rg�o gestor "%s" na data de hoje. Deseja prosseguir com a a��o?';
       DeleteBairro = 'Confirma a exclus�o do bairro corrente? Aten��o: esta ' +
        'opera��o pode tornar os dados de algunsendere�os inconsistentes.';
       DeleteExternalReport = 'Deseja realmente apagar este relat�rio externo? ' +
         'ATEN��O! Ao apagar este relat�rio externo ele ficar� completamente ' +
         'indispon�vel para todos os usu�rios!';
       Cancel = 'Confirma o cancelamento deste item? Aten��o: esta a��o n�o ' +
         'poder� ser desfeita!';
       DelServer = 'Deseja realmente excluir a conex�o remota "%s"?';
       ConfCep = 'O cep fornecido parece n�o estar correto. Deseja prosseguir com ' +
        'a opera��o de escrita dos dados?';
       RemoveSubordinacaoLink = 'Confirma a opera��o de retirada da informa��o ' +
         'sobre a subordina��o do �rg�o gestor atual?';
       DelFocus = 'ATEN��O: a exclus�o inadivertida de ' +
         'um foco pode causar perda de informa��es. Por esta raz�o o sistema verificar� ' +
         'previamente se o foco poder� ser exclu�do. Deseja realmente excluir o foco "%s"?';
       SubordinacaoOrgao = 'Deseja subordinar o �rg�o gestor "%s" ao ' +
         '�rg�o gestor "%s"?';
       DelDirigente = 'Aten��o: voc� est� requisitando a exclus�o de um dirigente ' +
         'de um �rg�o gestor. Esta opera��o pode destruir informa��es importantes ' +
         'sobre este dirigente. Deseja prosseguir com a opera��o?';
       EndMandates = 'Esta a��o ir� encerrar os mandatos de todos os dirigentes ' +
         'da gest�o selecionada na data de hoje. Deseja prosseguir com a a��o?';
       RevokeUser = 'Retirar o usu�rio "%s" do grupo "%s"?';
       ReligarCadastrado = 'Deseja realmente religar o cadastrado selecionado?';
       DelFoto = 'Isto ir� excluir a foto do cadastrado. Deseja prosseguir com ' +
         'a opera��o?';
       AnularHistorico = 'Deseja realmente anular este evento do hist�rico ' +
         'discipular do cadastrado? ATEN��O: esta a��o pode trazer forte impacto na ' +
         'consist�ncia dos dados discipulares do cadastrado.';
       ConcluirAcaoHis = 'Deseja realmente marcar como conclu�da esta a��o do ' +
         'evento discipular?';
       ProtocoloInstalacao = 'Esta a��o adicionar� nos hist�ricos dos cadastrados ' +
         'selecionados os protocolos de instala��o no discipulado indicado. Deseja ' +
         'prosseguir com esta a��o?';
       Instalacao = 'Esta a��o ir� instalar o(s) cadastrado(s) selecionado(s) no ' +
         'discipulado "%s". Deseja prosseguir com esta opera��o?';
       ClearTasks = 'Esta opera��o ir� eliminar todas as tarefas cadastradas. ' +
         'Deseja prosseguir com a opera��o?';
       DelTask = 'Deseja realmente excluir a tarefa selecionada?';
       DelAtividade = 'Deseja realmente excluir a atividade selecionada da ' +
         'agenda de atividades?';
       DelTiposAtividades = 'Deseja realmente excluir este tipo de atividade? ' +
         'ATEN��O: a exclus�o somente ser� efetuada se n�o existirem atividades deste ' +
         'tipo cadastradas.';
       Frequencia = 'Tipicamente, este tipo de atividade n�o exige a presen�a ' +
         'dos cadastrados. Deseja ainda assim iniciar o levantamento da freq��ncia ' +
         'dos cadastrados para esta atividade?';
       ConsultaCEP = 'A consulta de c�digos postais na base de dados da E.C.T. ' +
         'exige o estabelecimento de uma conex�o com a internet. Deseja prosseguir ' +
         'com esta opera��o?';
       MoverConta = 'Deseja realmente transformar a conta "%s" uma subconta de "%s"?';
       ClearFocoConta = 'Isto ir� retirar a informa��o sobre o foco propriet�rio ' +
         'desta conta. Deseja prosseguir com a opera��o?';
       ClonarInscricoes = 'Voc� est� prestes a copiar as inscri��es da confer�ncia modelo ' +
         '(%s) para a confer�ncia corrente (%s). Deseja prosseguir com a opera��o?';
       ConfirmarAlojamento = 'Esta opera��o iniciar� o processo de alojamento autom�tico ' +
         'dos inscritos na confer�ncia. Deseja prosseguir com a opera��o?';
   end;


   //Avisos
   TCosmosWarningMsg = class
     const
      WzNovoUsuarioStep1 = 'Os dados deste passo do assistente est�o incompletos. Preencha todas as informa��es antes de prosseguir.';
      EmptyArgument = '� preciso informar um argumento de pesquisa para executar ' +
       'esta opera��o!';
      EmptyFocus = '� preciso informar um foco no qual ser� feita a pesquisa!';
      InsertKeyword = '� necess�rio salvar a nova alocu��o antes de inserir ' +
       'as suas palavras-chave!';
      SearchFields = 'Nenhum campo de pesquisa foi definido para esta grade!';
      NoOrgaoSelcionado = 'Nenhum �rg�o gestor foi selecionado na lista acima!';
      IncompletedFields = 'Existem informa��es de preenchimento obrigat�rio!';
   end;

   TConverterErrorMsg = class
     const
      //Erros relacionados a convers�o de dados
      StringDateConvert = '%s n�o � uma data v�lida!';
      StringTimeConvert = '%s n�o � uma hora v�lida!';
      StringIntegerConvert = '%s n�o � um n�mero inteiro v�lido!';
   end;

   ///<summary>
   ///  Classe que ordena as mensagens de erro disparadas quando ocorrer uma falha
  ///   cr�tica que deve ser manipulada no evento OnReconcile dos datasets.
   ///</summary>
   TCosmosErrorReconcile = class
     const
      UnknownError = 'Ocorreu uma falaha cr�tica desconhecida ao tentar salvar os dados. ' +
        'Consulte os logs do servidor do Cosmos para obter mais informa��es. A opera��o ser� cancelada.';
      ForeignKey = 'Ocorreu uma falha cr�tica ao tentar salvar os dados. O sistema detectou que ' +
        'existem dados inv�lidos ou incompletos referentes a campos de liga��o entre duas tabelas. ' +
        'A opera��o ser� cancelada.';
   end;

   ///<summary>
   ///  Classe que ordena as mensagens de erro disparadas quando ocorrer uma falha
  ///   relacionada a datanavigators.
   ///</summary>
   TCosmosErrorDataNavigators = class
     const
      UnCreatedInnerObject = 'Falha na aplica��o. A fonte de dados n�o foi criada.';
      EInactiveInnerObject = 'Falha na aplica��o. A fonte de dados n�o est� ativa.';
   end;

   ///<summary>
   ///  Classe que ordena as mensagens de erro de caixas de di�logo.
   ///</summary>
   TCosmosErrorMsg =  class
    const
      //Mensagens t�cnicas de erros pr�prias de classes de exce��o descritas na biblioteca cmlib.bpl
      sEIsNotArray = 'Os par�metros fornececidos n�o est�o no formato de array de variants!';
      //Protocolos, certificados e conex�es.
      InvalidProtocol = 'Server Error: o protocolo de transporte configurado n�o � v�lido.';
      CertificateNotFound = 'N�o foi encontrado um certificado digital para essa conex�o. O uso de certificados ' +
           'digitais � requerido para esse tipo de conex�o com o servidor Cosmos.';
      CertificateExpired = 'O certificado digital recebido est� expirado. O per�odo de validade para uso do certificado ' +
           'n�o � mais v�lido. A opera��o ser� encerrada.';
      CertificateNotYetValid = 'O certificado digital recebido ainda n�o pode ser usado. O per�odo de validade para in�cio ' +
           'do uso do certificado n�o foi alcan�ado. A opera��o ser� encerrada.';
      CreateMyCosmosFolder = 'N�o foi poss�vel criar seu ambiente de trabalho para a correta execu��o do Cosmos. A aplica��o ser� encerrada.';
      CreateLogsFolder = 'N�o foi poss�vel criar a pasta de arquivos de logs no local: %s' + #13 + 'Verifique os arquivos de configura��o do Cosmos.';
      InvalidSearchParams = 'Os par�metros de busca desta opera��o s�o inv�lidos.';
      InvalidNumParams = 'O n�mero de par�metros chegou ao seu limite!';
      UnregisteredClass = 'N�o foi poss�vel obter uma interface para uso dos ' +
           'recursos dispon�veis no m�dulo "%s". Relate aos administradores do Cosmos ' +
           'esta mensagem.';
      LoadDLL = 'O aplicativo n�o localizou a biblioteca "%s". A reinstala��o ' +
           'do produto pode corrigir este erro.';
      UnknownConnectionError = 'Ocorreu um erro desconhecido ao tentar conectar-se com o servidor remoto. ' +
           'Verifique os logs do sistema para obter detalhes do erro ocorrido.';
      UnknowDataTarget = 'A fonte de dados para a escrita do resultado da pesquisa n�o pode ' +
           'ser encontrada. Entre em contato com o administrador do sistema.';
      InactiveDataTarget = 'A fonte de dados para a escrita do resultado da pesquisa ' +
           'est� inativa. Entre em contato com o administrador do sistema.';
      IncorrectServer = 'Esta aplica��o do Cosmos n�o pode conectar-se com este servidor. ' +
           'Verifique se as configura��es atuais de endere�o e porta est�o corretas.';
      EmptyDataset        = 'Uma busca de dados retornou vazio. Esse resultado n�o � ' +
           'v�lido ou n�o pode ser processado.';
      OptionsPageNotFound = 'A p�gina de configura��o n�o pode ser encontrada!';
      SelectData          = 'Ocorreu um erro durante a busca dos dados para esta opera��o. ' +
           'Verifique se o sistema continua operando e avalie os logs do sistema.';
      LoginFailure        = 'Falha durante a tentativa de autentica��o. Certifique-se de que '+
           'foram fornecidos corretamente todos os dados usados na autentica��o.';
      ParamMatriculas = 'N�o foram informadas as matr�culas dos alunos para ' +
           'os quais ser�o emitidas as carteirinhas!';
      EscalaConferenciaInvalida       = 'O escalado n�o pode atuar nessa atividade pois n�o ' +
           'est� inscrito para a confer�ncia!';
      CadastradoFalecido     = 'Esta opera��o n�o pode ser finalizada pois uma ou mais ' +
           'pessoas envolvidas j� est�o falecidas!';
      EscalarFalecido     = 'A pessoa n�o pode ser escalada para a atividade pois ' +
           'j� et� falecida!';
      OpenFocusUnknownModule = 'Falha remota durante a tentativa de obter os focos que o ' +
           'usu�rio pode acessar. N�o foi poss�ve identificar o m�dulo do aplicativo ' +
           'Cosmos que solicitou a lsitagem dos focos.';
      TransferenciaMesmoFoco = 'O cadastrado j� se encontra vinculado ao foco selecionado!';
      CannotOpenFileCentralPesquisaServer =  'N�o foi poss�vel obter o comando a ser executado. O arquivo ' +
           'de configura��o "ServerCommands.xml" n�o foi encontrado.';
      CannotOpenFileCentralPesquisaUser =  'N�o foi poss�vel executar essa pesquisa. Aconteceu uma falha grave ' +
           'no servidor do Cosmos que impede a execu��o de pesquisas da Central de Pesquisas. ' +
           'Informe o ocorrido a um respons�vel pelo Cosmos.';
      CannotFindCentralPesquisaCmd = 'N�o foi poss�vel executar a pesquisa. A fonte de informa��o das pesquisas ' +
       'foi encontrada, mas nela n�o existe informa��o sobre a pesquisa solicitada.';
      ExecuteScript = 'Ocorreu um erro ao executar alguns comandos seq�enciais ' +
        'necess�rios para completar esta opera��o. Entre em contato com o administrador ' +
        'do sistema Cosmos.';
      ExecuteCommand = 'Ocorreu um erro ao tentar executar um comando DML no servidor de dados. A opera��o foi desfeita.';
      ExecuteCommandUser = 'Ocorreu um erro ao tentar salvar dados para a opera��o corrente. A opera��o foi desfeita.';
      SelectSequenceData = 'Ocorreu um erro ao tentar obter o pr�ximo valor do ' +
        'identificador �nico deste novo cadastro. Informe o ocorrido a um gestor do Cosmos.';
      UnknownCosmosSearch = 'N�o foi poss�vel localizar um comando interno necess�rio para essa opera��o.';
      CadastradosSearch =  'Ocorreu um erro durante a pesquisa de cadastrados ' +
            'executada durante esta opera��o. Consulte os logs para obter mais informa��es ' +
            'sobre o problema.';
      AtualizarGruposTM =  'Ocorreu um erro durante a a atualiza��o dos grupos do Trabalho da Mocidade.';
      GerarFrequenciaConferencia = 'Ocorreu um erro ao tentar gerar os registros ' +
            'de controle de freq��ncia para esta confer�ncia. Consulte os logs para obter ' +
            'mais informa��es sobre este problema.';
      DadosIncompletosOperacao = 'Os dados est�o incompletos. Informe todos os dados antes ' +
            'de concluir esta opera��o.';
      CannotFindCadastrado   = 'O cadastrado n�o pode ser encontrado! A opera��o foi cancelada.';
      UnknownFocusType       = 'N�o foi poss�vel obter os dados do novo foco do cadastrado. ' +
            'Verifique com o respons�vel pelo Cosmos em seu n�cleo esse fato.';
      TransferenciaInvalidaAluno =  'Um aluno ou jovem da Mocidade n�o pode se vincular a uma sala ou ' +
            'local do Trabalho P�blico ou a um centro de confer�ncia. A opera��o de transfer�ncia foi cancelada.';
      TransferenciaInvalidaPesquisador =  'Um pesquisador ou simpatizante n�o pode se vincular a um centro de confer�ncia. '  +
            'A opera��o de transfer�ncia foi cancelada.';
      CadastradoDesligado =  'O cadastrado j� se encontra desligado. N�o � poss�vel fazer qualquer movimenta��o discipular ' +
            'de pessoas que j� est�o desligadas.';
      ExecuteOperation  = 'Ocorre um erro inesperado ao executar esta opera��o. � poss�vel que a opera��o ' +
            'n�o tenha sido conclu�da com sucesso e seus dados n�o tenham sido salvos.';
      DataObito = 'N�o � poss�vel registrar um �bito ocorrido em uma data futura! Corrija a data de �bito antes de prosseguir.';
      BatizadoCampo = 'Somente alunos do Lectorium Rosicrucianum a partir do probat�rio ou crian�as e jovens do TM podem ser batizados!';
      BatizadoDiscipulado = 'Somente alunos que estejam no probat�rio ou em um discipulado posterior podem ser batizados!';
      BatizadoIdade = 'Uma pessoa somente pode ser batizada se possuir at� 28 anos inteiros!';
      DBXUnknown  ='Ocorreu um erro inesperado na troca de dados com o servidor remoto. ' +
             'Acesse os logs do sistema para obter mais informa��es.';
      DBXNoMemory = 'N�o existe mem�ria para executar esta opera��o!';
      DBXConnectionFailed = 'A opera��o de conex�o falhou. Tente novamente.';
      DBXServerMethodFailed ='A chamada a um m�todo do servidor remoto falhou de forma inesperada. ' +
             'Consulte os logs do sistema para obter mais informa��es';
      DBXDeniedAuthorization ='O usu�rio corrente n�o est� autorizado a acessar esta funcionalidade!';
      NoivaAusente = 'O nome da noiva ainda n�o foi indicado!';
      NoivoAusente = 'O nome do noivo ainda n�o foi indicado!';
      NumRegistroNulo = 'Um n�mero de registro do evento deve ser fornecido para ser inserido no hist�rico discipular do cadastrado!';
      DescricaoHistorico = 'Uma descri��o sum�ria a ser inserida no hist�rico discipular � requerida nesta opera��o!';
      CasarCasado = 'Um dos nubentes indicados j� se encontra casado! O registro do casamento foi cancelado.';
      DiscipuladoUnselected = '� preciso selecionar o novo discipulado antes de prosseguir com a opera��o!';
      MotivoUnknown = '� preciso informar o motivo antes de prosseguir com a opera��o!';
      DataFutura = 'N�o � poss�vel informar uma data futura para a ocorr�ncia dessa opera��o!';
      RetrogradacaoIlegal = 'Apenas alunos do Lectorium Rosicrucianum e cursistas podem ser retrogradados para outro discipulado. ' +
             'A opera��o foi cancelada.';
      CartaFrequenciaCampo = 'Somente alunos podem receber cartas de freq��ncia!';
      ReligarDescricao = '� preciso informar o discipulado ao qual o cadastrado ser� religado e ' +
             'uma descri��o para inser��o no seu hist�rico discipular!';
      PasswordUpdate = 'Ocorreu uma falha durante a opera��o de altera��o da senha do usu�rio %s. ' +
             'Se poss�vel, verifique os logs do servidor para obter mais informa��es sobre o problema.';
      PasswordReset = 'Ocorreu uma falha durante ao tentar regerar a senha do usu�rio %s. ' +
             'Se poss�vel, verifique os logs do servidor para obter mais informa��es sobre o problema.';
      LockUser = 'Ocorreu uma falha de sistema ao tentar bloquear um usu�rio. Tente novamente mais tarde.';
      AuthenticateProcess = 'Ocorreu uma falha de sistema durante o processo de autentica��o do usu�rio ' +
             'ou em uma verifica��o posterior de suas credenciais de acesso.';
      DadosCadastrado = 'Ocorreu uma falha de sistema ao tentar obter os dados de um aluno, jovem, pesquisador ou simpatizante.';
      NovaTurmaTP = 'Falha durante a cria��o da nova turma do Trabalho P�blico. Consulte os logs para obter maiores informa��es sobre o problema.';
      CantDeleteTurmaTP = 'N�o � poss�vel excluir a turma de cursistas selecionada. Existem atividades destinadas ' +
             '� turma e outras depend�ncias cadastradas.';
      DeleteTurmaTP = 'Ocorreu um erro ao tentar excluir uma turma do Trabalho P�blico. Consulte os logs para obter mais informa��es sobre o problema.';
      NumeroNovaTurmaTP = 'N�o foi poss�vel obter o n�mero da nova turma do Trabalho P�blico';
      CadastradoJaSelecionado = 'Este cadastrado j� foi selecionado previamente!';
      MembrosTurmaInstalacao = 'N�o foi poss�vel obter os membros desta turma de instala��o. ' +
             'Consulte os logs para obter mais informa��es sobre o problema.';
     UpdateReconcile = 'O servidor detectou um conflito de concilia��o de dados. � poss�vel que algum usu�rio tenha alterado ' +
             'essas informa��es antes de voc� faz�-lo ou que tenha ocorrido outro tipo de conflito. Se poss�vel, consulte ' +
             'os logs do sistema para obter os detalhes sobre o problema.';
     InitializationLogs = 'Ocorreu um erro fatal durante a inicializa��o do sistema. O sistema de gera��o de logs n�o pode ser criado. ' +
             'A aplica��o ser� encerrada. Informa��es t�cnicas: AppMethod: %s.LoadLogsConfigurations';
     RequiredFields = 'Existem informa��es requeridas para este cadastro. Informe os dados de cada campo antes de prosseguir.';
     SystemFailure = 'Ocorreu uma falha de sistemas grave durante a execu��o desta opera��o. Se poss�vel, consulte os logs para obter mais informa��es.';
     UnConfirmedNewPassword = 'A nova senha informada n�o pode ser confirmada. Digite a sua nova senha e confirme-a no campo de confirma��o.';
     IncorrectNewPassword = 'A nova senha informada n�o pode ser a mesma da sua atual senha. Digite a sua nova senha e confirme-a no campo de confirma��o.';
     NoneRoleToUser = 'N�o foi poss�vel identificar um perfil de acesso para voc�. Solicite a um administrador do Cosmos a atribui��o de um perfil de acesso.';
     NoServerAvaible = 'Nenhum servidor remoto foi encontrado. Verifique nas configura��es do Cosmos os endere�os dos servidores que est�o executando a aplica��o servidora.';
     NoNetActivity = 'O sistema n�o detectou conectividade com a Internet ou com o servidor do Cosmos. Verifique se a sua Internet est� funcionando e se a VPN do Cosmos j� foi estabelecida por voc�.';
     AbortedConnection = 'A conex�o com o servidor Cosmos que estava em curso foi abortada.';
     RefusedConnection = 'N�o foi poss�vel conectar com o servidor remoto. A conex�o foi recusada ativamente.';
     LoadPhotoFromFile = 'N�o foi poss�vel exibir a foto a partir do arquivo selecionado. Selecione outro arquivo para prosseguir com a opera��o.';
     CreateUser = 'Ocorreu uma falha durante a opera��o de cria��o de um novo usu�rio. Verifique os logs para obter mais informa��es sobre o problema.';
     DeleteUser = 'Ocorreu uma falha ao tentar excluir um usu�rio. Tente novamente mais tarde.';
     GrantPermission = 'Ocorreu uma falha durante o processo de atribui��o das permiss�es do usu�rio. Tente novamente mais tarde.';
     RevokePermission = 'Ocorreu uma falha durante a opera��o de retirada de permiss�es a um usu�rio. Tente novamente mais tarde.';
     GrantAdministrator = 'Houve uma falha de sistema ao tentar atribuir ou retirar do usu�rio a fun��o de administrador do sistema. Tente novamente mais tarde.';
     UnlockUser = 'Ocorreu uma falha ao tentar desbloquear um usu�rio. Tente novamente mais tarde.';
     LoginAlreadyExists = 'N�o � poss�vel criar um novo usu�rio para esta pessoa. O login %s j� � usado por outro usu�rio.';
     CreateUserAttributes = 'Ocorreu uma falha durante a opera��o de salvamento das pemiss�es de acesso do novo usu�rio. A opera��o n�o pode ser conclu�da.';
     AdmPrivelegies = 'Esta opera��o s� pode ser executa por um usu�rio com privil�gios de administra��o. Se voc� precisa continuar com o opera��o contacte um administrador.';
     IncorrectRoleName = 'O perfil de acesso informado n�o est� correto. O Cosmos detectou que voc� n�o pertence ao perfil de acesso informado ou este perfil n�o existe.';
     PasswordNotConfirmed = 'A senha n�o est� correta. Informe a senha e confirme-a novamente.';
     IlegalGrantUser = 'N�o foi identificado o usu�rio para o qual os perfis seriam atribu�dos ou retirados! A opera��o foi cancelada.';
     IlegalGrantRole = 'N�o foi identificado o perfil que seria atribu�do ou retirado ao usu�rio! A opera��o foi cancelada.';
     ResetPassword = 'Ocorreu uma falha ao tentar regerar uma senha tempor�ria de usu�rio. A opera��o foi cancelada.';
     UpdateData = 'Ocorreu uma falha ao tentar salvar seus dados. A opera��o de salvamento foi cancelada.';

     //Confer�ncias.
     DuplicatedAttributes = 'J� existe um classificador com a sigla fornecida. As siglas dos classificadores devem ser �nicas. A opera��o de salvamento ser� cancelada.';
     DelAttribute = 'O sistema detectou um erro durante a tentativa de exclus�o de um classificador. Consulte os logs para obter mais informa��es sobre o problema.';
     SaveAreaStaff = 'Ocorreu uma falha ao tentar executar esta opera��o na �rea de staff. A opera��o foi cancelada.';
     ChangeConferenceControlModel = 'N�o � poss�vel alterar o tipo de controle de freq��ncia de uma confer�ncia quando o levantamento da freq��ncia j� houver sido iniciado!';
     DelFlagInscricao = 'O sistema detectou um erro durante a tentativa de exclus�o de uma informa��o de inscri��o. Consulte os logs para obter mais informa��es sobre o problema.';
     CancelarInscricao = 'Ocorreu uma falha de sistema ao tentar cancelar uma inscri��o para uma confer�ncia. Contate um administrador do sistema.';
     DesalojarInscrito = 'Ocorreu uma falha ao tentar desalojar o inscrito selecionado. A opera��o foi cancelada.';
     ClonarAlojamento  = 'Ocorreu um erro ao tentar alojar um inscrito na confer�ncia corrente. A opera��o foi cancelada.';
     InscricaoDataChegada = 'A data de chegada n�o pode ser posterior ao t�rmino da confer�ncia!';
     InscricaoHoraChegadaSaida = 'A hora de chegada e sa�da devem ser fornecidas!';
     InscricaoDataSaida = 'A data de sa�da n�o pode ser anterior ao in�cio da confer�ncia!';
     AtualizarAtributosInscricoes = 'Ocorreu um erro ao tentar atualizar as informa��es de detalhamento das ' +
       'inscri��es feitas para esta confer�ncia. Verifique os logs para obter mais informa��es.';
     CantCreateReader   = 'N�o foi poss�vel ler os dados retornados pelo servidor em uma pesquisa. Se poss�vel, consulte os logs para obter mais informa��es sobre a falha.';
     ImportacaoInscritosGeral = 'Ocorreu um erro ao processar a importa��o de inscritos. As inscri��es n�o foram executadas com sucesso.';
     ImportacaoInscritos = 'Ocorreu um erro ao tentar ler os dados do arquivo de importa��o de inscritos. Verifique se o arquivo est� em um formato v�lido.';
     CadastradoMatricula = 'N�o foi poss�vel encontrar um cadastrado com a matr�cula "%s"!';
     CompareTime = 'A hora de in�cio deve ser anterior � hora de t�rmino!';
     ChangeTarefaAreaStaff = 'Ocorreu um erro ao tentar mudar a tarefa selecionada para outra �rea de staff. A opera��o foi cancelada.';
     CantOpenFileConfigurationsAll = 'O sistema n�o pode encontrar o arquivo geral de configura��es do sistema no caminho "%s".';
     ReadCosmosConfigurations = 'Ocorreu uma falha inesperada ao tentar acessar as configura��es do sistema.';
     ReadCosmosLogsFilesPath = 'O sistema n�o pode detectar a pasta onde as informa��es de logs ser�o salvas. Isso pode ter ocorrido devido a eventuais problemas com um arquivo de configura��es. Entre em contato com um respons�vel pelo sistema. A aplica��o ser� encerrada.';
     ReadCosmosLogsFilesPathXP = 'O sistema n�o pode detectar a pasta onde as informa��es de logs devem ser salvas. Isso pode ter ocorrido devido a eventuais problemas com um arquivo de configura��es. ' +
       'Em computadores executando Windows XP, o problema pode ser resolvido instalando uma vers�o mais recente do Internet Explorer, que atualiza bibliotecas usadas pelo Cosmos. Entre em contato com um respons�vel pelo sistema Cosmos. A aplica��o ser� encerrada.';
     ExecuteLogsViewer = 'O sistema n�o pode abrir a ferramenta de visualiza��o de logs do Cosmos. � prov�vel que esse programa n�o tenha sido instalado ou tenha sido removido.';
     DllCalculator = 'N�o foi poss�vel executar o m�dulo "Calculadora". Reinstale o aplicativo para tentar corrigir o problema.';
     LoadConfigurations = 'Ocorreu uma falha de sistema ao tentar obter algumas configura��es da aplica��o Cosmos corrente. Informe o fato ao administrador do sistema.';
     DatabaseNotFound  = 'As configura��es de conex�o ao banco de dados n�o indicam um caminho v�lido para acesso ao banco de dados.';
     ExportDataSearch  = 'Ocorreu uma falha grave ao tentar exportar os dados para um arquivo. Verifique se o caminho informado est� correto ou se voc� possui permiss�o para criar arquivos na pasta informada.';
     ExportDataToFile = 'Ocorreu uma falha grave ao tentar fazer a busca dos dados para serem exportados.';
     FormatParams = 'Ocorreu um erro durante a prepara��o dos dados dos par�metros do relat�rio ou pesquisa corrente. Verifique se todos os par�metros foram fornecidos corretamente.';
     ReportFile = 'A Central de Relat�rios n�o conhece um arquivo de relat�rios definido para este aplicativo. � imposs�vel prosseguir.';
     IdentificaoAtiva = 'A identifica��o ativa falhou. Essa confirma��o � necess�ria para a conclus�o desta opera��o.';
     GetCommand = 'Ocorreu um erro ao tentar recuperar um comando necess�rios para completar esta opera��o. Entre em contato com o administrador do sistema Cosmos.';
     LoadWizard = 'Ocorreu uma falha ao tentar acessar o assistente. A biblioteca onde o assistente reside pode estar ausente ou apresentou algum problema. Consulte os logs do sistema para obter mais informa��es.';
     ExportData = 'Ocorreu uma falha ao tentar exportar dados da aplica��o. A opera��o de exporta��o foi cancelada.';
     //Erros da Central de Relat�rios
     ReportInfoFile = 'As informa��es sobre os relat�rios n�o puderam ser obtidas. � poss�vel que alguma configura��o ou arquivo importante esteja indispon�vel ou inacess�vel. Procure um administrador do sistema e reporte esta informa��o.';
     ReportPhoto = 'A foto de um aluno, membro ou jovem do TM est� em um formato n�o conhecido ou est� corrompida. Insira apenas fotos no formato JPEG.';
     ReportExecute = 'Ocorreu um erro de sistema ao tentar gerar o relat�rio selecionado. Consulte os logs do sistema para obter mais informa��es sobre a falha.';
     MatriculaDuplicada = 'A matr�cula %s j� est� em uso por uma pessoa do seu centro ou de outro. As altera��es feitas ser�o canceladas.';
     UpdateDownload = 'Ocorreu um erro de sistema durante o download de uma atualiza��o do sistema Cosmos. Verifique a sua conex�o com a Internet.';
     EnderecosCorrespondencia = 'Somente um endere�o pode ser marcado como o de ' +
       'entrega de correspond�ncias!';
     InvalidEMail = 'O meio de contato do cadastrado n�o � um email!';
     GetServerDateTime = 'Ocorreu um erro ao tentar obter a data e hora no servidor ' +
       'de aplica��o.';
     LoadAcessedFocus = 'Ocorreu um erro fatal ao tentar obter os focos para os quais ' +
       'voc� possui permiss�o de acesso. Consulte os logs do sistema para obter mais informa��es.';
     //Carregamentos/salvamento de arquivos de configura��o
     LoadServerConfigFile = 'Ocorreu uma falha de sistema ao tentar obter ' +
       'as configura��es das conex�es com a aplica��o servidora do Cosmos. Informe o fato ' +
       'ao administrador do sistema.';
     SaveServerConfigFile = 'Ocorreu uma falha de sistema ao tentar salvar ' +
       'as configura��es das conex�es com a aplica��o servidora do Cosmos. Informe o fato ' +
       'ao administrador do sistema.';
     SaveGUIConfigurations = 'Ocorreu uma falha de sistema ao tentar salvar ' +
       'as configura��es de apar�ncia do aplicativo Cosmos. Informe o fato ' +
       'ao administrador do sistema.';
     HostNotFound = 'O servidor n�o pode ser acessado. Verifique se o nome ou endere�o do servidor est� correto ' +
       'ou se a sua conex�o de rede ou internet est�o dispon�veis.';
     ConnectError = 'Ocorreu um erro desconhecido ao tentar conectar com o servudor do Cosmos. ' +
       'Verifique os logs para mais informa��es.';
     ConnectionTimeout = 'O tempo limite de estabelecimento da conex�o se esgotou. Verifique se ' +
       'a sua conex�o de rede ou internet est�o dispon�veis.';
     SocksServerGeneralError = 'Ocorreu uma falha desconhecida durante a tentativa de comunica��o ' +
       'com o servidor. Verifique os logs para obter mais detalhes';
     ConnectionLost = 'A conex�o com o servidor remoto foi perdida. Ser� necess�rio reiniciar a autentica��o para continuar. Mensagem de erro recebida:';
     //Cidades e estados------------------------------------------------------------
     PaisEstado = '� necess�rio selecionar um pa�s antes de escolher um estado!';
     EstadoCidade = '� necess�rio selecionar um estado antes de escolher uma cidade!';
     CidadeBairro = '� necess�rio selecionar uma cidade antes de escolher um bairro!';
     CepNotFount = 'O cep procurado n�o est� cadastrado na base de dados da ECT!';
     ConsultaCEP = 'N�o foi poss�vel eatabelecer uma conex�o com o webservice ' +
       'e obter uma pacote com os dados do logradouro. Talvez haja algum problema ' +
       'com a conex�o com a Internet ou esta esteja inoperante.';
     FrequenciaConferenciaEmCurso = 'O levantamento de freq��ncia para esta confer�ncia ' +
       'j� foi feito. Agora voc� poder� alterar os dados j� trabalhados anteriormente.';
     //Gest�es e dirigentes--------------------------------------------------------
     DatasGestao = 'A data de in�cio da gest�o n�o pode ser igual ou superior ' +
       '� data de t�rmino. A opera��o ser� cancelada.';
     //Valida��o de cadastros-------------------------------------------------------
     MensalidadeNula = '� necess�rio informar o valor da mensalidade!';
     TaxaConferenciaNula = '� necess�rio informar o valor da taxa de confer�cnia!';
     DiscipuladoTMBNulo = '� necess�rio informar em qual discipulado do ' +
       'Trabalho de Membros o cadastrado ser� instalado!';
     ProfissaoTMBNulo = '� necess�rio informar a profiss�o do instalando!';
     EstadoCivilTMBNulo = '� necess�rio informar o estado civil do instalando!';
     //Relat�ricos Externos
     ExternalReportNotFound = 'O relat�rio externo "%s", situado no arquivo %s ' +
       'n�o pode ser executado porque o arquivo mencionado n�o pode ser encontrado.';
     PrivilegioFocoCadastrado = 'O usu�rio selecionado j� possui privil�gio ' +
       'de acesso ao foco indicado!';

     FaixaGruposTM = 'O cadastrado n�o possui idade para fazer parte do TM ou ' +
       'a data informada est� incorreta.';
     UpdateLogFile = 'Se voc� deseja registrar logs do processo de atualiza��o, ' +
       '� necess�rio informar o local e o nome do arquivo de log.';
     LinkFocos = 'Ocorreu um erro ao tentar salvar os focos com os quais o novo ' +
       'usu�rio poder� trabalhar. Verifique se o usu�rio foi criado e examine a lista '+
       'de focos a ele associada.';

     //Erros que ocorrem quando do registro de eventos no hist�rico discipular
     ErrorBatizado = 'Ocorreu uma falha de sistema durante o registro do batismo. ' +
       'Verifique se os dados do batismo foram inseridos corretamente no hist�rico discipular.';
     ReligarCadastradoInexistente = 'N�o foi poss�vel localizar o cadastrado para ' +
       'executar o religamento! A opera��o foi cancelada.';
     ReligarCadastradoFalecido = 'O cadastrado que seria religado j� se encontra ' +
       'falecido! O religamento foi cancelado.';
     //Tasks
     LoadTaskFile = 'Ocorreu uma falha durante a leitura do arquivo de tarefas. ' +
       'Os dados podem ter sido corrompidos. O sistema criar� um novo arquivo de tarefas.';
     ReadReportParams = 'Ocorreu uma falha inesperada na leitura dos �ltimos ' +
       'valores usados na gera��o deste relat�rio. Apesar deste problema, voc� poder� ' +
       'gerar o relat�rio normalmente.';
     ReportDataError = 'Ocorreu um erro ao tentar gerar os dados de um relat�rio. O c�digo de ' +
      'tratamento de busca de dados do relat�rio n�o foi encontrado.';

     ConferenciaModelo = 'A confer�ncia modelo selecionada � a mesma da confer�ncia ' +
       'corrente. Para importar os inscritos da confer�ncia modelo para a corrente ' +
       'voc� precisa selecionar outra confer�ncia modelo.';
     CentralPesquisaInfoFile = 'As informa��es sobre as pesquisas n�o puderam ser ' +
       'obtidas. � poss�vel que alguma configura��o ou arquivo importante esteja ' +
       'indispon�vel ou inacess�vel. Procure um administrador do sistema e reporte ' +
       'esta informa��o.';

     //Outros------------------------------------------------------------
     ErrorDatas = 'A data inicial n�o pode ser posterior � data final!';
     CadastradoEI = 'O aluno selecionado pertence � Escola Interna. Esta ' +
       'opera��o somente pode ser executada por usu�rios que possuem direitos de ' +
       'acesso aos dados da Escola Interna.';

   end;


   TCosmosErrorSecurityMsg = class
     const
      UsuarioExists = 'N�o � poss�vel criar um novo usu�rio com este login, pois ele j� � utilizado por outro usu�rio. Altere o login e repita a opera��o.';
      UnknownProfile = 'N�o foi poss�vel identificar o perfil "%s", atribu�do na cria��o do novo usu�rio. Toda a opera��o foi desfeita.';
      //Mensagens relacionadas � autentica��o
      BlockedUser = 'O sistema detectou que voc� est� impedido de acessar as aplica��es Cosmos. Procure um administrador do sistema Cosmos para obter mais informa��es.';
      UnknowUser = 'N�o foi poss�vel identificar os dados do usu�rio %s. A aplica��o servidora do Cosmos pode ter registrado uma exce��o. Procure um administrador do sistema Cosmos para obter mais informa��es.';
      SyncProcessing = 'O banco de dados encontra-se atualmente em estado de sincroniza��o. N�o � poss�vel utilizar qualquer aplicativo da suite Cosmos quando o banco de dados est� em estado de sincroniza��o. Tente logar novamente dentro de alguns minutos.';
      ActivatedUser = 'A ativa��o do usu�rio %s nesta instala��o do Cosmos foi feita com sucesso. Execute novamente a opera��o de login para acessar o sistema.';
      LoginSystemFailure = 'Ocorreu um erro de sistema durante a autentica��o. Tente novamente.';
      SysdbaLoginFailure = 'Este aplicativo n�o pode ser acessado pelo usu�rio administrador do banco de dados. A conex�o ser� cancelada.';
      UnknownUser = 'O usu�rio n�o pode ser identificado corretamente. � poss�vel que o usu�rio n�o esteja cadastrado ou autorizado a usar o sistema. Procure um administrador do sistema para obter suporte ou consulte a ajuda do Cosmos.';
      AdmTool = 'Tentativa de acesso negada. Somente usu�rios que possuem privil�gios de administradores podem acessar esta ferramenta!';
      AdmOnly = 'Somente os administradores do sistema est�o autorizados a acessar este recurso. Pe�a o suporte de um usu�rio administrador.';
      AcessoDadoEI = 'Somente usu�rios autorizados a lidar com informa��es referentes � Escola Interna podem acessar este recurso!';
      PasswordRequired = '� preciso informar a sua senha atual para executar esta opera��o.';
      NewPasswordRequired = '� preciso informar a nova senha para executar esta opera��o.';
      UserNameRequired = '� preciso informar o seu login para executar esta opera��o!';
      //Gest�o de usu�rios
      ActivateUser = 'Ocorreu uma falha durante o processo de ativa��o do usu�rio. Consulte um administrador do sistema Cosmos para obter mais informa��es sobre o problema.';
      SelectUserRoles = 'Ocorreu uma falha ao tentar recuperar o grupo do usu�rio. Tente novamente mais tarde.';
      Grants = 'Ocorreu uma falha durante a opera��o de concess�o de permiss�es a um usu�rio. Tente novamente mais tarde.';
      UserNotFound = 'N�o foi poss�vel encontrar o usu�rio selecionado na base de usu�rios. A opera��o foi cancelada.';
      DelFailure = 'Houve uma falha de sistema ao tentar excluir o usu�rio corrente. Tente novamente mais tarde.';
      SQLServerUserExists = 'O login %s j� se encontra em uso por outro usu�rio. A cria��o da nova conta de acesso foi cancelada.';
      SetUserProfile = 'Ocorreu uma falha durante a opera��o de defini��o de um perfil para o usu�rio. Verifique os logs para obter mais informa��es sobre o problema.';
      UserDataNotFound = 'N�o foram encontradas informa��es sobre este usu�rio!';
   end;



   //Mensagens de erro espec�ficas do m�dulo "secretarias".
   TCosmosErrorSecMsg = class
     const
      CalcularCandidatos = 'Ocorreu um erro durante a busca pelos candidados a membros da nova turma de instala��o. A sele��o dos candidatos dever� ser feita manualmente.';
      DuplicateCandidato = 'O candidato selecionado na pesquisa j� se encontra na lista de candidatos da turma de instala��o!';
      CreateTurmaInstalacao = 'Ocorreu uma falha durante a cria��o da nova turma de instala��o. Entre em contato com o administrador do sistema Cosmos.';
      InstalarTurmaAluno   = 'Ocorreu um erro durante a instala��o de uma turma de alunos. A turma n�o pode ser instalada. Verifique os logs para obter mais informa��es.';
      TurmaInstalada = 'A turma selecionada j� se encontra instalada!';
      NumeroTurmaInstalacao = 'Ocorreu uma falha ao tentar calcular o n�mero da nova turma de instala��o. Entre em contato com o administrador do sistema Cosmos.';
      DelMembroTurmaInstalacao = 'Ocorreu uma falha ao tentar excluir o membro da turma de instala��o selecionado. Entre em contato com o administrador do sistema Cosmos.';
      InstalacaoInvalida = 'A instala��o de um ou mais membros da turma de instala��o n�o � v�lida. O candidato pode estar em um discipulado posterior ao da instala��o ou estar inativo.';
      NovoInstalando = 'Ocorreu um erro ao tentar adicionar um novo membro desta turma de instala��o. Entre em contato com o administrador do sistema Cosmos.';
      AnularHistorico = 'Ocorreu uma falha na tentativa de anular o hist�rico discipular. Consulte os logs para obter mais informa��es sobre o problema.';
      NovaMatricula = 'Ocorreu uma falha ao tentar gerar um n�mero de matr�cula para o cadastrado. Consulte os logs para obter mais informa��es sobre o problema.';
      CantDeleteLessonEI = 'N�o � poss�vel excluir esta li��o da Escola Interna. A li��o j� foi ou est� sendo utilizadas por um ou mais c�rculos do campo de trabalho brasileiro.';
      DeleteLessonEI = 'Ocorreu um erro durante a exclus�o de uma li��o da Escola Interna. Entre em contato com um respons�vel pelo sistema Cosmos.';
      ReorderBookEI = 'Ocorreu uma falha durante a reordena��o dos livros da Escola Interna! Consulte os logs para obter informa��es sobre a natureza da falha.';
      ReorderLessonEI = 'Ocorreu uma falha durante a reordena��o de li��es da Escola Interna! Consulte os logs para obter informa��es sobre a natureza da falha.';
      CantDeleteBookEI = 'N�o � poss�vel excluir este livro da Escola Interna. O livro possui li��es que j� foram ou est�o sendo utilizadas por um ou mais c�rculos do campo de trabalho brasileiro.';
      DeleteBookEI = 'Ocorreu um erro durante a exclus�o de um livro da Escola Interna. Entre em contato com um respons�vel pelo sistema Cosmos.';
      NovoCirculoEI = 'Falha durante a cria��o do novo c�rculo da Escola Interna. Consulte os logs para obter maiores informa��es sobre o problema.';
      DesativarCirculoEI = 'Ocorreu um erro ao tentar desativar um c�rculo da Escola Interna. Consulte os logs para obter maiores informa��es sobre o problema.';
      DelAtividades = 'N�o � poss�vel excluir esta atividade, pois existem informa��es relacionadas a ela que seriam perdidas!';
      LimparFrequencia = 'N�o foi poss�vel concluir a tarefa de limpeza de controle de freq��ncia para a atividade selecionada. Consulte os logs para obter mais informa��es sobre o problema.';
      DuplicatedMembroCirculoEI = 'Um ou mais membros do c�rculo j� est�o vinculados a outro c�rculo da Escola Interna deste ou de outro foco. Um aluno somente pode estar vinculado a um c�rculo.';
      AutoTitular = 'O cadastrado n�o pode ser titular de si mesmo!';
      SavePhoto = 'Ocorreu uma falha ao tentar salva a foto de um aluno, pesquisador ou jovem do TM. Verifique nos logs do sistema as informa��es sobre a falha ocorrida.';
      LoadPhoto = 'Erro ao tentar obter a foto de um aluno, pesquisador ou jovem do TM. O erro pode acontecer ao tentar ler a foto de um arquivo com um tipo de formato n�o suportado ou que est� corrompido. Verifique nos logs do sistema as informa��es sobre a falha ocorrida.';
      EncerrarTurmaTP = 'Ocorreu um erro ao tentar encerrar uma turma do Trabalho P�blico. Se poss�vel, consulte os logs do servidor para obter mais informa��es sobre o erro.';
      ReativarTurmaTP = 'Ocorreu um erro ao tentar reativar uma turma do Trabalho P�blico. Se poss�vel, consulte os logs do servidor para obter mais informa��es sobre o erro.';
      TurmaEI = 'Esta � uma turma de instala��o de um discipulado da Escola Interna. Apenas usu�rios com privil�gios de acesso aos dados da Escola Interna podem executar esta opera��o.';
      AddDelInstalandos = 'N�o � poss�vel adicionar ou remover instalandos ou alterar dados de protocolo de instala��o de uma turma que j� foi instalada! A opera��o ser� cancelada.';
      DelTiposAtividades = 'Existem refer�ncias a atividades deste tipo na agenda nacional de atividades. � imposs�vel excluir um tipo de atividade que j� tenha sido referenciado na agenda de atividades.';
      CarteirinhaInstalandos = 'Somente � poss�vel emitir a carteirinha dos alunos de uma turma que j� foi instalada.';
      TipoAtividadeLR = 'Voc� n�o est� autorizado a cadastrar tipos de atividades ' +
         'promovidas pelo Lectorium Rosicrucianum.';
      TipoAtividadeTM = 'Voc� n�o est� autorizado a cadastrar tipos de atividades ' +
         'promovidas pelo Trabalho da Mocidade.';
      TipoAtividadeTMB = 'Voc� n�o est� autorizado a cadastrar tipos de atividades ' +
         'promovidas pelo Trabalho de Membros.';
      TipoAtividadeTP = 'Voc� n�o est� autorizado a cadastrar tipos de atividades ' +
         'promovidas pelo Trabalho P�blico.';
      TipoAtividadeSIM = 'Voc� n�o est� autorizado a cadastrar tipos de atividades ' +
         'promovidas pelo trabalho de simpatizantes.';
      TipoAtividadeEI = 'Voc� n�o est� autorizado a cadastrar tipos de atividades ' +
         'promovidas pela Escola Interna.';
      LoadPhotoPupil = 'A foto de um aluno, membro ou jovem do TM n�o pode ser exibida. ' +
         'Talvez tenha ocorrido uma falha na comunica��o com o servidor do Cosmos ou a ' +
         'foto est� corrompida.';
      DirigenteExists = 'O dirigente "%s" j� se encontra vinculado a esta gest�o!';
   end;


   //Mensagens de erro espec�ficas do m�dulo "financeiro".
   TCosmosErrorFinMsg = class
     const
       DeleteContaBancariaEmUso = 'N�o � poss�vel excluir a conta banc�ria porque existem lan�amentos associados a ela.';
       DeleteContaSubcontas = 'A exclus�o da conta foi cancelada. Existem outras contas vinculada a esta conta. Tente excluir todas as subcontas antes de excluir a conta selecionada.';
       DeleteContasUsadas = 'A exclus�o da conta foi cancelada. Esta conta est� sendo usada no momento e existem informa��es de lan�amentos financeiros associadas � conta.';
       DesativaContasBancaria = 'Ocorreu uma falha ao tentar desativar uma conta banc�ria. Tente novamente mais tarde.';
       ReativaContasBancaria = 'Ocorreu uma falha ao tentar reativar uma conta banc�ria. Tente novamente mais tarde.';
       DeleteConta = 'A exclus�o da conta foi cancelada. Ocorreu um erro desconhecido durante a opera��o.';
       MoveConta = 'N�o foi poss�vel alterar a conta desejada do Plano de Contas. O sistema registrou uma falha inesperada.';
       CaixaNovo = 'Ocorreu um erro inesperado ao tentar abrir um novo caixa para o usu�rio "%s". Tente novamente.';
       CaixaFechar = 'Ocorreu um erro inesperado ao tentar fechar um caixa para o usu�rio "%s". Tente novamente.';
   end;

   //Mensagens de erro espec�ficas do m�dulo "confer�ncias".
   TCosmosErrorConfMsg = class
     const
       CantClearConf = 'N�o � poss�vel limpar todos os registros de freq��ncia de uma confer�ncia!';
   end;

   //Mensagens de erro espec�ficas do m�dulo "usu�rios".
   TCosmosErrorUsuMsg = class
     const
       s = '';
   end;

   //Mensagens de erro espec�ficas do m�dulo "focos".
   TCosmosErrorFocMsg = class
     const
       RenameRa = 'Ocorreu uma falha de sistema ao tentar renomear uma regi�o administrativa. ' +
         'Tente novamente. Caso o erro persista, pe�a a algu�m para examinar os logs do servidor.';
       MoveRa = 'Ocorreu uma falha de sistema ao tentar mover uma regi�o administrativa. ' +
         'Tente novamente. Caso o erro persista, pe�a a algu�m para examinar os logs do servidor.';
       DeleteRa = 'Ocorreu uma falaha de sistema ao tentar excluir a regi�o administrativa selecionada.';
       CannotDeleteRa = 'Existem focos ou subregi�es ligadas a esta subregi�o. A exclus�o foi cancelada.';
       CreateRA = 'Ocorreu um erro ao tentar criar uma nova Regi�o Administrativa. ' +
         'Consulte os logs do servidor para obter mais informa��es. A opera��o foi cancelada.';
       DesactiveFoco = 'N�o foi poss�vel desativar o foco.';
       FocoDoadorInexiste = 'O foco que est� sendo desativado n�o pode ser encontrado. A opera��o foi cancelada.';
       FocoRecebedorInexiste = 'O foco que receber� as pessoas ligadas ao foco em desativa��o n�o pode ser encontrado. A opera��o foi cancelada.';
       CannotDeleteFoco = 'Ocorreu uma falha de sistema ao tentar excluir um foco. A opera��o foi cancelada.';
       CannotDeleteFocoHistorico = 'N�o � poss�vel excluir o foco! Existem informa��es no hist�rico discipular vinculadas ao foco.';
       CannotDeleteFocoCadastrados = 'O foco n�o pode ser exclu�do, pois existem cadastrados a ele ligados.';
       CreateFocoDuplicado = 'J� existe um foco cadastrado com o mesmo nome do ' +
         'foco que voc� est� tentando criar. A opera��o foi cancelada.';
       CreateFoco = 'Ocorreu uma falha durante o processo de cria��o do novo ' +
         'foco no servidor remoto. A opera��o n�o foi conclu�da com sucesso. Consulte ' +
         'os logs do servidor remoto para obter informa��es detalhadas sobre a falha.';
       CannotFindID = 'Erro: N�o foi poss�vel determinar o identificador �nico do �tem selecionado.';
       MoveFocoRa = 'N�o foi poss�vel alterar a vincula��o deste foco para uma nova regi�o administrativa. ' +
         'Ocorreu uma falha de sistema. Tente novamente.';
       ChangeFocusParent = 'Ocorreu um erro de sistema ao tentar mudar o foco titular de outro foco. Conulte ' +
         'os logs do servidor remoto para obter informa��es detalhadas sobre a falha.';
       ChangeFocusStatus = 'Ocorreu um erro de sistema ao tentar ativar ou desativar um foco. Conulte ' +
         'os logs do servidor remoto para obter informa��es detalhadas sobre a falha.';
       NoTargetFocus = 'Nenhum foco foi definido como receptor dos cadastrados ' +
         'a serem transferidos!';
       SameTargetFocus = 'O foco definido como receptor dos cadastrados � o ' +
         'mesmo que deve ser desativado! � imposs�vel prosseguir com a opera��o.';
       LengthSiglaFoco = 'A sigla do foco deve possuir 3 letras mai�sculas!';
   end;

 //Erros relacionados a relat�rios.-----------------------------------
   TCosmosReportsError = class
     const
       ParamDatasAtividade = '� preciso informar a data de in�cio e t�rmino ' +
         'que ser� usada para pesquisar a agenda de atividades!';
       ParamAno = '� preciso informar o ano para que o relat�rio selecionado ' +
         'seja gerado!';
       ParamCirculoEI = '� preciso informar um c�rculo da Escola Interna para ' +
         'que o relat�rio selecionado seja gerado!';
       ParamMatriculaLEC = '� preciso informar a matr�cula do aluno para ' +
         'gerar o relat�rio selecionado!';
       ParamMatriculaTM = '� preciso informar a matr�cula do jovem do TM para ' +
         'que o relat�rio selecionado seja gerado!';
       ParamMatriculaTMB = '� preciso informar a matr�cula do membro para ' +
         'que o relat�rio selecionado seja gerado!';
       ParamMatriculaTP = '� preciso informar a matr�cula do pesquisador ou ' +
         'cursista para que o relat�rio selecionado seja gerado!';
       ParamMatricula = '� preciso informar a matr�cula do cadastrado para ' +
         'gerar o relat�rio selecionado!';
       ParamAtividade = '� preciso informar uma atividade para gerar o ' +
         'relat�rio selecionado!';
   end;

   TCosmosMiscellaneous = class
     const
      //Nomes dos meses
      JAN = 'Janeiro';
      FEV = 'Fevereiro';
      MAR = 'Mar�o';
      ABR = 'Abril';
      MAI = 'Maio';
      JUN = 'Junho';
      JUL = 'Julho';
      AGO = 'Agosto';
      SETM = 'Setembro';
      OUTU = 'Outubro';
      NOV = 'Novembro';
      DEZ = 'Dezembro';
      //Vers�o de arquivo desconhecida (ferramenta "m�dulos do sistema").
      UnknowVersionFile = '-';
      Nacionalidade = 'Brasileira';
      Residencial = 'Residencial';
      Gestao = 'Gest�o';
      OrgaoGestor = '�rg�o Gestor';
      MembroOrgao = 'Membro de �rg�o Gestor';
      Unknown  = 'Desconhecido';
      ReceiptsDataList = '"[Contribuinte]";"[Valor da contribui��o]";"[Valor (extenso)]";"[Data do recebimento]";"[Foco recebedor]"';
   end;



implementation

end.


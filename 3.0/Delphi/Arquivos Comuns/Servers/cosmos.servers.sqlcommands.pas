unit cosmos.servers.sqlcommands;

{ATEN��O: AS CONSTANTES DESTA UNIDADE N�O PODEM SER TRADUZIDAS EM CASO
 DE LOCALIZA��O!}

interface

const

//----------------------------------------------------------------------
//Focos e regi�es administrativas
sSelFocos = 'select codfoc, nomfoc, sigfoc, tipfoc from viw_focos where indati = %s order by nomfoc';
sSQLFocosRa = 'select codfoc, nomfoc, tipfoc, sigfoc, indati from focos where ' +
 'codreg = %d and focpai is null %s order by indcab desc, nomfoc';
sSQLFocosRa2 = 'select codfoc, nomfoc, tipfoc, sigfoc, indati from focos where ' +
 'codreg = %d order by indcab desc, nomfoc';
sSQLFocosTitulares = 'select codfoc, nomfoc, tipfoc, sigfoc, indati from focos ' +
 'where indcab = %s and indati = %s order by nomfoc';
sSQLFocosDependentes = 'select codfoc, nomfoc, tipfoc, sigfoc, indati from focos ' +
 'where focpai = %d order by nomfoc';
sSQLFocosTitularAtivos = 'select codfoc, nomfoc, tipfoc, sigfoc, indati from ' +
 'focos where focpai = %d and indati = %s order by nomfoc';
sSQLFocosByType = 'select codfoc, nomfoc, tipfoc, sigfoc, indati from ' +
 'focos where tipfoc = %s and indati = %s order by nomfoc';


//FKs
sSQLfkFocosRegiao = 'select codreg, nomreg from regioes order by nomreg';
sSQLfkFocosTitulares = 'select codfoc as "focpai", nomfoc as "nompai", sigfoc as "sigpai" from focos order by nomfoc';
sSQLfkTiposContatos = 'select codtipcon, destipcon from tipos_contatos order by destipcon';
sSQLfkLogradouros = 'select * from viw_logradouros order by nomlog';
sSQLfkPaises = 'select codpai, nompai from paises order by nompai';
sSQLfkEstados = 'select codest, nomest, sigest from estados where codpai = %d order by nomest';
sSQLfkCidades = 'select codcid, nomcid, codest from cidades where codest = %d order by nomcid';
sSQLfkBairros = 'select codbai, nombai, nomcid, sigest, nompai from viw_bairros order by nombai';
sSQLfkOrgaosGestores = 'select codorg, nomorg, sigorg from orgaos_gestores order by nomorg';
sSQLfkOrgaosSuperiores = 'select codorg as "codpai", nomorg as "orgsup", sigorg from orgaos_gestores order by nomorg';
sSQLCargos = 'select * from cargos order by descar';
sSQLFuncoes = 'select codfun, desfun from funcoes order by desfun';
sSQLfkAreasAptidoes = 'select codare, desare from areas_aptidoes order by desare';
sSQLfkEnfermidades = 'select codenf, nomenf from enfermidades order by nomenf';
sSQLfkProfissoes = 'select codpro, despro from profissoes order by despro';
sSQLfkLicoesEI = 'select codlic, nomlic from licoes_ei order by ordlic';
sSQLfkTiposEventos = 'select codtipeve, destipeve from tipos_eventos where camtra = %s';
sSQLfkTiposAtuacao = 'select codtipatu, destipatu from tipos_atuacao order by destipatu';
sSQLCartasTP = 'select codtipeve, destipeve, tipeve, camtra from tipos_eventos ' +
 'where camtra = %s and tipeve = %s and indescint = %s order by destipeve';

//SQL�s diversos
sSQLCommandCentralPesquisa = 'select command  from pesquisas where codpes = %d';
sSQLDescriptografar = 'select * from descriptografar(%s)';
sSQLViw_aluno = 'select * from viw_alunos_discipulados where matcad = %s';



sDiscipuladosEI = 'select coddis, nomdis from discipulados where indescint = ' +
  '''' + 'S' + '''' + ' order by seqdis' ;
sDiscipulados = 'select coddis, nomdis, sigdis from discipulados where indescint = %s ' +
  'and camdis = %s and indati = %s order by seqdis' ;
sDiscipuladosCampos = 'select coddis, nomdis, sigdis from discipulados ' +
  'where camdis = %s order by seqdis' ;
sSelLivrosEI = 'select codliv as "cod", nomliv as "desc" from livros_ei where ' +
  'coddis = %d order by ordliv';
sLicoesLivroEI = 'select codlic as "cod", nomlic as "desc" from licoes_ei ' +
  'where codliv = %d order by ordlic';

sRegioes = 'select * from regioes where codpai is null order by nomreg';
sRegioesPai = 'select * from regioes where codpai = %d order by nomreg';
sListFocos = 'select codfoc, nomfoc, tipfoc, sigfoc, indati from focos %s order by nomfoc';
sSQLFilteredFocos = 'select codfoc, nomfoc, tipfoc, sigfoc from focos %s order by nomfoc';

sSelCount = 'select count(%s) from %s where %s = %d';
sSQLFindLogradouro = 'select * from viw_logradouros where ceplog = %s';
sSQLFocosStatus = 'select codfoc, nomfoc, tipfoc, sigfoc, indati from focos where indati = %s order by nomfoc';



sSQLListGestoesOrgao = 'select * from viw_gestoes where codorg = %d order by datini desc';
sSQLListDirecoesGestao = 'select * from viw_direcoes where codges = %d order by nomcad';
sSQLMaxTurmas_TP = 'select max(codtur) from turmas_tp where codfoc = %d';

//Cadastrados
sSQLCadastradoIndex = 'select codcad, matcad, nomcad, apecad, coddis, sigdis, codfoc, sigfoc, matcadint from viw_cadastrados where ' +
 'upper(matcad collate PT_BR) = upper(%s)';
sSQLCadastradosMatricula = 'select codcad, matcad, nomcad, apecad, coddis, sigdis, codfoc, sigfoc, matcadint from viw_cadastrados where ' +
 'camdis = %s and upper(matcad collate PT_BR) like upper(%s)';
sSQLCadastradosNome = 'select codcad, matcad, nomcad, apecad, coddis, sigdis, codfoc, sigfoc, matcadint from viw_cadastrados where ' +
 'camdis = %s and upper(nomcad collate PT_BR) like upper(%s)';
sSQLCadastradosApelido = 'select codcad, matcad, nomcad, apecad, coddis, sigdis, codfoc, sigfoc, matcadint from viw_cadastrados where ' +
 'camdis = %s and upper(apecad collate PT_BR) like upper(%s)';


//Alunado
sSQLJovensAlunos = 'select codcad, matcad, nomcad, apecad, coddis, sigdis, codfoc, sigfoc, matcadint from viw_cadastrados where ' +
 'camdis = %s and indgrujov = %s order by nomcad';
sSQLJovensAlunosFoco = 'select codcad, matcad, nomcad, apecad, coddis, sigdis, codfoc, sigfoc, matcadint from viw_cadastrados where codfoc = %d ' +
 'and camdis = %s and indgrujov = %s order by nomcad';
sSQLListaGeralAlunos = 'select matcad, nomcad, sigfoc, sexcad, datnas,  sigdis, ' +
 '(Extract(year from current_date) - Extract(year from datnas)) as "Idade" from ' +
 'viw_cadastrados where codfoc = %d and camdis = %s and indati = %s order by %s';
sSQLEnderecoCadastradoCorrespondencia = 'select * from viw_enderecos_cadastrados where codcad = %d and indcor = %s';
sSQLMeiosContatoCadastrado = 'select mei.codcad, mei.descon, tcon.destipcon ' +
 'from meios_contatos mei inner join tipos_contatos tcon on (tcon.codtipcon = mei.codtipcon) and codcad = %d';
sSQLHistoricoCadastrado = 'select * from viw_historico where codcad = %d order by dathis desc';
sSQLFamiliaresCadastrado = 'select codcad, nomfam, parfam, telfam, indfam from familiares where codcad = %d order by nomfam';

sSQLcsEnderecoFocoCampo = 'select edr.* from viw_enderecos_cadastrados edr join ' +
 'viw_cadastrados cad using(codcad) where cad.codfoc = %d and cad.indati = %s and cad.camdis = %s';
sSQLcsMeiosContatoFocoCampo = 'select mcon.codtipcon, tc.destipcon, mcon.descon, mcon.codfoc, mcon.codcon, cad.codcad, ' +
 'mcon.indcar, mcon.datcad, mcon.usures from meios_contatos mcon join tipos_contatos tc using (codtipcon) ' +
 'join viw_cadastrados cad using(codcad) where cad.codfoc = %d and cad.indati = %s and cad.camdis = %s';

//Fun��es cadastrados
sSQLFuncoesCadastrado = 'select cad.codfuncad, cad.codcad, cad.codfun, ' +
 'fun.desfun from funcoes_cadastrado cad inner join funcoes fun on (fun.codfun = cad.codfun) and codcad = %d order by fun.desfun';
sSQLListaListaFuncoesCadastrado = 'select fun.desfun from funcoes fun inner join funcoes_cadastrado cad ' +
  'on(cad.codfun = fun.codfun) and cad.codcad = %d order by fun.desfun';

//Pesquisas gen�ricas com argumentos: nome, apelido, campo de trabalho, sexo e ativo.
sSQLCadastradoCodigo = 'select codcad, matcad, matcadint, nomcad, apecad, sexcad, coddis, sigdis, nomdis, camdis, codfoc, nomfoc, sigfoc, indati ' +
 'from VIW_CADASTRADOS where codcad = %d';
sSQLCadastrado = 'select codcad, matcad, matcadint, nomcad, apecad, coddis, sigdis, nomdis, codfoc, nomfoc, sigfoc ' +
 'from VIW_CADASTRADOS where lower(%s) like lower(%s) and indati %s';
sSQLCadastradoCampo = 'select codcad, matcad, matcadint, nomcad, apecad, coddis, sigdis, nomdis, codfoc, nomfoc, sigfoc ' +
 'from VIW_CADASTRADOS where lower(%s) like lower(%s) and CAMDIS = %s and indati %s';
sSQLCadastradoSexo = 'select codcad, matcad, matcadint, nomcad, apecad, coddis, sigdis, nomdis, codfoc, nomfoc, sigfoc ' +
 'from VIW_CADASTRADOS where lower(%s) like lower(%s) and SEXCAD = %s and indati %s';
sSQLCadastradoCampoSexo = 'select codcad, matcad, matcadint, nomcad, apecad, coddis, sigdis, nomdis, codfoc, nomfoc, sigfoc ' +
 'from VIW_CADASTRADOS where lower(%s) like lower(%s) CAMDIS = %s and SEXCAD = %s and indati %s';
sSQLCadastradoFoco = 'select codcad, matcad, matcadint, nomcad, apecad, coddis, sigdis, nomdis, codfoc, nomfoc, sigfoc ' +
 'from VIW_CADASTRADOS where CODFOC = %d and lower(%s) like lower(%s) and indati %s';
sSQLCadastradoFocoCampo = 'select codcad, matcad, matcadint, nomcad, apecad, coddis, sigdis, nomdis, codfoc, nomfoc, sigfoc ' +
 'from VIW_CADASTRADOS where CODFOC = %d and lower(%s) like lower(%s) and CAMDIS = %s and indati %s';
sSQLCadastradoFocoSexo = 'select codcad, matcad, matcadint, nomcad, apecad, coddis, sigdis, nomdis, codfoc, nomfoc, sigfoc ' +
 'from VIW_CADASTRADOS where CODFOC = %d and lower(%s) like lower(%s) and SEXCAD = %s and indati %s';
sSQLCadastradoFocoCampoSexo = 'select codcad, matcad, matcadint, nomcad, apecad, coddis, sigdis, nomdis, codfoc, nomfoc, sigfoc ' +
 'from VIW_CADASTRADOS where CODFOC = %d and lower(%s) like lower(%s) and CAMDIS = %s and SEXCAD = %s and indati %s';

sSQLCadastradosFocoCampo = 'select codcad, matcad, matcadint, nomcad, apecad, coddis, sigdis, nomdis, codfoc, nomfoc, sigfoc ' +
 'from VIW_CADASTRADOS where CODFOC = %d and CAMDIS = %s and indati = %s';

//Escola Interna
sSQLSearchCirculosEIFocoDiscipulado = 'select codgru, nomgru, sigdis, nomdis, nomliv, nomlic from viw_circulos_ei where codfoc = %d and coddis = %d order by nomgru';
sSQLSearchMentoresEI = 'select codcad, matcad, nomcad, apecad from cadastrados ' +
 'where indmen = %s and sexcad = %s and indati = %s';
sSQLSearchMentoresEIFoco = 'select codcad, matcad, nomcad, apecad from cadastrados ' +
 'where indmen = %s and sexcad = %s and indati = %s and codfoc = %d';
sSQLDiscipuladosAnterioresAtual = 'select coddis, nomdis, camdis from discipulados ' +
 'where camdis = %s union select coddis, nomdis, camdis from  discipulados ' +
 'where seqdis <= (select seqdis from discipulados where coddis = %d) ' +
 'and camdis = %s';

//Atividades
sSQLTiposAtividades = 'select codtipati, destipati, horati, campro, indfre, indescint, ' +
 'indest from tipos_atividades where campro = %s and indescint = %s and indati = %s order by destipati';
sSQLPesquisaAtividades = 'select * from viw_atividades where extract(month from datati) = %d ' +
 'and extract(year from datati) = %d and campro = %s and indfre = %s order by datati desc';
sSQLPesquisaAtividadesFoco = 'select * from viw_atividades where extract(month from datati) = %d ' +
 'and extract(year from datati) = %d and campro = %s and indfre = %s and codfoc = %d order by datati desc';
sSQLCountAtividadesLessons = 'select count(codlic) from atividades where codlic = %d';

//Turmas de instala��o
sSQLTurmasInstalacao = 'select tur.codturins, tur.numtur, tur.codfoc, tur.coddis, dis.nomdis, ' +
 'dis.indescint, tur.indins from turmas_instalacoes tur inner join discipulados dis ' +
 'on (dis.coddis = tur.coddis) and tur.codfoc = %d and extract(year from tur.datcad) = %d';
sSQLMembrosTurmaInstalacao = 'select mem.codmem, mem.codturins, mem.codcad, ' +
 'cad.nomcad, cad.matcad, cad.codfoc, cad.coddis, dis.nomdis from ' +
 'membros_turmas_instalacoes mem inner join cadastrados cad on (cad.codcad = mem.codcad) ' +
 'inner join discipulados dis on (dis.coddis = cad.coddis) where mem.codturins = %d ' +
 'order by cad.nomcad';
sSQLCountAtividadesTurmaTP = 'select count(codati) from atividades where codtur = %d';
sSQLDiscipuladoTM = 'select * from DISCIPULADO_TM(%s)';
sSQLFocosTipos = 'select codfoc, nomfoc, sigfoc from focos where indati = %s ' +
 'and %s = %s order by nomfoc';
sSQLFocoAtivos = 'select codfoc, nomfoc, sigfoc, tipfoc, indati from focos where indati = %s order by nomfoc';

sSQLTiposEventos = 'select eve.codtipeve, eve.destipeve, eve.tipeve, eve.camtra, ' +
 'eve.coddis, dis.sigdis from tipos_eventos eve ' +
 'left outer join discipulados dis on (eve.coddis = dis.coddis) ' +
 'where eve.tipeve = %s';
sSQLCarteirinhasCadastrados = 'select codcad, matcad, nomcad, docide, orgexp, fotcad from ' +
 'cadastrados where indati = %s and upper (matcad collate PT_BR) in (%s) order by nomcad';
sSQLConferenciasFocoAno = 'select conf.codcon, conf.nomcon, conf.camcon, conf.stacon ' +
 'from conferencias conf where conf.codfoc = %d and extract(year from conf.datini) = %d ' +
 'order by conf.datini';
sSQLFocosConferencia = 'select distinct(foc.codfoc), foc.nomfoc, foc.tipfoc from focos foc inner ' +
 'join conferencias con on(con.codfoc = foc.codfoc) and extract(year from con.datini) = %d order by foc.nomfoc';
sSQLBairros = 'select codbai, nombai, nomcid, nomest, sigest, nompai from viw_bairros ' +
 'where nombai collate PT_BR starting with %s order by nombai';
sSQLCidades = 'select cid.codcid, cid.nomcid, est.sigest, pai.nompai from cidades cid ' +
 ' inner join estados est on (cid.codest = est.codest)  inner join paises pai on (pai.codpai = est.codpai) ' +
 ' and upper(cid.nomcid) collate PT_BR starting with %s order by cid.nomcid';
sSQLEstados = 'select est.codest, est.nomest, est.sigest, pai.nompai from estados est ' +
 ' inner join paises pai on (pai.codpai = est.codpai) where nomest ' +
 'collate PT_BR starting with %s order by pai.nompai, est.nomest';
sSQLPaises = 'select * from paises where nompai collate PT_BR starting with %s order by nompai';
sSQLAlocucoes = 'select alo.codalo, alo.titalo, alo.fraalo, alo.nomaut ' +
 'from alocucoes alo where upper(%s) like upper(%s) and indlec = %s and indtmo = %s and ' +
 'indtmb = %s and indtpu = %s';
sSQLCadastradoMatricula = 'select codcad, nomcad, matcad, sigdis, sigfoc from ' +
 'VIW_ALUNOS_DISCIPULADOS where matcad = %s';
sSQLCadastradoNome = 'select codcad, nomcad, matcad, sigdis, sigfoc from ' +
 'VIW_ALUNOS_DISCIPULADOS where nomcad like %s';


sSQLFichaUsuario = 'select * from viw_usuarios where upper(logusu) = %s';

//Cadastrados
sSQLDiscipuladoCadastrado = 'select cad.codcad, dis.coddis, dis.nomdis from cadastrados cad ' +
 'inner join discipulados dis on (cad.coddis = dis.coddis) and cad.codcad = %d';
sSQLCadastradosDiscipulado = 'select codcad, matcad, nomcad, apecad, sigdis, ' +
 'sigfoc, indati from viw_cadastrados where sigdis = %s and indati = %s and ' +
 'order by nomcad';
sSQLListaCadastradosDiscipuladoFoco = 'select codcad, matcad, nomcad, apecad, datnas, sexcad, sigdis, ' +
 'indescint, sigfoc, indati, matcadint from viw_cadastrados where ' +
 'sigdis = %s and indati = %s and codfoc = %d order by nomcad';
sSQLListaCadastradosNomeFoco = 'select codcad, matcad, nomcad, apecad, datnas, sexcad, sigdis, ' +
 'indescint, sigfoc, indati, matcadint from viw_cadastrados where ' +
 '((nomcad collate PT_BR starting with %s) or (nomcad collate PT_BR starting with %s)) ' +
 'and codfoc = %d and indati = %s and camdis = %s order by nomcad';

//Hist�rico discipular
sSQLDiscEventoHistorico = 'select dis.coddis, dis.nomdis from discipulados dis inner join tipos_eventos ' +
  'tip on (tip.coddis = dis.coddis) and tip.codtipeve = %d';

//Alocu��es
sSQLAlocucoesDataCadastro  = 'select codalo, titalo, nomaut, datati from viw_alocucoes ' +
 'where (current_timestamp - datcad) <= %d';
sSQLAlocucoesDataLeitura = 'select codalo, titalo, nomaut, datati from viw_alocucoes ' +
 'where (current_date - datati) <= %d';
sSQLAlocucoesIneditas = 'select codalo, titalo, nomaut, datati from viw_alocucoes ' +
 'where datati is null';
sSQLAlocucoesAssunto = 'select codalo, titalo, nomaut, datati from viw_alocucoes ' +
 'where codalo in (select codalo from keywords keys where lower(keys.keywor) in (%s))';
sSQLAlocucoesAutor = 'select codalo, titalo, nomaut, datati from viw_alocucoes ' +
 'where nomaut like %s';
sSQLAlocucoesCamposTrabalho = 'select codalo, titalo, nomaut, datati from viw_alocucoes ' +
 'where indlec = %s and indtmo = %s and indtmb = %s and indtpu = %s';


//Selects relacionados a sincroniza��o
sSQLSincStatus = 'select * from CONTROLE_MENSAGENS order by DATA_MODIFICACAO desc';

//---------------------------

//Selects de relat�rios

sSQLReportRelacaoGeralAlunos = 'select * from instalacoes(%d) where camdis = ' + '''' + 'LEC' + '''' +
 'and indati = ' + '''' + 'S' + '''' + ' order by nomcad collate PT_BR';
sSQLReportListaPresencaAtividade = 'select cad.codcad, cad.nomcad, cad.matcad, ' +
 'cad.camdis  from viw_cadastrados cad where cad.coddis in (select coddis from ' +
 'atividades_discipulados where codati = %d) and cad.codfoc in (select codfoc ' +
 'from atividades_focos where codati = %d) and cad.indati = ' + '''' + 'S' + '''' + ' order by cad.camdis, cad.%s';
sSQLReportFolhaPresenca = 'select * from folha_presenca(%d, %s)';
sSQLReportCadastradosDicipulado = 'select matcad, nomcad, datnas, sigdis from viw_cadastrados ' +
 'where codfoc = %d and sigdis = %s and indati = %s order by %s';
sSQLReportTotalAlunos = 'select sum(numcad) as "Total" from contar_cadastrados(%d, %s)';
//select * from contar_cadastrados(:codfoc, :camtra)
sSQLReportContarAlunosEE = 'select * from contar_cadastrados(%d, %s) ' +
 'where indescint = ' + '''' + 'N' + '''';
sSQLReportContarAlunosEI = 'select * from contar_cadastrados(%d, %s) ' +
 'where indescint = ' + '''' + 'S' + '''';
sSQLReportCadastradoCodigo = 'select codcad, matcad, nomcad from cadastrados where codcad = %d';
sSQLReportHistoricoCadastrado = 'select * from viw_historico where codcad = %d order by dathis desc';
sSQLReportAtividadesCampo = 'select * from viw_atividades where datati between ' +
 '%s and %s and codfoc = %d and campro = %s order by datati, horati';
sSQLReportEscalasAtividades = 'select esc.codati, esc.codcad, cad.nomcad, ' +
 'esc.codtipatu, tip.destipatu from escalas_atividades esc inner join cadastrados cad ' +
 'on (cad.codcad = esc.codcad) inner join tipos_atuacao tip ' +
 'on (tip.codtipatu = esc.codtipatu) order by cad.nomcad';
sSQLReportMembrosCirculo = ' select matcad, nomcad, indcon from viw_membros_circulos ' +
 'where codgru = %d order by nomcad';
sSQLReportCirculosEI = 'select codgru, nomgru, sigdis from viw_circulos_ei ' +
 'where codfoc = %d order by nomgru';
sSQLReportMembrosCirculos = 'select * from viw_membros_circulos order by codgru, nomcad asc';
sSQLReportTempoDiscipulado = 'select * from calcula_tempo_discipulado(%d, %s) order by nomcad collate pt_br';
sSQLReportListaProfissoes = 'select codpro, despro from profissoes where codpro in ' +
 '(select codpro from cadastrados where codfoc = %d and indati = %s) order by despro';
sSQLReportCadastradosProfissoes = 'select cad.codcad, cad.matcad, cad.nomcad, cad.codpro ' +
 'from cadastrados cad where cad.codfoc = %d and cad.indati = %s order by cad.nomcad';
sSQLReportListaFuncoes = 'select * from funcoes order by desfun';
sSQLReportCadastradosFuncoes = 'select fun.codfuncad, fun.codfun, cad.codcad, cad.matcad, ' +
 'cad.nomcad, cad.sigdis from funcoes_cadastrado fun inner join viw_cadastrados cad on ' +
 '(cad.codcad = fun.codcad) and cad.codfoc = %d and cad.indati = %s order by cad.nomcad';
sSQLReportFamiliares = 'select codcad, nomfam, parfam, telfam, indfam from familiares order by nomfam';
sSQLReportFrequenciaAno = 'select * from contabilizar_frequencia(%d, %d)';
sSQLReportFrequenciaAnoDiscipulado = 'select * from contabilizar_frequencia(%d, %d) where sigdis = %s';
sSQLReportFrequenciaPeriodo = 'select * from contabilizar_frequencia_periodo(%d, %d, %d, %d, %d) order by %s';
sSQLReportFrequenciaPeriodoDiscipulado = 'select * from contabilizar_frequencia_periodo(%d, %d, %d, %d, %d) ' +
 'where sigdis = %s order by %s';
sSQLReportFrequenciaAtividades = 'select * from frequencia_tipo_atividade(%d, %d, %d, %d, %d, %d) ' +
 'order by %s';
sSQLReportFrequenciaAtividadesEI = 'select * from frequencia_escola_interna(%d, %d, %d, %d, %d) ' +
 'order by nomcad';
sSQLReportAniversariantesMes = 'select matcad, nomcad, apecad, datnas, nomdis from ' +
 'viw_cadastrados where codfoc = %d and camdis = %s and indati = %s and extract(month from datnas) = %d order by nomcad';
sSQLReportSumarizaAtividades = 'select * from sumariza_atividades(%d, %d, %s) order by destipati';
sSQLReportResumoEstatistico = 'select * from resumo_estatistico';
sSQLReportResumoEstatisticoRa = 'select * from resumo_estatistico where (codreg = %d) and (codpai = %d)';
sSQLReportResumoEstatisticoParent = 'select * from resumo_estatistico where (codpai = %d)';
sSQLReportMalaDireta = 'select * from MAIL_LABEL_CADASTRADOS where codfoc = %d ' +
 'and camtra = %s and indati = %s';
sSQLReportOcorrenciasMes = 'select his.dathis, cad.nomcad, tip.destipeve from historicos his ' +
 'inner join tipos_eventos tip on(tip.codtipeve = his.codtipeve) inner join focos foc ' +
 'on (foc.codfoc = his.codfoc) inner join cadastrados cad on (cad.codcad = his.codcad) ' +
 'and extract(month from his.dathis) = %d and extract(year from his.dathis) = %d ' +
 'and his.codfoc = %d and tip.camtra = %s and tip.tipeve in (' +
 '''' + 'BAT' + '''' + ',' + '''' + 'CFR' + '''' + ',' + '''' + 'DES' + '''' + ',' +
 '''' + 'REL' + '''' + ',' + '''' + 'TRA' + '''' + ',' + '''' + 'CAS' + '''' + ',' +
 '''' + 'INS' + '''' + ',' + '''' + 'RET' + '''' + ') order by his.dathis, cad.nomcad';
sSQLListaMembrosCirculo = 'select cad.codcad, cad.matcad, cad.nomcad, cad.matcadint ' +
 'from viw_cadastrados cad inner join membros_grupos_ei cir on cir.codcad = cad.codcad ' +
 'where cir.codgru = %d order by cad.nomcad';
sSQLEnderecosMembrosCirculo = 'select edr.* from viw_enderecos_cadastrados edr join ' +
 'viw_membros_circulos mem using(codcad) where mem.codgru = %d';
sSQLMeiosContatoMembrosCirculo = 'select mei.codcad, mei.descon, tcon.destipcon from meios_contatos mei ' +
 'inner join tipos_contatos tcon on (tcon.codtipcon = mei.codtipcon) and codcad in ' +
 '(select codcad from viw_membros_circulos where codgru = %d)';
sSQLReportInformacoesInscritosByFlag = 'select det.codins, det.matcad, det.nomcad, ' +
'ins.sigdis, ins.sigfoc, ins.nomalo, ins.numqua, ins.numlei from viw_detalhes_inscricao det ' +
'inner join viw_inscricoes ins on(ins.codins = det.codins) where det.codcon = %d and det.codite = %d ' +
'and det.valinf = ' + '''' + 'S' + '''' + ' order by det.nomcad';
sSQLReportQuadroTotalizacaoRa = 'select * from resumo_estatistico_ras';
sSQLReportQuadroTotalizacaoRaTM = 'select * from resumo_estatistico_tm order by codreg, nomfoc';


//Exporta��es de dados de cadastrados--------------------
sSQLExportCadastrados = 'select cad.nomcad, cad.sigfoc, cad.sigdis ' +
 'from viw_cadastrados cad where cad.codfoc = %d and cad.sigdis in (%s) and ' +
 'cad.indati = %s order by cad.nomcad';
sSQLExportCadastradosEnderecos = 'select cad.nomcad, cad.sigfoc, cad.sigdis, edr.nomlog, edr.numend, edr.comend, edr.ceplog, ' +
 'edr.nombai, edr.nomcid, edr.sigest, edr.nompai from viw_cadastrados cad ' +
 'inner join viw_enderecos_cadastrados edr on (cad.codcad = edr.codcad) and '+
 'cad.codfoc = %d and cad.sigdis in (%s) and cad.indati = %s order by cad.nomcad';
sSQLExportCadastradosEnderecosTelefones = 'select cad.nomcad, cad.sigfoc, cad.sigdis, edr.nomlog, edr.numend, edr.comend, edr.ceplog, ' +
'edr.nombai, edr.nomcid, edr.sigest, edr.nompai, con.descon, tcon.destipcon ' +
'from viw_cadastrados cad inner join viw_enderecos_cadastrados edr on (cad.codcad = edr.codcad) ' +
'inner join meios_contatos con on(con.codcad = cad.codcad) ' +
'inner join tipos_contatos tcon on (tcon.codtipcon = con.codtipcon) and ' +
'cad.codfoc = %d and cad.sigdis in (%s) and cad.indati = %s and ' +
'tcon.destipcon <> ' + '''' + 'Email' + '''' + ' order by cad.nomcad';
sSQLExportCadastradosEnderecosEmails = 'select cad.nomcad, cad.sigfoc, cad.sigdis, edr.nomlog, edr.numend, edr.comend, edr.ceplog, ' +
'edr.nombai, edr.nomcid, edr.sigest, edr.nompai, con.descon, tcon.destipcon ' +
'from viw_cadastrados cad inner join viw_enderecos_cadastrados edr on (cad.codcad = edr.codcad) ' +
'inner join meios_contatos con on(con.codcad = cad.codcad) ' +
'inner join tipos_contatos tcon on (tcon.codtipcon = con.codtipcon) and ' +
'cad.codfoc = %d and cad.sigdis in (%s) and cad.indati = %s and ' +
'tcon.destipcon = ' + '''' + 'Email' + '''' + ' order by cad.nomcad';
sSQLExportCadastradosEnderecosTelefoneEmails = 'select cad.nomcad, cad.sigfoc, cad.sigdis, edr.nomlog, edr.numend, edr.comend, edr.ceplog, ' +
'edr.nombai, edr.nomcid, edr.sigest, edr.nompai, con.descon, tcon.destipcon from viw_cadastrados cad ' +
'inner join viw_enderecos_cadastrados edr on (cad.codcad = edr.codcad) ' +
'inner join meios_contatos con on(con.codcad = cad.codcad) ' +
'inner join tipos_contatos tcon on (tcon.codtipcon = con.codtipcon) and ' +
'cad.codfoc = %d and cad.sigdis in (%s) and cad.indati = %s order by cad.nomcad';
sSQLExportCadastradosTelefone = 'select cad.nomcad, cad.sigfoc, cad.sigdis, con.descon, tcon.destipcon ' +
'from viw_cadastrados cad inner join meios_contatos con on(con.codcad = cad.codcad) ' +
'inner join tipos_contatos tcon on (tcon.codtipcon = con.codtipcon) and ' +
'cad.codfoc = %d and cad.sigdis in (%s) and cad.indati = %s and ' +
'tcon.destipcon <> ' + '''' + 'Email' + '''' + ' order by cad.nomcad';
sSQLExportCadastradosEmails = 'select cad.nomcad, cad.sigfoc, cad.sigdis, con.descon, tcon.destipcon ' +
'from viw_cadastrados cad inner join meios_contatos con on(con.codcad = cad.codcad) ' +
'inner join tipos_contatos tcon on (tcon.codtipcon = con.codtipcon) and ' +
'cad.codfoc = %d and cad.sigdis in (%s) and cad.indati = %s and ' +
'tcon.destipcon = ' + '''' + 'Email' + '''' + ' order by cad.nomcad';
sSQLExportCadastradosTelefoneEmails = 'select cad.nomcad, cad.sigfoc, cad.sigdis, con.descon, tcon.destipcon ' +
'from viw_cadastrados cad inner join meios_contatos con on(con.codcad = cad.codcad) ' +
'inner join tipos_contatos tcon on (tcon.codtipcon = con.codtipcon) and ' +
'cad.codfoc = %d and cad.sigdis in (%s) and cad.indati = %s ' +
'order by cad.nomcad';


//Mensagens
sSQLMyMessages = 'select codmen, titmen, remmen, desmen, datmen, hormen, stamen ' +
 'from mensagens where desmen containing %s';

//INSERTs
sSQLInsertConferencia = 'INSERT INTO CONFERENCIAS (NOMCON, CODFOC, CAMCON, VALTAX, LIMINS, ' +
 'DATINI, HORINI, DATTER, HORTER, DATLIM, INDESP, STACON, INDMOD, TIPLEV, MESREF, USURES, DATCAD) VALUES ' +
 '(%s, %d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %d, %s, %s)';
sSQLInsGrupo = 'insert into grupos (nomgru) values (%s)';



sSQLCloneDirigente = 'execute procedure clone_dirigente(%d,%d)';
sSQLInsGestao = 'insert into gestoes (codges, codorg, datini, datter) values (%d, %d, %s, %s)';
sSQLInsDirigente = 'insert into DIRECOES (codges, codcad, codfoc, coddis, codcar, indcon, datini, datter) ' +
 'values (%d, %d, %d, %d, %d, %s, %s, %s )';
sSQLInsTurmaTP = 'insert into TURMAS_TP (codtur, codfoc) values (%d, %d);';
sSQLInsMembrosTurmasTP = 'insert into MEMBROS_TURMAS_TP (codtur, codcad) values (%d, %d);';



//Updates

sSQLUpdGrupos = 'update grupos set nomgru = %s where codgru = %d';
sSQLMoveDirigente = 'update direcoes set codges = %d where coddir = %d';
sSQLTerminateMandate = 'update direcoes set datter = %s where coddir = %d';
sSQLTerminateMandates = 'update direcoes set datter = %s where codges = %d';
sSQLTerminateGestao = 'update gestoes set datter = %s where codges = %d';

//Atividades de confer�ncias
sUpdAtividadesConferencia = 'update atividades set codcon = %d where codati = %d';
sUpdAtividadesConferenciaDel = 'update atividades set codcon = null where codati = %d';

//Deletes

sSQLDelGestao = 'delete from gestoes where codges = %d';
sSQLDelDirigente = 'delete from direcoes where coddir = %d';

sSQLDelTurmaTP = 'delete from turmas_tp where codtur = %d';
sSQLDelFlagInscricoes = 'delete from FLAGS_INSCRICAO where codfla = %d';

//Execute procedures
sExecGerarFrequencia = 'execute procedure gerar_frequencia(%d, %s)';
sExecGerarFrequenciaConf = 'execute procedure gerar_frequencia_conferencia(%d, %s)';
sExecAtualizaGruposTM = 'execute procedure atualiza_TM(%d, %s)';
sExecDesligaGJA = 'execute procedure desligar_GJA(%d, %s)';

type

///<summary>Nomes de sequences do banco de dados.</summary>
 TSequencesNames =  class
    const
      GEN_ACTIVE_RANGE = 'ACTIVE_RANGE';
      GEN_SYNC_STATUS = 'SYNC_STATUS';
      GEN_FOCOS = 'GEN_FOCOS_ID';
      GEN_REGIOES = 'GEN_REGIOES_ID';
      GEN_CADASTRADOS = 'GEN_CADASTRADOS_ID';
      GEN_PAISES = 'GEN_PAISES_ID';
      GEN_ESTADOS = 'GEN_ESTADOS_ID';
      GEN_CIDADES = 'GEN_CIDADES_ID';
      GEN_BAIRROS = 'GEN_BAIRROS_ID';
      GEN_LOGRADOUROS = 'GEN_LOGRADOUROS_ID';
      GEN_ENDERECOS = 'GEN_ENDERECOS_ID';
      GEN_MEIOS_CONTATOS = 'GEN_MEIOS_CONTATOS_ID';
      GEN_FAMILIARES = 'GEN_FAMILIARES_ID';
      GEN_INFO_MED = 'GEN_INFO_MED_ID';
      GEN_FUNCOES_CADASTRADO = 'GEN_FUNCOES_CADASTRADO_ID';
      GEN_CARGOS = 'GEN_CARGOS_ID';
      GEN_TIPOS_CONTATOS = 'GEN_TIPOS_CONTATOS_ID';
      GEN_MENTORES_REGIOES = 'GEN_MENTORES_REGIOES_ID';
      GEN_ORGAOS_GESTORES = 'GEN_ORGAOS_GESTORES_ID';
      sGESTOES = 'GEN_GESTOES_ID';
      GEN_DIRECOES = 'GEN_DIRECOES_ID';
      GEN_USUARIOS = 'GEN_USUARIOS_ID';
      GEN_GESTOES = 'GEN_GESTOES_ID';
      GEN_GRUPOS_USUARIOS = 'GEN_GRUPOS_USUARIOS_ID';
      GEN_PROFISSOES = 'GEN_PROFISSOES_ID';
      GEN_ENFERMIDADES = 'GEN_ENFERMIDADES_ID';
      GEN_LIVROS_EI = 'GEN_LIVROS_EI_ID';
      GEN_LICOES_EI = 'GEN_LICOES_EI_ID';
      GEN_ALOCUCOES = 'GEN_ALOCUCOES_ID';
      GEN_ALOJAMENTOS = 'GEN_ALOJAMENTOS_ID';
      GEN_KEYWORDS = 'GEN_KEYWORDS_ID';
      GEN_TURMASTP = 'GEN_TURMAS_TP_ID';
      GEN_MEMBROS_TURMAS = 'GEN_MEMBROS_TURMAS_TP_ID';
      GEN_GRUPOS_EI = 'GEN_GRUPOS_EI_ID';
      GEN_APTIDOES = 'GEN_APTIDOES_ID';
      GEN_DISPENSAS = 'GEN_DISPENSAS_ID';
      GEN_DBVERSION = 'GEN_DBVERSION';
      GEN_HISTORICOS = 'GEN_HISTORICOS_ID';
      GEN_DETALHES_HISTORICO = 'GEN_DETALHE_HISTORICO_ID';
      GEN_ATIVIDADES = 'GEN_ATIVIDADES_ID';
      GEN_ATIVIDADES_DISCIPULADOS = 'GEN_ATIVIDADES_DISCIPULADOS_ID';
      GEN_ATIVIDADES_FOCOS = 'GEN_ATIVIDADES_FOCOS_ID';
      GEN_ATRIBUTOS = 'GEN_ATRIBUTOS_ID';
      GEN_ESCALAS_ATIVIDADES =  'GEN_ESCALAS_ATIVIDADES_ID';
      GEN_TIPOS_ATIVIDADES = 'GEN_TIPOS_ATIVIDADES_ID';
      GEN_MEMBROS_GRUPOS_EI = 'GEN_MEMBROS_GRUPOS_EI_ID';
      GEN_FREQUENCIAS = 'GEN_FREQUENCIAS_ID';
      GEN_INSCRICOES = 'GEN_INSCRICOES_ID';
      GEN_AREAS_APTIDOES = 'GEN_AREAS_APTIDOES_ID';
      GEN_CONTAS = 'GEN_CONTAS_ID';
      GEN_RECEBIMENTOS = 'GEN_RECEBIMENTOS_ID';
      GEN_PAGAMENTOS = 'GEN_PAGAMENTOS_ID';
      GEN_TURMAS_INSTALACOES = 'GEN_TURMAS_INSTALACOES_ID';
      GEN_MEMBROS_TURMAS_INSTALACOES = 'GEN_MEMBROS_TURMAS_INSTALACOES_ID';
      GEN_FUNCOES = 'GEN_FUNCOES_ID';
      GEN_PARTICIPANTES = 'GEN_PARTICIPANTES_ID';
      GEN_ATRIBUTOS_LEITOS = 'GEN_ATRIBUTOS_LEITOS_ID';
      GEN_CONFERENCIAS_FOCOS = 'GEN_CONFERENCIAS_FOCOS_ID';
      GEN_CONFERENCIAS_DISC = 'GEN_CONFERENCIAS_DISC_ID';
      GEN_RELATORIOS_EXTERNOS = 'GEN_RELATORIOS_EXTERNOS_ID';
      GEN_PERFIS = 'GEN_PERFIS_ID';
      GEN_PRIVILEGIOS = 'GEN_PRIVILEGIOS_ID';
      GEN_CENTROS_CUSTOS = 'GEN_CENTRO_CUSTOS_ID';
      GEN_CONTAS_BANCARIAS = 'GEN_CONTAS_BANCARIAS_ID';
      GEN_TIPOS_RECEBIMENTOS = 'GEN_TIPOS_RECEBIMENTOS_ID';
      GEN_ATRIBUTOS_CADASTRADOS = 'GEN_ATRIBUTOS_CADASTRADOS_ID';
      GEN_AREAS = 'GEN_AREAS_ID';
      GEN_TAREFAS_STAFF = 'GEN_TAREFAS_STAFF_ID';
      GEN_QUARTOS = 'GEN_QUARTOS_ID';
      GEN_LEITOS = 'GEN_LEITOS_ID';
      GEN_FLAGS_INSCRICOES = 'GEN_FLAGS_INSCRICOES_ID';
      GEN_ITENS_INSCRICAO = 'GEN_ITENS_INSCRICAO_ID';
      GEN_STAFF = 'GEN_STAFF_ID';
      GEN_NOTAS_INSCRITO = 'GEN_NOTAS_INSCRITO_ID';
      GEN_CAIXAS = 'GEN_CAIXAS_ID';
 end;

///<summary>Nomes de tabelas do banco de dados.</summary>
 TTablesNames = class
   const
      TAB_ALOJAMENTOS = 'ALOJAMENTOS';
      TAB_APTIDOES = 'APTIDOES';
      TAB_ATIVIDADES = 'ATIVIDADES';
      TAB_ATIVIDADES_DISCIPULADOS = 'ATIVIDADES_DISCIPULADOS';
      TAB_ATIVIDADES_FOCOS = 'ATIVIDADES_FOCOS';
      TAB_ATRIBUTOS_CADASTRADOS = 'ATRIBUTOS_CADASTRADOS';
      TAB_ATRIBUTOS_LEITOS = 'ATRIBUTOS_LEITOS';
      TAB_BAIRROS = 'BAIRROS';
      TAB_CADASTRADOS = 'CADASTRADOS';
      TAB_CARGOS = 'CARGOS';
      TAB_CENTRO_CUSTOS = 'CENTRO_CUSTOS';
      TAB_CIRCULOS_EI = 'CIRCULOS_EI';
      TAB_CONFERENCIAS_DISCIPULADOS = 'CONFERENCIAS_DISCIPULADOS';
      TAB_CONFERENCIAS_FOCOS = 'CONFERENCIAS_FOCOS';
      TAB_CONTAS = 'CONTAS';
      TAB_CONTAS_BANCARIAS = 'CONTAS_BANCARIAS';
      TAB_DETALHE_HISTORICO = 'DETALHE_HISTORICO';
      TAB_DETALHE_INSCRICAO = 'DETALHE_INSCRICAO';
      TAB_DIRECOES = 'DIRECOES';
      TAB_DISCIPULADOS = 'DISCIPULADOS';
      TAB_ENDERECOS = 'ENDERECOS';
      TAB_ENFERMIDADES = 'ENFERMIDADES';
      TAB_ESCALAS_ATIVIDADES = 'ESCALAS_ATIVIDADES';
      TAB_FLAGS_INSCRICOES = 'FLAGS_INSCRICOES';
      TAB_FOCOS = 'FOCOS';
      TAB_FREQUENCIAS = 'FREQUENCIAS';
      TAB_FUNCOES = 'FUNCOES';
      TAB_FUNCOES_CADASTRADO = 'FUNCOES_CADASTRADO';
      TAB_GRUPOS_EI = 'GRUPOS_EI';
      TAB_INFO_MED = 'INFO_MED';
      TAB_INSCRICOES = 'INSCRICOES';
      TAB_ITENS_INSCRICAO = 'ITENS_INSCRICAO';
      TAB_HISTORICOS = 'HISTORICOS';
      TAB_LEITOS = 'LEITOS';
      TAB_LOGRADOUROS = 'LOGRADOUROS';
      TAB_MEIOSCONTATOS = 'MEIOS_CONTATOS';
      TAB_MEMBROS_GRUPOS_EI = 'MEMBROS_GRUPOS_EI';
      TAB_MENTORES_REGIOES = 'MENTORES_REGIOES';
      TAB_ORGAOS_GESTORES = 'ORGAOS_GESTORES';
      TAB_PAGAMENTOS = 'PAGAMENTOS';
      TAB_PARTICIPANTES = 'PARTICIPANTES';
      TAB_PERFIS = 'PERFIS';
      TAB_PROFISSOES = 'PROFISSOES';
      TAB_QUARTOS = 'QUARTOS';
      TAB_RECEBIMENTOS = 'RECEBIMENTOS';
      TAB_RELATORIOS_EXTERNOS = 'RELATORIOS_EXTERNOS';
      TAB_STAFF = 'STAFF';
      TAB_TIPOS_ATIVIDADES = 'TIPOS_ATIVIDADES';
      TAB_TIPOS_EVENTOS = 'TIPOS_EVENTOS';
      TAB_TIPOS_RECEBIMENTOS = 'TIPOS_RECEBIMENTOS';
 end;


///<summary>Nomes de stored procedures do banco de dados.</summary>
 TProceduresNames = class
   const
      PROC_ANULAR_EVENTO_DISCIPULAR = 'ANULAR_EVENTO_DISCIPULAR';
      PROC_BATIZAR_CADASTRADO = 'BATIZAR_CADASTRADO';
      PROC_CASAR_CADASTRADOS = 'CASAR_CADASTRADOS';
      PROC_DESLIGAR_CADASTRADO = 'DESLIGAR_CADASTRADO';
      PROC_ENVIAR_CARTA_FREQUENCIA = 'ENVIAR_CARTA_FREQUENCIA';
      PROC_RELIGAR_CADASTRADO = 'RELIGAR_CADASTRADO';
      PROC_REORDENAR_LIVRO_LICAO = 'REORDENAR_LIVRO_LICAO';
      PROC_RETROGRADAR_CADASTRADO = 'RETROGRADAR_CADASTRADO';
      PROC_TRANSFERIR_CADASTRADO = 'TRANSFERIR_CADASTRADO';
      PROC_CLONAR_ALOJAMENTO_INSCRITO = 'CLONAR_ALOJAMENTO_INSCRITO';
 end;


///<summary>Comandos relacionados � seguran�a do sistema.</summary>
 TSecurityCommand =  class
    const
      AdmUser = 'select indadm from USUARIOS where upper(logusu) = %s';
      //sLockedUsers = 'select logusu from usuarios where indati = %s';
      UserInfo = 'select * from viw_usuarios where upper(logusu) = upper(%s)';
      //sSQLIsADM = 'select INDADM from usuarios where upper(logusu) = upper(%s)';
      PerfilUsuario = 'select indlec, indtmo, indtmb, indtpu, indein, indsim, abrper from PERFIS where Upper(nomper) = %s';
      UserFocos = 'select * from FOCOS_USUARIO(%s) where %s = %s';
      UserModules = 'select * from PRIVILEGIOS where codusu = %d and %s';
      UserModule = 'select pri.codusu, pri.codfoc, pri.tipper, pri.indsec, pri.indfin, ' +
       'pri.indcon, pri.indfoc, pri.indusu from privilegios pri inner join usuarios usu ' +
       'on(pri.codusu = usu.codusu) and lower(usu.logusu) = lower(%s) and %s';
      UsuarioRolesAtivas = 'select nomper from viw_usuarios_perfis where upper(logusu) = upper(%s) and indati = %s';
      ChangePassword = 'update usuarios set paswrd = %s, indpro = %s where lower(logusu) = lower(%s)';
      PasswordIsTemporary = 'select indpro from usuarios where logusu = %s';
      InsertPerfilUsuario = 'insert into USUARIOS_PERFIS (codusu, codper) values (%d, %d)';
      DelPerfilUsuario = 'delete from  USUARIOS_PERFIS where codusu = %d and codper = %d';
      //sSQLDelPrivilegiosUser = 'delete from privilegios where codusu = %d';
      InsertCosmosUser = 'insert into USUARIOS (CODUSU, LOGUSU, PASWRD, CODCAD, INDATI, INDADM, INDBLO, INDPRO) ' +
       'values (%d, %s, %s, %d, %s, %s, %s, %s);';
      InsertPrivilegios = 'insert into privilegios (codusu, codfoc, tipper, indsec, indfin, ' +
       'indcon, indfoc, indusu) values (%d, %d, %s, %s, %s, %s, %s, %s);';
      SelRoles = 'select nomper from perfis order by nomper';
      UsuarioByLogin = 'select codcad, codusu, logusu, paswrd, nomcad, apecad, matcad, ' +
       'sigfoc, sigdis, datnas, indati, indadm from viw_usuarios where Upper(logusu) = %s';
      //sSQLUsuario = 'select logusu from usuarios where codusu = %d';
      RegisteredUsers = 'select * from usuarios order by logusu';
      DeleteUser = 'delete from usuarios where codusu = %d';
      DeleteFocusUser = 'delete from privilegios where codpri = %d';
      LoginExists = 'select logusu from usuarios where lower(logusu) = lower(%s)';
      LoginUser = 'select logusu, paswrd, indati, indadm, indblo, indpro from usuarios ' +
       'where lower(logusu) = lower(%s) and paswrd = %s';
      UsuarioInfo = 'select codusu, logusu, paswrd, nomcad, matcad, sigfoc, sigdis, indati, indblo, indadm from viw_usuarios where upper(logusu) = upper(%s)';
 end;

///<summary>Comandos gerais usados por mais de um m�dulo.</summary>
 TDQLCommand =  class
    const
      BufferSchemma = 'select * from %s';
      TableVersion  = 'select versao from tabelas_buferizadas where sigtab = %s';
      GeneralSelect = 'select * from %s';
      Generators = 'select gen_id(%s,%d) from rdb$database';
      ///<summary>Checa se um cadastrado est� falecido.</summary>
      CadastradoFalecido           = 'select datobi from cadastrados where codcad = %d';
      ///<summary>Recupera alguns dados b�sicos do cadastrado, incluindo foto.</summary>
      DadosCadastrado              = 'select codcad, nomcad, apecad, matcad, sigdis, sigfoc, ' +
         'fotcad from viw_cadastrados where codcad = %d';
      CadastradosMatriculaFoco = 'select codcad, matcad, nomcad, apecad, coddis, sigdis, codfoc, sigfoc, matcadint from viw_cadastrados where codfoc = %d ' +
         'and camdis = %s and upper(matcad collate PT_BR) like upper(%s)';
      CadastradosNomeFoco = 'select codcad, matcad, nomcad, apecad, coddis, sigdis, codfoc, sigfoc, matcadint from viw_cadastrados where codfoc = %d ' +
         'and camdis = %s and upper(nomcad collate PT_BR) like upper(%s)';
      CadastradosApelidoFoco = 'select codcad, matcad, nomcad, apecad, coddis, sigdis, codfoc, sigfoc, matcadint from viw_cadastrados where codfoc = %d ' +
         'and camdis = %s and upper(apecad collate PT_BR) like upper(%s)';
      CountFrequencias = 'select count(codati) from frequencias where codati = %d';
      ListaSimpatizantes = 'select codcad, nomcad, datnas, codfoc, sigfoc, orisim, indati from VIW_SIMPATIZANTES where ' +
         '((nomcad collate PT_BR starting with %s) or (nomcad collate PT_BR starting with %s)) ' +
         'and codfoc = %d and indati = %s order by nomcad';
      ListaTurmasTP = 'select codtur, numtur, datcre, datenc from turmas_tp where codfoc = %d and indenc = %s order by numtur';
      CodigoDiscipulado = 'select coddis from discipulados where camdis = %s and sigdis = %s';
      DiscipuladosCampos = 'select coddis, nomdis, sigdis from discipulados where camdis = %s and indati = %s order by seqdis' ;
 end;

///<summary>Comandos espec�ficos de relat�rios dos sistemas.</summary>
 TReportsCommand = class
   const
      ExternalReports = 'select distinct(tagrel) from relatorios_externos ' +
       'where %s = %s order by tagrel';
      Cadastrados = 'select * from viw_list_cadastrados %s';
      ListaCadastrados = 'select codcad, matcad, nomcad, matcadint from ' +
       'viw_cadastrados where codfoc = %d and indati = %s and camdis = %s order by %s';
      ListaCadastradosOrdenado = 'select codcad, matcad, nomcad, matcadint from ' +
       'viw_cadastrados where codfoc = %d and indati = %s and camdis = %s order by %s';
      ListaCadastradosNascimento = 'select cad.codcad, cad.matcad, cad.nomcad, cad.datnas, ' +
       'cad.coddis from viw_cadastrados cad where cad.codfoc = %d and cad.indati = %s and cad.camdis = %s order by cad.nomcad';
      //Ficha do aluno.
      FichaAluno = 'select * from viw_cadastrados where upper(matcad collate PT_BR) = ' +
       'upper(%s) order by matcad';
      FichaAlunoEndereco = 'select * from viw_enderecos_cadastrados where codcad is not null';
      FichaAlunoMeioContato = 'select mei.codcad, mei.descon, tcon.destipcon ' +
       'from meios_contatos mei inner join tipos_contatos tcon on (tcon.codtipcon = mei.codtipcon)';
      FichaAlunoHistorico = 'select * from viw_historico order by dathis desc';
      FichaAlunoFuncoes = 'select cad.codfuncad, cad.codcad, cad.codfun, ' +
       'fun.desfun from funcoes_cadastrado cad inner join funcoes fun on (fun.codfun = cad.codfun)';
      //Carteirinhas dos alunos e membros
      CarteirinhaAluno = 'select codcad, matcad, nomcad, docide, orgexp, ' +
       'fotcad from cadastrados where matcad in (%s) order by nomcad';
      CarteirinhaFamiliares = 'select fam.codcad, fam.nomfam, fam.parfam, ' +
       'fam.telfam, fam.indfam from familiares fam join cadastrados cad using(codcad) ' +
       'where cad.matcad in (%s) and fam.indcar = ' + '''' + 'S' + '''';
      CarteirinhaMeiosContato = 'select con.codcad, con.descon from meios_contatos con ' +
       'join cadastrados cad using(codcad) where cad.matcad in (%s) and con.indcar = ' + '''' + 'S' + '''';
      CarteirinhaEndereco = 'select edr.* from viw_enderecos_cadastrados edr ' +
       'join cadastrados cad using(codcad) where matcad in(%s)and edr.tipend = ' + '''' + 'R' + '''';
      Carteirinhas = 'select * from carteirinhas(%d) where matcad in (%s)';
 end;

 TReportsSecCommands =  class
    const
     FichasAlunos = 'select * from viw_cadastrados where upper(matcad collate PT_BR) in ' +
      '(%s) order by matcad';
     EnderecosCadastradosCorrespondencia = 'select * from viw_enderecos_cadastrados where ' +
      'codcad in (select codcad from cadastrados where upper(matcad collate PT_BR) in (%s))';
     FuncoesCadastrados = 'select cad.codfuncad, cad.codcad, cad.codfun, ' +
      'fun.desfun from funcoes_cadastrado cad inner join funcoes fun on (fun.codfun = cad.codfun) ' +
      'and codcad in (select codcad from cadastrados where upper(matcad collate PT_BR) in (%s)) order by fun.desfun';
     HistoricosCadastrados = 'select * from viw_historico where codcad in ' +
      '(select codcad from cadastrados where upper(matcad collate PT_BR) in (%s)) order by dathis desc';
     MeiosContatoCadastrados = 'select mei.codcad, mei.descon, tcon.destipcon ' +
      'from meios_contatos mei inner join tipos_contatos tcon on (tcon.codtipcon = mei.codtipcon) ' +
      'and codcad in(select codcad from cadastrados where upper(matcad collate PT_BR) in (%s))';
     SituacaoAtividades = 'select * from situacao_atividades(%d, %d, %s)';

 end;


 TReportsConfCommands =  class
    const
     ProgramacaoConferencia = 'select destipati, datati, horati, nomcon from viw_atividades ' +
       'where codcon = %d order by datati, horati';
     FolhasQuartos = 'select codqua, numqua, numlei, nomalo, alaqua, matcad, nomcad, ' +
       'sigfoc, indmon, indsub from viw_inscricoes where codcon = %d and codalo = %d ' +
       'and codqua is not null order by numqua, numlei';
     ListaInscritos = 'select codcad, matcad, nomcad, sigfoc, codqua, numqua, numlei, ' +
       'nomalo, alaqua, indmon, indsub from viw_inscricoes where codcon = %d order by nomcad';

 end;

///<summary>Comandos espec�ficos do Cosmos Gestor de Usu�rios.</summary>
 TGUsersCommands =  class
    const
      CosmosUsers = 'select codcad, codusu, logusu, nomcad, sigfoc, indblo, indadm, indati, indadm from viw_usuarios order by nomcad' ;
      UserRoles = 'select * from viw_usuarios_perfis where upper(logusu) = upper(%s)';
      UserAdministrator = 'update usuarios set indadm = %s where codusu = %d';
      ResetPassword = 'update usuarios set paswrd = %s, indpro = %s where codusu = %d';
      DeleteUser = 'delete from usuarios where codusu = %d';
      LockUser = 'update usuarios set indblo = %s where codusu = %d';
      UserExists = 'select logusu, paswrd, indati, indadm, indblo, indpro from usuarios ' +
        'where lower(logusu) = lower(%s)';
      UsuarioByCadastrado = 'select logusu from usuarios where codcad = %d';
      UsuarioCadastrador = 'select codcad, nomcad, sigfoc, sigdis, matcad from viw_usuarios where upper(logusu) = upper(%s) or ' +
         'upper(nomcad) = upper(%s)';
     CodigoPerfil = 'select codper from PERFIS where upper(nomper) = upper(%s)';
 end;

///<summary>Comandos gerais usados pelo Cosmos Gestor de Secretarias.</summary>
 TSecretariasCommands = class
   const
     NovaMatricula = 'select * from nova_matricula(%d,%s, %d)';
     DadosBasicosCadastrado  = 'select codcad, matcad, nomcad, coddis, codfoc, indati from cadastrados where codcad = %d';
     DadosDiscipulado = 'select coddis, nomdis, sigdis, seqdis, indati from discipulados where coddis = %d';
     DiscipuladosPosteriores  = 'select * from discipulados_posteriores(%d, %s) order by seqdis';
 end;

 TSecAtividadesCommands = class
   const
     AlocucaoInsert = 'insert into alocucoes (codalo, titalo, fraalo, nomaut, indlec, indtmo, indtmb, indtpu, notalo) values (%d, %s, %s, %s, %s, %s, %s, %s, %s)';
     AlocucaoKeywordInsert = 'insert into keywords (keywor, codalo) values (%s, %d)';
     AtividadeDelete = 'delete from ATIVIDADES where codati = %d';
     TiposAtividadesCount = 'select count(codati) from atividades where codtipati = %d';
     TiposAtividadesDelete = 'delete from tipos_atividades where codtipati = %d';
     FrequenciasClear = 'delete from frequencias where codati = %d';
     AtividadesDatasFoco = 'select * from viw_atividades where datati between ' +
       '%s and %s and codfoc in(%s) order by datati, horati desc';
 end;

///<summary>Comandos do Cosmos Gestor de Secretarias realcionados � Escola Interna.</summary>
 TSecretariasEICommands = class
   const
     LessonsCount = 'select count(codati) from atividades where codlic = %d';
     CirculosLicaoCount =  'select count(codgru) from grupos_ei where codlic = %d';
     BooksEICount = 'select count(codlic) from licoes_ei where codliv = %d';
     DeleteLessonEI = 'delete from licoes_ei where codlic = %d';
     DeleteLivroEI = 'delete from livros_ei where codliv = %d';
     InsertGruposEI = 'insert into GRUPOS_EI (codgru, codfoc, nomgru, coddis, codlic, sencon, codsac, codsaz) values (%d, %d, %s, %d, %d, %s, %s, %s);';
     InsertMembrosCirculoEI = 'insert into MEMBROS_GRUPOS_EI (codgru, codcad, indcon, datcad, usures) values (%d, %d, %s, %s, %s);';
     DeleteCirculoEI = 'delete from GRUPOS_EI where codgru = %d';
     MembroCirculoEI = 'select codcad from MEMBROS_GRUPOS_EI where codcad = %d';
 end;

///<summary>Comandos do Cosmos Gestor de Secretarias realcionados ao hist�rico discipular.</summary>
 TSecHistoricoCmd = class
   const
     TurmaInstalada = 'select indins from turmas_instalacoes where codturins = %d';
     AlunosInstalados = 'select codcad from membros_turmas_instalacoes where codturins = %d and indins = %s';
     TurmaInstalacao = 'select tur.*, dis.indescint from turmas_instalacoes tur inner join discipulados dis on (dis.coddis = tur.coddis) and tur.codturins = %d';
     ProtocoloIncompleto = 'select his.codhis from historicos his inner join detalhe_historico det on (det.codhis = his.codhis) and his.codturins = %d and det.indcum = %s';
     EncerrarTurmaTP = 'update turmas_tp set datenc = %s, indenc = %s where codtur = %d';
     ReativarTurmaTP = 'update turmas_tp set datenc = null, indenc = %s where codtur = %d';
     FecharTurmaIns = 'update turmas_instalacoes set indins = %s, usures = %s, datcad = current_timestamp where codturins = %d;';
     InserirMembrosTurmasIns = 'insert into membros_turmas_instalacoes (codturins, codcad) values (%d, %d);';
     InserirTurmasInstalacao = 'insert into turmas_instalacoes (codturins, numtur, codfoc, coddis, indins, usures) values (%d, %s, %d, %d, %s, %s);';
     NumeroTurmaInstalacao = 'select * from NUMERO_TURMA_INSTALACAO(%d)';
     DelInstalando = 'delete from membros_turmas_instalacoes where codturins = %d and codcad = %d;';
     DelProtocoloInstalando = 'delete from historicos where codcad = %d and codturins = %d;';
     DiscipuladosReligacao = 'select * from discipulados_religamento(%d) order by camdis, seqdis';
     DiscipuladosAnteriores = 'select coddis, nomdis, camdis from discipulados_anteriores(%d, %s, %s, %s, %s)';
     TurmaInstalacaoInfo = 'select tur.codturins, tur.numtur, tur.codfoc, foc.nomfoc, tur.coddis, dis.nomdis, tur.indins, tur.datcad, tur.usures ' +
        'from TURMAS_INSTALACOES tur inner join focos foc on(foc.codfoc = tur.codfoc) inner join discipulados dis on(dis.coddis = tur.coddis) and tur.codturins = %d';
     InstalarAluno = 'execute procedure Instalar_Aluno(%d, %d, %d, %d, %s, %s, %s);';
     MembrosTurmaInstalacao = 'select mem.codmem, mem.codturins, mem.codcad, cad.nomcad, cad.matcad, cad.codfoc, cad.coddis, dis.nomdis ' +
        'from membros_turmas_instalacoes mem inner join cadastrados cad on (cad.codcad = mem.codcad) inner join discipulados dis on (dis.coddis = cad.coddis) ' +
        'where mem.codturins = %d order by cad.nomcad';
 end;

///<summary>Comandos gerais usados pelo Cosmos Gestor de Focos.</summary>
 TFocosCommands = class
   const
     InsertRegion = 'insert into regioes (codreg, nomreg, codpai) values (%d,%s,%s)';
     RenameRegion = 'update regioes set nomreg = %s where codreg = %d';
     MoveRegion = 'update regioes set codpai = %d where codreg = %d';
     MoveRegionToRoot = 'update regioes set codpai = null where codreg = %d';
     MoveRegionFoco = 'update focos set codreg = %d where codfoc = %d';
     MoveFocoTitular = 'update focos set focpai = %d where codfoc = %d';
     DelRegiao = 'delete from regioes where codreg = %d';
     DelFocus = 'execute procedure delete_foco(%d)';
     DesactiveFoco = 'select status from desativar_foco(%d,%d,%s)';
     AlteraStatusFoco = 'update focos set indati = %s where codfoc = %d';
     MoveOrgao = 'update orgaos_gestores set codpai = %d where codorg = %d';
     FindFoco = 'select codfoc from focos where codfo = %d';
     FocusExistsName = 'select 1 as "cod" from focos where upper(nomfoc) = Upper(%s)';
     InsertFoco = 'INSERT INTO FOCOS (CODFOC, SIGFOC, NOMFOC, NOMTEM, CODREG, ' +
          'FOCPAI, TIPFOC, INDLEC, INDTPU, INDTMO, INDSIM, INDIND, ' +
          'INDATI, INDNAC, INDCAB) VALUES (%d, %s, %s, %s, %d, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)';
     InsertEnderecos = 'INSERT INTO ENDERECOS (CODLOG, NUMEND, COMEND, TIPEND, ' +
          'INDCOR, REFEND, ACEEND, CODCAD, USURES, DATCAD, CODFOC) VALUES (%d, %d, %s, %s, %s, %s, %s, %s, %s, ' +
          'current_timestamp, %s)';
     InsertMeiosContatos = 'insert into meios_contatos (descon, codtipcon, codcad, ' +
          'codfoc, indcar, usures, datcad) values (%s, %d, %s, %s, %s, %s, current_timestamp)';
     FocosRas = 'select * from viw_focos order by nomreg, nomfoc';
     ListOrgaos = 'select codorg, nomorg, nomorging, sigorg, nivorg, orgsup, nomfoc ' +
          'from viw_orgaos_gestores where codpai %s order by nomorg';
     OrgaosByName = 'select codorg, nomorg, nomorging, sigorg, nivorg, orgsup, ' +
          'nomfoc from viw_orgaos_gestores order by nomorg';
     DelOrgaoGestor = 'delete from orgaos_gestores where codorg = %d';


 end;

///<summary>Comandos gerais usados pelo Cosmos Gestor de Confer�ncias.</summary>
 TGConfCommands =  class
    const
     ChangeTarefaAreaStaff = 'update TAREFAS_STAFF set codare = %d where codtar = %d';
     //Inscri��es em confer�ncias.
     DesalojaInscrito = 'update inscricoes set codlei = null where codins = %d';
     EstaInscritoConferencia      = 'select codins from inscricoes where codcon = %d ' +
         'and codcad = %d';
     CountInfoInscricao = 'select count(det.coddet) from detalhe_inscricao det inner join itens_inscricao ite on(det.codite = ite.codite) and ite.codfla = %d';
     DeleteItensInscricao = 'delete from ITENS_INSCRICAO where codite = %d';
     InscricaoInfo = 'select codcad, codcon from inscricoes where codins = %d';
     InscritoFrequenciaCount = 'select count(codfre) from frequencias where codcon = %d and codcad = %d';
     InscricaoDelete = 'delete from INSCRICOES where codins = %d';
     ConferenciaAtividade         = 'select codcon from atividades where codati = %d';
     //�reas de staff
     InsertAreaStaff = 'insert into AREAS (nomare, codpai, codfoc) values (%s, %s, %d)';
     UpdateAreaStaff = 'update AREAS set nomare = %s, codpai = %s, codfoc = %d where codare = %d';
     DeleteAreaStaff = 'delete from AREAS where codare = %d';
     AttributesCount = 'select cad.codatr from ATRIBUTOS_CADASTRADOS cad where cad.codatr = %d union select lei.codatr from ATRIBUTOS_LEITOS lei where lei.codatr = %d';
     AttributeDelete = 'delete from ATRIBUTOS where codatr = %d';
     FrequenciasConfCount = 'select count(codcon) from frequencias where codcon = %d';
     AlojarInscritos = 'select * from ALOJAR_INSCRITOS(%d, %d, %s)';
     AtualizarAtributosInscritos = 'execute procedure ATUALIZAR_DETALHES_INSCRICOES(%d)';
 end;

 TGConfAlojamentos = class
   const
    //Alojamentos
    ListaAlojamentosFoco = 'select codalo, nomalo, indext, telalo, endalo from ALOJAMENTOS where codfoc = %d order by nomalo';
    ListaQuartosAlojamento = 'select codqua, alaqua, numqua, indtra from QUARTOS where codalo = %d';
    ListaLeitosAlojamento = 'select lei.codlei, lei.codqua, qua.numqua, lei.numlei, lei.codcad, cad.nomcad, lei.indblo ' +
     'from LEITOS lei left outer join CADASTRADOS cad on(lei.codcad = cad.codcad) ' +
     'inner join QUARTOS qua on(lei.codqua = qua.codqua) and qua.codalo = %d order by qua.numqua, lei.numlei';
    ListaLeitosQuarto = 'select codlei, codqua, numlei, indblo from LEITOS where codqua = %d order by numlei';
    ClassificadoresLeitos = 'select codatr, sigatr, desatrlei from ATRIBUTOS order by sigatr';
    ClassificadoresCadastrados = 'select codatr, sigatr, desatrcad from ATRIBUTOS order by sigatr';
    LeitosAlojamento = 'select * from VIW_LEITOS where codalo = %d and alaqua = %s order by alaqua, numqua';
    LeitosLivresAlojamento =  'select lei.* from VIW_LEITOS lei where lei.codalo = %d and lei.alaqua = %s ' +
     'and lei.codlei not in (select distinct(codlei) from inscricoes where codcon  = %d and codlei is not null) and lei.indblo = ' + '''' + 'N' + '''' +
     'order by alaqua, numqua';
    SearchQuartosAlojamento = 'select codqua, alaqua, numqua, codalo, nomalo, ' +
     'indtra from VIW_QUARTOS where codalo = %d order by alaqua, numqua';
    LeitosAlojamentosFoco = 'select * from viw_leitos where codfoc = %d ' +
     'order by nomalo, numqua, numlei';
    AlojadosQuartos = 'select qua.codqua, qua.codalo, qua.nomalo, qua.numqua, ' +
     'qua.alaqua, qua.numlei, ins.nomcad, ins.sigfoc, ins.indmon, ins.indsub from viw_leitos qua ' +
     'inner join viw_inscricoes ins on (ins.codlei = qua.codlei) and ins.codcon = %d ' +
     'and qua.codalo = %d order by qua.alaqua, qua.numqua, qua.numlei';
    QuartosAlojamento = 'select qua.codqua, qua.alaqua, qua.numqua, qua.nomalo ' +
     'from viw_quartos qua where qua.codalo = %d order by qua.alaqua, qua.numqua';
    QuartosUsadosAlojamento = 'select distinct(ins.codqua), ins.alaqua, ins.numqua, ins.nomalo from viw_inscricoes ins ' +
     'where ins.codcon = %d and ins.codalo = %d';
 end;


 TGConfInscricoes = class
   const
    //Inscri��es para confer�ncias
    GeneralFlagsInscricoes = 'select fla.codfla, fla.desfla, fla.desimp from  FLAGS_INSCRICOES fla ' +
     'order by fla.desimp';
    FlagsInscricoes = 'select ite.codite, fla.desfla, fla.desimp from  itens_inscricao ite ' +
     'join FLAGS_INSCRICOES fla using(codfla) where ite.codfoc = %d order by ite.ordite, fla.desimp';
    ListaGeralInscritos = 'select * from VIW_INSCRICOES where codcon = %d ' +
     'order by nomcad';
    ListaInscritosAlfabetica = 'select codins, codcad, numins, matcad, nomcad, apecad, sexcad, sigdis, idade, nomalo, numqua, codlei, numlei, datche, horche from viw_inscricoes ' +
     'where codcon = %d and ((nomcad collate PT_BR starting with %s) or (nomcad collate PT_BR starting with %s)) ' +
     'order by nomcad';
    ListaInscritosDiscipulado = 'select codins, codcad, numins, matcad, nomcad, apecad, sexcad, sigdis, idade, nomalo, numqua, codlei, numlei, datche, horche from viw_inscricoes ' +
     'where codcon = %d and sigdis = %s order by nomcad';
    ListaInscritosFocos = 'select codins, codcad, numins, matcad, nomcad, apecad, sexcad, sigdis, idade, nomalo, numqua, codlei, numlei, datche, horche from viw_inscricoes ' +
     'where codcon = %d and sigfoc = %s order by nomcad';
    ListaInscritosConferenciaImportacao = 'select matcad, nomcad, sigdis, sexcad, ' +
     'sigfoc from viw_inscricoes where codcon = %d order by nomcad';
    ImportarInscritoConferencia = 'select * from importar_inscritos(%d, %s, %s, %s, %s)';
    ReportCrachaInscrito = ' select ins.codins, ins.numins, ins.datche, ins.horche, ins.datsai, ins.horsai, ' +
     'ins.matcad, ins.nomcad, ins.apecad, ins.sexcad, ins.sigdis, ins.sigfoc, ' +
     'ins.numqua, ins.numlei, ins.nomalo, ins.indmon, ins.indsub, ins.datins from viw_inscricoes ins ' +
     'where codins = %d';
    ReportTarefasInscrito =  'select codsta, codins, datsta, horini, horter, codtar, ' +
     'destar, codare, nomare, nomcad, matcad, sigdis, sigfoc ' +
     'from viw_staff where codins = %d order by datsta, horini';
    ReportCrachasInscritos = ' select ins.codins, ins.numins, ins.datche, ins.horche, ins.datsai, ins.horsai, ins.nomcon, ' +
     'ins.matcad, ins.nomcad, ins.apecad, ins.sexcad, ins.fotcad, ins.sigdis, ins.sigfoc, ' +
     'ins.numqua, ins.numlei, ins.nomalo, ins.indmon, ins.indsub, ins.datins from viw_inscricoes ins ' +
     'where codcon = %d order by nomcad';
    //Escala de staff em confer�ncias
    AreasStaff = 'select are.codare, are.nomare, are.codpai from AREAS are ' +
     'where are.codfoc = %d and are.codpai is null order by nomare';
    SubareasStaff = 'select are.codare, are.nomare, are.codpai from AREAS are ' +
     'where are.codfoc = %d and are.codpai = %d order by nomare';
    CountTarefasStaffUsadas = 'select count(sta.codsta) from STAFF sta join TAREFAS_STAFF tar using (codtar) ' +
     'join AREAS are using (codare) where are.codare = %d';
    TarefasAreaStaff = 'select codtar, destar from TAREFAS_STAFF where codare = %d order by destar';
    InscritosConferencia = 'select codins, numins, codcad, nomcad, matcad, sexcad, sigfoc, sigdis, ' +
     'nomalo, numqua, numlei from viw_inscricoes where codcon = %d order by nomcad';
    InscritosAlojados = 'select codins, numins, codcad, nomcad, matcad, sexcad, sigfoc, sigdis, ' +
     'nomalo, numqua, numlei from viw_inscricoes where codcon = %d and codlei is not null order by nomcad';
    InscritosDesalojados = 'select codins, numins, codcad, nomcad, matcad, sexcad, sigfoc, sigdis, ' +
     'nomalo, numqua, numlei from viw_inscricoes where codcon = %d and codlei is null order by nomcad';
    InscritoNome = 'select codins, numins, codcad, nomcad, matcad, sexcad, sigfoc, sigdis, ' +
     'nomalo, numqua from viw_inscricoes where codcon = %d and nomcad like %s';
    InscritoConferencia = 'select codins, numins, codcad, nomcad, matcad, sexcad, sigfoc, sigdis, ' +
     'nomalo, numqua, numlei, nomcon from viw_inscricoes where codins = %d';
    AreasTarefasStaff = 'select are.codare, are.nomare, are.codpai, par.codare ' +
     'as "CODPAR", par.nomare as "NOMLOC" from AREAS are inner join AREAS par on ' +
     '(are.codare = par.codpai) where par.codare in (select codare from tarefas_staff) ' +
     'and are.codfoc = %d';
    StaffConferencia = 'select codsta, codins, datsta, horini, horter, codtar, ' +
     'destar, codare, nomare, nomcad, matcad, sigdis, sigfoc ' +
     'from viw_staff where codcon = %d order by codins, datsta, horini';
    FocosInscritos = 'select codfoc, nomfoc, sigfoc from focos where codfoc in (' +
     'select distinct(codfoc) from viw_inscricoes where codcon = %d) order by nomfoc';
    IncritosConferenciaFocos = 'select numins, datche, horche, datsai, horsai, codcon, ' +
     'nomcon, codcad, matcad, matcadint, nomcad, apecad, sexcad, coddis, sigdis, codfoc, ' +
     'sigfoc, idade, indpre, forins, modtra, codlei, codqua, numqua, alaqua, numlei, ' +
     'codalo, nomalo, indmon, indsub, recins, indrec, datins, usures from viw_inscricoes ' +
     'where codcon = %d and codfoc in(%s) order by sigfoc, nomcad';
 end;


 TFinCommands =  class
    const
     //Conta banc�ria
     ChangeStatusContaBancaria = 'update contas_bancarias set indati = %s where codconban = %d';
     ContarLancamentosConta = 'select count(nrolan) from lancamentos where codconban = %d';
     DeleteContaBancaria = 'delete from contas_bancarias where codconban = %d';

     //Plano de contas
     DeleteConta = 'select * from Delete_Conta_Plano(%d)';
     MoveConta = 'update contas set codconpar = %d where codcon = %d';
     RootContas = 'select * from viw_plano_contas where codconpar is null order by descon';
     Subcontas = 'select * from viw_plano_contas where codconpar = %d order by descon';
     CaixasYear = 'select count(codcai) from caixas where extract(year from databe) = %d';
     CaixaNovo = 'insert into caixas (codcai, numcai, codfoc, valini, usuabe, databe) values (%d, %s, %d, %d, %d, %s)';
     CaixaFechar = 'select * from fechar_caixa(%d, %d, %s)';
     CaixasMesAno = 'select * from viw_caixas where codfoc = %d and extract(month from databe) = %d and extract(year from databe) = %d order by databe desc';
     RecebimentoCancelar = 'update recebimentos set indcan = %s, datcan = %s, motcan = %d, usucan = %s, usures = %s where codrec = %d';
     InstituicoesBancarias = 'select * from instituicoes_bancarias order by nomban';
     TiposRecebimento = 'select * from tipos_recebimentos order by destiprec';
 end;





implementation

end.

unit cosmos.server.SQLConst;

interface

type
  TSQLFocusCommands =  class
    const
      //Focos
      cmdFocusAtivos = 'select codfoc, nomfoc from FOCOS where indati = :indati order by nomfoc';
      cmdFocusRegion = 'select codfoc, nomfoc from FOCOS where codreg = :codreg and indati = :indati order by nomfoc';

      //Regiões administrativas
      cmdChildRegions = 'select codreg, nomreg from REGIOES where codpai = :codpai order by nomreg';
      cmdRootRegions = 'select codreg, nomreg from REGIOES where codpai is null order by nomreg';
  end;

  TSQLPupilsCommands =  class
    const
      //Alunos
      cmdPupilsAtivosFocus = 'select count(codcad) as "Total" from VIW_CADASTRADOS where codfoc = :codfoc and indati = :indati and camdis = :camdis';
      cmdGrades = 'select coddis, nomdis, sigdis from DISCIPULADOS where camdis = :camdis and indati = :indati order by seqdis';
      cmdPupilName = 'select nomcad from CADASTRADOS where codcad = :codcad';
      cmdPupilsFocus = 'select nomcad from VIW_CADASTRADOS where sigfoc = :sigfoc order by nomcad';
      cmdFocusPupilsCount = ' select nomfoc, sigfoc, totalgeral from RESUMO_ESTATISTICO order by nomfoc';

  end;


implementation

end.

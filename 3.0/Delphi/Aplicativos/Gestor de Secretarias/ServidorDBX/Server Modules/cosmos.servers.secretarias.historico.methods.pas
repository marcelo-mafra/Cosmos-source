unit cosmos.servers.secretarias.historico.methods;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Classes,
  System.Json, Datasnap.DSServer, DataSnap.DSProviderDataModuleAdapter, Datasnap.DSAuth,
  Data.DB, Datasnap.DBClient, Data.SqlExpr, Data.FMTBcd, cosmos.classes.application, System.Variants,
  Provider, cosmos.servers.sqlcommands, cosmos.system.messages,  System.WideStrings,
  Data.dbxCommon, DataSnap.DsSession, cosmos.classes.logs, cosmos.system.exceptions,
  Data.DBXFirebird, cosmos.business.focos, cosmos.business.secretariats,
  cosmos.classes.persistence.ini;

type
  TCosmosSecHistoricoServerMethods = class(TDSServerModule)
    SQLSPTransferir: TSQLStoredProc;
    SQLHistorico: TSQLDataSet;
    DspHistorico: TDataSetProvider;
    SQLHistoricoCODHIS: TIntegerField;
    SQLHistoricoCODCAD: TIntegerField;
    SQLHistoricoCODTIPEVE: TIntegerField;
    SQLHistoricoDESTIPEVE: TStringField;
    SQLHistoricoCAMTRA: TStringField;
    SQLHistoricoTIPEVE: TStringField;
    SQLHistoricoSIGFOC: TStringField;
    SQLHistoricoDATHIS: TDateField;
    SQLEventoHistorico: TSQLDataSet;
    SQLEventoHistoricoCODHIS: TIntegerField;
    SQLEventoHistoricoDATHIS: TDateField;
    DspEventoHistorico: TDataSetProvider;
    SQLEventoHistoricoNOMCAD: TStringField;
    SQLEventoHistoricoCODTIPEVE: TIntegerField;
    SQLEventoHistoricoDESTIPEVE: TStringField;
    SQLEventoHistoricoTIPEVE: TStringField;
    SQLEventoHistoricoCAMTRA: TStringField;
    SQLEventoHistoricoNOMFOC: TStringField;
    SQLEventoHistoricoSIGDIS: TStringField;
    SQLEventoHistoricoDESEVE: TStringField;
    SQLEventoHistoricoOBSHIS: TMemoField;
    SQLEventoHistoricoMOTDES: TStringField;
    SQLEventoHistoricoNUMREG: TIntegerField;
    SQLEventoHistoricoUSURES: TStringField;
    SQLEventoHistoricoDATCAD: TSQLTimeStampField;
    SQLDetalhesHistorico: TSQLDataSet;
    DspDetalhesHistorico: TDataSetProvider;
    SQLDetalhesHistoricoCODDET: TIntegerField;
    SQLDetalhesHistoricoDATDET: TSQLTimeStampField;
    SQLDetalhesHistoricoCODFLU: TIntegerField;
    SQLDetalhesHistoricoDESFLU: TStringField;
    SQLDetalhesHistoricoSEQFLU: TSmallintField;
    SQLDetalhesHistoricoINDCUM: TStringField;
    SQLDetalhesHistoricoOBSDET: TMemoField;
    SQLDetalhesHistoricoDATCAD: TSQLTimeStampField;
    SQLDetalhesHistoricoUSURES: TStringField;
    SQLHistoricoINDESCINT: TStringField;
    SQLHistoricoCODDIS: TIntegerField;
    SQLHistoricoSIGDIS: TStringField;
    SQLSPAnularHistorico: TSQLStoredProc;
    SQLTurmasInstalacao: TSQLDataSet;
    DspTurmasInstalacao: TDataSetProvider;
    SQLMembrosTurmasIns: TSQLDataSet;
    DspMembrosTurmasIns: TDataSetProvider;
    SQLPassosProtocolo: TSQLDataSet;
    DspPassosProtocolo: TDataSetProvider;
    SQLPassosProtocoloCODHIS: TIntegerField;
    SQLPassosProtocoloCODDET: TIntegerField;
    SQLPassosProtocoloDATDET: TSQLTimeStampField;
    SQLPassosProtocoloCODFLU: TIntegerField;
    SQLPassosProtocoloDESFLU: TStringField;
    SQLPassosProtocoloSEQFLU: TSmallintField;
    SQLPassosProtocoloINDCUM: TStringField;
    SQLCartas: TSQLDataSet;
    DspCartas: TDataSetProvider;
    SQLCartasCODHIS: TIntegerField;
    SQLCartasDATHIS: TDateField;
    SQLCartasCODCAD: TIntegerField;
    SQLCartasCODTIPEVE: TIntegerField;
    SQLCartasDESTIPEVE: TStringField;
    SQLCartasTIPEVE: TStringField;
    SQLCartasCAMTRA: TStringField;
    SQLCartasCODFOC: TIntegerField;
    SQLCartasNOMFOC: TStringField;
    SQLCartasOBSHIS: TMemoField;
    SQLInstalarMembro: TSQLStoredProc;
    SQLEventoHistoricoCODCAD: TIntegerField;
    SQLEventoHistoricoCODFOC: TIntegerField;
    SQLEventoHistoricoCODDIS: TIntegerField;
    procedure DspEventoHistoricoGetDataSetProperties(Sender: TObject;
      DataSet: TDataSet; out Properties: OleVariant);
    procedure DspCartasGetDataSetProperties(Sender: TObject; DataSet: TDataSet;
      out Properties: OleVariant);
    procedure DspDetalhesHistoricoGetDataSetProperties(Sender: TObject;
      DataSet: TDataSet; out Properties: OleVariant);
    procedure SQLHistoricoBeforeOpen(DataSet: TDataSet);
    procedure DspEventoHistoricoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure DspCartasGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure DspPassosProtocoloGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure SQLInstalarMembroBeforeOpen(DataSet: TDataSet);
    procedure DspDetalhesHistoricoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
  private
    { Private declarations }

  public
    { Public declarations }

    //Turmas de instala��o
    procedure AdicionarInstalando(codturins, codcad, coddis,  codfoc: Integer);
    procedure CreateTurmaInst(const numtur: WideString; codfoc, coddis: Integer;
      memtur: OleVariant; UserName: string);
    procedure DropInstalando(codturins, codcad: Integer);
    function GenNumeroTurmaInst(codfoc: Integer): string;
    procedure InstalarTurmaAlunos(codturins: Integer; datins: TDateTime; current_user: WideString);

    //A��es no hist�rico discipular
    procedure AnularEventoHistorico(codhis: Integer; const sigdis, current_user: WideString);
    procedure AtualizaGruposTM(codfoc: Integer);
    function NovaMatricula(codfoc: integer; CampoTrabalho, CreationMode: integer): string;
    procedure BatizarCadastrado(Data: OleVariant; out ReturnCode: integer);
    procedure CasarCadastrados(Data: OleVariant; out ReturnCode: integer);
    procedure DesligarCadastrado(Data: OleVariant; out ReturnCode: integer);
    procedure EnviarCartaFrequencia(Data: OleVariant; out ReturnCode: integer);
    procedure ReativarCadastrado(Data: OleVariant; out ReturnCode: integer);
    procedure RetrogradarAluno(Data: OleVariant; out ReturnCode: integer);
    procedure TransferirCadastrado(Data: Olevariant; out ReturnCode: integer);

    //Pesquisas acess�rias
    function GetDiscipuladosAnteriores(coddis: Integer;
      indtmo, indtpu, indsim, incatu: boolean): TDBXReader;
    function GetDiscipuladoCadastrado(codcad: Integer): TDataset;
    function GetDiscipuladosReligacao(codcad: Integer): TDataset;

  end;



implementation

uses cosmos.servers.common.dataacess, cosmos.servers.common.methods,
  cosmos.servers.common.services;

{$R *.DFM}

procedure TCosmosSecHistoricoServerMethods.DspCartasGetDataSetProperties(Sender: TObject;
  DataSet: TDataSet; out Properties: OleVariant);
begin
  Properties := VarArrayCreate([0,1], varVariant);
  Properties[0] := VarArrayOf(['SequenceName', TSequencesNames.GEN_HISTORICOS, False]);
end;

procedure TCosmosSecHistoricoServerMethods.DspCartasGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: string);
begin
TableName := TTablesNames.TAB_HISTORICOS;
end;

procedure TCosmosSecHistoricoServerMethods.DspDetalhesHistoricoGetDataSetProperties(Sender: TObject;
  DataSet: TDataSet; out Properties: OleVariant);
begin
  Properties := VarArrayCreate([0,1], varVariant);
  Properties[0] := VarArrayOf(['SequenceName', TSequencesNames.GEN_DETALHES_HISTORICO, False]);
end;

procedure TCosmosSecHistoricoServerMethods.DspDetalhesHistoricoUpdateError(
  Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError;
  UpdateKind: TUpdateKind; var Response: TResolverResponse);
begin
 DMServerDataAcess.OnUpdateError(E, UpdateKind, Response);
end;

procedure TCosmosSecHistoricoServerMethods.DspEventoHistoricoGetDataSetProperties(Sender: TObject;
  DataSet: TDataSet; out Properties: OleVariant);
begin
  Properties := VarArrayCreate([0,1], varVariant);
  Properties[0] := VarArrayOf(['SequenceName', TSequencesNames.GEN_HISTORICOS, False]);
end;

procedure TCosmosSecHistoricoServerMethods.DspEventoHistoricoGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: string);
begin
TableName := TTablesNames.TAB_HISTORICOS;
end;

procedure TCosmosSecHistoricoServerMethods.DspPassosProtocoloGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: string);
begin
TableName := TTablesNames.TAB_DETALHE_HISTORICO;
end;

procedure TCosmosSecHistoricoServerMethods.SQLHistoricoBeforeOpen(
  DataSet: TDataSet);
begin
 TSQLDataset(Dataset).SQLConnection := DMServerDataAcess.ConnectionPool.GetConnection;
end;

procedure TCosmosSecHistoricoServerMethods.SQLInstalarMembroBeforeOpen(
  DataSet: TDataSet);
begin
  TSQLStoredProc(Dataset).SQLConnection := DMServerDataAcess.ConnectionPool.GetConnection;
end;

procedure TCosmosSecHistoricoServerMethods.DesligarCadastrado(Data: OleVariant;
  out ReturnCode: integer);
var
AData: TCosmosData;
ADate: Extended;
TD: TDBXTransaction;
AProc: TSQLStoredProc;
begin
 //Desliga um cadastrado.
 AData := TCosmosData.Create(6);
 AProc := DMServerDataAcess.CreateStoreProcedure;

 try
  AData.LoadTaggedValues(Data);

  AProc.StoredProcName := TProceduresNames.PROC_DESLIGAR_CADASTRADO;

  with AProc.Params do
   begin
    ParamByName('icodcad').AsInteger := AData.FindValue('CADASTRADO');
     ADate := AData.FindValue('DATA');
     ParamByName('idathis').Value := TDataConverter.ToFormatedDateTime(ADate, 'yyyy/mm/dd');
     ParamByName('imotdes').AsString := AData.FindValue('MOTIVO');
     ParamByName('iusures').AsString := AData.FindValue('USUARIO');

     if AData.FindValue('OBITO') <> '' then
      begin
       ADate := AData.FindValue('OBITO');
       ParamByName('idatobi').Value := TDataConverter.ToFormatedDateTime(ADate, 'yyyy/mm/dd');
      end;

     if Trim(AData.FindValue('OBSERVACAO')) <> '' then
       ParamByName('iobshis').AsString := AData.FindValue('OBSERVACAO');
   end;

  TD := DMServerDataAcess.BeginTransaction(AProc.SQLConnection, TDBXIsolations.ReadCommitted);
  AProc.Prepared := True;
  AProc.ExecProc;
  DMServerDataAcess.CommitTransaction(AProc.SQLConnection, TD);

  ReturnCode := 0; //Sucesso.
  DMCosmosServerServices.RegisterLog(TCosmosInfoMsg.DesligamentoRegistrado, DMServerDataAcess.GetContextInfo(AProc));

  AData.Free;
  AProc.Free;

 except
  on E: Exception do
   begin
     DMCosmosServerServices.RegisterLog(E.Message, DMServerDataAcess.GetContextInfo(AProc), leOnError);
     ReturnCode := TCosmosErrorCodes.ExecuteOperation; //Falha gen�rica.

     if E.Message.Contains('EX_CADASTRADO_INEXISTE') then //N�o foi encontrado o cadastrado.
       ReturnCode := TCosmosErrorCodes.CannotFindCadastrado;

     if E.Message.Contains('EX_CADASTRADO_DESLIGADO') then
       ReturnCode := TCosmosErrorCodes.CadastradoDesligado;

     if Assigned(AData) then FreeAndNil(AData);
     DMServerDataAcess.RollbackTransaction(AProc.SQLConnection, TD);
    if Assigned(AData) then FreeAndNil(AData);

    if Assigned(AProc) then FreeAndNil(AProc);
    raise TDBXError.Create(ReturnCode, TCosmosErrorCodes.ToMessage(ReturnCode));
   end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.TransferirCadastrado(Data: Olevariant;
 out ReturnCode: integer);
var
AData: TCosmosData;
ADate: Extended;
TD: TDBXTransaction;
AProc: TSQLStoredProc;
begin
 //Transfere um cadastrado para outro foco.
 AData := TCosmosData.Create(6);
 AProc := DMServerDataAcess.CreateStoreProcedure;

 try
  AData.LoadTaggedValues(Data);
  ADate := AData.FindValue('DATA');
  AProc.StoredProcName := TProceduresNames.PROC_TRANSFERIR_CADASTRADO;

  with AProc.Params do
   begin
    ParamByName('icodcad').AsInteger := AData.FindValue('CADASTRADO');
    ParamByName('idathis').AsString := TDataConverter.ToFormatedDateTime(ADate, 'yyyy/mm/dd');
    ParamByName('inovo_foco').AsInteger := AData.FindValue('NOVOFOCO');
    ParamByName('imanter_circulo').AsString := TDataConverter.ToBoleanString(AData.FindValue('MANTERCIRCULO'));
    ParamByName('iusures').Value := AData.FindValue('USUARIO');

    if Trim(AData.FindValue('OBSERVACAO')) = '' then
      ParamByName('iobshis').Clear
    else
      ParamByName('iobshis').Value := AData.FindValue('OBSERVACAO');
   end;

 //Inicia uma nova transa��o
   TD := DMServerDataAcess.BeginTransaction(AProc.SQLConnection, TDBXIsolations.ReadCommitted);
   AProc.Prepared := True;
   AProc.ExecProc;
   DMServerDataAcess.CommitTransaction(AProc.SQLConnection, TD);

   ReturnCode := 0; //Sucesso.
   DMCosmosServerServices.RegisterLog(TCosmosInfoMsg.TransferenciaRegistrada, DMServerDataAcess.GetContextInfo(AProc));
   AData.Free;


 except
  on E: Exception do
   begin
     DMCosmosServerServices.RegisterLog(E.Message, DMServerDataAcess.GetContextInfo(AProc), leOnError);
     ReturnCode := TCosmosErrorCodes.ExecuteOperation; //Falha gen�rica.

     if E.Message.Contains('EX_CADASTRADO_INEXISTE') then //N�o foi encontrado o cadastrado.
       ReturnCode := TCosmosErrorCodes.CannotFindCadastrado;

     if E.Message.Contains('EX_TRANSF_ILEGAL') then //O cadastrado j� est� vinculado ao novo foco.
       ReturnCode := TCosmosErrorCodes.TransferenciaMesmoFoco;

     if E.Message.Contains('EX_FOCO_INVALIDO') then //O tipo do novo foco n�o foi determinado.
       ReturnCode := TCosmosErrorCodes.UnknownFocusType;

     if E.Message.Contains('EX_TRANSF_ALUNO_FOCO') then //Um aluno n�o pode se vincular a uma sala/local do TP ou a um C.C.
       ReturnCode := TCosmosErrorCodes.TransferenciaInvalidaAluno;

     if E.Message.Contains('EX_TRANSF_JOVEMTM_FOCO') then //Um jovem do TM n�o pode se vincular a uma sala/local do TP ou a um C.C.!      begin
       ReturnCode := TCosmosErrorCodes.TransferenciaInvalidaAluno;

     if E.Message.Contains('EX_TRANSF_PESQUISADOR_FOCO') then //Um pesquisador ou cursista n�o pode se vincular a um C.C.!
       ReturnCode := TCosmosErrorCodes.TransferenciaInvalidaPesquisador;

     if E.Message.Contains('EX_CADASTRADO_DESLIGADO') then
       ReturnCode := TCosmosErrorCodes.CadastradoDesligado;

     if E.Message.Contains('EX_CADASTRADO_FALECIDO') then
       ReturnCode := TCosmosErrorCodes.CadastradoFalecido;

     DMServerDataAcess.RollbackTransaction(AProc.SQLConnection, TD);

     if Assigned(AData) then FreeAndNil(AData);
     if Assigned(AProc) then FreeAndNil(AProc);

     raise TDBXError.Create(ReturnCode, TCosmosErrorCodes.ToMessage(ReturnCode));
   end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.ReativarCadastrado(Data: OleVariant;
  out ReturnCode: integer);
var
AData: TCosmosData;
ADate: Extended;
TD: TDBXTransaction;
AProc: TSQLStoredProc;
begin
 //Reativa um cadastrado desligado.

 AData := TCosmosData.Create(6);
 AProc := DMServerDataAcess.CreateStoreProcedure;

 try
  AData.LoadTaggedValues(Data);
  ADate := AData.FindValue('DATA');
  AProc.StoredProcName := TProceduresNames.PROC_RELIGAR_CADASTRADO;

  with AProc.Params do
   begin
    ParamByName('icodcad').AsInteger := AData.FindValue('CADASTRADO');
    ParamByName('icoddis').AsInteger := ADATA.FindValue('DISCIPULADO');
    ParamByName('idathis').Value := TDataConverter.ToFormatedDateTime(ADate, 'yyyy/mm/dd');
    ParamByName('ideseve').Value := ADATA.FindValue('DESCRICAO');
    ParamByName('iusures').Value := AData.FindValue('USUARIO');

    if Trim(AData.FindValue('OBSERVACAO')) = '' then
      ParamByName('iobshis').Clear
    else
      ParamByName('iobshis').Value := AData.FindValue('OBSERVACAO');
   end;

 //Inicia uma nova transa��o
  TD := DMServerDataAcess.BeginTransaction(AProc.SQLConnection, TDBXIsolations.ReadCommitted);
  AProc.Prepared := True;
  AProc.ExecProc;

  DMServerDataAcess.CommitTransaction(AProc.SQLConnection, TD);
  DMCosmosServerServices.RegisterLog(TCosmosInfoMsg.ReligamentoRegistrado, DMServerDataAcess.GetContextInfo(AProc));
  ReturnCode := 0;

  AProc.Free;
  AData.Free;

 except
  on E: Exception do
   begin
     DMCosmosServerServices.RegisterLog(E.Message, DMServerDataAcess.GetContextInfo(AProc), leOnError);
     ReturnCode := TCosmosErrorCodes.ExecuteOperation; //Falha gen�rica.

    if E.Message.Contains('EX_CADASTRADO_INEXISTE') then
     ReturnCode := TCosmosErrorCodes.CannotFindCadastrado;

    if E.Message.Contains('EX_CADASTRADO_FALECIDO') then
     ReturnCode := TCosmosErrorCodes.CadastradoFalecido;

    DMServerDataAcess.RollbackTransaction(AProc.SQLConnection, TD);
    if Assigned(AData) then FreeAndNil(AData);
    if Assigned(AProc) then FreeAndNil(AProc);
    raise TDBXError.Create(ReturnCode, TCosmosErrorCodes.ToMessage(ReturnCode));
   end;
 end;
end;

function TCosmosSecHistoricoServerMethods.GetDiscipuladosAnteriores(coddis: Integer;
  indtmo, indtpu, indsim, incatu: boolean): TDBXReader;
var
 sCommand, sindtmo, sindtpu, sindsim, sincatu: string;
 ACommand: TDBXCommand;
begin
 //Lista os discipulares anteriores ao discipulado passado em par�metro.
 sindtmo := TDataConverter.ToBoleanString(indtmo, True);
 sindtpu := TDataConverter.ToBoleanString(indtpu, True);
 sindsim := TDataConverter.ToBoleanString(indsim, True);
 sincatu := TDataConverter.ToBoleanString(incatu, True);

 sCommand := Format(TSecHistoricoCmd.DiscipuladosAnteriores, [coddis, sindtmo, sindtpu, sindsim, sincatu]);
 ACommand := DMServerDataAcess.CreateCommand;

 try
  ACommand.CommandType := TDBXCommandTypes.DbxSQL;
  ACommand.Text := sCommand;
  Result := ACommand.ExecuteQuery;

 except
  on E: TDBXError do
   begin
     DMCosmosServerServices.RegisterLog(E.Message, sCommand, leOnError);
     if Assigned(ACommand) then  FreeAndNil(ACommand);
     raise TDBXError.Create(TCosmosErrorCodes.SelectData, TCosmosErrorMsg.SelectData);
   end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.RetrogradarAluno(Data: OleVariant;
  out ReturnCode: integer);
var
TD: TDBXTransaction;
AData: TCosmosData;
ADate: Extended;
AProc: TSQLStoredProc;
//AValue: string;
begin
 //Retrograda um aluno para outro discipulado anterior ao atual.
 AData := TCosmosData.Create(7);
 AProc :=  DMServerDataAcess.CreateStoreProcedure;

 try
  AData.LoadTaggedValues(Data);
//  AValue := AData.FindValue('DATA');
//  outputdebugstring(PWideChar(AValue));
  ADate := AData.FindValue('DATA');
  AProc.StoredProcName := TProceduresNames.PROC_RETROGRADAR_CADASTRADO;

  with AProc.Params do
   begin
    ParamByName('icodcad').AsInteger := AData.FindValue('CADASTRADO');
    ParamByName('idathis').Value := TDataConverter.ToFormatedDateTime(ADate, 'yyyy/mm/dd');
    ParamByName('icoddis').AsInteger := AData.FindValue('DISCIPULADO');
    ParamByName('imotivo').Value := AData.FindValue('MOTIVO');
    ParamByName('ideseve').AsString := AData.FindValue('DESCRICAO');
    ParamByName('iusures').AsString := AData.FindValue('USUARIO');

    if Trim(AData.FindValue('OBSERVACAO')) = '' then
      ParamByName('iobshis').Clear
    else
      ParamByName('iobshis').Value := AData.FindValue('OBSERVACAO');
   end;

 //Inicia uma nova transa��o
   TD := DMServerDataAcess.BeginTransaction(AProc.SQLConnection, TDBXIsolations.ReadCommitted);
   AProc.ExecProc;
   DMServerDataAcess.CommitTransaction(AProc.SQLConnection, TD);

   ReturnCode := 0; //Sucesso.
   DMCosmosServerServices.RegisterLog(TCosmosInfoMsg.RetrogradacaoRegistrada, DMServerDataAcess.GetContextInfo(AProc));

   AProc.Free;
   AData.Free;

 except
  on E: Exception do
   begin
     DMCosmosServerServices.RegisterLog(E.Message, DMServerDataAcess.GetContextInfo(AProc), leOnError);
     ReturnCode := TCosmosErrorCodes.ExecuteOperation; //Falha gen�rica.

    if E.Message.Contains('EX_CADASTRADO_INEXISTE') then
     ReturnCode := TCosmosErrorCodes.CannotFindCadastrado;

    if E.Message.Contains('EX_CADASTRADO_DESLIGADO') then
     ReturnCode := TCosmosErrorCodes.CadastradoDesligado;

    if E.Message.Contains('EX_CADASTRADO_FALECIDO') then
     ReturnCode := TCosmosErrorCodes.CadastradoFalecido;

    if E.Message.Contains('EX_RETROGRADACAO_ILEGAL') then
     ReturnCode := TCosmosErrorCodes.RetrogradacaoIlegal;

    DMServerDataAcess.RollbackTransaction(AProc.SQLConnection, TD);
    if Assigned(AData) then FreeAndNil(AData);
    if Assigned(AProc) then FreeAndNil(AProc);

    raise TDBXError.Create(ReturnCode, TCosmosErrorCodes.ToMessage(ReturnCode));
   end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.BatizarCadastrado(Data: OleVariant;
 out ReturnCode: integer);
var
TD: TDBXTransaction;
AData: TCosmosData;
ADate: Extended;
AProc: TSQLStoredProc;
begin
 //Registra o batismo de um cadastrado.
 AData := TCosmosData.Create(6);
 AProc := DMServerDataAcess.CreateStoreProcedure;

 try
  AData.LoadTaggedValues(Data);
  ADate := AData.FindValue('DATA');

  AProc.StoredProcName := TProceduresNames.PROC_BATIZAR_CADASTRADO;

  with AProc.Params do
   begin
    ParamByName('icodcad').AsInteger := AData.FindValue('CADASTRADO');
    ParamByName('idathis').Value := TDataConverter.ToFormatedDateTime(ADate, 'yyyy/mm/dd');;
    ParamByName('ideseve').Value := AData.FindValue('DESCRICAO');
    ParamByName('inumreg').AsInteger := AData.FindValue('REGISTRO');
    ParamByName('iusures').Value := AData.FindValue('USUARIO');

    if Trim(AData.FindValue('OBSERVACAO')) = '' then
      ParamByName('iobshis').Clear
    else
      ParamByName('iobshis').Value := AData.FindValue('OBSERVACAO');
   end;

  //Inicia uma nova transa��o
  TD := DMServerDataAcess.BeginTransaction(AProc.SQLConnection, TDBXIsolations.ReadCommitted);
  AProc.Prepared := True;
  AProc.ExecProc;
  DMServerDataAcess.CommitTransaction(AProc.SQLConnection, TD);

  ReturnCode := 0;
  DMCosmosServerServices.RegisterLog(TCosmosInfoMsg.BatismoRegistrado, DMServerDataAcess.GetContextInfo(AProc));

  AData.Free;
  AProc.Free;

 except
 on E: Exception do
  begin
    ReturnCode := TCosmosErrorCodes.ExecuteOperation; //Falha gen�rica.
    DMCosmosServerServices.RegisterLog(E.Message, DMServerDataAcess.GetContextInfo(AProc), leOnError);

   if Pos('EX_BATIZADO_DISCIPULADO', E.Message) > 0 then //Somente probat�rios em diante podem ser batizados...
     ReturnCode := TCosmosErrorCodes.BatizadoDiscipulado;

   if Pos('EX_BATIZADO_IDADE', E.Message) > 0 then //Somente podem ser batizados alunos com at� 28 anos...
     ReturnCode := TCosmosErrorCodes.BatizadoIdade;

   if Pos('EX_BATIZADO_ILEGAL', E.Message) > 0 then //Somente podem ser batizados alunos e crian�as do TM...
     ReturnCode := TCosmosErrorCodes.BatizadoCampo;

    if Assigned(AData) then FreeAndNil(AData);
    DMServerDataAcess.RollbackTransaction(AProc.SQLConnection, TD);

    if Assigned(AProc) then  FreeAndNil(AProc);
    raise TDBXError.Create(ReturnCode, TCosmosErrorCodes.ToMessage(ReturnCode));
  end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.CasarCadastrados(Data: OleVariant;
  out ReturnCode: integer);
var
TD: TDBXTransaction;
AData: TCosmosData;
ADate: Extended;
AProc: TSQLStoredProc;
begin
 //Registra o casamento de cadastrados.
 AData := TCosmosData.Create(8);
 AProc := DMServerDataAcess.CreateStoreProcedure;

 try
  AData.LoadTaggedValues(Data);
  ADate := AData.FindValue('DATA');
  AProc.StoredProcName := TProceduresNames.PROC_CASAR_CADASTRADOS;

  with AProc.Params do
   begin
    ParamByName('icodcad1').AsInteger := AData.FindValue('NOIVA');
    ParamByName('icodcad2').AsInteger := AData.FindValue('NOIVO');
    ParamByName('icodfoc').Value := AData.FindValue('FOCO');
    ParamByName('idathis').Value := TDataConverter.ToFormatedDateTime(ADate, 'yyyy/mm/dd');
    ParamByName('inumreg').AsInteger := AData.FindValue('REGISTRO');
    ParamByName('ideseve').Value := AData.FindValue('DESCRICAO');
    ParamByName('iusures').Value := AData.FindValue('USUARIO');

    if Trim(AData.FindValue('OBSERVACAO')) = '' then
      ParamByName('iobshis').Clear
    else
      ParamByName('iobshis').Value := AData.FindValue('OBSERVACAO');
   end;

  TD := DMServerDataAcess.BeginTransaction(AProc.SQLConnection, TDBXIsolations.ReadCommitted);
  AProc.Prepared := True;
  AProc.ExecProc;

  DMServerDataAcess.CommitTransaction(AProc.SQLConnection, TD);

  ReturnCode := 0; //sucesso.
  DMCosmosServerServices.RegisterLog(TCosmosInfoMsg.CasamentoRegistrado, DMServerDataAcess.GetContextInfo(AProc));
  AData.Free;
  AProc.Free;

 except
  on E: Exception do
   begin
    ReturnCode := TCosmosErrorCodes.ExecuteOperation;

    if E.Message.Contains('EX_CADASTRADO_CASADO') then
      ReturnCode := TCosmosErrorCodes.CasarCasado;

    DMCosmosServerServices.RegisterLog(E.Message, DMServerDataAcess.GetContextInfo(AProc), leOnError);
    DMServerDataAcess.RollbackTransaction(AProc.SQLConnection, TD);

    if Assigned(AData) then FreeAndNil(AData);
    if Assigned(AProc) then FreeAndNil(AProc);
    raise TDBXError.Create(ReturnCode, TCosmosErrorCodes.ToMessage(ReturnCode));
   end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.EnviarCartaFrequencia(Data: OleVariant;
  out ReturnCode: integer);
var
TD: TDBXTransaction;
AData: TCosmosData;
ADate: Extended;
AProc: TSQLStoredProc;
begin
 //Registra o envio de cartas de freq��ncia para um aluno.
 AData := TCosmosData.Create(5);
 AProc := DMServerDataAcess.CreateStoreProcedure;

 try
  AData.LoadTaggedValues(Data);
  ADate := AData.FindValue('DATA');
  AProc.StoredProcName := TProceduresNames.PROC_ENVIAR_CARTA_FREQUENCIA;

  with AProc.Params do
   begin
    ParamByName('icodcad').AsInteger := AData.FindValue('CADASTRADO');
    ParamByName('idathis').Value := TDataConverter.ToFormatedDateTime(ADate, 'yyyy/mm/dd');
    ParamByName('ideseve').Value := AData.FindValue('DESCRICAO');
    ParamByName('iusures').Value := AData.FindValue('USUARIO');

    if Trim(AData.FindValue('OBSERVACAO')) = '' then
      ParamByName('iobshis').Clear
    else
      ParamByName('iobshis').Value := AData.FindValue('OBSERVACAO');
   end;

  TD := DMServerDataAcess.BeginTransaction(AProc.SQLConnection, TDBXIsolations.ReadCommitted);
  AProc.Prepared := True;
  AProc.ExecProc;

  DMServerDataAcess.CommitTransaction(AProc.SQLConnection, TD);
  DMCosmosServerServices.RegisterLog(TCosmosInfoMsg.CartaFrequenciaRegistrada, DMServerDataAcess.GetContextInfo(AProc));
  ReturnCode := 0;
  AData.Free;
  AProc.Free;

 except
  on E: Exception do
   begin
     DMCosmosServerServices.RegisterLog(E.Message, DMServerDataAcess.GetContextInfo(AProc), leOnError);
     ReturnCode := TCosmosErrorCodes.ExecuteOperation; //Falha gen�rica.

    if E.Message.Contains('EX_CARTA_FREQUENCIA') then //do not localize!
      ReturnCode := TCosmosErrorCodes.CartaFrequenciaCampo;

    if E.Message.Contains('EX_CADASTRADO_INEXISTE') then  //do not localize!
     ReturnCode := TCosmosErrorCodes.CannotFindCadastrado;

    if E.Message.Contains('EX_CADASTRADO_DESLIGADO') then //do not localize!
     ReturnCode := TCosmosErrorCodes.CadastradoDesligado;

    if E.Message.Contains('EX_CADASTRADO_FALECIDO') then //do not localize!
     ReturnCode := TCosmosErrorCodes.CadastradoFalecido;

    DMServerDataAcess.RollbackTransaction(AProc.SQLConnection, TD);
    if Assigned(AData) then FreeAndNil(AData);
    if Assigned(AProc) then FreeAndNil(AProc);
    raise TDBXError.Create(ReturnCode, TCosmosErrorCodes.ToMessage(ReturnCode));
   end;
 end;
end;

function TCosmosSecHistoricoServerMethods.GetDiscipuladoCadastrado(codcad: Integer): TDataset;
var
ADataset: TSQLDataset;
begin
 //Retorna o discipulado de um cadastrado.
 ADataset := DMServerDataAcess.CreateDataset;

 try
  ADataset.CommandText := Format(sSQLDiscipuladoCadastrado, [codcad]);
  ADataset.Open;
  Result := ADataset;

 except
  on E: TDBXError do
   begin
    Result := nil;
    DMCosmosServerServices.RegisterLog(E.Message, ADataset.CommandText, leOnError);
   end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.AtualizaGruposTM(codfoc: Integer);
var
 CurrentUserName: string;
begin
//Atualiza os grupos de jovens do TM de acordo com a idade deles.
 try
   CurrentUserName := DMCosmosServerServices.ConnectedUser.ToUpper;
   CurrentUserName := CurrentUserName.QuotedString;
   DMServerDataAcess.DoExecuteCommand(Format(sExecAtualizaGruposTM, [codfoc, CurrentUserName]));

 except
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, '', leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.AtualizarGruposTM, TCosmosErrorMsg.AtualizarGruposTM);
   end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.AnularEventoHistorico(codhis: Integer;
  const sigdis, current_user: WideString);
var
TD: TDBXTransaction;
AProc: TSQLStoredProc;
begin
//Anula um evento do hist�rico discipular de um cadastrado
 AProc := DMServerDataAcess.CreateStoreProcedure;

 try
  AProc.StoredProcName := TProceduresNames.PROC_ANULAR_EVENTO_DISCIPULAR;

  with AProc do
   begin
    Params.Items[0].Value := codhis;
    Params.Items[1].Value := sigdis;
    Params.Items[2].Value := current_user;
   end;

  TD := DMServerDataAcess.BeginTransaction(AProc.SQLConnection, TDBXIsolations.ReadCommitted);
  AProc.Prepared := True;
  AProc.ExecProc;
  DMServerDataAcess.CommitTransaction(AProc.SQLConnection, TD);

 except
 on E: Exception do
  begin
   DMCosmosServerServices.RegisterLog(E.Message, '', leOnError);
   DMServerDataAcess.RollbackTransaction(AProc.SQLConnection, TD);
   raise TDBXError.Create(TCosmosErrorCodes.AnularHistorico, TCosmosErrorSecMsg.AnularHistorico);
  end;
 end;
end;

function TCosmosSecHistoricoServerMethods.GetDiscipuladosReligacao(codcad: Integer): TDataset;
var
 ADataset: TSQLDataset;
begin
 //Recupera os discipulados nos quais um cadastrado pode ser religado
 ADataset := DMServerDataAcess.CreateDataset;

 try
  ADataset.CommandText := Format(TSecHistoricoCmd.DiscipuladosReligacao, [codcad]);
  ADataset.Open;
  Result := ADataset;

 except
 on E: TDBXError do
  begin
   DMCosmosServerServices.RegisterLog(E.Message, ADataset.CommandText, leOnError);
   raise;
  end;
 end;
end;

function TCosmosSecHistoricoServerMethods.GenNumeroTurmaInst(codfoc: Integer): string;
var
 ADataset: TSQLDataset;
begin
//Gera um novo n�mero da turma de instala��o.
 ADataset := DMServerDataAcess.CreateDataset;

 try
  ADataset.CommandText := Format(TSecHistoricoCmd.NumeroTurmaInstalacao, [codfoc]);
  ADataset.Open;

  Result :=  ADataset.Fields.Fields[0].Value;

 except
 on E: Exception do
  begin
   Result := '';
   DMCosmosServerServices.RegisterLog(E.Message, '', leOnError);
   raise TDBXError.Create(TCosmosErrorCodes.NumeroTurmaInstalacao, TCosmosErrorSecMsg.NumeroTurmaInstalacao);
  end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.CreateTurmaInst(const numtur: WideString; codfoc,
  coddis: Integer; memtur: OleVariant; UserName: string);
var
AScript: TStringList;
codturins, codcad: integer;
ADataset: TClientDataset;
sCommandText: string;
begin
//Cria uma nova turma de instala��o com seus membros.
 AScript := TStringList.Create;
 ADataset := TClientDataset.Create(self);

 try
  codturins := DMServerDataAcess.DoGetSequenceValue(TSequencesNames.GEN_TURMAS_INSTALACOES);
  sCommandText := Format(TSecHistoricoCmd.InserirTurmasInstalacao, [codturins, QuotedStr(numtur),
    codfoc, coddis, QuotedStr('N'), QuotedStr(UserName)]);
  AScript.Append(sCommandText);

  ADataset.Data := memtur;

  while not ADataset.Eof do
   begin
    codcad := ADataset.Fields.FieldByName('codcad').AsInteger;
    sCommandText := Format(TSecHistoricoCmd.InserirMembrosTurmasIns, [codturins, codcad]);
    AScript.Append(sCommandText);

    ADataset.Next;
   end;

  DMServerDataAcess.DoExecuteScript(AScript);

  if Assigned(AScript) then AScript.Free;
  if Assigned(ADataset) then ADataset.Free;

 except
 on E: Exception do
  begin
   DMCosmosServerServices.RegisterLog(E.Message, AScript.Text, leOnError);
   E.Message := TCosmosErrorSecMsg.CreateTurmaInstalacao;
   if Assigned(AScript) then AScript.Free;
   if Assigned(ADataset) then ADataset.Free;
   raise TDBXError.Create(TCosmosErrorCodes.CreateTurmaInstalacao, TCosmosErrorSecMsg.CreateTurmaInstalacao);
  end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.DropInstalando(codturins, codcad: Integer);
var
AScript: TStringList;
begin
{Deleta um membro de uma turma de instala��o e retira os dados do protocolo
 de instala��o que foi inserido no hist�rico discipular quando da cria��o
 da turma de instala��o.}
  AScript := TStringList.Create;

  try
   with AScript do
    begin
     Append(Format(TSecHistoricoCmd.DelInstalando, [codturins, codcad]));
     Append(Format(TSecHistoricoCmd.DelProtocoloInstalando, [codcad, codturins]));
    end;

   DMServerDataAcess.DoExecuteScript(AScript);

   AScript.Free;

  except
   on E: Exception do
    begin
     DMCosmosServerServices.RegisterLog(E.Message, AScript.Text, leOnError);
     if Assigned(AScript) then AScript.Free;
     raise TDBXError.Create(TCosmosErrorCodes.DelMembroTurmaInstalacao, TCosmosErrorSecMsg.DelMembroTurmaInstalacao);
  end;
 end;
end;

procedure TCosmosSecHistoricoServerMethods.InstalarTurmaAlunos(codturins: Integer;
  datins: TDateTime; current_user: WideString);
var
AScript: TStringList;
aDataset: TSQLDataset;
coddis, codcad, codfoc: integer;
Data, sCommand: string;
begin
{Instala os alunos de uma turma de instala��o em seus discipulados.}
  AScript := TStringList.Create;
  ADataset := DMServerDataAcess.CreateDataset;

  try
   //Primeiro, checa se a turma j� est� instalada.
   ADataset.CommandText := Format(TSecHistoricoCmd.TurmaInstalada, [codturins]);
   ADataset.Open;

   if TDataConverter.ToBolean(ADataset.FieldValues['indins']) then
    raise TDBXError.Create(TCosmosErrorCodes.TurmaInstalada, TCosmosErrorSecMsg.TurmaInstalada);

   DMServerDataAcess.CloseDataset(ADataset);
   ADataset.CommandText := Format(TSecHistoricoCmd.TurmaInstalacao, [codturins]);
   ADataset.Open;

   coddis := ADataset.Fields.FieldByName('coddis').AsInteger;
   codfoc := ADataset.Fields.FieldByName('codfoc').AsInteger;

   Data := FormatDateTime('yyyy/mm/dd', datins);
   DMServerDataAcess.CloseDataset(aDataset);

  //Agora, recupera os membros da turma para montar o script que os instalar�.
   aDataset.CommandText := Format(TSecHistoricoCmd.MembrosTurmaInstalacao, [codturins]);
   aDataset.Open;

   while not aDataset.Eof do
    begin
      codcad := aDataset.FieldValues['codcad'];
      sCommand := Format(TSecHistoricoCmd.InstalarAluno, [coddis, codcad, codfoc, codturins, QuotedStr(Data), QuotedStr('N'), QuotedStr(current_user)]);
      AScript.Append(sCommand);

      aDataset.Next;
    end;

   //Agora, marca a turma como instalada..
   sCommand := Format(TSecHistoricoCmd.FecharTurmaIns, [QuotedStr('S'), QuotedStr(current_user), codturins]);
   AScript.Append(sCommand);

   //Finalmente, executa o AScript
   DMServerDataAcess.DoExecuteScript(AScript);

   DMServerDataAcess.CloseDataset(aDataset);

  if Assigned(AScript) then AScript.Free;
  if Assigned(ADataset) then ADataset.Free;

  except
   on E: TDBXError do
    begin
     DMCosmosServerServices.RegisterLog(E.Message, AScript.Text, leOnError);
     DMServerDataAcess.CloseDataset(ADataset);
     DMServerDataAcess.CloseDataset(SQLMembrosTurmasIns);
     if Assigned(AScript) then AScript.Free;
     raise;
    end;
   on E: Exception do
    begin
     DMCosmosServerServices.RegisterLog(E.Message, AScript.Text, leOnError);
     DMServerDataAcess.CloseDataset(ADataset);
     DMServerDataAcess.CloseDataset(SQLMembrosTurmasIns);
     if Assigned(AScript) then AScript.Free;
     raise TDBXError.Create(TCosmosErrorCodes.InstalarTurmaAluno, TCosmosErrorSecMsg.InstalarTurmaAluno);
    end;
 end;
end;

function TCosmosSecHistoricoServerMethods.NovaMatricula(codfoc: integer;
  CampoTrabalho, CreationMode: integer): string;
var
sCampoTrabalho, sCommand: string;
ADataset: TSQLDataset;
CosmosApp: TCosmosApplication;
ANumber: integer;
begin
//Retorna um novo n�mero de matr�cula de um aluno de um determinado foco.
 CosmosApp := TCosmosApplication.Create;
 ADataset := DMServerDataAcess.CreateDataset;

 ANumber := 0; //default, sempre a partir da �ltima matr�cula.

 case TNewMatriculaMode(CreationMode) of
  mmFromLastNumber: ANumber := 0;
  mmEmptyIntervals: ANumber := 1;
 end;

 try
  sCampoTrabalho := TFocusTypesInfo.CampoTrabalhoToString(TCampoTrabalho(CampoTrabalho));
  sCommand := Format(TSecretariasCommands.NovaMatricula,[codfoc, QuotedStr(sCampoTrabalho), ANumber]);
  ADataset.CommandText := sCommand;
  ADataset.Open;
  Result :=  ADataset.Fields.Fields[0].Value;

  if Assigned(CosmosApp) then FreeAndNil(CosmosApp);

 except
  on E: Exception do
   begin
    if Assigned(CosmosApp) then FreeAndNil(CosmosApp);
    Result := '';
    DMCosmosServerServices.RegisterLog(E.Message, sCommand, leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.NovaMatricula, TCosmosErrorSecMsg.NovaMatricula);
   end;
 end;

end;

procedure TCosmosSecHistoricoServerMethods.AdicionarInstalando(codturins, codcad, coddis,
  codfoc: Integer);
var
 sCommand: string;
 ADataset: TSQLDataset;
begin
//Adiciona um novo instalando a uma turma de instala��o.
 ADataset := DMServerDataAcess.CreateDataset;

 try
  //Obt�m informa��es do cadastrado a serem usadas em algumas valida��es.
  ADataset.CommandText := Format(TSecretariasCommands.DadosBasicosCadastrado, [codcad]);
  ADataset.Open;

  //Se o cadastrado n�o est� ativo, gera uma exce��o.
  if not TDataConverter.ToBolean(ADataset.FieldValues['indati']) then
   raise EDataOperationError.Create('');

  DMServerDataAcess.CloseDataset(ADataset);
  sCommand := sCommand.Format(TSecHistoricoCmd.InserirMembrosTurmasIns, [codturins, codcad]);

  DMServerDataAcess.DoExecuteCommand(sCommand);
  if Assigned(ADataset) then FreeAndNil(ADataset);


 except
  on E: EDataOperationError do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, sCommand,  leOnError);
    if Assigned(ADataset) then FreeAndNil(ADataset);
    raise TDBXError.Create(TCosmosErrorCodes.InstalacaoInvalida, TCosmosErrorSecMsg.InstalacaoInvalida);
   end;
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, sCommand,  leOnError);
    if Assigned(ADataset) then FreeAndNil(ADataset);
    raise TDBXError.Create(TCosmosErrorCodes.NovoInstalando, TCosmosErrorSecMsg.NovoInstalando);
   end;
 end;
end;


end.


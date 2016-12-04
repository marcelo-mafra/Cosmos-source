unit cosmos.servers.secretarias.focos.methods;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  cosmos.classes.application, cosmos.system.messages, cosmos.system.exceptions,
  cosmos.servers.sqlcommands, System.Variants, cosmos.classes.dataobjects,
  cosmos.classes.ServerInterface, Data.DB, Data.DBXCommon, DBClient, Data.FMTBcd,
  Data.SqlExpr, Datasnap.Provider, DataSnap.DsSession, DataSnap.DSProviderDataModuleAdapter,
  cosmos.business.focos, cosmos.classes.logs, Data.DBXDBReaders;

type
  {$METHODINFO OFF}


  {$METHODINFO ON}    
  TDMCosmosFocosMethods = class(TDSServerModule)
    SQLFoco: TSQLDataSet;
    SQLFocoCODFOC: TIntegerField;
    SQLFocoNOMFOC: TStringField;
    SQLFocoSIGFOC: TStringField;
    SQLFocoNOMTEM: TStringField;
    SQLFocoTIPFOC: TStringField;
    SQLFocoCODREG: TIntegerField;
    SQLFocoNOMREG: TStringField;
    SQLFocoFOCPAI: TIntegerField;
    SQLFoconompai: TStringField;
    SQLFocoINDLEC: TStringField;
    SQLFocoINDTPU: TStringField;
    SQLFocoINDTMO: TStringField;
    SQLFocoINDSIM: TStringField;
    SQLFocoINDEIN: TStringField;
    SQLFocoINDIND: TStringField;
    SQLFocoINDATI: TStringField;
    SQLFocoINDNAC: TStringField;
    SQLFocoINDCAB: TStringField;
    DspFoco: TDataSetProvider;
    SQLMeiosContatosFocos: TSQLDataSet;
    SQLMeiosContatosFocosCODCON: TIntegerField;
    SQLMeiosContatosFocosCODTIPCON: TIntegerField;
    SQLMeiosContatosFocosDESTIPCON: TStringField;
    SQLMeiosContatosFocosDESCON: TStringField;
    SQLMeiosContatosFocosCODFOC: TIntegerField;
    SQLMeiosContatosFocosINDCAR: TStringField;
    SQLMeiosContatosFocosDATCAD: TSQLTimeStampField;
    SQLMeiosContatosFocosUSURES: TStringField;
    DspMeiosContatosFoco: TDataSetProvider;
    DspMentores: TDataSetProvider;
    SQLMentores: TSQLDataSet;
    SQLMentoresCODMEN: TIntegerField;
    SQLMentoresCODREG: TIntegerField;
    SQLMentoresNOMREG: TStringField;
    SQLMentoresCODCAD: TIntegerField;
    SQLMentoresNOMCAD: TStringField;
    SQLMentoresMATCAD: TStringField;
    SQLMentoresSIGDIS: TStringField;
    SQLMentoresSIGFOC: TStringField;
    DspDirigentesAtuais: TDataSetProvider;
    SQLDirigentesAtuais: TSQLDataSet;
    DspDirigentesGestao: TDataSetProvider;
    SQLDirigentesGestao: TSQLDataSet;
    DspCargos: TDataSetProvider;
    SQLCargos: TSQLDataSet;
    SQLCargosCODCAR: TIntegerField;
    SQLCargosDESCAR: TStringField;
    DspTiposContatos: TDataSetProvider;
    SQLTiposContatos: TSQLDataSet;
    SQLTiposContatosCODTIPCON: TIntegerField;
    SQLTiposContatosDESTIPCON: TStringField;
    DspOrgaos: TDataSetProvider;
    SQLOrgaos: TSQLDataSet;
    SQLOrgaosCODORG: TIntegerField;
    SQLOrgaosNOMORG: TStringField;
    SQLOrgaosNOMORGING: TStringField;
    SQLOrgaosSIGORG: TStringField;
    SQLOrgaosCODPAI: TIntegerField;
    SQLOrgaosORGSUP: TStringField;
    SQLOrgaosMANORG: TSmallintField;
    SQLOrgaosROLORG: TStringField;
    SQLOrgaosNIVORG: TSmallintField;
    SQLOrgaosCODFOC: TIntegerField;
    SQLOrgaosNOMFOC: TStringField;
    SQLOrgaosSIGFOC: TStringField;
    SQLOrgaosINDLEC: TStringField;
    SQLOrgaosINDTMO: TStringField;
    SQLOrgaosINDSIM: TStringField;
    SQLOrgaosINDTPU: TStringField;
    SQLOrgaosINDATA: TStringField;
    SQLOrgaosINDATI: TStringField;
    SQLOrgaosINDNAC: TStringField;
    SQLOrgaosUSURES: TStringField;
    SQLOrgaosDATCAD: TSQLTimeStampField;
    DspGestoes: TDataSetProvider;
    SQLGestoes: TSQLDataSet;
    SQLGestoesCODGES: TIntegerField;
    SQLGestoesCODORG: TIntegerField;
    SQLGestoesNOMORG: TStringField;
    SQLGestoesDATINI: TDateField;
    SQLGestoesDATTER: TDateField;
    SQLGestoesDATCAD: TSQLTimeStampField;
    SQLGestoesUSURES: TStringField;
    DspDirecoes: TDataSetProvider;
    SQLDirecoes: TSQLDataSet;
    SQLDirecoesCODDIR: TIntegerField;
    SQLDirecoesCODGES: TIntegerField;
    SQLDirecoesCODCAD: TIntegerField;
    SQLDirecoesCODFOC: TIntegerField;
    SQLDirecoesCODDIS: TIntegerField;
    SQLDirecoesNOMCAD: TStringField;
    SQLDirecoesSIGDIS: TStringField;
    SQLDirecoesNOMFOC: TStringField;
    SQLDirecoesCODCAR: TIntegerField;
    SQLDirecoesDESCAR: TStringField;
    SQLDirecoesDATINI: TDateField;
    SQLDirecoesDATTER: TDateField;
    SQLDirecoesINDCON: TStringField;
    SQLDirecoesOBSDIR: TMemoField;
    SQLDirecoesDATCAD: TSQLTimeStampField;
    SQLDirecoesUSURES: TStringField;
    DspEnderecosFoco: TDataSetProvider;
    SQLEnderecosFoco: TSQLDataSet;
    SQLEnderecosFocoNOMFOC: TStringField;
    SQLEnderecosFocoCODEND: TIntegerField;
    SQLEnderecosFocoCODLOG: TIntegerField;
    SQLEnderecosFocoNOMLOG: TStringField;
    SQLEnderecosFocoNUMEND: TIntegerField;
    SQLEnderecosFocoCOMEND: TStringField;
    SQLEnderecosFocoCEPLOG: TStringField;
    SQLEnderecosFocoCODBAI: TIntegerField;
    SQLEnderecosFocoNOMBAI: TStringField;
    SQLEnderecosFocoCODCID: TIntegerField;
    SQLEnderecosFocoNOMCID: TStringField;
    SQLEnderecosFocoNOMEST: TStringField;
    SQLEnderecosFocoSIGEST: TStringField;
    SQLEnderecosFocoCODPAI: TIntegerField;
    SQLEnderecosFocoNOMPAI: TStringField;
    SQLEnderecosFocoINDCOR: TStringField;
    SQLEnderecosFocoREFEND: TStringField;
    SQLEnderecosFocoACEEND: TStringField;
    SQLEnderecosFocoCODFOC: TIntegerField;
    SQLEnderecosFocoNUMCAI: TSmallintField;
    SQLEnderecosFocoDATCAD: TSQLTimeStampField;
    SQLEnderecosFocoUSURES: TStringField;
    procedure DspRecadosGetDataSetProperties(Sender: TObject; DataSet: TDataSet;
      out Properties: OleVariant);
    procedure SQLFocoBeforeOpen(DataSet: TDataSet);
    procedure DspFocoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure DspMentoresGetDataSetProperties(Sender: TObject;
      DataSet: TDataSet; out Properties: OleVariant);
    procedure DspMentoresGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure DspCargosGetDataSetProperties(Sender: TObject; DataSet: TDataSet;
      out Properties: OleVariant);
    procedure DspOrgaosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure DspEnderecosFocoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: string);
    procedure DspEnderecosFocoGetDataSetProperties(Sender: TObject;
      DataSet: TDataSet; out Properties: OleVariant);
    procedure DspMeiosContatosFocoGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: string);
    procedure DspDirigentesGestaoGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: string);
    procedure DspMeiosContatosFocoGetDataSetProperties(Sender: TObject;
      DataSet: TDataSet; out Properties: OleVariant);
    procedure DspFocoUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
      E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
  private
    { Private declarations }


  public
    { Public declarations }
    //Dirigentes e �rg�os gestores.
    function DuplicarGestao(codorg, codges: Integer; datini, datter: TDateTime;
      Dirigentes: OleVariant): boolean;
    procedure DeleteDirigente(coddir: Integer);
    procedure MoveDirigente(coddir, codges: Integer);
    function TerminateMandate(coddir: Integer): boolean;
    function TerminateMandates(codges: Integer): boolean;
    function CloneDirigente(coddir, codges: Integer): boolean;
    procedure DeleteGestao(codges: Integer);
    procedure DeleteOrgao(codorg: Integer);
    procedure AlterarSubordinacao(codorg, NewParent: Integer);

    //Focos.
    function CreateFocus(DadosFoco, DadosEndereco, DadosGestao,
      DadosMeiosContatos: OleVariant): boolean;
    function DeleteFocus(codfoc: Integer): boolean;
    function DesactiveFocus(TargetFocus, TransferFocus: Integer;
      Desactivate: boolean): string;
    function ChangeFocusParent(FocusID, NewParentId: Integer): boolean;
    procedure ChangeFocusStatus(FocusId, Status: boolean);

    //Regi�es administrativas.
    procedure ChangeRegion(FocusID, NewRegion: Integer);
    procedure DeleteRegion(RegionID: Integer);
    function NewRegion(RegionName: string; RaParent: OleVariant): integer;
    procedure MoveRegion(RegionID, NewRegion: Integer);
    procedure RenameRegion(codreg: Integer; const NewName: string);
  end;


var
  DMCosmosFocosMethods: TDMCosmosFocosMethods;

implementation

{$R *.DFM}

uses cosmos.servers.common.dataacess, cosmos.servers.common.services;

procedure TDMCosmosFocosMethods.AlterarSubordinacao(codorg, NewParent: Integer);
begin

end;

function TDMCosmosFocosMethods.ChangeFocusParent(FocusID,
  NewParentId: Integer): boolean;
var
sDML: string;
begin
//Muda a liga��o de depend�ncia de um foco para com outro.
 sDML := sDML.Format(TFocosCommands.MoveFocoTitular, [NewParentId, FocusID]);

 try
  Result := DMServerDataAcess.DoExecuteCommand(sDML) >= 0;

 except
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.ChangeFocusParent', leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.ChangeFocusParent, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.ChangeFocusParent));
   end;
 end;

end;

procedure TDMCosmosFocosMethods.ChangeFocusStatus(FocusId, Status: boolean);
var
sDML: string;
begin
//Ativa ou desativa um foco.
 if Status then
  sDML := sDML.Format(TFocosCommands.AlteraStatusFoco,[QuotedStr('S'), FocusID])
 else
  sDML := sDML.Format(TFocosCommands.AlteraStatusFoco, [QuotedStr('N'), FocusID]);

 try
  DMServerDataAcess.DoExecuteCommand(sDML)

 except
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.ChangeFocusStatus', leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.ChangeFocusStatus, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.ChangeFocusStatus));
   end;
 end;

end;

procedure TDMCosmosFocosMethods.ChangeRegion(FocusID,
  NewRegion: Integer);
var
sDML: string;
begin
//Muda a regi�o administrativa de um foco.
 sDML := sDML.Format(TFocosCommands.MoveRegionFoco, [NewRegion, FocusID]);

 try
  DMServerDataAcess.DoExecuteCommand(sDML);

 except
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.ChangeRegion', leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.MoveFocoRa, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.MoveFocoRa));
   end;
 end;

end;

procedure TDMCosmosFocosMethods.DspCargosGetDataSetProperties(Sender: TObject;
  DataSet: TDataSet; out Properties: OleVariant);
begin
  Properties := VarArrayCreate([0,1], varVariant);
  Properties[0] := VarArrayOf(['SequenceName', TSequencesNames.GEN_CARGOS, False]);
end;

procedure TDMCosmosFocosMethods.DspDirigentesGestaoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
 TableName := TTablesNames.TAB_DIRECOES;
end;

procedure TDMCosmosFocosMethods.DspEnderecosFocoGetDataSetProperties(
  Sender: TObject; DataSet: TDataSet; out Properties: OleVariant);
begin
  Properties := VarArrayCreate([0,1], varVariant);
  Properties[0] := VarArrayOf(['SequenceName', TSequencesNames.GEN_ENDERECOS, False]);
end;

procedure TDMCosmosFocosMethods.DspEnderecosFocoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
 TableName := TTablesNames.TAB_ENDERECOS;
end;

procedure TDMCosmosFocosMethods.DspFocoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
 TableName := TTablesNames.TAB_FOCOS;
end;

procedure TDMCosmosFocosMethods.DspFocoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
 DMServerDataAcess.OnUpdateError(E, UpdateKind, Response);
end;

procedure TDMCosmosFocosMethods.DspMeiosContatosFocoGetDataSetProperties(
  Sender: TObject; DataSet: TDataSet; out Properties: OleVariant);
begin
  Properties := VarArrayCreate([0,1], varVariant);
  Properties[0] := VarArrayOf(['SequenceName', TSequencesNames.GEN_MEIOS_CONTATOS, False]);
end;

procedure TDMCosmosFocosMethods.DspMeiosContatosFocoGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: string);
begin
 TableName := TTablesNames.TAB_MEIOSCONTATOS;
end;

procedure TDMCosmosFocosMethods.DspMentoresGetDataSetProperties(Sender: TObject;
  DataSet: TDataSet; out Properties: OleVariant);
begin
  Properties := VarArrayCreate([0,1], varVariant);
  Properties[0] := VarArrayOf(['SequenceName', TSequencesNames.GEN_MENTORES_REGIOES, False]);
end;

procedure TDMCosmosFocosMethods.DspMentoresGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
 TableName := TTablesNames.TAB_MENTORES_REGIOES;
end;

procedure TDMCosmosFocosMethods.DspOrgaosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
  TableName := TTablesNames.TAB_ORGAOS_GESTORES;
end;

procedure TDMCosmosFocosMethods.DspRecadosGetDataSetProperties(
  Sender: TObject; DataSet: TDataSet; out Properties: OleVariant);
begin
  Properties := VarArrayCreate([0,1], varVariant);
  Properties[0] := VarArrayOf(['SequenceName', TSequencesNames.GEN_NOTAS_INSCRITO, False]);
end;

function TDMCosmosFocosMethods.DuplicarGestao(codorg, codges: Integer; datini,
  datter: TDateTime; Dirigentes: OleVariant): boolean;
begin

end;

procedure TDMCosmosFocosMethods.MoveDirigente(coddir, codges: Integer);
begin

end;

procedure TDMCosmosFocosMethods.MoveRegion(RegionID,
  NewRegion: Integer);
var
 sDML: string;
begin
 //Altera a liga��o de uma regi�o administrativa para outra.
 if NewRegion >= 0 then
  sDML := sDML.Format(TFocosCommands.MoveRegion, [NewRegion, RegionID])
 else
  sDML := sDML.Format(TFocosCommands.MoveRegionToRoot, [RegionID]);

 try
  DMServerDataAcess.DoExecuteCommand(sDML);

 except
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.MoveRegion', leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.MoveRa, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.MoveRa));
   end;
 end;
end;

function TDMCosmosFocosMethods.NewRegion(RegionName: string;
  RaParent: OleVariant): integer;
var
 sDML: string;
 NewId, ParentId: integer;
begin
//Insere uma nova RA ou subregi�o e retorna o c�digo �nico dela.
 try
 //Reserva o valor do auto-incremento
  NewId := DMServerDataAcess.DoGetSequenceValue(TSequencesNames.GEN_REGIOES);

  if RaParent = null then
   sDML := sDML.Format(TFocosCommands.InsertRegion, [NewId, RegionName.QuotedString, 'null']) //do not localize!
  else
   begin
    ParentId := RaParent;
    sDML := Format(TFocosCommands.InsertRegion, [NewId, RegionName.QuotedString, ParentId.ToString]);
   end;

  DMServerDataAcess.DoExecuteCommand(sDML);
  Result := NewId;

 except
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.NewRegion', leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.CreateRa, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.CreateRa));
   end;
 end;
end;

procedure TDMCosmosFocosMethods.RenameRegion(codreg: Integer;
  const NewName: string);
var
 sDML: string;
begin
//Renomeia uma regi�o administrativa.
 sDML := sDML.Format(TFocosCommands.RenameRegion, [QuotedStr(NewName), codreg]);

 try
  DMServerDataAcess.DoExecuteCommand(sDML);

 except
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.RenameAr', leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.RenameRa, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.RenameRa));
   end;
 end;
end;

procedure TDMCosmosFocosMethods.SQLFocoBeforeOpen(DataSet: TDataSet);
begin
 TSQLDataSet(Dataset).SQLConnection := DMServerDataAcess.ConnectionPool.GetConnection;
end;

function TDMCosmosFocosMethods.CloneDirigente(coddir, codges: Integer): boolean;
begin

end;

function TDMCosmosFocosMethods.CreateFocus(DadosFoco, DadosEndereco, DadosGestao,
  DadosMeiosContatos: OleVariant): boolean;
var
  NewID: Integer;
  aScript: TStringList;
  sCommand, nomfoc, NOMTEM, comend, refend, aceend, suser: string;
  FOCPAI: variant;
  aLocalDataset: TClientDataset;
  aDataset: TSQLDataset;
begin
{Este m�todo remoto � respons�vel por criar um novo foco e registrar o seu
 endere�o e meios de contato. � feito atrav�s da leitura de pacotes de dados,
 vindo da esta��o cliente, e usados para montar um script sCommand que ser� executado.}

 aLocalDataset := TClientDataset.Create(self);
 aScript := TStringList.Create;
 sUser := TDSSessionManager.GetThreadSession.GetData('UserName');

 try
  aLocalDataset.Data := DadosFoco;
  nomfoc := aLocalDataset.Fields.FieldByName('nomfoc').AsString;

  //Primeiramente, checa se o foco j� n�o est� cadastrado.
  aDataset := DMServerDataAcess.DoExecuteDQL(Format(TFocosCommands.FocusExistsName, [nomfoc.QuotedString]));
  if not ADataset.IsEmpty then
    raise EFocusDuplicated.Create(TCosmosErrorFocMsg.CreateFocoDuplicado);

  //OK, o foco n�o est� cadastrado. A opera��o seguir�.
  NewID := DMServerDataAcess.DoGetSequenceValue(TSequencesNames.GEN_FOCOS);
  aLocalDataset.Data := DadosFoco;

  //Monta o comando sCommand para inserir os dados principais do foco.
  with aLocalDataset.Fields do
   begin
    if FieldByName('NOMTEM').IsNull then NOMTEM := 'null'
    else
     NOMTEM := FieldByName('NOMTEM').AsString.QuotedString;

    if FieldByName('FOCPAI').IsNull then FOCPAI := 'null'
    else
     FOCPAI := FieldByName('FOCPAI').AsString; //deve ser texto..

    sCommand := sCommand.Format(TFocosCommands.InsertFoco,[NewID, FieldByName('SIGFOC').AsString.QuotedString,
     FieldByName('NOMFOC').AsString.QuotedString, NOMTEM,
     FieldByName('CODREG').AsInteger, FOCPAI,
     FieldByName('TIPFOC').AsString.QuotedString,
     FieldByName('INDLEC').AsString.QuotedString,
     FieldByName('INDTPU').AsString.QuotedString,
     FieldByName('INDTMO').AsString.QuotedString,
     FieldByName('INDSIM').AsString.QuotedString,
     FieldByName('INDIND').AsString.QuotedString,
     FieldByName('INDATI').AsString.QuotedString,
     FieldByName('INDNAC').AsString.QuotedString,
     FieldByName('INDCAB').AsString.QuotedString]);
   end;

   aScript.Append(sCommand + ';');

   //Agora monta o comando para inserir os dados do endere�o.
   aLocalDataset.Data := DadosEndereco;
   if not aLocalDataset.IsEmpty then
     begin
      while not aLocalDataset.Eof do
       begin
        if aLocalDataset.Fields.FieldByName('comend').IsNull then comend := 'null'
        else
         comend := aLocalDataset.Fields.FieldByName('comend').AsString.QuotedString;

        if aLocalDataset.Fields.FieldByName('refend').IsNull then refend := 'null'
        else
         refend := aLocalDataset.Fields.FieldByName('refend').AsString.QuotedString;

        if aLocalDataset.Fields.FieldByName('aceend').IsNull then aceend := 'null'
        else
         aceend := aLocalDataset.Fields.FieldByName('aceend').AsString.QuotedString;

        sCommand := Format(TFocosCommands.InsertEnderecos,[aLocalDataset.Fields.FieldByName('codlog').AsInteger,
          aLocalDataset.Fields.FieldByName('numend').AsInteger, comend, 'null',
          aLocalDataset.Fields.FieldByName('indcor').AsString.QuotedString,
          refend, aceend, 'null', sUser.QuotedString, IntToStr(NewID)]);

        sCommand := sCommand + ';';
        aScript.Append(sCommand);
        aLocalDataset.Next;
       end;
     end;

   //Agora monta o comando sCommand para inserir os dados de meios de contato.
   aLocalDataset.Data := DadosMeiosContatos;
   if not aLocalDataset.IsEmpty then
     begin
      while not aLocalDataset.Eof do
       begin
        sCommand := Format(TFocosCommands.InsertMeiosContatos,
          [aLocalDataset.Fields.FieldByName('descon').AsString.QuotedString,
           aLocalDataset.Fields.FieldByName('codtipcon').AsInteger,
           'null', IntToStr(NewID), TDataConverter.ToBoleanString(True, True), sUser.QuotedString]);

        sCommand := sCommand + ';';
        aScript.Append(sCommand);
        aLocalDataset.Next;
       end;
     end;

   //Finalmente, executa o script em uma �nica transa��o.
   Result := DMServerDataAcess.DoExecuteScript(aScript);

  except
   on E: TDBXError do
    begin
     if Assigned(aDataset) then FreeAndNil(aDataset);
     aLocalDataset.Free;
     DMCosmosServerServices.RegisterLog(E.Message, aScript.CommaText, leOnError);
     aScript.Free;
     raise TDBXError.Create(TCosmosErrorCodes.CreateFoco, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.CreateFoco));
    end;
   on E: EFocusDuplicated do
    begin
     if Assigned(aDataset) then FreeAndNil(aDataset);
     aLocalDataset.Free;
     aScript.Free;
     DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.CreateFoco', leOnError);
     raise TDBXError.Create(TCosmosErrorCodes.CreateFocoDuplicado, E.Message);
    end;
  end;
 end;

procedure TDMCosmosFocosMethods.DeleteDirigente(coddir: Integer);
begin

end;

function TDMCosmosFocosMethods.DeleteFocus(codfoc: Integer): boolean;
var
 sDML: string;
begin
//Exclui um determinado foco
 sDML := sDML.Format(TFocosCommands.DelFocus, [codfoc]);

 try
  Result := DMServerDataAcess.DoExecuteCommand(sDML) <> -1;

 except
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.DeleteFocus', leOnError);

    if Pos('EX_FOCO_TEM_CADASTRADOS', E.Message) > 0 then //Existem cadastrados ligados ao foco.
     raise TDBXError.Create(TCosmosErrorCodes.CannotDeleteFocoCadastrados, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.CannotDeleteFocoCadastrados))
    else
    if Pos('EX_FOCO_HISTORICO', E.Message) > 0 then //Existem refer�ncias ao foco no hist�rico de qualquer cadastrado.
     raise TDBXError.Create(TCosmosErrorCodes.CannotDeleteFocoHistorico, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.CannotDeleteFocoHistorico))
    else
     raise TDBXError.Create(TCosmosErrorCodes.CannotDeleteFoco, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.CannotDeleteFoco));
   end;
 end;

end;

procedure TDMCosmosFocosMethods.DeleteGestao(codges: Integer);
begin

end;

procedure TDMCosmosFocosMethods.DeleteOrgao(codorg: Integer);
begin

end;

procedure TDMCosmosFocosMethods.DeleteRegion(RegionID: Integer);
var
 sDML: string;
begin
//Exclui uma regi�o administrativa, se poss�vel.
 sDML := sDML.Format(TFocosCommands.DelRegiao, [RegionID]);

 try
  DMServerDataAcess.DoExecuteCommand(sDML);

 except
  on E: Exception do
   begin
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.DeleteRegion', leOnError);

    if Pos('EX_CANNOT_DEL_RA', E.Message) > 0 then //Existem subregi�es ou focos vinculados.
     raise TDBXError.Create(TCosmosErrorCodes.CannotDeleteRa, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.CannotDeleteRa))
    else
     raise TDBXError.Create(TCosmosErrorCodes.DeleteRa, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.DeleteRa));
   end;
 end;
end;

function TDMCosmosFocosMethods.DesactiveFocus(TargetFocus,
  TransferFocus: Integer; Desactivate: boolean): string;
var
 aDataset: TSQLDataset;
 aReturn: TStringList;
begin
//Transfere os cadastrados para outro foco e desativa um foco.
 aDataset := DMServerDataAcess.CreateDataset;
 aReturn := TStringList.Create;

 try
  //Verifica se o foco doador existe.
  aDataset.CommandText := Format(TFocosCommands.FindFoco, [TargetFocus]);
  aDataset.Open;

  if aDataset.IsEmpty then
   raise EFocusInexists.Create(TCosmosErrorFocMsg.FocoDoadorInexiste);

  //Verifica se o foco recebedor existe.
  aDataset.Close;
  aDataset.CommandText := Format(TFocosCommands.FindFoco, [TransferFocus]);
  aDataset.Open;

  if aDataset.IsEmpty then
   raise EFocusInexists.Create(TCosmosErrorFocMsg.FocoRecebedorInexiste);

  //Agora desativa o foco.
  aDataset.Close;
  aDataset.CommandText := Format(TFocosCommands.DesactiveFoco ,[TargetFocus, TransferFocus,
   TDataTransformation.AsSQLBoolean(Desactivate).QuotedString]) ;
  aDataset.Open;

  while not aDataset.Eof do
   begin
     aReturn.Append(aDataset.Fields.Fields[0].AsString);
     aDataset.Next;
   end;

  Result := aReturn.CommaText;

  aDataset.Free;
  aReturn.Free

 except
  on E: EFocusInexists do
   begin
    aDataset.Free;
    aReturn.Free;
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.DesactiveFocus', leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.DesactiveFoco, E.Message);
   end;
  on E: Exception do
   begin
    aDataset.Free;
    aReturn.Free;
    DMCosmosServerServices.RegisterLog(E.Message, 'TDMCosmosFocosMethods.DesactiveFocus', leOnError);
    raise TDBXError.Create(TCosmosErrorCodes.DesactiveFoco, TCosmosErrorCodes.ToMessage(TCosmosErrorCodes.DesactiveFoco));
   end;
 end;
end;

function TDMCosmosFocosMethods.TerminateMandate(coddir: Integer): boolean;
begin

end;

function TDMCosmosFocosMethods.TerminateMandates(codges: Integer): boolean;
begin

end;


end.

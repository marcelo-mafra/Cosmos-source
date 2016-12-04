unit cosmos.classes.logs.controller;

interface

uses
 Winapi.Windows, System.Classes, System.SysUtils, cosmos.classes.logs,
 cosmos.classes.logs.textfile, cosmos.system.messages;

 type
  TOnNewFileEvent = procedure(NewFileName: string) of object;

  TCosmosLogsController = class(TInterfacedObject, ICosmosLogs)

   private
    FCosmosAppName, FCurrentFile: string;
    FEncoding: TEncoding;
    FEvents: TLogEvents;
    FFileExtension: string;
    FMaxFileSize: int64;
    FPrefix: string;
    FSourcePath: string;
    FOnNewFileEvent: TOnNewFileEvent;

    function CreateWriter: TTextFileLog;
    function GetCurrentFile: string;
    procedure SetCurrentFile(const CurrentFile: string);

   public
    {ICosmosLogs}
    procedure RegisterAuditFailure(const Message: string);
    procedure RegisterAuditSucess(const Message: string);
    procedure RegisterError(const Message: string);
    procedure RegisterInfo(const Message: string);
    procedure RegisterSucess(const Message: string);
    procedure RegisterWarning(const Message: string);
    procedure RegisterRemoteCallSucess(const Message, ContextInfo: string);
    procedure RegisterRemoteCallFailure(const Message, ContextInfo: string);
    procedure RegisterLog(const Info, ContextInfo: string; Event: TLogEvent);

    constructor Create(const SourcePath, FileExtension: string; Encoding: TEncoding;
     Events: TLogEvents);
    destructor Destroy; override;

    property CosmosAppName: string read FCosmosAppName write FCosmosAppName;
    property CurrentFile: string read GetCurrentFile write SetCurrentFile;
    property Encoding: TEncoding read FEncoding;
    property Events: TLogEvents read FEvents write FEvents;
    property FileExtension: string read FFileExtension;
    property MaxFileSize: int64 read FMaxFileSize write FMaxFileSize;
    property Prefix: string read FPrefix write FPrefix;
    property SourcePath: string read FSourcePath;

    property OnNewFile: TOnNewFileEvent read FOnNewFileEvent write FOnNewFileEvent;

 end;


implementation

{ TCosmosLogsController }

constructor TCosmosLogsController.Create(const SourcePath, FileExtension: string;
     Encoding: TEncoding; Events: TLogEvents);
begin
 inherited Create;
 FSourcePath := SourcePath;
 FFileExtension := FileExtension;
 FEncoding := Encoding;
 FEvents := Events;
 OutPutDebugString(PWideChar('TCosmosLogsController.Create: ' + SourcePath));
end;

function TCosmosLogsController.CreateWriter: TTextFileLog;
begin
 Result := TTextFileLog.Create(SourcePath, FileExtension, Encoding, Events);
 OutPutDebugString(PWideChar('TCosmosLogsController.CreateWriter: ' + SourcePath));
// Result.OnNewFile := OnNewFile;
end;

destructor TCosmosLogsController.Destroy;
begin
 inherited Destroy;
end;

function TCosmosLogsController.GetCurrentFile: string;
begin
 Result := FCurrentFile;
end;

procedure TCosmosLogsController.RegisterAuditFailure(const Message: string);
begin
  inherited;
  RegisterLog(Message, '', leOnAuthenticateFail);
end;

procedure TCosmosLogsController.RegisterAuditSucess(const Message: string);
begin
  inherited;
  RegisterLog(Message, '', leOnAuthenticateSucess);
end;

procedure TCosmosLogsController.RegisterError(const Message: string);
begin
  inherited;
  RegisterLog(Message, '', leOnError);
end;

procedure TCosmosLogsController.RegisterInfo(const Message: string);
begin
  inherited;
  RegisterLog(Message, '', leOnInformation);
end;

procedure TCosmosLogsController.RegisterLog(const Info, ContextInfo: string;
  Event: TLogEvent);
var
 AList: TStringList;
 AInfo, AContextInfo: string;
 AWriter: TTextFileLog;
begin
{Este m�todo monta as mensagens de log e utiliza m�todos de "atalho" para escrever
as mensagens de log.}
  inherited;
  if not (Event in self.Events) then
   Exit;

 AList := TStringList.Create;
 OutPutDebugString(PWideChar('SourcePath: ' + SourcePath));
 OutPutDebugString(PWideChar('CurrentFile: ' + CurrentFile));

 try
  if DirectoryExists(SourcePath) then
   begin
    AWriter := CreateWriter;
    AWriter.AutoSave := True;
    AWriter.MaxSize := MaxFileSize;
    AWriter.Prefix := Prefix;
    AWriter.CurrentFile := CurrentFile;
   end
  else
   Exit;

  AInfo := Info;
  {Retira todas as quebras de linha da mensagem. Isso � necess�rio para que a
  ferramenta de visualiza��o de logs exiba corretamente o texto do log.}
  while AInfo.IndexOf(#10) >= 0 do
    AInfo := AInfo.Replace(#10, ' ');

  AContextInfo := ContextInfo;

  while AContextInfo.IndexOf(#10) >= 0 do
   begin
    AContextInfo := AContextInfo.Replace(#10, ' ');
    AContextInfo := AContextInfo.Replace(#13, ' ');
   end;

 if Assigned(AWriter) then
  begin
   AList.Append(Format('DateTime=%s', [DateTimeToStr(Now)]));
   AList.Append(Format('CosmosApp=%s', [self.CosmosAppName]));
   AList.Append(Format('Message=%s', [AInfo]));
   AList.Append(Format('ContextInfo=%s', [AContextInfo]));

   case Event of
     leOnInformation:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.InfoLogType]));
         AWriter.RegisterInfo(AList.CommaText);
       end;
     leOnWarning:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.WarnLogType]));
         AWriter.RegisterWarning(AList.CommaText);
       end;
     leOnError:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.ErrorLogType]));
         AWriter.RegisterError(AList.CommaText);
         outputdebugstring(PWideChar(AContextInfo));
       end;
     leOnPrepare:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.PrepareLogType]));
         AWriter.RegisterPrepare(AList.CommaText);
       end;
     leOnTrace:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.TraceLogType]));
         AWriter.RegisterTrace(AList.CommaText);
       end;
     leOnAuthenticateSucess:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.AuthLogType]));
         AWriter.RegisterAuditSucess(AList.CommaText);
       end;
     leOnAuthenticateFail:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.AuthFailLogType]));
         AWriter.RegisterAuditFailure(AList.CommaText);
       end;
     leOnAuthorize:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.AutLogType]));
         AWriter.RegisterAuthorization(AList.CommaText);
       end;
     leOnConnect:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.ConLogType]));
         AWriter.RegisterConnection(AList.CommaText);
       end;
     leOnConnectError:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.ConErrorLogType]));
         AWriter.RegisterConnectionFailure(AList.CommaText);
       end;
     leOnConnectClose:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.ConCloseLogType]));
         AWriter.RegisterConnectionClose(AList.CommaText);
       end;
     leOnMethodCall:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.RemoteCallLogType]));
         AWriter.RegisterRemoteCallSucess(AList.CommaText);
       end;
     leOnMethodCallError:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.RemoteCallErrorLogType]));
         AWriter.RegisterRemoteCallFailure(AList.CommaText);
       end;
     leUnknown:
       begin
         AList.Append(Format('LogType=%s', [TCosmosLogs.UnknownLogType]));
         AWriter.RegisterUnknow(AList.CommaText);
       end;
   end;
  end;

  //Atualiza o nome do arquivo de log usado pelo objeto interno e dispara o evento.
  if self.CurrentFile <> AWriter.CurrentFile then
   begin
    self.CurrentFile := AWriter.CurrentFile;
    self.OnNewFile(self.CurrentFile);
   end;

  if Assigned(AList) then FreeAndNil(AList);
  if Assigned(AWriter) then FreeAndNil(AWriter);

 except
   on E: Exception do
    begin
     if Assigned(AList) then FreeAndNil(AList);
     if Assigned(AWriter) then FreeAndNil(AWriter);
     raise Exception.Create(E.Message);
    end;
 end;
end;

procedure TCosmosLogsController.RegisterRemoteCallFailure(const Message,
  ContextInfo: string);
begin
   RegisterLog(Message, ContextInfo, leOnMethodCallError);
end;

procedure TCosmosLogsController.RegisterRemoteCallSucess(const Message,
  ContextInfo: string);
begin
   RegisterLog(Message, ContextInfo, leOnMethodCall);
end;

procedure TCosmosLogsController.RegisterSucess(const Message: string);
begin
  inherited;
  RegisterLog(Message, '', leOnInformation);
end;

procedure TCosmosLogsController.RegisterWarning(const Message: string);
begin
  inherited;
  RegisterLog(Message, '', leOnWarning);
end;

procedure TCosmosLogsController.SetCurrentFile(const CurrentFile: string);
begin
 FCurrentFile := CurrentFile;
 OutputDebugString(PWideChar('TCosmosLogsController.SetCurrentFile: ' + CurrentFile));
end;

end.

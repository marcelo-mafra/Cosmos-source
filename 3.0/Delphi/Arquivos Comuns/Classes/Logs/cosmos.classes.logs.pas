unit cosmos.classes.logs;

interface

uses

 Winapi.Windows;

 type
    //Eventos de gera��o de logs.
   TLogEvent = (leOnPrepare, leOnError, leOnTrace, leOnAuthenticateSucess,
    leOnAuthenticateFail, leOnAuthorize, leOnInformation, leOnWarning,
    //esses abaixo somente s�o usados na camada cliente.
    leOnConnect, leOnConnectError, leOnConnectClose, leOnMethodCall,
    leOnMethodCallError, leUnknown);


   TLogEvents = set of TLogEvent; //Conjunto de eventos de gera��o de logs.

   ICosmosLogs = interface
    ['{1BA3657F-D67F-4909-8606-70494B2D265C}']
    procedure RegisterAuditFailure(const Message: string);
    procedure RegisterAuditSucess(const Message: string);
    procedure RegisterError(const Message: string);
    procedure RegisterInfo(const Message: string);
    procedure RegisterSucess(const Message: string);
    procedure RegisterWarning(const Message: string);
    procedure RegisterRemoteCallSucess(const Message, ContextInfo: string);
    procedure RegisterRemoteCallFailure(const Message, ContextInfo: string);
    procedure RegisterLog(const Info, ContextInfo: string; Event: TLogEvent);
  end;


  TCustomLog = class(TInterfacedObject)

   private
    FEvents: TLogEvents;

   public
    constructor Create(Events: TLogEvents);
    destructor Destroy; override;

    procedure RegisterAuditFailure(const Message: string); virtual; abstract;
    procedure RegisterAuditSucess(const Message: string); virtual; abstract;
    procedure RegisterError(const Message: string); virtual; abstract;
    procedure RegisterInfo(const Message: string); virtual; abstract;
    procedure RegisterSucess(const Message: string); virtual; abstract;
    procedure RegisterWarning(const Message: string); virtual; abstract;
    procedure RegisterLog(const Info, ContextInfo: string; Event: TLogEvent); virtual; abstract;

    property Events: TLogEvents read FEvents;

  end;

implementation

{ TCustomLog }

constructor TCustomLog.Create(Events: TLogEvents);
begin
 inherited Create;
 FEvents := Events;
end;

destructor TCustomLog.Destroy;
begin
 inherited Destroy;
end;

end.

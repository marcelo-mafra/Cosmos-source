unit cosmos.mobile.classes.RestRequestNotifiers;

{Todas as classes implementadoras das interfaces declaradas nesta unidade
devem descender de TInterfacedPersistent e não de TInterfacedObject ou TAggregatedObject.
Do contrário, devido ao gerenciamento automático do ciclo de vida das interfaces,
o sistema começará a disparar Access Violations ao tentar acessar as interfaces.
}

interface

uses

 System.Classes, System.Generics.Collections;

type
 TOnRequestStatus = (rsExecuting, rsExecuted, rsOnError);

 TNotifyChangeRequestStatusEvent = procedure(Status: TOnRequestStatus) of object;


 {Observer class.}
 TRestRequestStatusObserver = class(TInterfacedPersistent)
    private
     FOnNotifyChangeRequestStatus: TNotifyChangeRequestStatusEvent;
     FPoolIndex: Int64;

     procedure NotifyChangeRestRequestStatus(Status: TOnRequestStatus);

    public
     constructor Create;
     destructor Destroy;
     property PoolIndex: Int64 read FPoolIndex;

     property OnNotifyChangeRequestStatus: TNotifyChangeRequestStatusEvent read
        FOnNotifyChangeRequestStatus write FOnNotifyChangeRequestStatus;
  end;

 {Observable class.}
 TRestRequestStatusObservable = class(TInterfacedPersistent)
    private
     FObserversPool:  TDictionary<Int64, TRestRequestStatusObserver>;

    public
     constructor Create;
     destructor Destroy;
     procedure NotifyObservers(const Status: TOnRequestStatus);
     procedure RegisterObserver(Observer: TRestRequestStatusObserver);
     procedure UnregisterObserver(Observer: TRestRequestStatusObserver);
 end;


implementation

{ TRestRequestStatusObservable }

constructor TRestRequestStatusObservable.Create;
begin
  inherited Create;
  FObserversPool := TDictionary<Int64, TRestRequestStatusObserver>.Create;
end;

destructor TRestRequestStatusObservable.Destroy;
begin
  FObserversPool.Values.Free;
  FObserversPool.Keys.Free;
  FObserversPool.Free;
  inherited Destroy;
end;

procedure TRestRequestStatusObservable.NotifyObservers(
  const Status: TOnRequestStatus);
var
  AKey: Int64;
 aObserver: TRestRequestStatusObserver;
begin
{Notifica todos os observadores acerca da mudança do status da conexão com
 o servidor do Cosmos.}
  for AKey in FObserversPool.Keys do
   begin
    aObserver := FObserversPool[Akey];
    aObserver.NotifyChangeRestRequestStatus(Status);
   end;
end;

procedure TRestRequestStatusObservable.RegisterObserver(
  Observer: TRestRequestStatusObserver);
begin
 if not FObserversPool.ContainsKey(Observer.PoolIndex) then
  FObserversPool.Add(Observer.PoolIndex, Observer);
end;

procedure TRestRequestStatusObservable.UnregisterObserver(
  Observer: TRestRequestStatusObserver);
begin
 if FObserversPool.ContainsKey(Observer.PoolIndex) then
   FObserversPool.Remove(Observer.PoolIndex);
end;

{ TRestRequestStatusObserver }

constructor TRestRequestStatusObserver.Create;
begin
  inherited Create;
  Randomize;
  FPoolIndex := Random(10);
end;

destructor TRestRequestStatusObserver.Destroy;
begin
  inherited Destroy;
end;

procedure TRestRequestStatusObserver.NotifyChangeRestRequestStatus(
  Status: TOnRequestStatus);
begin
 //Dispara o evento "OnNotifyChangeRequestStatus".
 if Assigned(FOnNotifyChangeRequestStatus) then
   FOnNotifyChangeRequestStatus(Status);
end;

end.

unit cosmos.business.financeiro;

interface

uses

 System.Classes, cosmos.business.focos;

type

 //Objetos de negócio do módulo financeiro.
  TTiposRecebimento = (trMensalidade, trTxConferencia, trDoacao);

  //Motivos de cancelamentos de um recebimento.
  TMotivoCancelamento = (mcEquivoco, mcDesistencia, mcSystemError);

  //Classe utilitária acessória com métodos de classe relacionados a recebimentos de valores.
  TTipoRecebimentosInfo = class
   private

   public
    class function ToStringValue(const Tipo: TTiposRecebimento): string;
  end;

  TCaixa = class
  private
    FActivated: boolean;
    FCaixaID: integer;
    FCaixaStart, FCaixaEnd: TDateTime;
    FFocoCaixa: TFocus;
    FUserLogin, FUserName, FNumCaixa: string;

  public
   constructor Create;
   destructor Destroy; override;

   property Activated: boolean read FActivated;
   property CaixaID: integer read FCaixaID write FCaixaID;
   property FocoCaixa: TFocus read FFocoCaixa write FFocoCaixa;
   property CaixaStart: TDateTime read FCaixaStart write FCaixaStart;
   property CaixaEnd: TDateTime read FCaixaEnd write FCaixaEnd;
   property NumCaixa: string read FNumCaixa write FNumCaixa;
   property UserLogin: string read FUserLogin write FUserLogin;
   property UserName: string read FUserName write FUserName;


   procedure RegistrarAbertura;
   procedure RegistrarEncerramento;

  end;


implementation

{ TConferencia }

constructor TCaixa.Create;
begin
  inherited Create;
end;

destructor TCaixa.Destroy;
begin
 inherited Destroy;
end;


procedure TCaixa.RegistrarAbertura;
begin
 FActivated := True;
end;

procedure TCaixa.RegistrarEncerramento;
begin
 FActivated := False;
end;

{ TTipoRecebimentosInfo }

class function TTipoRecebimentosInfo.ToStringValue(
  const Tipo: TTiposRecebimento): string;
begin
 case Tipo of
   trMensalidade: Result := 'MEN'; //do not localize!
   trTxConferencia: Result := 'TAX';//do not localize!
   trDoacao: Result := 'DOA';//do not localize!
 end;
end;

end.


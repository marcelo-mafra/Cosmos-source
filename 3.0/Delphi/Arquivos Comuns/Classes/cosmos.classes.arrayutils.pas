unit cosmos.classes.arrayutils;

interface

uses
 system.SysUtils, system.variants, cosmos.system.messages;

type
 {Representa um array de argumentos de pesquisa que ser�o usados na montagem do
  comando SQL. Esta estrutura suporta at� 11 argumentos de pesquisa.}
 EUnknowVarRecType = Exception;
 EIsNotArray = Exception;

 TConstArray = array [0..20] of TVarRec;

 TArrayUtils = class

   class function CreateConstArray(Elements: Olevariant): TConstArray;
   class function VarFormat(const FmtString: string; Parameters: Olevariant): string;
   class procedure ReplaceStr(var AString: string; OldStr, NewStr: string); inline;

 end;

implementation

{ TArrayUtils }

class function TArrayUtils.CreateConstArray(Elements: Olevariant): TConstArray;
{Recebe um array de variants contendo todos os argumentos da pesquisa e retorna
 um tipo TConstArray, que poder� ser usado para montar o comando SQL a ser
 executado.}
var
 Args: array [0..20] of TVarRec;
 AVariant: Variant;
 ABound, HighBound: integer;
 sValue: string;
begin
 ABound := varArrayLowBound(Elements, 1);
 HighBound := varArrayHighBound(Elements, 1);

 while ABound <= HighBound  do
   begin
    AVariant := VarArrayGet(Elements, [ABound]);

    case VarType(AVariant) of
     varEmpty, varNull, varDispatch, varError, varUnknown: Exit;
     varSmallint, varShortInt, varInteger, varSingle, varByte, varWord:
      begin
       Args[ABound].VType := vtInteger;
       Args[ABound].VInteger := AVariant;
      end;
     varDouble: Exit;
     varCurrency: Exit;
     varDate: Exit;
     varOleStr, varStrArg, varString:
      begin
       sValue := AVariant;
       Args[ABound].VType := vtPWideChar;
       Args[ABound].VPWideChar := PWideChar(sValue);
      end;
     varBoolean: //booleans s�o tratados como strings...
      begin
       Args[ABound].VType := vtPWideChar;

       if AVariant = True then
        sValue := QuotedStr('S')
       else
        sValue := QuotedStr('N');

       Args[ABound].VPWideChar := PWideChar(sValue);
      end;
     varVariant: Exit;
     varLongWord: Exit;
     varInt64: Exit;
    end;
    Inc(ABound);
  end;

 Result := TConstArray(Args);
end;


class procedure TArrayUtils.ReplaceStr(var AString: string; OldStr,
  NewStr: string);
var
 AIndex: integer;
begin
{Na string "AString", substitui a primeira ocorr�ncia de "OldStr" por "NewStr".
 Este m�todo foi criado pelo fato de eu n�o estar conseguindo fazer funcionar o
 m�todo StringReplace, da unidade SysUtils.}
 AIndex := Pos(OldStr, AString);
 if AIndex > 0 then
  begin
   Delete(AString, AIndex, Length(OldStr));
   Insert(NewStr, AString, AIndex);
  end;
end;

class function TArrayUtils.VarFormat(const FmtString: string;
  Parameters: Olevariant): string;
var
ABound, HighBound: integer;
AVariant: Variant;
AString, AValue: string;
begin
{Retorna uma string formatada com os par�metros recebidos na vari�vel de entrada
 "Parameters". Esta vari�vel deve ser um array de variant.}

 //Checa se "Parameters � um array.
 if not varIsArray(Parameters) then
   raise EIsNotArray.Create(TCosmosErrorMsg.sEIsNotArray);

 //Come�a a opera��o em cima do par�metros "FmtString".
 AString := FmtString;
 ABound := varArrayLowBound(Parameters, 1);
 HighBound := varArrayHighBound(Parameters, 1);

 while ABound <= HighBound do
  begin
    //Pega o valor do par�metro.
    AVariant := VarArrayGet(Parameters, [ABound]);

    case VarType(AVariant) of
     varEmpty, varNull, varDispatch, varError, varUnknown:
       begin
        Result := AString;
        Exit;
       end;

     varSmallint, varShortInt, varInteger: self.ReplaceStr(AString, '%d', AVariant);

     varSingle, varByte, varWord: self.ReplaceStr(AString, '%d', AVariant);

     varDouble: Exit;

     varCurrency: Exit;

     varDate: Exit;

     varOleStr, varStrArg, varString: self.ReplaceStr(AString, '%s', AVariant);

     varBoolean: //booleans s�o tratados como strings...
      begin
       if AVariant = True then
        AValue := QuotedStr('S')
       else
        AValue := QuotedStr('N');

        self.ReplaceStr(AString, '%s', AValue);
      end;
     varVariant: Exit;
     varLongWord: Exit;
     varInt64: Exit;
    end;

   Inc(ABound);
  end;

 Result := AString;
end;

end.

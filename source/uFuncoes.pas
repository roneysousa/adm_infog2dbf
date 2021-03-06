unit uFuncoes;

interface

uses
Windows, Dialogs, Messages, SysUtils, Classes, Controls, Forms,
StdCtrls, Mask,Db, DBTables,DBIProcs,TypInfo,WinProcs, ExtCtrls, uPrincipal,
ExtDlgs,Jpeg, DBXpress, SqlExpr, DBClient, Provider, FMTBcd, DateUtils;

// Func�es e procedures para o sistema.

Function StrZero(Zeros:string;Quant:integer):String;
Procedure Limpar_Status;
function Empty(inString:String): Boolean;
Function Codifica( const Str1: string): String;
Function SysComputerName: string;
Function ContaCaracs(Edit:String): integer;
Function Replicate( Caracter:String; Quant:Integer ): String;
Function CPF(num: string): boolean;
Function CGC(num: string): boolean;
Function Alltrim(const Search: string): string;
Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
Function DataExtenso(Data:TDateTime): String;
Function MesExtenso (xMes : TDateTime) : string;
function MesExtenso2( Mes:Word ) : string;
function StrToPChar(const Str: string): PChar;
Function Arredondar(Valor: Double; Dec: Integer): Double;
Function tbReplChar(const Ch: Char; const Len: integer): string;
Function Padr(s:string;n:integer):string;
function Padl(s:string;n:integer):string;
Function Justifica(mCad:string;mMAx:integer):string;
function extenso (valor: real): string;
function Maiuscula(Texto:String): String;
Function DiadaSemana(Data : String) : string;
Function OnLine(Porta:Word):Boolean;
Function EsvaziaTabela(Tabela : TTable): Boolean;
function RemoveChar(Const Texto:String):String;
function StrIsInteger(const S: string): boolean;
function Gerapercentual(valor:real;Percent:Real):real;
Procedure Grava_Imagem_JPEG(Tabela:TTable; Campo:TBlobField;
Foto:TImage; Dialog:TOpenPictureDialog);
Procedure Grava_Imagem_JPEG_CDS(Tabela:TClientDataSet; Campo:TBlobField;
Foto:TImage; Dialog:TOpenPictureDialog);
Procedure Le_Imagem_JPEG(Campo:TBlobField; Foto:TImage);
Function PrinterOnLine : Boolean;
function ArredontaFloat(x : Real): Real;
function LTrim(Texto:String):String;
Function PadC(S:string;Len:byte):string;
function PasswordInputBox(const ACaption, APrompt:string): string;
function FormataCNPJ(CNPJ: string): string;
function LOCALIZAR_CLIENTE(W_CDCLIE : String) : boolean;
function LOCALIZAR_FUNCIONARIO(M_CDFUNC : String) : boolean;
function getNMFUNCIONARIO(M_CDFUNC : String) : String;
function getNMCLIENTE(M_CDCLIE : String) : String;
function FormataFONE(sFONE: string): string;
function FormataData(sData : string) : String;
function FormataData2(sData : string) : String;
function CEP(sCEP : string) : String;
function RemoveAcento(Str:String): String;
function FormataCPF(cTexto : String) : String;
function FormataCep(M_NUNCEP : string) : String;
Function Acrescentar_Dias_Data(M_DATA : TDate) : TDate;
function AnsiToAscii ( str: String ): String;
function ValidarEMail(aStr: string): Boolean;


implementation

uses udmADM;


function FormataCNPJ(CNPJ: string): string;
begin
  Result :=Copy(CNPJ,1,2)+'.'+Copy(CNPJ,3,3)+'.'+Copy(CNPJ,6,3)+'/'+
    Copy(CNPJ,9,4)+'-'+Copy(CNPJ,13,2);
end;

function MesExtenso2( Mes:Word ) : string; const meses : array[0..11] of
PChar = ('JANEIRO', 'FEVEREIRO', 'MAR�O', 'ABRIL', 'MAIO', 'JUNHO', 'JULHO', 'AGOSTO', 'SETEMBRO','OUTUBRO', 'NOVEMBRO', 'DEZEMBRO');
begin
    result := meses[mes-1];
End;


function Padl(s:string;n:integer):string; // Alinhamento pela esquerda
{alinha uma string � esquerda}
begin
  Result:=Format('%-'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;

function LTrim(Texto:String):String;
{Remove os Espa�os em branco � direita da string}
var
  I : Integer;
begin
  I := 0;
  while True do
  begin
  inc(I);
  if I > length(Texto) then
  break;
  if Texto[I] <> #32 then
  break;
  end;
  Result := Copy(Texto,I,length(Texto));
end;

function ArredontaFloat(x : Real): Real;
{Arredonda um n�mero float para convert�-lo em String}
Begin
  if x > 0 Then
  begin
  if Frac(x) > 0.5 Then
  begin
  x := x + 1 - Frac(x);
  end
  else
  begin
  x := x - Frac(x);
  end;
  end
  else
  begin
  x := x - Frac(x);
  end;
  result := x
end;

function RemoveChar(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
   begin
   if (Texto[I] in ['0'..'9']) then
       begin
       S := S + Copy(Texto, I, 1);
       end;
   end;
result := S;
end;

function StrIsInteger(const S: string): boolean;
// Verificar se uma string cont�m um valor inteiro v�lido
begin
  try
  StrToInt(S);
  Result := true;
  except
  Result := false;
  end;
end;

function Gerapercentual(valor:real;Percent:Real):real;
// Retorna a porcentagem de um valor
begin
percent := percent / 100;
try
  valor := valor * Percent;
finally
  result := valor;
end;
end;

Procedure Grava_Imagem_JPEG(Tabela:TTable; Campo:TBlobField;
Foto:TImage; Dialog:TOpenPictureDialog);
var
    BS:TBlobStream;
    MinhaImagem:TJPEGImage;
Begin
     Dialog.InitialDir := 'c:\temp';
     Dialog.Execute;
     if Dialog.FileName <> '' Then
     Begin
          if not (Tabela.State in [dsEdit, dsInsert]) Then
              Tabela.Edit;
          BS := TBlobStream.Create((Campo as TBlobField), BMWRITE);
          MinhaImagem := TJPEGImage.Create;
          MinhaImagem.LoadFromFile(Dialog.FileName);
          MinhaImagem.SaveToStream(BS);
          Foto.Picture.Assign(MinhaImagem);
          BS.Free;
          MinhaImagem.Free;
          Tabela.Post;
          DBISaveChanges(Tabela.Handle);
     End;
End;

Procedure Grava_Imagem_JPEG_CDS(Tabela:TClientDataSet; Campo:TBlobField;
Foto:TImage; Dialog:TOpenPictureDialog);
var
    BS:TBlobStream;
    MinhaImagem:TJPEGImage;
Begin
     Dialog.InitialDir := 'c:\temp';
     Dialog.Execute;
     if Dialog.FileName <> '' Then
     Begin
          if not (Tabela.State in [dsEdit, dsInsert]) Then
              Tabela.Edit;
          BS := TBlobStream.Create((Campo as TBlobField), BMWRITE);
          MinhaImagem := TJPEGImage.Create;
          MinhaImagem.LoadFromFile(Dialog.FileName);
          MinhaImagem.SaveToStream(BS);
          Foto.Picture.Assign(MinhaImagem);
          BS.Free;
          MinhaImagem.Free;
          Tabela.Post;
          //DBISaveChanges(Tabela.Handle);
     End;
End;

Procedure Le_Imagem_JPEG(Campo:TBlobField; Foto:TImage);
var BS:TBlobStream;
    MinhaImagem:TJPEGImage;
Begin
    if Campo.AsString <> '' Then
    Begin
        BS := TBlobStream.Create((Campo as TBlobField), BMREAD);
        MinhaImagem := TJPEGImage.Create;
        MinhaImagem.LoadFromStream(BS);
        Foto.Picture.Assign(MinhaImagem);
        BS.Free;
        MinhaImagem.Free;
    End;
//Else Foto.Picture.LoadFromFile('c:\temp\limpa.jpg');
End;

function StrZero(Zeros:string;Quant:integer):String;
{Insere Zeros � frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := zeros;
  Tamanho := length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;
end;

Function Padr(s: string; n: integer): string;
{alinha uma string � direita}
begin
       Result:=Format('%'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;


Function tbReplChar(const Ch: Char; const Len: integer): string;
var
  I: integer;
begin
  SetLength(Result, Len);
  for I := 1 to Len do
  Result[I] := Ch;
end;


Procedure Limpar_Status;
begin
     frmPrincipal.StatusBar1.Panels[2].Text := ' ';
     frmPrincipal.StatusBar1.Panels[1].Text := '';
end;

function Empty(inString:String): Boolean;
{Testa se a variavel est� vazia ou n�o}
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  while (index <= Length(inString))and (index <> 0) do
  begin
  if inString[index] = ' ' Then
  begin
inc(index)
  end
  else
Begin
  Empty := False;
  index := 0
end;
  end;
end;

Function Codifica( const Str1: string): String;
{Encripta uma string}
var
Mascara,Str2: String;
PonM, PonS: Byte;
begin
Mascara := '#$%$'#13#12;
Str2 := '';
PonM := 1;
for PonS:=1 to length(Str1) do
  begin
  AppendStr( Str2, Chr( Ord(Str1[PonS]) Xor Ord(Mascara[PonM])));
  Inc( PonM);
  if PonM>Length(Mascara) then
  begin
  PonM:=1;
  end;
  Result := Str2;
  end;
end;

{ Sys }
function SysComputerName: string;
var
  I: DWord;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;

Function ContaCaracs(Edit: String): integer;
{Retorna quantos caracteres tem um Edit especificado}
begin
     Result := Length(Edit);
end;

function Replicate(Caracter: String; Quant: Integer): String;
{Repete o mesmo caractere v�rias vezes}
var I : Integer;
begin
Result := '';
  for I := 1 to Quant do
  Result := Result + Caracter;
end;

Function CPF(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[10]+num[11];
if calculado=digitado then
  cpf:=true
  else
  cpf:=false;
end;

function cgc(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
n10:=StrToInt(num[10]);
n11:=StrToInt(num[11]);
n12:=StrToInt(num[12]);
d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[13]+num[14];
if calculado=digitado then
  cgc:=true
  else
  cgc:=false;
end;

Function Alltrim(const Search: string): string;
{Remove os espa�os em branco de ambos os lados da string}
const
BlackSpace = [#33..#126];
var
Index: byte;
begin
Index:=1;
while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
  Index:=Index + 1;
  end;
Result:=Copy(Search, Index, 255);
Index := Length(Result);
while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
  Index:=Index - 1;
  end;
Result := Copy(Result, 1, Index);
End;

Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
//
// Retorna uma data acres�ida de mais um certo n�mero de dias
//
var dw:integer;
Begin
  dw := DayOfWeek(dataini)-1;
  result := dataini+dias_uteis+((dias_uteis-1+dw) div 7)*2;
End;

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'domingo';
  DiaDasemana [2]:= 'segunda-feira';
  DiaDasemana [3]:= 'ter�a-feira';
  DiaDasemana [4]:= 'quarta-feira';
  DiaDasemana [5]:= 'quinta-feira';
  DiaDasemana [6]:= 'sexta-feira';
  DiaDasemana [7]:= 's�bado';
{ Meses do ano }
  Meses [1] := 'janeiro';
  Meses [2] := 'fevereiro';
  Meses [3] := 'mar�o';
  Meses [4] := 'abril';
  Meses [5] := 'maio';
  Meses [6] := 'junho';
  Meses [7] := 'julho';
  Meses [8] := 'agosto';
  Meses [9] := 'setembro';
  Meses [10]:= 'outubro';
  Meses [11]:= 'novembro';
  Meses [12]:= 'dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result :=  IntToStr(Dia) +' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano)+'.';
  //DiaDaSemana[NoDia] + ', '
end;

Function MesExtenso (xMes : TDateTime) : string;
Var
Dia, Mes, Ano : Word;
begin
Mes := 0;
DecodeDate (xMes, Ano, Mes, Dia);
{Try
Mes := Round (xMes);
Except
End;}
case Mes of
1: Result := 'JANEIRO';
2: Result := 'FEVEREIRO';
3: Result := 'MAR�O';
4: Result := 'ABRIL';
5: Result := 'MAIO';
6: Result := 'JUNHO';
7: Result := 'JULHO';
8: Result := 'AGOSTO';
9: Result := 'SETEMBRO';
10: Result := 'OUTUBRO';
11: Result := 'NOVEMBRO';
12: Result := 'DEZEMBRO';
else
Result := '';
end;
end;

function StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
  begin
  Result := @Str[1];
  end
  else
  begin
  Result := StrAlloc(Length(Str)+1);
  RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
  StrPCopy(Result,Str);
  StrDispose(Ring[RingIndex]);
  Ring[RingIndex]:= Result;
  end;
end;

Function Arredondar(Valor: Double; Dec: Integer): Double;
var
  Valor1,
  Numero1,
  Numero2,
  Numero3: Double;
begin
  Valor1:=Exp(Ln(10) * (Dec + 1));
  Numero1:=Int(Valor * Valor1);
  Numero2:=(Numero1 / 10);
  Numero3:=Round(Numero2);
  Result:=(Numero3 / (Exp(Ln(10) * Dec)));
end;

Function Justifica(mCad:string;mMAx:integer):string;
var
mPos,mPont,mTam,mNr,mCont:integer;
mStr:string;
begin
mTam:=Length(mCad);
if mTam>=mMax then
Result:=copy(mCad,1,mMax)
else
mStr:='';
mCont:=0;
mPont:=1;
mNr:=mMax-mTam;
while mCont<mNr do
begin
mPos:=pos(mStr,copy(mCad,mPont,100));
if mPos=0 then
begin
mStr:=mStr+' ';
mPont:=1;
continue;
end
else
begin
mCont:=mCont+1;
Insert(' ',mCad,mPos+mPont);
mPont:=mPont+mPos+length(mStr);
end;
Result:=mCad;
end;
end;

function extenso (valor: real): string;
var
Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
if Expressao
then Result:=CasoVerdadeiro
else Result:=CasoFalso;
end;



function MiniExtenso (trio: string): string;
var
Unidade, Dezena, Centena: string;
begin
Unidade:='';
Dezena:='';
Centena:='';
if (trio[2]='1') and (trio[3]<>'0') then
  begin
  Unidade:=Dez[strtoint(trio[3])];
  Dezena:='';
end
else
 begin
  if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
  if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
 end;
if (trio[1]='1') and (Unidade='') and (Dezena='')
 then Centena:='cem'
else
 if trio[1]<>'0'
  then Centena:=Centenas[strtoint(trio[1])]
  else Centena:='';
 Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
  + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
end;
begin
if (valor>999999.99) or (valor<0) then
 begin
  msg:='O valor est� fora do intervalo permitido.';
  msg:=msg+'O n�mero deve ser maior ou igual a zero e menor que 999.999,99.';
  msg:=msg+' Se n�o for corrigido o n�mero n�o ser� escrito por extenso.';
  showmessage(msg);
  Result:='';
  exit;
 end;
if valor=0 then
 begin
  Result:='';
  Exit;
 end;
Texto:=formatfloat('000000.00',valor);
Milhar:=MiniExtenso(Copy(Texto,1,3));
Centena:=MiniExtenso(Copy(Texto,4,3));
Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
Result:=Milhar;
if Milhar<>'' then
  if copy(texto,4,3)='000' then
  Result:=Result+' Mil Reais'
  else
  Result:=Result+' Mil, ';
if (((copy(texto,4,2)='00') and (Milhar<>'')
  and (copy(texto,6,1)<>'0')) or (centavos=''))
  and (Centena<>'') then Result:=Result+' e ';
if (Milhar+Centena <>'') then Result:=Result+Centena;
if (Milhar='') and (copy(texto,4,3)='001') then
  Result:=Result+' Real'
 else
  if (copy(texto,4,3)<>'000') then Result:=Result+' Reais';
if Centavos='' then
 begin
  Result:=Result+'.';
  Exit;
 end
else
 begin
  if Milhar+Centena='' then
  Result:=Centavos
  else
  Result:=Result+', e '+Centavos;
if (copy(texto,8,2)='01') and (Centavos<>'') then
  Result:=Result+' Centavo'
 else
  Result:=Result+' Centavos';
end;
end;

function Maiuscula(Texto:String): String;
{Converte a primeira letra do texto especificado para
maiuscula e as restantes para minuscula}
var
OldStart: Integer;
begin
if Texto <> '' then
  begin
  Texto := UpperCase(Copy(Texto,1,1))+LowerCase(Copy(Texto,2,Length(Texto)));
  Result := Texto;
  end;
end;

Function DiadaSemana(Data : String) : string;
const
  semana : array[1..7] of string = ('Domingo','Segunda-feira','Ter�a-feira','Quarta-feira','Quinta-feira','Sexta-feira', 'Sabado');
begin
  Result := semana[DayOfWeek(strtodate(Data))]
end;

Function OnLine(Porta:Word):Boolean;
// Verificar se Impressora esta Conectada
Const
Portas :Byte = $02;
Var
Res :Byte;
Begin
{ C�digo em Assembler }
Asm
mov ah,Portas; {Requisita o acesso as portas}
mov dx,Porta;{Define a porta de teste}
Int $17; {Chama a interrup��o de Impressora}
mov Res,ah; {Guarda em Res o resultado da opera��o }
end;
Result := (Res and $80) = $80; {Testa o valor de sa�da}
End;

function EsvaziaTabela(Tabela : TTable): Boolean;
// Esvazia a tabela passada como parametro
var
lExclusivo : boolean;
begin
Tabela.Active := False;
repeat
try
  Tabela.Exclusive := True;
  Tabela.Active := True;
  Tabela.EmptyTable;
  lExclusivo := True;
  Break;
except
  on EDatabaseError do
  if MessageDlg('A tabela est� sendo usada por outro usu�rio. Tenta novamente ?', mtError,[mbOK, mbCancel], 0) <> mrOK then
  begin
  lExclusivo := False;
  raise;
  end;
  end;
until False;
Result := lExclusivo;
end;

Function PrinterOnLine : Boolean;
Const
  PrnStInt : Byte = $17;
  StRq : Byte = $02;
  PrnNum : Word = 0; { 0 para LPT1, 1 para LPT2, etc. }
Var
  nResult : byte;
Begin (* PrinterOnLine*)
  Asm
  mov ah,StRq;
  mov dx,PrnNum;
  Int $17;
  mov nResult,ah;
end;
  PrinterOnLine := (nResult and $80) = $80;
End;

Function PadC(S:string;Len:byte):string;
// Centraliza uma string em um espa�o determinado
var
 Str:String;
 L:byte;
begin
str :='';
if len < Length(s) then
  begin
  Result := '';
  Exit;
  end;
l:=(Len-Length(S)) div 2;
while l > 0 do
  begin
  str:=str+' ';
  dec(l);
  end;
for l:=1 to length(S) do
  begin
  str := str+s[L];
  end;
 Result := str;
end;

function PasswordInputBox(const ACaption, APrompt:string): string;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  Value: string;
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  Result := '';
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
    DialogUnits.X := DialogUnits.X div 52;
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    ClientHeight := MulDiv(63, DialogUnits.Y, 8);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      AutoSize := True;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Caption := APrompt;
    end;
    Edit := TEdit.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := MulDiv(19, DialogUnits.Y, 8);
      Width := MulDiv(164, DialogUnits.X, 4);
      MaxLength := 255;
      PasswordChar := '*';
      SelectAll;
    end;
    ButtonTop := MulDiv(41, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'OK';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'Cancel';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
    end;
    if ShowModal = mrOk then
    begin
      Value := Edit.Text;
      Result := Value;
    end;
  finally
    Form.Free;
    Form:=nil;
  end;
end;

function LOCALIZAR_CLIENTE(W_CDCLIE : String) : boolean;
begin
     With dmADM.qryLocClientes do
        begin
             Close;
             ParamByName('pCDCLIE').AsString := W_CDCLIE;
             Open;
             //
             If (dmADM.qryLocClientes.RecordCount > 0) Then
                 result := True
             Else
                 result := False;
        End;
End;

function FormataFONE(sFONE: string): string;
Begin
     // 99 9999 9999
     result := '('+Copy(sFONE,1,2)+')'
                  +Copy(sFONE,3,4)+'-'
                  +Copy(sFONE,7,4);
End;

function FormataData(sData : string) : String;
begin
     // 99 / 99 / 9999
     result := Copy(sData,7,2)+'/'+Copy(sData,5,2)+'/'+Copy(sData,1,4);
End;

function FormataData2(sData : string) : String;
begin
     // 99 / 99 / 9999
     result := Copy(sData,7,4)+Copy(sData,4,2)+Copy(sData,1,2);
End;

function CEP(sCEP : string) : String;
begin
     // 99999-999
     result := Copy(sCEP,1,5)+'-'+Copy(sCEP,6,3);
End;

function LOCALIZAR_FUNCIONARIO(M_CDFUNC : String) : boolean;
Begin
     With dmADM.qryConsulta do
        begin
             SQL.Clear;
             Close;
             SQL.Add('Select FUN_CDFUNC, FUN_NMFUNC from "ADMFUN.DBF" ');
             SQL.Add(' Where (FUN_CDFUNC = :pCDFUNC) ');
             ParamByName('pCDFUNC').AsString := StrZero(M_CDFUNC,5);
             Open;
             //
             If (dmADM.qryConsulta.RecordCount > 0) Then
                 result := True
             Else
                 result := False;
        End;
End;

function getNMFUNCIONARIO(M_CDFUNC : String) : String;
Begin
     With dmADM.qryConsulta do
        begin
             SQL.Clear;
             Close;
             SQL.Add('Select FUN_CDFUNC, FUN_NMFUNC from "ADMFUN.DBF" ');
             SQL.Add(' Where (FUN_CDFUNC = :pCDFUNC) ');
             ParamByName('pCDFUNC').AsString := StrZero(M_CDFUNC,5);
             Open;
             //
             If (dmADM.qryConsulta.RecordCount > 0) Then
                 result := FieldByname('FUN_NMFUNC').AsString
             Else
                 result := 'N�O ENCONTRADO';
        End;
End;

function getNMCLIENTE(M_CDCLIE : String) : String;
Begin
     With dmADM.qryConsulta do
        begin
             SQL.Clear;
             Close;
             SQL.Add('Select CLI_CDCLIE, CLI_NMCLIE from "ADMCLI.DBF" ');
             SQL.Add(' Where (CLI_CDCLIE = :pCDCLIE) ');
             ParamByName('pCDCLIE').AsString := StrZero(M_CDCLIE,7);
             Open;
             //
             If (dmADM.qryConsulta.RecordCount > 0) Then
                 result := FieldByname('CLI_NMCLIE').AsString
             Else
                 result := 'N�O ENCONTRADO';
        End;
End;

function RemoveAcento(Str:String): String;
Const
    ComAcento = '����������������������������';
    SemAcento = 'aaeouaoaeiou�uAAEOUAOAEIOUCU';
Var
  x : Integer;
Begin
    For x := 1 to Length(Str) do
      if Pos(Str[x],ComAcento)<>0 Then
    Str[x] := SemAcento[Pos(Str[x],ComAcento)];
    Result := Str;
end;


function FormataCPF(cTexto : String) : String;
begin
     //  999.999.999-99
     result := Copy(cTexto,1,3)+'.'+
               Copy(cTexto,4,3)+'.'+
               Copy(cTexto,7,3)+'-'+
               Copy(cTexto,10,2);
end;

function FormataCep(M_NUNCEP : string) : String;
Begin
     Result := Copy(M_NUNCEP,1,5)+'-'+Copy(M_NUNCEP,6,3);
End;

Function Acrescentar_Dias_Data(M_DATA : TDate) : TDate;
Var
   M_DIA, M_DIA_MES : Integer;
   Ano, Mes, Dia : word;
BEGIN
     DecodeDate (M_Data, Ano, Mes, Dia);
     //
     M_DIA := StrtoInt(Copy(DatetoStr(M_DATA),1,2));
     //
     M_Data := IncDay(M_Data, 10);
     //
     Result := M_Data;
End;

function AnsiToAscii ( str: String ): String;
var
i: Integer;
begin
for i := 1 to Length ( str ) do
case str[i] of
'�': str[i] := 'a';
'�': str[i] := 'e';
'�': str[i] := 'i';
'�': str[i] := 'o';
'�': str[i] := 'u';
'�': str[i] := 'a';
'�': str[i] := 'e';
'�': str[i] := 'i';
'�': str[i] := 'o';
'�': str[i] := 'u';
'�': str[i] := 'a';
'�': str[i] := 'e';
'�': str[i] := 'i';
'�': str[i] := 'o';
'�': str[i] := 'u';
'�': str[i] := 'a';
'�': str[i] := 'e';
'�': str[i] := 'i';
'�': str[i] := 'o';
'�': str[i] := 'u';
'�': str[i] := 'a';
'�': str[i] := 'o';
'�': str[i] := 'n';
'�': str[i] := 'c';
'�': str[i] := 'A';
'�': str[i] := 'E';
'�': str[i] := 'I';
'�': str[i] := 'O';
'�': str[i] := 'U';
'�': str[i] := 'A';
'�': str[i] := 'E';
'�': str[i] := 'I';
'�': str[i] := 'O';
'�': str[i] := 'U';
'�': str[i] := 'A';
'�': str[i] := 'E';
'�': str[i] := 'I';
'�': str[i] := 'O';
'�': str[i] := 'U';
'�': str[i] := 'A';
'�': str[i] := 'E';
'�': str[i] := 'I';
'�': str[i] := 'O';
'�': str[i] := 'U';
'�': str[i] := 'A';
'�': str[i] := 'O';
'�': str[i] := 'N';
'�': str[i] := 'C';
end;
Result := str;
end;

function ValidarEMail(aStr: string): Boolean;
begin 
     aStr := Trim(UpperCase(aStr));
     if Pos('@', aStr) > 1 then
     begin
       Delete(aStr, 1, pos('@', aStr));
       Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
     end
     else
       Result := False; 
end;




end.

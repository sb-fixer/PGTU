{***************************************************
 Modul dla perevoda iz razlichnix sistem schislenia
 pologitelnix celix chisel.
 Diaposon osnovania sistem chislenia: 2..10.
***************************************************}
Unit SysCalc;

Interface

Type
  TNum = array[1..16] of 0..9;(* massiv v kot 16 elemetov,
                                 elementi prinimaut znachenie
                                 ot 0 do 9 - eto cifri chisla *)
  TBase = 2..10;(* tip opredeliat diaposon vosmognix osnovanii ss *)
  TStr = string[16];(* stroka iz 16 ili < simvolov *)

Var
  Num    : TNum;(* massiv, v kot pomechautsa cifri chisla *)
  I,K    : integer;
  Number : longint;(* peremenia dla pomechenia v nee,
                      resultata razlichix operacii *)

Function InDec   (StrNum : TStr; Base : TBase ) : longint;(* u3 N-oi -> 10 *)
Function FromDec (DecNum : longint; Base : TBase) : string;(* u3 10-oi -> N *)
Function Sum     (Num1,Num2 : TStr; Base : TBase) : string;(* syMMa 2-x chisel *)
Function Razn    (Num1,Num2 : TStr; Base : TBase) : string;(* pa3HocT 2-x chisel *)
Function Proiz   (Num1,Num2 : TStr; Base : TBase) : string;(* proizvedenie 2-x chisel *)
Function Chast   (Num1,Num2 : TStr; Base : TBase) : string;(* chsatnoe 2-x chisel *)

Implementation

Function InDec(StrNum : TStr; Base : TBase) : longint;(* N -> 10 *)
Var
  KolCifr,Code : integer;
  DecNum       : longint;(* desiatichnoe chislo *)
Begin
  If (Base < 2) or (Base > 10) then RunError(135);(* proverka korrektnosti vvoda osnovania ss*)
  KolCifr := Length(StrNum);(* opredeliam dliny stroki *)
  DecNum := 0;(* desiatichnoe chislo opredeliam = 0 *)
  For I := 1 to KolCifr do(* cikl perevoda iz N v 10 *)
    begin
      Val(Copy(StrNum,i,1),Num[i],Code);(* berem otdelno kagdii simvol,
                                           perevodim ego iz strokovogo tipa
                                           v chislovoi,
                                           pomechaem v massiv Num *)
      If (Num[I] < 0) or (Num[I] > (Base-1)) then RunError(135);
      (* proverka vvodimich cifr chisla,
         tak chtobi ydovletvoriala osnovaniy ss *)
      If KolCifr = I
        then DecNum := DecNum + Num[i](* v tom slychai esli stepen = 0 *)
        else DecNum := Num[i] * Trunc(Exp((KolCifr-i) * Ln(Base))) + DecNum;
        (* chislo umnogaem na osnovanie v stepeni ("kol. cifr" - "I"),
           pribavlenie posleduchego snachenia desiatichogo chisla *)
    end;
  InDec := DecNum;(* funkcia prinimaet znachenie chisla v 10-oi ss *)
end;

Function FromDec(DecNum : longint; Base : TBase) : string;(* 10-oi -> N *)
Var
  DecNumT : longint;(* desatichnoe chislo *)
  StrNum,St : string;(* StrNum - dla nakoplenia chisla v N-oi ss,
                        St - promegutochnia peremenia *)
Begin
  If (Base < 2) or (Base > 10) then RunError(135);(* proverka korrektnosti vvoda osnovania ss*)
  DecNumT := DecNum;(* dla raboti s chislom,
                       peredaem v druguu peremenuu *)
  while DecNumT <> 0 do
    Begin
      K := DecNumT mod 10;
      DecNumT := DecNumT div 10;
    end;
  DecNumT := DecNum;
  StrNum := '';(* sosdaem pustuu stroku *)
  K := 0;
  while DecNumT <> 0 do(* cikl perevoda iz 10-ogo -> v N *)
    Begin
      K := K + 1;(* schetchik kolichestva iteracii cikla *)
      Num[K] := Round(DecNumT mod Base);(* delim chislo na osnovanie ss,
                                           ostatok pomechaem v massiv Num *)
      DecNumT := DecNumT div Base;(* umenchaem razriad chisla *)
    end;
  For I := K downto 1 do
    Begin
      Str(Num[I],St);(* perevodim chislo v strokovuu peremenuu,
                        pomechia v peremenuu St*)
      StrNum := StrNum + St;(* poluchaem chislo v N-oi ss *)
    end;
  FromDec := StrNum;(* funkcia prinimaet znachenie chisla v N-oi ss*)
end;

Function Sum(Num1,Num2 : TStr; Base : TBase) : string;(* summa 2-x chisel v N-oi ss *)
Begin
  Number := InDec(Num1,Base) + InDec(Num2,Base);(* perevod v 10 ss i slogenie 2-x chisel *)
  Sum := FromDec(Number,Base);(* perevod summi iz 10-oi v N ss *)
end;

Function Razn(Num1,Num2 : TStr; Base : TBase) : string;(* raznost 2-x chisel v N-oi ss *)
Begin
  Number := InDec(Num1,Base) - InDec(Num2,Base);(* perevod v 10 ss i raznost 2-x chisel *)
  Razn := FromDec(Number,Base);(* perevod raznosti iz 10-oi v N ss *)
end;

Function Proiz(Num1,Num2 : TStr; Base : TBase) : string;(* proizvedenie 2-x chisel v N-oi ss *)
Begin
  Number := InDec(Num1,Base) * InDec(Num2,Base);(* perevod v 10 ss i proizvedenie 2-x chisel *)
  Proiz := FromDec(Number,Base);(* perevod proizvedenia iz 10-oi v N ss *)
end;

Function Chast(Num1,Num2 : TStr; Base : TBase) : string;
Begin
  Number := Round(InDec(Num1,Base) / InDec(Num2,Base));(* perevod v 10 ss,
                                                          i okruglenoe chastnoe 2-x chisel *)
  Chast := FromDec(Number,Base);(* perevod chastnogo iz 10-oi v N ss *)
end;

Begin
end.


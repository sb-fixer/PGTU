program SysCalc_Ex1;
uses Crt,SysCalc;
Label M;
const
  Line = '*******************************************';
type
  Mas = array[1..100] of string;
var
  A        : Mas;
  Base,i,n : integer;
  P,S,st   : string;
  ch       : char;
begin
  repeat
    M:
    clrscr;
    TextColor(7);
    GotoXY(1,5);
    Writeln(' Copyright Sergey Belyov 2006');
    TextColor(14);
    Writeln(Line);
    TextColor(2);
    Writeln(' V kakoi sisteme schislenia,');
    Write(' xotite sozdat massiv ( 2<=Base<=10 ): ');
    Readln(Base);
    if (Base < 2) or (Base > 10) then
      begin
        TextColor(4);
        Writeln(' Error! Ne dopustimoe chislo. Povtorite vvod.');
        Readln;
        Goto M;
      end;
    TextColor(3);
    Writeln(' Iz skolki elementov,');
    Write(' xotite sosdat massiv (n<=100): ');
    Readln(n);
    if (n < 1) or (n > 100) then
      begin
        TextColor(4);
        Writeln('Error! Ne dopustimoe chislo. Povtorite vvod.');
        Readln;
        Goto M;
      end;
    TextColor(14);
    Writeln(Line);
    TextColor(13);
    Writeln(' Vvedite elementi massiva v ',base,'-oi sisteme:');
    TextColor(7);
    for i := 1 to n do
      begin
        Write(' Element N-',i,' v ',base,'-oi = ');
        Readln(A[i]);
        Writeln(' Element N-',i,' v 10-oi = ',InDec(A[i],Base));
        Writeln('---------------------------------------');
      end;
    S := '0';
    P := '1';
    for i := 1 to n do
      begin
        S := Sum(S,A[i],Base);
        P := Proiz(P,A[i],Base);
      end;
    TextColor(14);
    Writeln(Line);
    TextColor(4);
    Writeln(' Summa elementov massiva:');
    TextColor(11);
    Writeln(' v ',Base,'-oi sisteme schislenia  = ',S);
    Writeln(' v 10-oi sisteme schislenia = ',InDec(S,Base));
    TextColor(14);
    Writeln(Line);
    TextColor(4);
    Writeln(' Proizvedenie elementov massiva:');
    TextColor(11);
    Writeln(' v ',Base,'-oi sisteme schislenia  = ',P);
    Writeln(' v 10-oi sisteme schislenia = ',InDec(P,Base));
    TextColor(14);
    Writeln(Line);
    TextColor(7);
    Write(' Povtor (Y/N): ');
    Readln(ch);
  until UpCase(ch) <> 'Y';
end.




Program SysCalc_DEMO;
Uses SysCalc,Crt;
Label M;
Var
  DecNum : longint;
  StrNum,StrNum2 : string;
  I,Base : integer;
Begin
  M:
  clrscr;
  Writeln('1. InDec');
  Writeln('2. FromDec');
  Writeln('3. Summa');
  Writeln('4. Raznost');
  Writeln('5. Proizvedenie');
  Writeln('6. Delenie');
  Writeln('7. Exit');
  Write('Viberi N-punkta: ');
  Readln(I);
  case I of
    1 :
    begin
      Write('Vedi osnovanie sistemi schislenia: ');
      Readln(Base);
      Write('Vedi chislo v etoi sisteme schilsenia: ');
      Readln(StrNum);
      Writeln('Chislo ',StrNum,' v 10-oi ss = ',Indec(StrNum,Base));
      Readln;
      Goto M;
    end;
    2 :
    begin
      Write('Vedi chislo v 10-oi sisteme schilsenia: ');
      Readln(DecNum);
      Write('Vedi osnovanie sistemi schislenia, v kot nado perevesti: ');
      Readln(Base);
      Writeln('Chislo ',DecNum,' v ',Base,'-oi ss = ',FromDec(DecNum,Base));
      Readln;
      Goto M;
    end;
    3 :
    begin
      Write('Vedi ss, v kotoroi budech skladivat: ');Readln(Base);
      Write('Vedi chislo 1: ');Readln(StrNum);
      Write('Vedi chislo 2: ');Readln(StrNum2);
      Writeln('Ich summa v 10-oi = ',InDec(StrNum,Base),' + ',
                                     InDec(StrNum2,Base),' = ',
                                     InDec(StrNum,Base) + InDec(StrNum2,Base));
      Writeln('Ich summa v ',Base,'-oi = ',Sum(StrNum,StrNum2,Base));
      Readln;
      Goto M;
    end;
    4 :
    begin
      Write('Vedi ss, v kotoroi budech vichetat: ');Readln(Base);
      Write('Vedi chislo 1: ');Readln(StrNum);
      Write('Vedi chislo 2: ');Readln(StrNum2);
      Writeln('Ich raznost v 10-oi = ',InDec(StrNum,Base),' - ',
                                       InDec(StrNum2,Base),' = ',
                                       InDec(StrNum,Base) - InDec(StrNum2,Base));
      Writeln('Ich raznost v',Base,'-oi  = ',Razn(StrNum,StrNum2,Base));
      Readln;
      Goto M;
    end;
    5 :
    begin
      Write('Vedi ss, v kotoroi budech ymnogat: ');Readln(Base);
      Write('Vedi chislo 1: ');Readln(StrNum);
      Write('Vedi chislo 2: ');Readln(StrNum2);
      Writeln('Ich proiz. v 10-oi = ',InDec(StrNum,Base),' * ',
                                      InDec(StrNum2,Base),' = ',
                                      InDec(StrNum,Base) * InDec(StrNum2,Base));
      Writeln('Ich proizvedenie v',Base,'-oi = ',Proiz(StrNum,StrNum2,Base));
      Readln;
      Goto M;
    end;
    6 :
    begin
      Write('Vedi ss, v kotoroi budech delit: ');Readln(Base);
      Write('Vedi chislo 1: ');Readln(StrNum);
      Write('Vedi chislo 2: ');Readln(StrNum2);
      Writeln('Ich chastnoe v 10-oi = ',InDec(StrNum,Base),' / ',
                                        InDec(StrNum2,Base),' = ',
                                        Round(InDec(StrNum,Base) / InDec(StrNum2,Base)));
      Writeln('Ich okruglenoe chastnoe v',Base,'-oi  = ',Chast(StrNum,StrNum2,Base));
      Readln;
      Goto M;
    end;
    7 : Exit;
  else begin Writeln('Takogo puncta net!');Readln;Goto M;end;
  end;
end.



{������� ᯨ᮪ ᪫��� � ᯨ᮪ ���
�㦭� ������ �� � �������
�뢥��
� �������� �᫮ ⮢�� �� ᪫��� � � ���� ��᫥ �த���}

program bilet06;
uses crt;

type
    a = ^dan;
    dan = record
        tovar: string[10];
        num: integer;
        sled: a;
    end;

{headSK - ������ �� ᯨ᮪ ᪫���, headZA -  ������ �� ᯨ᮪ ���}
procedure form(var headSK,headZA: a);
var
ukzv: a;
f: text;
begin
assign(f,'sklad.inp');
reset(f);
new(ukzv);                     {����� �⠥� ᪫�� 1� � ���. �����}
headSK:=ukzv;
while not eof(f) do begin
new(ukzv^.sled);
ukzv:=ukzv^.sled;
read(f,ukzv^.tovar);
readln(f,ukzv^.num);
end;
new(ukzv^.sled);
ukzv^.sled^.sled:=nil;
close(f);
assign(f,'zayava.inp');
reset(f);
new(ukzv);                     {�������筮 ��� ���}
headZA:=ukzv;
while not eof(f) do begin
new(ukzv^.sled);
ukzv:=ukzv^.sled;
read(f,ukzv^.tovar);
readln(f,ukzv^.num);
end;
new(ukzv^.sled);
ukzv^.sled^.sled:=nil;
close(f);
end;

procedure vivod(head1,head2: a);    {��楤�� ���� �뢮��}
var
f: text;
ukzv: a;
begin
assign(f,'rez.out');
append(f);
writeln(f,'  �� ᪫���:');
ukzv:=head1^.sled;                     {�뢮��� ᪫��}
while ukzv^.sled<>nil do begin
writeln(f,ukzv^.tovar,' ',ukzv^.num);
ukzv:=ukzv^.sled;
end;
writeln(f,'  ���᮪ ���:');
ukzv:=head2^.sled;                     {�뢮��� ���}
while ukzv^.sled<>nil do begin
writeln(f,ukzv^.tovar,' ',ukzv^.num);
ukzv:=ukzv^.sled;
end;
close(f);
end;

{����� ����᭮� - ������ ⮢�஢ ��᫥ ��ࠡ�⪨ ���
head1,head2 -  ������ �� ᯨ᪨ ᪫��� � ��� ᮮ⢥��⢥���}
procedure making(var head1,head2: a);
var
uksp,ukzv: a;
begin
ukzv:=head1^.sled;
uksp:=head2^.sled;
while uksp^.sled<>nil do begin   {���� � ���� �� ������� �㭪��}
while ukzv^.sled<> nil do begin  {�㤥� ��� ������ ��� �᪠�� �� ᪫���}
if ukzv^.tovar = uksp^.tovar then begin  {�᫨ ��諨, � �஢�ਬ �᫮}
   if ukzv^.num>uksp^.num then begin  {�᫨ �� ᪫��� �����, � �� �⪮}
      ukzv^.num:=ukzv^.num-uksp^.num;
      uksp^.num:=0;
   end;
   if ukzv^.num<=uksp^.num then begin  {�᫨ �� ᪫��� �����, 祬 � ���}
      uksp^.num:=uksp^.num-ukzv^.num;  {�� �� ᪫��� ����, � � ��� ���⥬}
      ukzv^.num:=0;
   end;
break;
end;
ukzv:=ukzv^.sled;
end;
uksp:=uksp^.sled;     {���室 �� ᫥�. �㭪� � ����}
ukzv:=head1^.sled;    {� ᭮�� � ��砫� ᪫���}
end;

uksp:=head2;                     {�������� 㤮���⢮७��� ���}
while uksp^.sled<>nil do begin
if uksp^.sled^.num = 0 then begin {�᫨ ��� 㤮���⢮७�, �}
ukzv:=uksp^.sled;                 {��४���� 㪠��⥫� �� ᫥�. �㭪�}
uksp^.sled:=ukzv^.sled;
dispose(ukzv);                    {� ���⨬}
end
else uksp:=uksp^.sled;            {���� ���� �����}
end;
write('Done');
end;

var
ukstrS,ukstrZ: a;
f1: text;

begin                   {���� ��ଫ����}
clrscr;
assign(f1,'rez.out');
rewrite(f1);
writeln(f1,'�뫮:');
close(f1);
form(ukstrS,ukstrZ);
vivod(ukstrS,ukstrZ);
write('Done');
making(ukstrS,ukstrZ);
assign(f1,'rez.out');
append(f1);
writeln(f1,' ');
writeln(f1,'�⠫�:');
close(f1);
vivod(ukstrS,ukstrZ);
readkey;
end.
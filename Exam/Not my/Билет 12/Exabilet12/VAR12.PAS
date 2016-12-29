{Есть данные о книгах, нужно создать простой двунаправленный список
простой вывод в две стороны
Сортировка по фамилиям авторов ВСТАВКАМИ информацией}

program bilet12;
uses crt;

type
    a = ^dan;
    dan = record
        num: integer;
        other: string;
        sled,pred:a;
    end;

procedure making(var head,ass: a);
var
uksp,before: a;
str: string;
i,j: integer;
f: text;
begin
assign(f,'vhod.inp');
reset(f);
new(uksp);
uksp^.pred:=nil;                  {Первый пустой}
before:=uksp;
head:=uksp;
while not eof(f) do begin       {Обычное создание пока не конец файла}
new(uksp^.sled);
uksp:=uksp^.sled;
uksp^.pred:=before;
read(f,uksp^.num);
readln(f,uksp^.other);
before:=uksp;
end;
new(uksp^.sled);
uksp:=uksp^.sled;               {Последний пустой - конец списка}
uksp^.pred:=before;
uksp^.sled:=nil;
ass:=uksp;
close(f);
end;

procedure vivod(var head,ass: a; co: string);
var
uksp: a;
f: text;
begin
assign(f,'rez.out');
append(f);
if co='true' then begin           {Вывод по значению из диалогового окна}
uksp:=head^.sled;
while uksp^.sled<>nil do begin
writeln(f,uksp^.num,' ',uksp^.other);   {слева направо}
uksp:=uksp^.sled;
end; end
else begin
uksp:=ass^.pred;
while uksp^.pred<>nil do begin          {справа налево}
writeln(f,uksp^.num,' ',uksp^.other);
uksp:=uksp^.pred;
end;
end;
writeln(f);
close(f);
end;

procedure sort(var head: a);
var
pered,uksp: a;
n: integer;
m: string;
begin
uksp:=head^.sled;                       {Ставим на первый}
while uksp^.sled<>nil do begin
      n:=uksp^.num; m:=uksp^.other;      {Делаем резерв}
      pered:=uksp^.pred;                 {Ставим доп. указ. на перед рассматр}
      while (pered^.pred<>nil) and (pered^.other > m) do begin
            pered^.sled^.num:=pered^.num;     {Бежим пока не начало списка}
            pered^.sled^.other:=pered^.other; {или пока ищем место}
            pered^.num:=n; pered^.other:=m;   {и меняем информацию пошагово}
            pered:=pered^.pred;
      end;
      uksp:=uksp^.sled;   {идем на след. рассматриваемый}
      end;
end;

var
ukstr,last1: a;
c: string;
f1:text;

begin
clrscr;
assign(f1,'rez.out');
rewrite(f1);                        {диалоговые окна и все}
close(f1);
making(ukstr,last1);
write('В какую выводим? Вправо - true: ');
readln(c);
vivod(ukstr,last1,c);
sort(ukstr);
write('В какую выводим? Вправо - true: ');
readln(c);
vivod(ukstr,last1,c);
writeln('Done');
readkey;
end.


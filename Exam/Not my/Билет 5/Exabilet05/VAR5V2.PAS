{Создание обычного двунаправленного списки из записей "Фамилия номер"
Вывод этого списка в заданном направлении
Создание 2ух однонаправленных списков из этого, где первый идет по возрастанию
номеров, а второй по алфавиту. Вывести}

program bilet5;
uses crt;

type
    a = ^dan;
    dan = record
        fam: string;
        num: integer;
        sled,pred:a;
        end;

{Данная процедура меняет вам указатели
        в низу - сортировке.
p - левый
q - правый
pered - перед левым
var ukz - изменяющийся указатель в сортировке}
procedure swap(p,q,pered: a; var ukz: a);
var
posl,pred: a;
begin
ukz:=p;
while ukz^.sled <> q do
ukz:=ukz^.sled;
pred:=ukz;
posl:=q^.sled;
q^.sled:=p;
ukz:=pred;
ukz^.sled:=posl;
ukz:=pered;
ukz^.sled:=q;
end;

{Формируем список из файла}
procedure form(var head,ass: a);
var
ukzv,before: a;
str: string;
i,j: integer;
f: text;
begin
assign(f,'vhod.inp');
reset(f);
new(ukzv);      {Первый пустой}
ukzv^.pred:=nil;
head:=ukzv;
before:=ukzv;
while not eof(f) do begin   {Чтение нового элемента алгоритмом ниже}
new(ukzv^.sled);
ukzv:=ukzv^.sled;
ukzv^.pred:=before; {ПРоставили указатели}
before:=ukzv;
readln(f,str);    {Читаем из файла строку в отдельную переменную}
i:=1;
while str[i] <> ' ' do  {Считаем длину фамилии}
i:=i+1;
ukzv^.fam:=copy(str,1,i-1); {Вставляем фамилию в поле элемента списка}
i:=i+1;
ukzv^.num:=0;
while i<=length(str) do begin          {Считаем значение номера в интежер}
ukzv^.num:=ukzv^.num*10+ord(str[i])-48;
i:=i+1;
end;
end;
new(ukzv^.sled);   {Последний пустой}
ukzv:=ukzv^.sled;
ukzv^.pred:=before;
ass:=ukzv;          {Последний указатель на конец - запомнили его}
ukzv^.sled:=nil;
close(f);
end;

procedure vivod(head,ass: a);
var
ukzv: a;
f: text;
co: char;
begin
assign(f,'out.out');
append(f);
writeln('Куда выводим? 2 - вправо, все остальное - влево');
readln(co);
if co = '2' then begin      {Простой вывод вправо}
ukzv:=head^.sled;
while ukzv^.sled <> nil do begin
writeln(f,ukzv^.num,' ',ukzv^.fam);
ukzv:=ukzv^.sled;
end;
end
else begin       {Простой вывод влево}
ukzv:=ass^.pred;
while ukzv^.pred <> nil do begin
writeln(f,ukzv^.num,' ',ukzv^.fam);
ukzv:=ukzv^.pred;
end;
end;
writeln('Done');
writeln(f);
close(f);
end;

{Формирование 2ух списков из одного}
procedure spis2(head:a);
var
ukzv,beg1,beg2,golova1,golova2: a;  {Нужные указатели для создания}
min,work,temp,pred11: a;    {Нужные для сортировки}
f: text;
begin
assign(f,'out.out');
append(f);
writeln(f);
new(beg1);            {Первые пустые сделаем}
golova1:=beg1;
new(beg2);
golova2:=beg2;
ukzv:=head^.sled;

while ukzv^.sled <> nil do begin     {Перечитываем полностью в них инфу}
new(beg1^.sled); beg1:=beg1^.sled;   {из списка-предка}
new(beg2^.sled); beg2:=beg2^.sled;
beg1^.num:= ukzv^.num; beg1^.fam:=ukzv^.fam;
beg2^.num:= ukzv^.num; beg2^.fam:=ukzv^.fam;
ukzv:=ukzv^.sled;
end;
new(beg1^.sled); beg1:=beg1^.sled;   {Делаем последние пустые}
new(beg2^.sled); beg2:=beg2^.sled;
beg1^.sled:=nil; beg2^.sled:=nil;

{Сортировка 1ого списка по номера указателям+swap выбором}
beg1:=golova1;
while beg1^.sled<> nil do begin
pred11:=beg1;
ukzv:=beg1^.sled;
min:=ukzv;
work:=ukzv;
while ukzv^.sled <> nil do begin
if ukzv^.num < min^.num then     {Ищем минмальный}
min:=ukzv;
ukzv:=ukzv^.sled;
end;
if min <> work then     {Смена мест выбранного и минимального}
swap(work,min,pred11,beg1);
pred11:=pred11^.sled;
beg1:=pred11;
end;

{Аналогично - по фамилиям}
beg2:=golova2;
while beg2^.sled^.sled<> nil do begin
pred11:=beg2;
ukzv:=beg2^.sled;
min:=ukzv;
work:=ukzv;
while ukzv^.sled <> nil do begin
if ukzv^.fam < min^.fam then
min:=ukzv;
ukzv:=ukzv^.sled;
end;
if min <> work then
swap(work,min,pred11,beg2);
pred11:=pred11^.sled;
beg2:=pred11;
end;

{Обычный вывод обоих списков}
beg1:=golova1^.sled;
while beg1^.sled <> nil do begin
writeln(f,beg1^.num,' ',beg1^.fam);
beg1:=beg1^.sled;
end;
writeln(f);
beg2:=golova2^.sled;
while beg2^.sled <> nil do begin
writeln(f,beg2^.fam,' ',beg2^.num);
beg2:=beg2^.sled;
end;
writeln(f);
close(f);
end;

var
ukstr,last,uksp: a;
f1: text;

begin
clrscr;
assign(f1,'out.out');  {Сначала очистим прошлые данные}
rewrite(f1);
close(f1);
form(ukstr,last);
vivod(ukstr,last);
spis2(ukstr);
readkey;
end.
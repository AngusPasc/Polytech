{Имеется список склада и список заявок
Нужно занести их в линейные
Вывести
И пересчитать число товара на складе и в заявках после продажи}

program bilet06;
uses crt;

type
    a = ^dan;
    dan = record
        tovar: string[10];
        num: integer;
        sled: a;
    end;

{headSK - голова на список склада, headZA -  голова на список заявок}
procedure form(var headSK,headZA: a);
var
ukzv: a;
f: text;
begin
assign(f,'sklad.inp');
reset(f);
new(ukzv);                     {ПРосто читаем склад 1ый и посл. пустые}
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
new(ukzv);                     {Аналогично для заявок}
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

procedure vivod(head1,head2: a);    {Процедура просто вывода}
var
f: text;
ukzv: a;
begin
assign(f,'rez.out');
append(f);
writeln(f,'  На складе:');
ukzv:=head1^.sled;                     {Выводим склад}
while ukzv^.sled<>nil do begin
writeln(f,ukzv^.tovar,' ',ukzv^.num);
ukzv:=ukzv^.sled;
end;
writeln(f,'  Список заявок:');
ukzv:=head2^.sled;                     {Выводим заявки}
while ukzv^.sled<>nil do begin
writeln(f,ukzv^.tovar,' ',ukzv^.num);
ukzv:=ukzv^.sled;
end;
close(f);
end;

{Самое интересное - пересчет товаров после обработки заявки
head1,head2 -  головы на списки склада и заявок соответственно}
procedure making(var head1,head2: a);
var
uksp,ukzv: a;
begin
ukzv:=head1^.sled;
uksp:=head2^.sled;
while uksp^.sled<>nil do begin   {Пока в заявках не кончатся пункты}
while ukzv^.sled<> nil do begin  {Будем для каждой заявки искать на складе}
if ukzv^.tovar = uksp^.tovar then begin  {Если нашли, то проверим число}
   if ukzv^.num>uksp^.num then begin  {Если на складе больше, то все четко}
      ukzv^.num:=ukzv^.num-uksp^.num;
      uksp^.num:=0;
   end;
   if ukzv^.num<=uksp^.num then begin  {Если на складе меньше, чем в заявке}
      uksp^.num:=uksp^.num-ukzv^.num;  {То на складе пусто, а в заявке вычтем}
      ukzv^.num:=0;
   end;
break;
end;
ukzv:=ukzv^.sled;
end;
uksp:=uksp^.sled;     {Переход на след. пункт в заявках}
ukzv:=head1^.sled;    {И снова в начало склада}
end;

uksp:=head2;                     {Удаление удовлетворенных заявок}
while uksp^.sled<>nil do begin
if uksp^.sled^.num = 0 then begin {Если заявка удовлетворена, то}
ukzv:=uksp^.sled;                 {Перекинем указатель на след. пункт}
uksp^.sled:=ukzv^.sled;
dispose(ukzv);                    {И очистим}
end
else uksp:=uksp^.sled;            {Иначе идем дальше}
end;
write('Done');
end;

var
ukstrS,ukstrZ: a;
f1: text;

begin                   {Просто оформление}
clrscr;
assign(f1,'rez.out');
rewrite(f1);
writeln(f1,'Было:');
close(f1);
form(ukstrS,ukstrZ);
vivod(ukstrS,ukstrZ);
write('Done');
making(ukstrS,ukstrZ);
assign(f1,'rez.out');
append(f1);
writeln(f1,' ');
writeln(f1,'Стало:');
close(f1);
vivod(ukstrS,ukstrZ);
readkey;
end.
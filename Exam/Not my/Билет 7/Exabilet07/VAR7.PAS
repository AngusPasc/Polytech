{Создание бинарного дерева из несортированное списка с фамилиями и номерами
Вывод списка "левое-корень-правое"
Вывод ТОЛЬКО листьев списка справа налево}

program bilet07;
uses crt;

type
    a= ^dan;
    dan=record
       fam: string[10];
       num: integer;
       left,rt: a;
    end;

procedure putree(var uk1: a;buf: a);  {создание дерева}
var
uksp: a;
begin
if uk1=nil then begin     {Если узла еще нет, то создать его}
   new(uksp);             {и записать туда новую инфу}
   uksp^.fam:=buf^.fam;   {и, конечно, запомнить его}
   uksp^.num:=buf^.num;
   uksp^.left:=nil;
   uksp^.rt:=nil;
   uk1:=uksp;
   end
else begin                      {Если же узел существует, то сравним}
     if buf^.num > uk1^.num then   {Новый элемент больше узлового}
     putree(uk1^.rt,buf)           {вызов правого потомка}
     else                          {новые меньше узлового}
     putree(uk1^.left,buf);        {вызов левого потомка}
end;
end;

procedure gettree(var uk2: a;var f: text);  {Вывод дерева}
begin
if uk2^.left<> nil then          {Просто проверка на наличие и вывод}
gettree(uk2^.left,f);
writeln(f,uk2^.fam,' ',uk2^.num);
if uk2^.rt<> nil then
gettree(uk2^.rt,f);
end;

procedure vivodLIST(var uk3: a;var f: text);  {Вывод лишь листьев}
begin
if uk3^.rt<>nil then              {Справа кто-то есть  -  выводим}
vivodLIST(uk3^.rt,f);
if (uk3^.left=nil) and (uk3^.rt=nil) then  {ЛИСТ НЕ ИМЕЕТ ПОТОМКОВ!!}
writeln(f,uk3^.fam,' ',uk3^.num);
if uk3^.left<>nil then           {Слева есть - выводим его}
vivodLIST(uk3^.left,f);
end;


var
uktree,temp: a;
f1: text;

begin
clrscr;
assign(f1,'vhod.inp');
reset(f1);
uktree:=nil;   {Дерева НЕТ}
new(temp);                     {Читаем во временное хранилище данные}
while not eof(f1) do begin
readln(f1,temp^.fam,temp^.num);
putree(uktree,temp);          {И вызываем с корня}
end;
close(f1);
assign(f1,'rez.out');
rewrite(f1);
gettree(uktree,f1);    {Выводим дерево}
writeln(f1);
writeln(f1,'Листья справа налево:');
writeln('Done');
vivodLIST(uktree,f1);  {Выводим листья}
close(f1);
readkey;
end.
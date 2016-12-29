{Создание стека из алфавитного списка
Вывод этого стека в обратном порядке, т.е. первый записанный выходит первый
Вставка в нужное место стека новых фамилий из второго, несортиров. списка}

program bilet08;
uses crt;

type
    a = ^stack;
    stack = record
      fam: string;
      pred: a;
      check: boolean;
    end;

procedure makestack(var last: a);    {Создаем стек}
var
f: text;
uk: a;
begin
assign(f,'sort.inp');
reset(f);
new(uk);
uk^.pred:=nil;       {Сделали первый элемент и его указат. nil}
readln(f,uk^.fam);
last:=uk;
uk^.check:=true;   {Пометили его как нижний элемент стека для вывода}
while not eof(f) do begin
new(uk);
uk^.pred:=last;    {Делаем связь нового элемента на нижний}
readln(f,uk^.fam);
last:=uk;          {Запоминаем новую голову в верхний элемент}
end;
close(f);
end;

procedure vivod(var head1: a;var f: text);
label 1;
var
uk: a;
begin
uk:=head1;                  {Поставили указ на голову}
1: while uk^.pred^.check<> true do     {Пробегаем циклом до отмеченного на}
uk:=uk^.pred;                                                 {вывод}
if uk<>head1 then begin        {Если не остались в голове, то}
   writeln(f,uk^.pred^.fam);   {выводим нижний от того, на котором стоим}
   uk^.check:=true;            {помечаем настоящий элемент для вывода}
   uk:=head1;                  {Идем обратно в голову и повторяем цикл}
goto 1;
end
else begin                   {Если остались указателем в голове}
   writeln(f,uk^.pred^.fam);  {Выводим нижний к голове}
   uk^.check:=true;           {Чекаем голову как выведенную}
   writeln(f,uk^.fam);        {Выводим голову}
end;
uk:=head1;                    {Для повторного вывода можно очистить}
while uk^.pred<>nil do begin  {чеки в элементах, кроме самого нижнего}
uk^.check:=false;
uk:=uk^.pred; end;
end;

procedure adding(var last: a);
var
f: text;                 {temp - читает из файла, uk - бегущий,obmen - }
uk,obmen,temp: a;
begin
assign(f,'other.inp');
reset(f);
new(obmen);
while not eof(f) do begin
new(temp);                   {Выделяем место для нового элемента и читаем}
readln(f,temp^.fam);
uk:=last;                    {указатель пихаем на голову}
if uk^.fam < temp^.fam then begin   {Если новый элемент больше}
   obmen^.fam:=temp^.fam;
   temp^.fam:=uk^.fam;        {Меняем в голове и новом инфу местами}
   uk^.fam:=obmen^.fam;
   temp^.pred:=uk^.pred;      {И просто вносим новый после головы}
   uk^.pred:=temp^.pred;
end;
if uk^.fam >= temp^.fam then begin       {Если новый меньше}
   while (uk^.pred^.fam > temp^.fam) do begin  {Ищем место}
   if uk^.pred=nil then break;
   uk:=uk^.pred; end;
   if uk^.pred=nil then begin    {Если новый должен стать самым нижним}
   new(uk^.pred);
   uk^.check:=false;             {То создаем новую ячейку в памяти}
   uk:=uk^.pred;
   uk^.fam:=temp^.fam;           {И вписываем в нее данные нового элемента}
   uk^.check:=true;
   dispose(temp); {Удаляем лишний временный элемент}
   end else begin         {Если новый будет в середине}
   temp^.pred:=uk^.pred;  {просто перекидываем указатели}
   uk^.pred:=temp;
   {temp^.check:=false;} {Необязательно}
   end;
end;
end;
close(f);
end;

var
head: a;
f1: text;

begin
clrscr;
makestack(head);
assign(f1,'rez.out');
rewrite(f1);
writeln(f1,'  До вставок:');
vivod(head,f1);
adding(head);
writeln(f1,'  После вставок:');
vivod(head,f1);
writeln('Done');
close(f1);
readkey;
end.
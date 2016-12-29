type
List = ^TList;
	TList = record
		num:integer;
		fam:string[10];
		left, right:List;
	end;

{Рекурсивное добавление}
procedure P1(var Tree:List;num:integer; fam:string); {Входные параметры - адрес корня дерева и добавл элемент }
begin
 if not Assigned(tree) then  {Если дерево пустое то создаём его корень}
   begin
     New(tree);   {Выделяем память }
     Tree^.num:=num;     {Добавляем данные }
     Tree^.fam:=fam;    {Добавляем данные }
     Tree^.left:=nil;     {Зануляем указатели на левого }
     Tree^.right:=nil;  {и правого сыновей }
      exit;
   end;
 if num < Tree^.num then   {Доб к левому или правому поддереву это завсит от вводимого элемента}
     P1(Tree^.left,num,fam)  {если меньше корня то в левое поддерево }
  else
    P1(Tree^.right,num,fam);  {если больше то в правое}
end;	

{Итеративное добавление (не доделано для этой программы, доделать самим по аналогии, если нужно)}
{procedure P1(first: list; strok:string);
var	tree:list; i:byte;
	str: char;
begin
i:=1;
	while i<length(strok) do
	begin
		tree:= first;
		inc(i);
		str:=strok[i];
		while true do
		begin
			if ord(str) >= ord(tree^.data) then
			begin 
				if tree^.right <> nil then tree:=tree^.right
				else
				begin
					new(tree^.right);
					tree^.right^.data:=str;
					tree^.right^.left:=nil;
					tree^.right^.right:=nil;
					break;
				end;
			end
			else
			begin
				if tree^.left <> nil then tree:=tree^.left
				else
				begin
					new(tree^.left);
					tree^.left^.data:=str;
					tree^.left^.left:=nil;
					tree^.left^.right:=nil;
					break;
				end;
			end;
		end;
	end;
end;}

procedure P2(const name:string; tree: list);
var output:text;
begin
if tree=nil then
	begin
	Writeln(output,'Дерево не существует.');
	exit;  
end;
Assign(output, name);
Append(output); {Дополнить файл, а не перезаписать}
Writeln(output, tree^.num,' ',tree^.fam);
close(output);
	if tree^.left <> nil then P2(name, tree^.left);
	if tree^.right <> nil then P2(name, tree^.right);
end;

{procedure P3(const name:string; tree: list);
var output:text;
begin
if tree=nil then
	begin
	Writeln(output,'Дерево не существует.');
	exit;  
end;
Assign(output, name);
Append(output);
if (tree^.left = nil) and (tree^.right = nil) then Writeln(output, tree^.num,' ',tree^.fam);
close(output);
	if tree^.left <> nil then P3(name, tree^.left);
	if tree^.right <> nil then P3(name, tree^.right);
end;}

procedure P3(const name:string; tree: list);  {Вывод лишь листьев}
begin
if tree^.right<>nil then              {Справа кто-то есть  -  выводим}
P3(name,tree^.right);
if (tree^.left=nil) and (tree^.right=nil) then  {ЛИСТ НЕ ИМЕЕТ ПОТОМКОВ!!}
begin
	Assign(output, name);
	Append(output); {Дополнить файл, а не перезаписать}
	writeln(output, tree^.num,' ',tree^.fam);
	close(output);
end;
if tree^.left<>nil then           {Слева есть - выводим его}
P3(name,tree^.left);
end;

var nach:List; data:TList; input:text;
	name:string;
	i,D:longint;
begin
Assign(input,'B7_F1.IN');
Reset(input);
Writeln('Сколько строк файла прочитать?'); Readln(D);
for i:=1 to D do
begin
if not EoF(input) then 
with data do Readln(input, num, fam) else begin
 Writeln('Невозможно прочитать ',D,'-ую строчку файла.');
 Writeln;
 Writeln('Файл закончился. Последней прочитанной строкой была ',(i-1),'-ая.');
 Writeln;
 Writeln('Нажмите Enter, чтобы продолжить...'); Readln;
 break;
end;
with data do
 P1(nach, num, fam);
end;
close(input);
Write('Введите название выходного файла для процедур P2 и P3: '); Readln(name);
Assign(output,name);
Rewrite(output);
Writeln(output,'Начало P2');
close(output);
P2(name,nach);
Assign(output,name);
Append(output);
Writeln(output);
Writeln(output,'Начало P3');
close(output);
P3(name,nach);
end.
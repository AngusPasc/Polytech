type
  List=^TList;  
  TList=record
    Num:Integer;
	Name:string[10];
    next, 
    prev:List;
  end;

procedure P1(var nach,ends:List; num:integer; const name:string); {const - только для чтения}
var tmp,rab:list; tmpNum:integer; tmpAuthor,tmpName:string[10];
begin
  if not Assigned(nach) then {не пуст ли список, если пуст, то}
  begin
    Getmem(nach,SizeOf(TList)); 
    nach^.next:=nil; {никогда не забываем "занулять" указатели}
    nach^.prev:=nil; {аналогично}
    ends:=nach; {изменяем указатель конца списка}
  end
  else {если список не пуст}
  begin
    GetMem(ends^.next,SizeOf(Tlist)); {создаём новый элемент}
    ends^.next^.prev:=ends; {связь нового элемента с последним элементом списка}
    ends:=ends^.next;{конец списка изменился и мы указатель "переставляем"}
    ends^.next:=nil; {не забываем "занулять" указатели}
  end;
  ends^.num:= num; ends^.name:= name;
end;

procedure P2(FileName:string; nach,ends:List);
var output:text; i:shortint; b:boolean;
begin
Assign(output, FileName);
Rewrite(output);
b:=false;
repeat
Writeln('В какую сторону выводить?');
Writeln('0 - вперёд. 1 - назад.');
Readln(i);
if (i=0) or (i=1) then b:=true else
begin
Writeln('Неверная команда, введите ещё раз.');
Writeln;
Writeln('Нажмите Enter, чтобы продолжить...'); Readln; end;
until b;
case i of
 0 : begin
		while Assigned(nach) do
		begin
		 Writeln(output, nach^.num,' ', nach^.name);
		 nach:=nach^.next;
		end;
	 end;
 1 : begin
 		while Assigned(ends) do
		begin
		 Writeln(output, ends^.num,' ', ends^.name);
		 ends:=ends^.prev;
		end;
	 end;
else Writeln('Неверная комманда.');
end;
close(output);

end;

procedure AddToSortListByInt(var nach:List; num:integer; const name:string); {const - только для чтения}
var p,q:list;
begin
 New(p); { Создаем динамическую переменную-запись }
 { Размещаем данные в полях записи }
 p^.num:= num; p^.name:= name;
 p^.next:=nil;
 { Если список пуст... }
 if not Assigned(nach)
	then nach:=p { если список пуст, голова указывает на новую запись }
	else begin { если список не пуст: }
		q:= nach; { Поиск места вставки начинаем с головы }
		{ Двигаемся по списку, пока следующий элемент существует
		 и его номер меньше вставляемого }
		while Assigned(q^.next) and (q^.next^.num < num)
		do q:=q^.next;
		if q^.num > num then begin
		{ вставка на первое место }
	 	 p^.next:=nach; { первый становится вторым }
		 nach:=p; { а текущий - первым }
		end else begin
		{ вставка в середине или в конце списка }
		 p^.next:=q^.next; { связываем текущий со следующим }
		 q^.next:=p; { связываем предыдущий с текущим }
		end
	end
end;

procedure AddToSortListByString(var nach:List; num:integer; const name:string);
var p,q:list;
begin
 New(p);
 p^.num:= num; p^.name:= name;
 p^.next:=nil;
 if not Assigned(nach)
	then nach:=p
	else begin
		q:= nach;
		while Assigned(q^.next) and (q^.next^.name[2] < name[2])
		{по второй NAME[2], потому что первый символ - пробел}
		do q:=q^.next;
		if q^.name[2] > name[2] then begin {по второй NAME[2], потому что первый символ - пробел}
	 	 p^.next:=nach;
		 nach:=p;
		end else begin
		 p^.next:=q^.next;
		 q^.next:=p;
		end
	end
end;

procedure P3(nach,ends:List; var lOut1,lOut2:list);
begin
lOut1:=nil; lOut2:=nil;
while Assigned(nach) do
begin
 AddToSortListByInt(lOut1,nach^.num,nach^.name);
 nach:=nach^.next
end;
while Assigned(ends) do
begin
 AddToSortListByString(lOut2,ends^.num,ends^.name);
 ends:=ends^.prev
end;
end;

procedure WriteToFile(R,S1,S2:list);
var output:text;
begin
Assign(output, 'B5_F2.OUT');
Rewrite(output);
Writeln(output, 'Первый список (R):');
While Assigned(R) do
begin
 Writeln(output, R^.num,' ',R^.name);
 R:=R^.next;
end;
Writeln(output);
Writeln(output, 'Второй список (S1):');
While Assigned(S1) do
begin
 Writeln(output, S1^.num,' ',S1^.name);
 S1:=S1^.next;
end;
Writeln(output);
Writeln(output, 'Третий список (S2):');
While Assigned(S2) do
begin
 Writeln(output, S2^.num,' ',S2^.name);
 S2:=S2^.next;
end;
close(output);
end;

var R,Rend,S1,S2:List; Rec:Tlist;
	input:text;
begin
Assign(input, 'B5_F1.IN');
Reset(input);
while not Eof(input) do
with Rec do
begin
 Readln(input, num, name);
 P1(R,Rend,num,name);
end;
close(input);
Writeln('Введте название файла для выполнения процедуры P2:'); Readln(Rec.name);
P2(Rec.name,R,Rend);
P3(R,Rend,S1,S2);
WriteToFile(R,S1,S2);
end.
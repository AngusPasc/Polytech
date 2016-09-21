Program program1;
    var i1, i2, i: integer;
	var mas1: string;
	type mastype = array [1..11] of string;
	var mas: mastype;
	var t:boolean;
	
	procedure ComparingNames(i1: integer; mas: mastype; i2: integer; var t: boolean);
	begin
	for i2:=i2 to 33 do  
		{Этот for сравнивает фамилии или даты
		Если фамилия на i1-позиции выше по алфафиту,
		чем фамилия на i1+1 позиции, то возращает true, иначе false}
		begin
			if (mas[i1, i2] = mas [i1+1, i2]) then
			begin
				continue;
			end
			else if (mas[i1, i2] > mas [i1+1, i2]) then
			begin
				t:= true;
				break;
			end
			else
			begin
				t:=false;
				break;
			end;
		end;
	end;
	
begin
	assign(input, 'Входной файл');
	reset(input);
	for i1:=1 to 10 do
	begin
		readln(mas[i1]);
	end;
	assign(output, 'Выходной файл');
	rewrite(output);
	for i1:=1 to 10 do {В этом for'e выводим данные в файла}
	begin
		writeln(mas[i1]);
	end;
	writeln('');  {Пустая строка для читаемости}
	for i:=9 downto 1 do {сортировка пузырьком по алфавиту}
	begin
		for i1:=1 to i do
		begin
			ComparingNames(i1, mas, 1, t);
			if t = true then
			begin
				mas1:=mas[i1];
				mas[i1]:=mas[i1+1];
				mas[i1+1]:=mas1;
			end;
		end;
	end;
	writeln('First in alphabet: ', mas[1]);
	for i:=9 downto 1 do {сортировка пузырьком по дате}
	begin
		for i1:=1 to i do
		begin
			ComparingNames(i1, mas, 29, t); {29, так как там ничаниаются даты}
			if t = true then
			begin
				mas1:=mas[i1];
				mas[i1]:=mas[i1+1];
				mas[i1+1]:=mas1;
			end;
		end;
	end;
	writeln('The most young: ', mas[1]);
end.

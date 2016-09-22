Program program1;
    var i1, i2, i, k: integer;
	var c: char;
	type typemas = array [1..36] of char;
	var mas: array [1..11] of typemas;
	var b: typemas;
	var t:boolean;
	
begin
	assign(input, 'C:\Users\nikic\Desktop\in.txt');
	reset(input);
	for i1:=1 to 10 do
	begin
		for i2:=1 to 34 do
		begin
			read(mas[i1, i2]);
		end;
	end;
	assign(output, 'C:\Users\nikic\Desktop\out.txt');
	rewrite(output);
	for i1:=1 to 10 do
	begin
		for i2:=1 to 33 do
		begin
			write(mas[i1, i2]);
		end;
	end;
	writeln('');  {Пустая строка для читаемости}
	for i:=9 downto 1 do {сортировка пузырьком по алфавиту}
	begin
		for i1:=1 to i do
		begin
			for i2:=1 to 33 do  
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
			begin	
				b:=mas[i1];
				mas[i1]:=mas[i1+1];
				mas[i1+1]:=b;
			end;
		end;
	end;
	writeln('First in alphabet: ');
	for i1:=1 to 33 do
	begin
		write(mas[1, i1]);
	end;
	writeln('');
	for i:=9 downto 1 do {сортировка пузырьком по дате}
	begin
		for i1:=1 to i do
		begin
			for i2:=29 to 33 do  
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
			if t = true then
			begin	
				b:=mas[i1];
				mas[i1]:=mas[i1+1];
				mas[i1+1]:=b;
			end;
		end;
	end;
	writeln('The most young: ');
	for i1:=1 to 33 do
	begin
		write(mas[1, i1]);
	end;
end.

Program program1;
	var i1, i2, i: integer;
	type mastype = array [1..11] of string;
	var mas: mastype;
	var t:boolean;
	
	procedure BubbleSort(i2: integer; var mas: mastype); 
	{Сортировка строк. Для сравнения используются символы с i2}
	var mas1: string;
	begin
		for i:=9 downto 1 do 
		begin
			for i1:=1 to i do
			begin
				if Copy(mas[i1], i2, Length(mas[i1])-i2+1) > Copy(mas[i1+1], i2, Length(mas[i1])-i2+1) then
				begin
					mas1:=mas[i1];
					mas[i1]:=mas[i1+1];
					mas[i1+1]:=mas1;
				end;
			end;
		end;
	end;
	
begin
	assign(input, 'C:\Users\nikic\Desktop\in.txt');
	assign(output, 'C:\Users\nikic\Desktop\out.txt');
	reset(input);
	rewrite(output);
	for i1:=1 to 10 do
	begin
		readln(mas[i1]);
		writeln(mas[i1]);
	end;
	writeln('');  {Пустая строка для читаемости}
	BubbleSort (1, mas);
	writeln('First in alphabet: ', mas[1]);
	BubbleSort (29, mas);
	writeln('The most young: ', mas[1]);
end.

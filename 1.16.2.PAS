Program program1;
    var i1, i2, p1, n: integer;
	type String41 = string[41];
	var name1, name2: String41;
	type masString = array [0..11] of string[41];
	var mas: masString;
	procedure FileWrite(n: integer; mas : masString);
	begin
		for i1:=1 to n do
		begin
			writeln(mas[i1]);
		end;
	end;
	
	Function ExtractWord(mas: masString; i1: integer) : String41;
	var i:integer;
		name : String41;
	begin
		i:=0;
		while (mas[i1][i]<>' ') do
		begin
			i:=i+1;
		end;
		i:=i+1;
		name:='';
		while (mas[i1][i]<>' ') do
		begin
			name:=name+mas[i1][i];
			i:=i+1;
		end;
		ExtractWord := name;
	end;
begin
	n:=10;
	assign(input, 'C:\Users\nikic\Desktop\in.txt');
	reset(input);
	for i1:=1 to n do
	begin
		readln(mas[i1]);
	end;
	assign(output, 'C:\Users\nikic\Desktop\out.txt');
	rewrite(output);
	FileWrite(n, mas);
	writeln('');
	writeln('');
	
	for i1:=1 to n-1 do
	begin
		for i2:=i1+1 to n do
		begin
			name1 := ExtractWord(mas, i1);
			name2 := ExtractWord(mas, i2);
			if (name1 = name2) then
			begin
				for p1:=i2 to 9 do
				begin
					mas[p1]:=mas[p1+1];
				end;
				n:=n-1;
				break;
			end;
		end;
	end;
	FileWrite(n, mas);
end.

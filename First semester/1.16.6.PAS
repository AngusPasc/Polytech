Program program1;
	uses MyLib1, MyLib2;
	var fio: fiotype2;
	var i, n: integer;
	var c: char;
	
begin
	n:=10;
	assign(input, 'C:\Users\nikic\Desktop\IN.TXT');
	reset(input);
	for i:=1 to n do
	begin
		read(c);
		while (NOT(c=' ')) do
		begin
			fio[i].name1 := fio[i].name1 + c;
			read(c);
		end;
		read(c);
		while (NOT(c=' ')) do
		begin
			fio[i].name2 := fio[i].name2 + c;
			read(c);
		end;
		read(c);
		while (NOT(Ord(c) = 13)) do
		begin
			fio[i].name3 := fio[i].name3 + c;
			read(c);
		end;
		read(c);
	end;
	assign(output, 'C:\Users\nikic\Desktop\OUT.TXT');
	rewrite(output);
	FileWrite(n, fio);
	writeln('');
	DeleteSameName(1, n, fio);
end.

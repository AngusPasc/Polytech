Program program1;
	uses MyLib1;
	var fio: fiotype2;
	var i, i1, i2, p1, n: integer;
	var c: char;
	var str1, str2: string;
	
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
	writeln('');
	for i1:=1 to n-1 do
	begin
	  i2:=i1+1;
		while i2<=n do
		begin
			if (fio[i1].name2 = fio[i2].name2) then
			begin
				for p1:=i2 to 9 do
				begin
					fio[p1] := fio[p1+1];
				end;
				n:=n-1;
				i2:=i2-1;
			end;
		i2:=i2+1;
		end;
	end;
	FileWrite(n, fio);
end.

Program program1;
	Type fiotype1 = record
		name1: string[4];
		name2: string[4];
		name3: string[4];
	end;
	type fiotype2 = array [1..11] of fiotype1;
	var fio: fiotype2;
	var i, i1, i2, p1, n: integer;
	var f: file of fiotype1;
	procedure FileWrite(n: integer; fio : fiotype2);
	var i:integer;
	begin
		for i:=1 to n do
		begin
			writeln(fio[i].name1, fio[i].name2, fio[i].name3);
		end;
	end;

begin
	n:=10;
	assign(input, 'C:\Users\nikic\Desktop\IN.TXT');
	reset(input);
	for i:=1 to n do
	begin
		readln(fio[i].name1, fio[i].name2, fio[i].name3);
	end;
	
	Assign(f,'type.out');
	Rewrite(f);
	for i:=1 to n do 
	begin
		Write(f, fio[i]);
	end;
	Close(f);
	
	Assign(f,'type.out');
	Reset(f);
	while not Eof(f) do 
	begin
		Read(f, fio[i]);
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

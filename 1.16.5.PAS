Program program1;
	Type gg = ^fiotype1;
	fiotype1 = record
		name1: string[4];
		name2: string[4];
		name3: string[4];
		next: gg;
	end;
	var i, i1, i2, p1, n: integer;
	var ez, first, fio, abc: gg;
	procedure FileWrite(aaa : gg);
	begin
		While aaa <> nil do
		Begin
			writeln(aaa^.name1, aaa^.name2, aaa^.name3);
			aaa:= aaa^.next;
		end;
	end;

begin
	n:=10;
	assign(input, 'C:\Users\nikic\Desktop\IN.TXT');
	reset(input);
	new(fio);
	first:= fio;
	ez:=fio;
	readln(fio^.name1, fio^.name2, fio^.name3);
	fio^.next:=nil;
	for i:=2 to n do
	begin
		new(fio);
		readln(fio^.name1, fio^.name2, fio^.name3);
		fio^.next:=nil;
		ez^.next:= fio;
		ez:=fio;
	end;
	assign(output, 'C:\Users\nikic\Desktop\OUT.TXT');
	rewrite(output);
	fio:=first;
	ez:=first;
	FileWrite(first);
	writeln('');
	writeln('');
	while fio^.next <> nil do
	begin
		ez:=fio^.next;
		while ez <> nil do
		begin
			if (fio^.name2 = ez^.name2) then
			begin
				abc:=fio;
				while abc^.next <> ez do
				begin
					abc:= abc^.next;
				end;
				abc^.next:=ez^.next;
				ez:=abc;
			end;
		ez:= ez^.next;
		end;
	fio:=fio^.next;
	end;
	FileWrite(first);
end.

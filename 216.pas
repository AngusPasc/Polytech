Program program1;
	Type gg = ^fiotype1;
	fiotype1 = record
		name1: string[20];
		name2: string[10];
		next: gg;
	end;
	var i: integer;
	var ez, first, fio, abc: gg;
	var c: char;
	procedure FileWrite(aaa : gg);
	begin
		While aaa <> nil do
		Begin
			writeln(aaa^.name1,'.', aaa^.name2);
			aaa:= aaa^.next;
		end;
	end;
	procedure SortByName(aaa : gg);
	var fio, ez, abc: gg;
	begin
		fio:=aaa;
		ez:=aaa;
		writeln('');
		writeln('');
		while fio^.next <> nil do
		begin
			ez:=fio^.next;
			while ez <> nil do
			begin
				if (fio^.name1 > ez^.name1) then
				begin
					abc^:=ez^;
					ez^.name1:=fio^.name1;
					ez^.name2:=fio^.name2;
					fio^.name1:=abc^.name1;
					fio^.name2:=abc^.name2;
				end;
			ez:= ez^.next;
			end;
		fio:=fio^.next;
		end;
		FileWrite(aaa);
	end;
	procedure SortByTag(aaa : gg);
	var fio, ez, abc: gg;
	begin
		fio:=aaa;
		ez:=aaa;
		writeln('');
		writeln('');
		while fio^.next <> nil do
		begin
			ez:=fio^.next;
			while ez <> nil do
			begin
				if (fio^.name2 > ez^.name2) then
				begin
					abc^:=ez^;
					ez^.name1:=fio^.name1;
					ez^.name2:=fio^.name2;
					fio^.name1:=abc^.name1;
					fio^.name2:=abc^.name2;
				end;
			ez:= ez^.next;
			end;
		fio:=fio^.next;
		end;
		FileWrite(aaa);
	end;

begin
	writeln ('SortByName - 1; SortByTag - 2; SortByName&SortByTag - 12');
	read(i);
	assign(input, 'C:\Users\nikic\Desktop\IN.TXT');
	reset(input);
	new(fio);
	first:= fio;
	ez:=fio;
	read(c);
	fio^.name1:='';
	while c <> '.' do
	begin
		fio^.name1:=fio^.name1+c;
		read(c);
	end;
	readln(fio^.name2);
	fio^.next:=nil;
	while not (eof(input)) do
	begin
		new(fio);
		read(c);
		fio^.name1:='';
		while Not (c='.') do
		begin
			fio^.name1:=fio^.name1+c;
			read(c);
		end;
		readln(fio^.name2);
		fio^.next:=nil;
		ez^.next:= fio;
		ez:=fio;
	end;
	assign(output, 'C:\Users\nikic\Desktop\OUT.TXT');
	rewrite(output);
	FileWrite(first);
	if i = 1 then SortByName(first)
	else if i = 2 then SortByTag(first)
	else if i = 12 then begin SortByName(first); SortByTag(first); end
	else writeln('lol, try again');
end.

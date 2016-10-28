Program program1;
	Type gg = ^fiotype1;
	fiotype1 = record
		name: string[15];
		next: gg;
	end;
	var fio: gg;
	procedure FileWrite(aaa : gg);
	var tec, last: gg;
	begin
		last:=aaa;
		While last <> nil do
		Begin
			last:= last^.next;
		end;
		while aaa <> last do
		begin
			tec:=aaa;
			while tec^.next <> last do
			begin
				tec:=tec^.next;
			end;
			writeln(tec^.name);
			last:=tec;
		end;
	end;
	procedure Sort(aaa : gg);
	var fio, ez, fio1, ez1, fio2, ez2: gg;
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
				if (fio^.name > ez^.name) then
				begin
					fio1:=aaa;
					While fio1^.next <> fio do
					Begin
						fio1:= fio1^.next;
					end;
					ez1:=aaa;
					While ez1^.next <> ez do
					Begin
						ez1:= ez1^.next;
					end;
					fio2:=fio^.next;
					ez2:=ez^.next;
					fio1^.next:=ez;
					ez1^.next:=fio;
					fio^.next:=ez2;
					ez^.next:=fio2;
				end;
			ez:= ez^.next;
			end;
		fio:=fio^.next;
		end;
	end;
	
	
	procedure MakeList(first : gg);
	var ez, fio: gg;
	begin
		fio:=first;
		ez:=fio;
		readln(fio^.name);
		fio^.next:=nil;
		while not (eof(input)) do
		begin
			new(fio);
			readln(fio^.name);
			fio^.next:=nil;
			ez^.next:= fio;
			ez:=fio;
		end;
	end;

begin
	assign(input, 'C:\Users\nikic\Desktop\IN.TXT');
	reset(input);
	new(fio);
	MakeList(fio);
	assign(output, 'C:\Users\nikic\Desktop\OUT.TXT');
	rewrite(output);
	Sort(fio);
	FileWrite(fio);
end.

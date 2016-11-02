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
		writeln('');
	end;

	procedure Sort(aaa : gg);
	var  fio, ez, b1, b2, b3, b4, b5: gg;
	begin
		fio:=aaa^.next;
		while fio^.next <> nil do
		begin
			ez:= fio^.next;
			while ez <> nil do
			begin
				if fio^.name > ez^.name then
				begin
					if fio^.next = ez then
					begin
						b1:=aaa;
						while b1^.next <> fio do
							b1:=b1^.next;
						b2:=b1;
						
						b1^.next:=ez;
						fio^.next:=ez^.next;
						ez^.next:=fio;
						
						fio:=b2^.next;
						ez:=fio^.next;
					end
					else if fio^.next^.next = ez then
					begin
						b1:=aaa;
						while b1^.next <> fio do
							b1:=b1^.next;
						b2:=b1;
						b3:=fio^.next;
						
						b1^.next:=ez;
						fio^.next:=ez^.next;
						ez^.next:=b3;
						b3^.next:=fio;
						
						fio:=b2^.next;
						ez:=fio^.next^.next;
					end
					else
					begin
						b1:=aaa;
						b2:=fio;
						while b1^.next <> fio do
							b1:=b1^.next;
						while b2^.next <> ez do
							b2:=b2^.next;
						b3:=b1;
						b4:=b2;
						b5:=ez^.next;
						
						ez^.next:=fio^.next;
						b1^.next:=ez;
						fio^.next:=b5;
						b2^.next:=fio;
						
						fio:=b3^.next;
						ez:=b4^.next;
					end;
				end;
				ez:=ez^.next;
			end;
			fio:=fio^.next;
		end;
	end;
	
	procedure MakeList(var first : gg);
	var ez, fio: gg;
	begin
		new(fio);
		fio^.next:=first;
		first:=fio;
		fio:=first^.next;
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
	FileWrite(fio^.next);
	{close(output);}
	Sort(fio);
	FileWrite(fio^.next);
end.

Program program1;
	Type gg = ^fiotype1;
	fiotype1 = record
		k: integer;
		e: integer;
		next: gg;
	end;
	var A, B, C: gg;
	var ch: char;
	
	procedure FileWrite(aaa : gg);
	begin
		While aaa^.next <> nil do
		Begin
			write(aaa^.k,'*X^', aaa^.e, ' + ');
			aaa:= aaa^.next;
		end;
		write(aaa^.k,'*X^', aaa^.e);
		writeln('');
	end;

	procedure MakeList(var first : gg);
	var ez, fio: gg;
	begin
		fio:=first;
		ez:=fio;
		read(fio^.k, fio^.e);
		fio^.next:=nil;
		while not (eoln(input)) do
		begin
			new(fio);
			read(fio^.k, fio^.e);
			fio^.next:=nil;
			ez^.next:= fio;
			ez:=fio;
		end;
		readln;
	end;

	Function Mult(aaa, bbb : gg) : gg;
	var ccc, b, b1, b2, b3: gg;
	begin
		new(b3);
		b:=b3;
		b1:=aaa;
		While b1 <> nil do
		Begin
			b2:=bbb;
			While b2 <> nil do
			Begin
				new(ccc);
				ccc^.k:=b1^.k * b2^.k;
				ccc^.e:=b1^.e + b2^.e;
				ccc^.next:=nil;
				b^.next:=ccc;
				b:=ccc;
				b2:= b2^.next;
			end;
			b1:= b1^.next;
		end;
		Mult:= b3;
	end;

	procedure SortByTag(aaa : gg);
	var fio, ez, abc: gg;
	var k1, e1: integer;
	begin
		fio:=aaa;
		while fio^.next <> nil do
		begin
			ez:=fio^.next;
			while ez <> nil do
			begin
				if fio^.e < ez^.e then
				begin
					k1:=ez^.k;
					e1:=ez^.e;
					ez^.k:=fio^.k;
					ez^.e:=fio^.e;
					fio^.k:=k1;
					fio^.e:=e1;
				end
				else if fio^.e = ez^.e then
				begin
					fio^.k:= fio^.k + ez^.k;
					abc:=aaa;
					while abc^.next <> ez do
						abc:=abc^.next;
					abc^.next:=ez^.next;
				end;
				ez:= ez^.next;
			end;
			fio:=fio^.next;
		end;
	end;
	
begin
	assign(input, 'C:\Users\nikic\Desktop\IN.TXT');
	reset(input);
	new(A);
	MakeList(A);
	new(B);
	MakeList(B);
	assign(output, 'C:\Users\nikic\Desktop\OUT.TXT');
	rewrite(output);
	FileWrite(A);
	FileWrite(B);
	C:=Mult(A,B)^.next;
	SortByTag(C);
	FileWrite(C);
end.

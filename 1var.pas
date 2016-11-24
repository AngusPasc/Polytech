Program program1;
	Type link = ^list;
	list = record
		data: char;
		next: link;
	end;
	var A: link;
	

	procedure P1(A : link);
	var B:link;
	begin
		while not eof(input) do
		begin
			new(A^.next);
			A:=A^.next;
			readln(A^.data);
			A^.next:=nil;
		end;
	end;

	procedure P3(A : link);
	var last, tec: link;
	begin
		last:=A;
		While last <> nil do
		Begin
			last:= last^.next;
		end;
		while A <> last do
		begin
			tec:=A;
			while tec^.next <> last do
			begin
				tec:=tec^.next;
			end;
			writeln(tec^.data);
			last:=tec;
		end;
		writeln('');
	end;
	
	procedure P2(A : link);
	var B: link;
		C: char;
	begin
		while A^.next <> nil do
		begin
			B:=A^.next;
			while B <> nil do
			begin
				if A^.data < B^.data then
				begin
					C:=B^.data;
					B^.data:=A^.data;
					A^.data:=C;
				end;
				B:=B^.next;
			end;
			A:=A^.next;
		end;
	end;
	
begin
	assign(input, 'C:\Users\nikic\Desktop\IN.TXT');
	reset(input);
	assign(output, 'C:\Users\nikic\Desktop\OUT.TXT');
	rewrite(output);
	new(A);
	P1(A);
	P3(A^.next);
	P2(A^.next);
	writeln('~~~');
	P3(A^.next);
end.

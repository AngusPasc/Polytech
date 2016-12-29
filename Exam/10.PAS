{AAAAAAA}
Program pr5;
	type fio = ^rec;
	rec = record
		name: string;
		next: fio;
		back: fio;
	end;

	procedure P1(head: fio; var intext: text);
	begin 
		while not eof(intext) do
		begin
			new(head^.next);
			readln(intext, head^.next^.name);
			head^.next^.next:= nil;
			head^.next^.back:= head;
			head:= head^.next;
		end;
	end;

	procedure P2(head: fio; var outtext: text);
	var t: fio;
	begin
		t:=head^.next;
		while t^.next <> nil do
		begin
			writeln(outtext, t^.name);
			t:=t^.next;
		end;
		writeln(outtext, t^.name);
		writeln(outtext, '');
		while t <> head do
		begin
			writeln(outtext, t^.name);
			t:=t^.back;
		end;
		writeln(outtext, '');
	end;
	
	procedure P3(head: fio);
	var i: integer;
	begin
		i:=1;
		while head^.next <> nil do
		begin
			if i mod 2 = 1 then
			begin
				head^.next:=head^.next^.next;
				head^.next^.back:=head;
				i:=i+1;
			end;
			i:=i+1;
			head:=head^.next;
		end;
	end;
	
	var head: fio;
		intext, outtext: text;
	
begin
	assign(intext, 'f1.txt');
	assign(outtext, 'out.txt');
	rewrite(outtext);
	reset(intext);
	new(head);
	head^.back:=nil;
	head^.next:=nil;
	P1(head, intext);
	P2(head, outtext);
	P3(head);
	P2(head, outtext);
	close(intext);
	close(outtext);
end.

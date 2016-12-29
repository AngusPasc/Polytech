{AAAAAAAAA}
Program pr8;
	type fio = ^rec;
	rec = record
		name: string;
		next: fio;
	end;
	

	procedure P1(var head: fio; var intext: text);
	var t:fio;
	begin 
		while not eof(intext) do
		begin
			t:=head;
			new(head);
			head^.next:=t;
			readln(intext, head^.name);	
		end;
		t:=head;
		new(head);
		head^.next:=t;
	end;

	procedure P2(s1: fio; var outtext: text);
	var last, t:fio;
	begin
		last:=nil;
		while last <> s1^.next do
		begin
			t:=s1^.next;
			while t^.next <> last do
			begin
				t:=t^.next;
			end;
			writeln(outtext, t^.name);
			last:=t;
		end;
		writeln(outtext, '');
	end;
	
	procedure P3(head1, head2: fio);
	var t, t1: fio;
		str: string;
	begin
		t1:=head1;
		while t1^.next <> nil do t1:=t1^.next;
		t1^.next:=head2^.next;
		
		head1:=head1^.next;
		while head1^.next <> nil do
		begin
			head2:=head1^.next;
			while head2 <> nil do
			begin
				if head1^.name < head2^.name then
				begin
					str:=head1^.name;
					head1^.name:=head2^.name;
					head2^.name:=str;
				end;
				head2:=head2^.next;
			end;
			head1:=head1^.next;
		end;
	end;
	
	
	var head1, head2: fio;
		intext, outtext, intext2: text;
	
begin
	assign(intext, 'f1.txt');
	assign(intext2, 'f2.txt');
	assign(outtext, 'out.txt');
	rewrite(outtext);
	reset(intext);
	reset(intext2);
	new(head1);
	head1:=nil;
	new(head2);
	head2:=nil;
	P1(head1, intext);
	P1(head2, intext2);
	P2(head1, outtext);
	P2(head2, outtext);
	P3(head1, head2);
	P2(head1, outtext);
	close(intext);
	close(outtext);
end.

{AAAAAAAAA  15}
Program pr6;
	type mat = ^rec;
	rec = record
		number: integer;
		name: string[10];
		next: mat;
	end;
	

	procedure P1(head: mat; var intext: text);
	begin 
		while not eof(intext) do
		begin
			new(head^.next);
			head:=head^.next;
			head^.next:= nil;
			readln(intext, head^.name, head^.number);	
		end;
	end;

	procedure P2(s1: mat; var outtext: text);
	begin
		s1:=s1^.next;
		while s1 <> nil do
		begin
			writeln(outtext, s1^.name, ' ', s1^.number);
			s1:=s1^.next;
		end;
		writeln(outtext, '');
	end;
	
	
	
	procedure P3(head1, head2: mat);
	var t, t1: mat;
	begin
		t:= head2;
		head1:=head1^.next;
		while head1 <> nil do
		begin
			head2:=t^.next;
			while head2 <> nil do
			begin
				if head1^.name = head2^.name then
				begin
					if head1^.number >= head2^.number then
					begin
						head1^.number:=head1^.number - head2^.number;
						t1:=t;
						while t1^.next <> head2 do t1:=t1^.next;
						t1^.next:=head2^.next;
					end
					else if head1^.number < head2^.number then
					begin
						head2^.number:= head2^.number - head1^.number;
						head1^.number:= 0;
					end;
				end;
				head2:=head2^.next;
			end;
			head1:=head1^.next;
		end;
	end;
	
	
	var head1, head2: mat;
		intext, outtext, intext2: text;
	
begin
	assign(intext, 'f1.txt');
	assign(intext2, 'f2.txt');
	assign(outtext, 'out.txt');
	rewrite(outtext);
	reset(intext);
	reset(intext2);
	new(head1);
	head1^.next:=nil;
	P1(head1, intext);
	new(head2);
	head2^.next:=nil;
	P1(head2, intext2);
	P2(head1, outtext);
	P2(head2, outtext);
	P3(head1, head2);
	P2(head1, outtext);
	P2(head2, outtext);
	close(intext);
	close(outtext);
end.

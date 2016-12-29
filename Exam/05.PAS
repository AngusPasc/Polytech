{ABC 123}
Program pr5;
	type fio = ^rec;
	rec = record
		number: integer;
		name: string;
		next: fio;
		back: fio;
	end;
	
	type fio1 = ^rec1;
	rec1 = record
		number: integer;
		name: string;
		next: fio1;
	end;

	procedure P1(head: fio; var intext: text);
	var str, strname: string;
		numb, i: integer;
	begin 
		while not eof(intext) do
		begin
			readln(intext, str);
			i:=1;
			while str[i+1] <> ' ' do i:=i+1;
			strname:= Copy(str, 1, i);
			Val(Copy(str, i+1, length(str)), numb, numb);
			new(head^.next);
			head^.next^.number:= numb;
			head^.next^.name:= strname;
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
			writeln(outtext, t^.name, ' ', t^.number);
			t:=t^.next;
		end;
		writeln(outtext, t^.name, ' ', t^.number);
		writeln(outtext, '');
		while t <> head do
		begin
			writeln(outtext, t^.name, ' ', t^.number);
			t:=t^.back;
		end;
		writeln(outtext, '');
	end;
	
	procedure P3(head: fio; s1, s2: fio1);
	var t: fio;
		t1, t2: fio1;
		str: string;
		i: integer;
	begin
		t1:= s1;
		t2:= s2;
		t:=head^.next;
		while t <> nil do
		begin
			new(s1^.next);
			s1:=s1^.next;
			new(s2^.next);
			s2:=s2^.next;
			s1^.next:=nil;
			s2^.next:=nil;
			s1^.name:=t^.name;
			s1^.number:=t^.number;
			s2^.name:=t^.name;
			s2^.number:=t^.number;
			t:=t^.next;
		end;
		t1:=t1^.next;
		t2:=t2^.next;
		while t1^.next <> nil do
		begin
			s1:=t1^.next;
			while s1 <> nil do
			begin
				if s1^.number < t1^.number then
				begin
					str:=t1^.name;
					i:=t1^.number;
					t1^.name:=s1^.name;
					t1^.number:=s1^.number;
					s1^.name:=str;
					s1^.number:=i;
				end;
				s1:=s1^.next;
			end;
			t1:=t1^.next;
		end;
		while t2^.next <> nil do
		begin
			s2:=t2^.next;
			while s2 <> nil do
			begin
				if s2^.name < t2^.name then
				begin
					str:=t2^.name;
					i:=t2^.number;
					t2^.name:=s2^.name;
					t2^.number:=s2^.number;
					s2^.name:=str;
					s2^.number:=i;
				end;
				s2:=s2^.next;
			end;
			t2:=t2^.next;
		end;
	end;
	
	procedure P4(s1, s2: fio1; var outtext: text);
	begin
		while s1 <> nil do
		begin
			writeln(outtext, s1^.name, ' ', s1^.number);
			s1:=s1^.next;
		end;
		writeln(outtext, '');
		while s2 <> nil do
		begin
			writeln(outtext, s2^.name, ' ', s2^.number);
			s2:=s2^.next;
		end;
		writeln(outtext, '');
	end;
	
	var head: fio;
		s1, s2: fio1;
		intext, outtext: text;
	
begin
	assign(intext, 'in.txt');
	assign(outtext, 'out.txt');
	rewrite(outtext);
	reset(intext);
	new(head);
	head^.back:=nil;
	head^.next:=nil;
	P1(head, intext);
	P2(head, outtext);
	new(s1);
	new(s2);
	s1^.next:=nil;
	s2^.next:=nil;
	P3(head, s1, s2);
	P4(s1^.next, s2^.next, outtext);
	close(intext);
	close(outtext);
end.

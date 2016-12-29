{123, ABC, ABC, 1234, 1234}
Program pr12;
	type fio = ^rec;
	rec = record
		number: integer;
		author: string;
		name: string;
		year: integer;
		cost: integer;
		next: fio;
		back: fio;
	end;
	

	procedure P1(head: fio; var intext: text);
	var str, author, name: string;
		number, year, cost, i, i1: integer;
	begin 
		while not eof(intext) do
		begin
			readln(intext, str);
			i:=1;
			while str[i+1] <> ',' do i:=i+1;
			Val(Copy(str, 1, i), number, number);
			
			i1:=i+2;
			i:=i+1;
			while str[i+1] <> ',' do i:=i+1;
			author:= Copy(str, i1, i-i1 + 1);
			
			i1:=i+2;
			i:=i+1;
			while str[i+1] <> ',' do i:=i+1;
			name:= Copy(str, i1, i-i1 + 1);
			
			i1:=i+2;
			i:=i+1;
			while str[i+1] <> ',' do i:=i+1;
			Val(Copy(str, i1, i-i1 + 1), year, year);
			
			i1:=i+2;
			Val(Copy(str, i1, length(str)), cost, cost);
			
			new(head^.next);
			head^.next^.number:= number;
			head^.next^.name:= name;
			head^.next^.author:= author;
			head^.next^.year:= year;
			head^.next^.cost:= cost;
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
			writeln(outtext, t^.number, ',', t^.author, ',', t^.name, ', ', t^.year, ', ', t^.cost);
			t:=t^.next;
		end;
		writeln(outtext, t^.number, ',', t^.author, ',', t^.name, ', ', t^.year, ', ', t^.cost);
		writeln(outtext, '');
		while t <> head do
		begin
			writeln(outtext, t^.number, ',', t^.author, ',', t^.name, ', ', t^.year, ', ', t^.cost);
			t:=t^.back;
		end;
		writeln(outtext, '');
	end;
	
	procedure P3(head: fio);
	var s1, t: fio;
		author, name: string;
		number, year, cost: integer;
	begin
		head:=head^.next;
		while head^.next <> nil do
		begin
			s1:=head^.next;
			t:=head;
			while s1 <> nil do
			begin
				if s1^.author < t^.author then
				begin
					t:=s1;
				end;
				s1:=s1^.next;
			end;
			author:=t^.author;
			name:=t^.name;
			number:=t^.number;
			year:=t^.year;
			cost:=t^.cost;
			t^.author:=head^.author;
			t^.name:=head^.name;
			t^.number:=head^.number;
			t^.year:=head^.year;
			t^.cost:=head^.cost;
			head^.author:=author;
			head^.name:=name;
			head^.number:=number;
			head^.year:=year;
			head^.cost:=cost;
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

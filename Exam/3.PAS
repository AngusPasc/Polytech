Program pr3;
	type book = ^rec;
	rec = record
		number: integer;
		author: string;
		name: string;
		next: book;
		back: book;
	end;

	procedure P1(head: book; var intext: text);
	var t, t1: book;
		str, strname, strauthor: string;
		numb, i, i1: integer;
	begin 
		while not eof(intext) do
		begin
			readln(intext, str);
			i:=1;
			while str[i+1] <> ',' do i:=i+1;
			Val(Copy(str, 1, i), numb, numb);
			i1:=i;
			i:=i+1;
			while str[i+1] <> ',' do i:=i+1;
			strauthor:= Copy(str, i1+2, i-i1-1);
			strname:= Copy(str, i+2, length(str));
			if head^.next = nil then
			begin
				new(head^.next);
				head^.next^.number:= numb;
				head^.next^.author:= strauthor;
				head^.next^.name:= strname;
				head^.next^.next:= nil;
				head^.next^.back:= head;
			end
			else
			begin
				t:=head;
				while t^.next <> nil do
				begin
					if numb < t^.next^.number then
					begin
						t1:= t^.next;
						new(t^.next);
						t1^.back:=t^.next;
						t^.next^.number:= numb;
						t^.next^.author:= strauthor;
						t^.next^.name:= strname;
						t^.next^.next:= t1;
						t^.next^.back:= t;
						break;
					end;
					t:=t^.next;
				end;
				if t^.next = nil then
				begin
					new(t^.next);
					t^.next^.number:= numb;
					t^.next^.author:= strauthor;
					t^.next^.name:= strname;
					t^.next^.next:= nil;
					t^.next^.back:= t;
				end;
			end;
		end;
	end;

	procedure P3(head: book; var outtext: text);
	var t: book;
	begin
		t:=head^.next;
		while t^.next <> nil do
		begin
			writeln(outtext, t^.number, ',', t^.author, ',', t^.name);
			t:=t^.next;
		end;
		writeln(outtext, t^.number, ',', t^.author, ',', t^.name);
		writeln(outtext, '');
		while t <> head do
		begin
			writeln(outtext, t^.number, ',', t^.author, ',', t^.name);
			t:=t^.back;
		end;
		writeln(outtext, '');
	end;
	
	procedure P2(head: book);
	var t, t1: book;
		str, strname, strauthor: string;
		numb, i, i1: integer;
	begin
		readln(str);
		i:=1;
		while str[i+1] <> ',' do i:=i+1;
		Val(Copy(str, 1, i), numb, numb);
		i1:=i;
		i:=i+1;
		while str[i+1] <> ',' do i:=i+1;
		strauthor:= Copy(str, i1+2, i-i1-1);
		strname:= Copy(str, i+2, length(str));
		if head^.next = nil then
		begin
			new(head^.next);
			head^.next^.number:= numb;
			head^.next^.author:= strauthor;
			head^.next^.name:= strname;
			head^.next^.next:= nil;
			head^.next^.back:= head;
		end
		else
		begin
			t:=head;
			while t^.next <> nil do
			begin
				if numb < t^.next^.number then
				begin
					t1:= t^.next;
					new(t^.next);
					t1^.back:=t^.next;
					t^.next^.number:= numb;
					t^.next^.author:= strauthor;
					t^.next^.name:= strname;
					t^.next^.next:= t1;
					t^.next^.back:= t;
					break;
				end;
				t:=t^.next;
			end;
			if t^.next = nil then
			begin
				new(t^.next);
				t^.next^.number:= numb;
				t^.next^.author:= strauthor;
				t^.next^.name:= strname;
				t^.next^.next:= nil;
				t^.next^.back:= t;
			end;
		end;
	end;
	
	procedure P4(head: book; var outtext: text);
	var t: book;
		str: string;
	begin
		writeln('Esli vo vhodnom fajle, posle zapyatoj stoit probel, to vvedite familiyu s probelom pered nej');
		readln(str);
		t:=head^.next;
		while t <> nil do
		begin
			if t^.author = str then writeln(outtext, t^.number, ',', t^.author, ',', t^.name);
			t:=t^.next;
		end;
	end;
	
	var head: book;
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
	P3(head, outtext);
	P2(head);
	P3(head, outtext);
	P4(head, outtext);
	close(intext);
	close(outtext);
end.

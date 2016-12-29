{AAAAAAAAAA 15}
Program pr7;
	type fio = ^rec;
	rec = record
		number: integer;
		name: string[10];
		left: fio;
		right: fio;
	end;

	procedure P1(head: fio; var intext: text);
	var strname: string[10];
		numb: integer;
		t:fio;	
	begin
		readln(intext, head^.name, head^.number);
		t:=head;
		while not eof(intext) do
		begin
			head:=t;
			readln(intext, strname, numb);
			while true do
			begin
				if numb < head^.number then
				begin
					if head^.left = nil then
					begin
						new(head^.left);
						head:=head^.left;
						head^.left:=nil;
						head^.right:=nil;
						head^.number:=numb;
						head^.name:=strname;
						break;
					end
					else head:=head^.left;
				end
				else if numb >= head^.number then
				begin
					if head^.right = nil then
					begin
						new(head^.right);
						head:=head^.right;
						head^.left:=nil;
						head^.right:=nil;
						head^.number:=numb;
						head^.name:=strname;
						break;
					end
					else head:=head^.right;
				end;
			end;
		end;
	end;

	procedure P2(head: fio; var outtext: text);
	begin
		if head^.left <> nil then P2(head^.left, outtext);
		writeln(outtext, head^.name, ' ', head^.number);
		if head^.right <> nil then P2(head^.right, outtext);
	end;
	
	procedure P3(head: fio; var outtext: text);
	begin
		if head^.right <> nil then P3(head^.right, outtext);
		if head^.left <> nil then P3(head^.left, outtext);
		if ((head^.left = nil) and (head^.right = nil)) then writeln(outtext, head^.name, ' ', head^.number);
	end;
	var head: fio;
		intext, outtext: text;
	
begin
	assign(intext, 'f1.txt');
	assign(outtext, 'out.txt');
	rewrite(outtext);
	reset(intext);
	new(head);
	head^.left:=nil;
	head^.right:=nil;
	P1(head, intext);
	P2(head, outtext);
	writeln(outtext, '');
	P3(head, outtext);
	writeln(outtext, '');
	close(intext);
	close(outtext);
end.

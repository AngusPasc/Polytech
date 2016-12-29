{AAA, 2}
Program pr11;
	type fio = ^rec;
	rec = record
		number: integer;
		count: integer;
		left: fio;
		right: fio;
	end;

	procedure P1(head: fio; var intext: text);
	var str: string;
		numb, i: integer;
		t:fio;
	begin
		readln(intext, str);
		i:=1;
		while str[i] <> ',' do i:=i+1;
		Val(Copy(str, i+1, length(str)), numb, numb);
		head^.number:=numb;
		head^.count:=1;
		t:=head;
		while not eof(intext) do
		begin
			head:=t;
			readln(intext, str);
			i:=1;
			while str[i] <> ',' do i:=i+1;
			Val(Copy(str, i+1, length(str)), numb, numb);
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
						head^.count:=1;
						break;
					end
					else head:=head^.left;
				end
				else if numb > head^.number then
				begin
					if head^.right = nil then
					begin
						new(head^.right);
						head:=head^.right;
						head^.left:=nil;
						head^.right:=nil;
						head^.number:=numb;
						head^.count:=1;
						break;
					end
					else head:=head^.right;
				end
				else if numb = head^.number then
				begin
					head^.count:=head^.count+1;
					break;
				end;
			end;
		end;
	end;

	procedure P2(head: fio; var outtext: text);
	begin
		if head^.left <> nil then P2(head^.left, outtext);
		writeln(outtext, head^.number, ' - ', head^.count);
		if head^.right <> nil then P2(head^.right, outtext);
	end;

	
	procedure P3(head: fio; var outtext: text);
	begin
		
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
	close(intext);
	close(outtext);
end.

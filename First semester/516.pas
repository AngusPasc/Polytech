Program program1;
	Type gg = ^fiotype1;
	fiotype1 = record
		data: string[10];
		left: gg;
		right: gg;
	end;
	var A: gg;
	var i:integer;
	
	procedure MakeTree(first: gg);
	var length: integer;
		aaa:gg;
	var str: string;
	var tr: boolean;
	begin
		while not eof(input) do
		begin
			aaa:= first;
			readln(str);
			while true do
			begin
				if str >= aaa^.data then
				begin 
					if aaa^.right <> nil then aaa:=aaa^.right
					else
					begin
						new(aaa^.right);
						aaa^.right^.data:=str;
						aaa^.right^.left:=nil;
						aaa^.right^.right:=nil;
						break;
					end;
				end
				else
				begin
					if aaa^.left <> nil then aaa:=aaa^.left
					else
					begin
						new(aaa^.left);
						aaa^.left^.data:=str;
						aaa^.left^.left:=nil;
						aaa^.left^.right:=nil;
						break;
					end;
				end;
			end;
		end;
	end;
	
	procedure WriteTree(aaa: gg; deep: integer);
	begin
		writeln(aaa^.data, ' - ', deep);
		if aaa^.left <> nil then WriteTree(aaa^.left, deep + 1);
		if aaa^.right <> nil then WriteTree(aaa^.right, deep + 1);
	end;
	
begin
	assign(input, 'C:\Users\nikic\Desktop\IN.TXT');
	reset(input);
	assign(output, 'C:\Users\nikic\Desktop\OUT.TXT');
	rewrite(output);
	new(A);
	readln(A^.data);
	A^.left:= nil;
	A^.right:= nil;
	MakeTree(A);
	WriteTree(A, 1)
end.

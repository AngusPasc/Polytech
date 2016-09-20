Program program1;
    var i1, i2, i3, p1, p2, p3, n, s:integer;
	type ta = array [0..11, 0..41] of char;
	var mas, mas1: ta;
	var c: char;
	procedure FileWrite(c: char; n: integer; mas : ta);
	begin
		for i1:=1 to n do
		begin
			for i2:=1 to 40 do
			begin
				c:=mas[i1, i2];
				if (Ord(c) = 26) then
				begin
					break;
				end
				else if (Ord(c) <> 10) then
				begin
					write(c);
				end 
				else
				begin
					write(c);
					break;
				end;
			end;
		end;
	end;
begin
	n:=10;
	i3:=1;
	assign(input, 'C:\Users\nikic\Desktop\in.txt');
	reset(input);
	for i1:=1 to n do
	begin
		for i2:=1 to 40 do
		begin
			read(c);
			if (s=1) then
			begin
				mas1[i1, i3]:=c;
				i3:=i3+1;
			end;
			if (c=' ') then
			begin
				s:=s+1;
				mas[i1, i2]:=c;
			end
			else if (Ord(c) <> 10) then
			begin
				mas[i1, i2]:=c;
			end
			else
			begin
				mas[i1, i2]:=Chr(10);
				s:=0;
				i3:=1;
				break;
			end;
		end;
	end;
	assign(output, 'C:\Users\nikic\Desktop\out.txt');
	rewrite(output);
	FileWrite(c, n, mas);
	writeln('');
	writeln('');
	for i1:=1 to n-1 do
	begin
		for i2:=i1+1 to n do
		begin
			for i3:=1 to 40 do
			begin
				if (mas1[i1,i3] <> mas1[i2,i3]) then
				begin
					break;
				end
				else if (mas1[i1,i3]=' ') then
				begin
					for p1:=i2 to 9 do
					begin
						for p2:=1 to 40 do
						begin
							mas[p1, p2]:=mas[p1+1, p2];
							mas1[p1, p2]:=mas1[p1+1, p2];
						end;
					end;
					n:=n-1;
					break;
				end;
			end;
		end;
	end;
	FileWrite(c, n, mas);
end.

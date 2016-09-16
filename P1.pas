Program p1;
    var i1, i2, i3, i4, i5, n:integer;
	var mas: array [0..11, 0..41] of char;
	var c: char;
	label metka;
begin
	n:=10;
	assign(input, 'C:\Users\nikic\Desktop\in.txt');
	reset(input);
	for i1:=1 to n do
	begin
		for i2:=1 to 40 do
		begin
			read(c);
			if (Ord(c) <> 10) then
			begin
				mas[i1, i2]:=c;
			end
			else
			begin
				mas[i1, i2]:=Chr(10);
				break;
			end;
		end;
	end;
	assign(output, 'C:\Users\nikic\Desktop\out.txt');
	rewrite(output);
	for i1:=1 to 10 do
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
	writeln('');
	writeln('');
	
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
end.

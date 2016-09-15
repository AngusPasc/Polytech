Program p1;
    var i1, i2:integer;
	var mas: array [0..11, 0..41] of char;
	var c: char;
begin
	assign(input, 'C:\Users\nikic\Desktop\in.txt');
	reset(input);
	for i1:=1 to 10 do
	begin
		for i2:=1 to 40 do
		begin
			read(c);
			if (Ord(c) <> 12) then
			begin
				mas[i1, i2]:=c;
			end
			else
			begin
				mas[i1, i2]:=Chr(12);
				Continue;
			end;
		end;
	end;
	assign(output, 'C:\Users\nikic\Desktop\out.txt');
	rewrite(output);
	for i1:=1 to 10 do
	begin
		for i2:=1 to 40 do
		begin
			read(c);
			if (Ord(c) <> 12) then
			begin
				write(mas[i1, i2]);
			end
			else
			begin
				write(mas[i1, i2]);
				Continue;
			end;
		end;
	end;
	readln;
end.

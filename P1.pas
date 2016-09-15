Program p1;
    var i1, i2, i3, i4, i5, n:integer;
	var mas: array [0..11, 0..41] of char;
	var c: char;
begin
	n:=10;
	assign(input, 'C:\Users\nikic\Desktop\in.txt');
	reset(input);
	for i1:=1 to n do
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
	writeln('');
	for i1:=1 to n-1 do
	begin
		for i3:=i1+1 to n do
		begin
			for i2:=1 to 40 do
			begin
				if (mas[i1, i2] <> mas[i3, i2]) then
				begin
					break;
				end
				else if ((mas[i1, i2] = ' ') and (mas[i3, i2] = ' ')) then
				begin
					for i4:=i3 to n-1 do
					begin
						for i5:=1 to 40 do
						begin
							if (Ord(mas[i4, i5]) <> 12) then
							begin
								mas[i4, i5]:=mas[i4+1, i5];
							end
							else
							begin
								mas[i4, i5]:=mas[i4+1, i5];
								Continue;
							end;
						end;
					end;
					n:=n-1;
				end
			end;
		end;
	end;
	for i1:=1 to n do
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
end.

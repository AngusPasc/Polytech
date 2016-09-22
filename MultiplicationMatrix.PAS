Program program1;
    var i1, i2, l, m, n, k: integer;
	type mastype = array [1..30, 1..30] of integer;
	var mas1, mas2, mas: mastype;
	procedure ComparingNames(l, m, n:integer; mas1,mas2:mastype; var mas:mastype);
	begin
		for i1:=1 to l do  
		begin
			for i2:=1 to n do  
			begin
				for k:=1 to m do
				begin
					mas[i1,i2]:= mas[i1,i2] + mas1[i1, k]*mas2[k, i2];
				end;			
			end;
		end;
	end;
begin
	assign(input, 'C:\Users\nikic\Desktop\in.txt');
	reset(input);
	read(l, m, n);
	for i1:=1 to l do
	begin
		for i2:=1 to m do
		begin
			read(mas1[i1,i2]);
		end;
	end;
	for i1:=1 to m do
	begin
		for i2:=1 to n do
		begin
			read(mas2[i1,i2]);
		end;
	end;
	assign(output, 'C:\Users\nikic\Desktop\out.txt');
	rewrite(output);
	ComparingNames(l, m, n, mas1, mas2, mas);
	for i1:=1 to l do
	begin
		for i2:=1 to n do
		begin
			write(mas[i1,i2]:4);
		end;
		writeln('');
	end;
end.

Program program1;
    var i, k, j:integer;
	var a,b,c: array [1..10] of integer;
begin
	assign(input, 'C:\Users\nikic\Desktop\in.txt');
	assign(output, 'C:\Users\nikic\Desktop\out.txt');
	reset(input);
	rewrite(output);
	for i:=1 to 10 do
	begin
		read(a[i]);
		write(a[i], ' ');
	end;
	writeln(' ');
	for i:=1 to 10 do
	begin
		read(b[i]);
		write(b[i], ' ');
	end;
	writeln(' ');
	k:=1;
	i:=1;
	j:=1;
	repeat
	begin
		repeat
		begin
			if (a[i]=b[j]) then 
			begin
				c[k]:=a[i];
				k:=k+1;
			end;
			j:=j+1;
		end;
		until (j>10);
	i:=i+1;
	j:=1;
	end;
	until (i>10);
	for i:=1 to 10 do
	begin
		write(c[i], ' ');
	end;
end.

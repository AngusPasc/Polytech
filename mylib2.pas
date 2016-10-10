Unit mylib2;
interface
	uses MyLib1;
	procedure DeleteSameName(i1, n: integer; fio : fiotype2);
	
implementation
	procedure DeleteSameName;
	var i2, p1: integer;
	begin
		if i1 > n then
		begin
			FileWrite(n, fio);
		end
		else
		begin
			i2:=i1+1;
			while i2<=n do
			begin
				if (fio[i1].name2 = fio[i2].name2) then
				begin
					for p1:=i2 to 9 do
					begin
						fio[p1] := fio[p1+1];
					end;
					n:=n-1;
					i2:=i2-1;
				end;
				i2:=i2+1;
			end;
			DeleteSameName(i1+1, n, fio);
		end;
	end;
begin
end.

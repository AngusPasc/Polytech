Unit mylib1;
interface
	Type fiotype1 = record
		name1: string[10];
		name2: string[10];
		name3: string[10];
	end;
	type fiotype2 = array [1..11] of fiotype1;
	procedure FileWrite(n: integer; fio : fiotype2);
	
implementation
	procedure FileWrite; 
	var i:integer;
	begin
		for i:=1 to n do
		begin
			writeln(fio[i].name1 + ' ' + fio[i].name2 + ' ' + fio[i].name3);
		end;
	end;
begin
end.

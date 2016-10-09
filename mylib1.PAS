Unit 1164UNIT;
Interface 
	Type fiotype1 = record
		name1: string;
		name2: string;
		name3: string;
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
end.

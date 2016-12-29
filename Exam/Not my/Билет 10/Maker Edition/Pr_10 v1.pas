Program pr_10;
Type
	DList = ^TRec;
	TRec = record
		fam: string;
		back, next: DList;
	end;
Var
	first, point, last: DList;
	F1, F2: text;

Procedure P1 (var first, point: DList; var H: text);
Begin
	new (first);
	readln (H, first^.fam);
	first^.next:=nil;
	first^.back:=nil;
	point:=first;
	while not eof (H) do 
	begin
		new (point^.next);
		point^.next^.back:=point;
		point:=point^.next;
		readln (H, point^.fam);
		point^.next:=nil;
	end;
End;

Procedure P2 (first, point: DList; var G: text);
Begin
	while first <> nil do
	begin
		writeln (G, first^.fam);
		first:=first^.next;
	end;
	writeln (G, '====in 1st direction====');
	while point <> nil do
	begin
		writeln (G, point^.fam);
		point:=point^.back;
	end;
	writeln (G, '====in 2st direction====');
End;

Procedure DelElement (var first, point, last: DList);
Var
	temp: DList;
Begin
	if first=nil then
	exit;
	if point=first then
	begin
		first:=point^.next;
		if first <> nil then 
		first^.back:=nil
		else
		last:=nil;
		dispose (point);
	end
	else
	if point=last then
	begin
		last:=last^.back;
		if last <> nil then
		last^.next:=nil
		else
		first:=nil;
		dispose (point);
	end
	else
	begin
		temp:=first;
		while temp^.next <> point do
		temp:=temp^.next;
		temp^.next:=point^.next;
		if point^.next <> nil then
		point^.next^.back:=temp;
		dispose (point);
	end;
End;
		

Procedure P3 (var first, point, last: DList);
Var
	n: integer;
Begin
	point:=first;
	n:=1;
	while point <> nil do
	begin
		if n mod 2 <> 0 then
		begin
			DelElement (first, point, last);
		end;
	n:=n+1;
	point:=point^.next;	
	end;
End;
	
Begin
	Assign (F1, 'F1.txt');
	Reset (F1);
	P1 (first, point, F1);
	Close (F1);
	Assign (F2, 'F2.txt');
	Rewrite (F2);
	P2 (first, point, F2);
	writeln (F2, ' ');
	writeln (F2, '====D O N E====');
	P3 (first, point, last);
	P2 (first, point, F2);
	Close (F2);
End.
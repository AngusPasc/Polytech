Program pr8;
Type
	Stack = ^TStack;
	TStack = record
		fam: string;
		next: Stack;
	end;
Var
	point, point1: Stack;
	F1, F2, F3: text;
	i: integer;

Procedure P1 (var point: Stack; var H: text);
Var
	temp: Stack;
Begin
	while not eof (H) do
	begin
		new (temp);
		temp^.next:=point;
		readln (H, temp^.fam);
		point:=temp;
	end;
End;

Procedure P2 (point: Stack; var G: text);
Begin
	while point <> nil do
	begin
		writeln (g, point^.fam);
		point:=point^.next;
	end;
End;

Procedure SortStack (point: Stack);
Var
	temp, work: Stack;
	temp_el: string;
Begin
	new (work);
	work:=point;
	while work <> nil do
	begin
		temp:=work^.next;
		while temp <> nil do
		begin
			if temp^.fam < work^.fam then
			begin
				temp_el:=temp^.fam;
				temp^.fam:=work^.fam;
				work^.fam:=temp_el;
			end;
			temp:=temp^.next;
		end;
		work:=work^.next;
	end;
End;

Procedure P3 (var point: Stack; var G: text);
Var
	temp: Stack;
Begin
	while not eof (G) do
	begin
		new (temp);
		readln (G, temp^.fam);
		temp^.next:=point;
		point:=temp;
	end;
	SortStack (point);
End;

Begin
	Assign (F2, 'F2.txt');
	Reset (F2);
	P1 (point1, F2);
	Close (F2);
	Assign (F1, 'F1.txt');
	Reset (F1);
	P1 (point, F1);
	Close (F1);
	Assign (F3, 'F3.txt');
	Rewrite (F3);
	P2 (point, F3);
	writeln (F3, '====from F1====');
	P2 (point1, F3);
	writeln (F3, '====from F2====');
	Reset (F2);
	P3 (point, F2);
	P2 (point, F3);
	writeln (F3, '====D O N E====');
	Close (F3);
End.
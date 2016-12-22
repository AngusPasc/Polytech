Program program1;
	Uses graph, Crt, WinDOS;
	var intkey: word;
	
	type Player = object
		delete : boolean;
		X: integer;
		Y: integer;
		procedure draw(number: integer);
		procedure deleting;
	end;
	
	type arr = array[0..20] of Player;
	
	type leading = object (Player)
		number: integer;
		procedure drawcursor(i: integer; P: arr);
	end;
	
	procedure Player.draw;
	var s: string; 
	begin
		Circle (X, Y, 40);
		str(number, S);
		OutTextXY(X-10, Y-20, S);
	end;
	
	procedure Player.deleting;
	begin
		SetColor(4);
		Line(X-40, Y-40, X+40, Y+40);
		Line(X+40, Y-40, X-40, Y+40);
		SetColor(8);
		delete:=true;
	end;
	
	procedure leading.drawcursor;
	var k: integer;
		tx, ty: real;
	begin
		tx:= P[i+1].X - P[i].X;
		ty:= P[i+1].Y - P[i].Y;
		for k:=0 to 24 do 
		begin
			SetColor(6);
			SetFillStyle(0,15);
			Bar(220, 140, 440, 340);
			line(X, Y, Round((P[i].X+k*tx/24)/2) + 160, Round((P[i].Y+k*ty/24)/2) + 120);
			SetColor(10);
			draw(number);
		end
	end;
	
	Function StartGame (M, K, Io, number: integer): integer;
	var P: arr;
		L: leading;
		i, i1, counter:integer;
	begin
		ClearDevice;
		SetBkColor(15);
		if number = 0 then
		begin
			counter:=M;
			for i:=1 to M do
			begin
				P[i].X:=Round(320+200*Cos(((2*Pi*i)/M) - Pi/2));
				P[i].Y:=Round(240+200*Sin(((2*Pi*i)/M) - Pi/2));
				P[i].draw(i);
			end;
			P[0]:=P[M];
		end
		else
		begin
			P[number].delete:=true;
			counter:=M-1;
			for i:=1 to number-1 do
			begin
				P[i].X:=Round(320+200*Cos(((2*Pi*i)/(M-1)) - Pi/2));
				P[i].Y:=Round(240+200*Sin(((2*Pi*i)/(M-1)) - Pi/2));
				P[i].draw(i);
			end;
			for i:=number+1 to M do
			begin
				P[i].X:=Round(320+200*Cos(((2*Pi*(i-1))/(M-1)) - Pi/2));
				P[i].Y:=Round(240+200*Sin(((2*Pi*(i-1))/(M-1)) - Pi/2));
				P[i].draw(i);
			end;
			P[0]:=P[M];
			P[number].X:=p[number-1].X;
			P[number].Y:=p[number-1].Y;
		end;
		L.X:=320;
		L.Y:=240;
		L.number:=number;
		L.draw(number);
		i:=Io;
		while counter > 1 do
		begin
			intkey:= Ord(readkey);
			if intkey = 0 then
			begin
				intkey:= Ord(readkey); 
				if intkey = 77 then 
				begin
					i1:=1;
					while i1 <= K do
					begin					
						i:=i+1;
						if i > M then i := i mod M;
						if i <> number then L.drawcursor(i-1, P);
						if not (P[i].delete = true) then i1:=i1+1;
					end;
					P[i].deleting;
					counter:=counter-1;
				end
				else if intkey = 27 then break;
			end
			else if intkey = 27 then break;
		end;
		for i:=1 to M do
		begin
			if P[i].delete = false then number:=i;
			P[i].delete := false;
		end;
		StartGame:=number;
	end;
	
	Function TextArea(str: string):string;
	var i: integer;
	begin
		for i:=1 to length(str) do
		begin
			ClearDevice;
			SetBkColor(15);
			SetColor(10);
			Rectangle(195, 200, 350, 250);
			OutTextXY(200, 200,  str);
			if str[i]='_' then
			begin
				str[i]:=ReadKey;
			end;
		end;
		TextArea:=str;
	end;
	

	Var D, M, K, I, number: integer;

begin
	D:= detect;
	InitGraph(D, m, 'C:\Program Files (x86)\SchoolPak\pak\BP\EGAVGA.BGI');
	SetColor(10);
	SetLineStyle (0, 0, 3);
	SetTextStyle(4, 0, 5);
	Val(Copy(TextArea('M=__'), 3, 2), M, M);
	Val(Copy(TextArea('K=__'), 3, 2), K, K);
	Val(Copy(TextArea('I=__'), 3, 2), I, I);
	number:=StartGame(M, K, I, 0);
	repeat
	begin
		if intkey = 27 then break;
		SetColor(10);
		number:=StartGame(M, K, I, number);
	end;
	until false;
	closeGraph;
end.

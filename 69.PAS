Program program1;
	Uses graph, Crt, WinDOS;
	var D, m, x, y, r: integer;
	Var H, Mi, Sec, S100: word;
	var i, i1: real;
		P1, P2 : Pointer;
		Size : Word;
	Function CordX(minute: real; r: integer) : integer;
	begin
		CordX:=Round(320+r*Cos((minute-15)*Pi/30));
	end;

	Function CordY(minute: real; r: integer) : integer;
	begin
		CordY:=Round(240+r*Sin((minute-15)*Pi/30));
	end;

begin
	D:= detect;
	x:=320;
	y:=240;
	r:=191;
	InitGraph(D, m, 'C:\Program Files (x86)\SchoolPak\pak\BP\EGAVGA.BGI');
	If  GraphResult = 0 then
	begin
		i1:=0;
		GetTime(H, Mi, Sec, S100);
		i:= 3600*(H/1) + 60*Mi + Sec + S100/100;
		SetBkColor(15);
		SetColor(8);
		SetLineStyle (0, 0, 3);
		Circle (x, y, r);
		SetTextStyle(4, 0, 5);
		OutTextXY(299, 60, '12');
		OutTextXY(310, 375, '6');
		Size := ImageSize(120, 40, 520, y);
		GetMem(P1, Size);
		GetImage(120, 40, 520, y, P1^);
		Size := ImageSize(120, y, 520, 440);
		GetMem(P2, Size);
		GetImage(120, y, 520, 440, P2^);
		while true do
		begin
			GetTime(H, Mi, Sec, S100);
			i:= 3600*(H/1) + 60*Mi + Sec + S100/100;
			if i - 0.1 >= i1 then
			begin
				i1:=i;
				PutImage(120, 40, P1^, NormalPut);
				PutImage(120, y, P2^, NormalPut);
				SetColor(8);
				SetLineStyle (0, 0, 3);
				Line (x, y, Round(320+100*Cos(((i/3600)-3)*Pi/6)), Round(240+100*Sin(((i/3600)-3)*Pi/6))); {Hours}
				SetLineStyle (0, 0, 1);
				Line (x, y, CordX(i/60, 128), CordY(i/60, 128)); {Minutes}
				SetColor(13);
				Line (x, y, CordX(i, 164), CordY(i, 164)); {Second}
			end;
		end;
	readln;
	closeGraph;
	end
	else writeln ('Error');
end.

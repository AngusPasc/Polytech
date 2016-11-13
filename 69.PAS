Program program1;
	Uses graph, Crt, WinDOS;
  Const x=320;
		y=240;
		r=191;

	var D, m, DelayTime: integer;
	Var H, Mi, Sec, S100, intkey: word;
	var i, i1: real;
	var str, str1: string;
	Function CordX(minute: real; r: integer) : integer;
	begin
		CordX:=Round(320+r*Cos((minute-15)*Pi/30));
	end;

	Function CordY(minute: real; r: integer) : integer;
	begin
		CordY:=Round(240+r*Sin((minute-15)*Pi/30));
	end;

	Procedure MakePattern(var P1: Pointer; var P2: Pointer);
	var i:real;
	var Size: word;
	begin
		ClearDevice;
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
	end;
	
	Function SetDelay : integer;
	var i, i1: real;
	var m: word;
	Var H, Mi, Sec, S100, UserDelay, TimeQuestion: word;
	var P1, P2 : Pointer;
	begin
		MakePattern(P1, P2);
		SetTextStyle(4, 0, 5);
		OutTextXY(80, 0, 'Please, wait a few seconds');
		m:=0;
		GetTime(H, Mi, Sec, S100);
		UserDelay:=0;
		TimeQuestion:=0;
		i:= 3600*(H/1) + 60*Mi + Sec + S100/100;
		i1:=i;
		repeat
		begin
			if keypressed then 
			begin
				while keypressed do readkey; 
				break;
			end;
			Delay(UserDelay);
			if TimeQuestion = 1 then
			begin
				GetTime(H, Mi, Sec, S100);
				i:= 3600*(H/1) + 60*Mi + Sec + S100/100;
			end
			else
			begin
				i:= i {+ DelayTime/1000} + 65/1000;
			end;
			PutImage(120, 40, P1^, NormalPut);
			PutImage(120, y, P2^, NormalPut);
			SetColor(8);
			SetLineStyle (0, 0, 3);
			Line (x, y, Round(320+100*Cos(((i/3600)-3)*Pi/6)), Round(240+100*Sin(((i/3600)-3)*Pi/6))); {Hours}
			SetLineStyle (0, 0, 1);
			Line (x, y, CordX(i/60, 128), CordY(i/60, 128)); {Minutes}
			SetColor(13);
			Line (x, y, CordX(i, 164), CordY(i, 164)); {Second}
			m:=m+1;
		end;
		until m>1000;
		GetTime(H, Mi, Sec, S100);
		i:= 3600*(H/1) + 60*Mi + Sec + S100/100;
		SetDelay:= Round(((i-i1)/m)*1000);
	end;
	
	
	
	Function TextArea(str: string):string;
	var i: integer;
	begin
		for i:=1 to length(str) do
		begin
			ClearDevice;
			SetBkColor(15);
			SetColor(10);
			SetLineStyle (0, 0, 3);
			SetTextStyle(4, 0, 5);
			Rectangle(195, 200, 400, 250);
			OutTextXY(200, 200,  str);
			if str[i]='_' then
			begin
				str[i]:=ReadKey;
			end;
		end;
		TextArea:=str;
	end;
	
	Function RealTimeQuestion:word;
	var i: integer;
	var c:char;
	begin
		ClearDevice;
		SetBkColor(15);
		SetColor(10);
		SetLineStyle (0, 0, 3);
		SetTextStyle(4, 0, 5);
		OutTextXY(170, 200, 'Real time? Y/N');
		c:=ReadKey;
		if (c ='Y') or (c ='y') or (c ='н') or (c ='Н') then
		begin
			RealTimeQuestion:=1;
		end
		else
		begin
			RealTimeQuestion:=0;
		end;
	end;
	
	Procedure RealTime(DelayTime: integer; var intkey: word);
	var i, k: real;
	Var S100, TimeQuestion, H, Mi, Sec, UserDelay: word;
	var P1, P2 : Pointer;
	begin
		k:=1;
		TimeQuestion:= RealTimeQuestion;
		str:= TextArea('____ms.');
		Val((Copy(str, 1, 4)), UserDelay, UserDelay);
		i:= 3600*(H/1) + 60*Mi + Sec;
		if TimeQuestion = 1 then
		begin
			GetTime(H, Mi, Sec, S100);
			i:= 3600*(H/1) + 60*Mi + Sec + S100/100;
		end
		else
		begin
			str:= TextArea('__:__:__');
			Val((Copy(str, 1, 2)), H, H);
			Val((Copy(str, 4, 2)), Mi, Mi);
			Val((Copy(str, 7, 2)), Sec, Sec);
			i:= 3600*(H/1) + 60*Mi + Sec;
		end;
		MakePattern(P1, P2);
		if UserDelay >= DelayTime then 
		begin
			UserDelay:=UserDelay-DelayTime;
		end
		else 
		begin
			UserDelay:=0;
		end;
		repeat
		begin
			if keypressed then 
			begin
				intkey:= Ord(readkey);
				if intkey = 0 then
				begin
					intkey:= Ord(readkey);
					while keypressed do readkey; 
					if intkey = 72 then k:=k*2
					else if intkey = 80 then k:=k/2
					else if intkey = 77 then k:=k*1.1
					else if intkey = 75 then k:=k/1.1
					else break;
				end
				else break;
			end;
			Delay(UserDelay);
			if TimeQuestion = 1 then
			begin
				GetTime(H, Mi, Sec, S100);
				i:= 3600*(H/1) + 60*Mi + Sec + S100/100;
			end
			else
			begin
				i:= i + k* ((DelayTime + UserDelay)/1000);
			end;
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
		until false;
	end;

begin
	D:= detect;
	InitGraph(D, m, 'C:\Program Files (x86)\SchoolPak\pak\BP\EGAVGA.BGI');
	DelayTime:= SetDelay;
	repeat
	begin
		if intkey = 27 then break;
		RealTime(DelayTime, intkey);
	end;
	until false;
	closeGraph;
end.

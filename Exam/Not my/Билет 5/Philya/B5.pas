type
  List=^TList;  
  TList=record
    Num:Integer;
	Name:string[10];
    next, 
    prev:List;
  end;

procedure P1(var nach,ends:List; num:integer; const name:string); {const - ⮫쪮 ��� �⥭��}
var tmp,rab:list; tmpNum:integer; tmpAuthor,tmpName:string[10];
begin
  if not Assigned(nach) then {�� ���� �� ᯨ᮪, �᫨ ����, �}
  begin
    Getmem(nach,SizeOf(TList)); 
    nach^.next:=nil; {������� �� ���뢠�� "�������" 㪠��⥫�}
    nach^.prev:=nil; {�������筮}
    ends:=nach; {�����塞 㪠��⥫� ���� ᯨ᪠}
  end
  else {�᫨ ᯨ᮪ �� ����}
  begin
    GetMem(ends^.next,SizeOf(Tlist)); {ᮧ��� ���� �����}
    ends^.next^.prev:=ends; {��� ������ ����� � ��᫥���� ����⮬ ᯨ᪠}
    ends:=ends^.next;{����� ᯨ᪠ ��������� � �� 㪠��⥫� "����⠢�塞"}
    ends^.next:=nil; {�� ���뢠�� "�������" 㪠��⥫�}
  end;
  ends^.num:= num; ends^.name:= name;
end;

procedure P2(FileName:string; nach,ends:List);
var output:text; i:shortint; b:boolean;
begin
Assign(output, FileName);
Rewrite(output);
b:=false;
repeat
Writeln('� ����� ��஭� �뢮����?');
Writeln('0 - �����. 1 - �����.');
Readln(i);
if (i=0) or (i=1) then b:=true else
begin
Writeln('����ୠ� �������, ������ ��� ࠧ.');
Writeln;
Writeln('������ Enter, �⮡� �த������...'); Readln; end;
until b;
case i of
 0 : begin
		while Assigned(nach) do
		begin
		 Writeln(output, nach^.num,' ', nach^.name);
		 nach:=nach^.next;
		end;
	 end;
 1 : begin
 		while Assigned(ends) do
		begin
		 Writeln(output, ends^.num,' ', ends^.name);
		 ends:=ends^.prev;
		end;
	 end;
else Writeln('����ୠ� ��������.');
end;
close(output);

end;

procedure AddToSortListByInt(var nach:List; num:integer; const name:string); {const - ⮫쪮 ��� �⥭��}
var p,q:list;
begin
 New(p); { ������� ���������� ��६�����-������ }
 { �����頥� ����� � ����� ����� }
 p^.num:= num; p^.name:= name;
 p^.next:=nil;
 { �᫨ ᯨ᮪ ����... }
 if not Assigned(nach)
	then nach:=p { �᫨ ᯨ᮪ ����, ������ 㪠�뢠�� �� ����� ������ }
	else begin { �᫨ ᯨ᮪ �� ����: }
		q:= nach; { ���� ���� ��⠢�� ��稭��� � ������ }
		{ ��������� �� ᯨ��, ���� ᫥���騩 ����� �������
		 � ��� ����� ����� ��⠢�塞��� }
		while Assigned(q^.next) and (q^.next^.num < num)
		do q:=q^.next;
		if q^.num > num then begin
		{ ��⠢�� �� ��ࢮ� ���� }
	 	 p^.next:=nach; { ���� �⠭������ ���� }
		 nach:=p; { � ⥪�騩 - ���� }
		end else begin
		{ ��⠢�� � �।��� ��� � ���� ᯨ᪠ }
		 p^.next:=q^.next; { ��뢠�� ⥪�騩 � ᫥���騬 }
		 q^.next:=p; { ��뢠�� �।��騩 � ⥪�騬 }
		end
	end
end;

procedure AddToSortListByString(var nach:List; num:integer; const name:string);
var p,q:list;
begin
 New(p);
 p^.num:= num; p^.name:= name;
 p^.next:=nil;
 if not Assigned(nach)
	then nach:=p
	else begin
		q:= nach;
		while Assigned(q^.next) and (q^.next^.name[2] < name[2])
		{�� ��ன NAME[2], ��⮬� �� ���� ᨬ��� - �஡��}
		do q:=q^.next;
		if q^.name[2] > name[2] then begin {�� ��ன NAME[2], ��⮬� �� ���� ᨬ��� - �஡��}
	 	 p^.next:=nach;
		 nach:=p;
		end else begin
		 p^.next:=q^.next;
		 q^.next:=p;
		end
	end
end;

procedure P3(nach,ends:List; var lOut1,lOut2:list);
begin
lOut1:=nil; lOut2:=nil;
while Assigned(nach) do
begin
 AddToSortListByInt(lOut1,nach^.num,nach^.name);
 nach:=nach^.next
end;
while Assigned(ends) do
begin
 AddToSortListByString(lOut2,ends^.num,ends^.name);
 ends:=ends^.prev
end;
end;

procedure WriteToFile(R,S1,S2:list);
var output:text;
begin
Assign(output, 'B5_F2.OUT');
Rewrite(output);
Writeln(output, '���� ᯨ᮪ (R):');
While Assigned(R) do
begin
 Writeln(output, R^.num,' ',R^.name);
 R:=R^.next;
end;
Writeln(output);
Writeln(output, '��ன ᯨ᮪ (S1):');
While Assigned(S1) do
begin
 Writeln(output, S1^.num,' ',S1^.name);
 S1:=S1^.next;
end;
Writeln(output);
Writeln(output, '��⨩ ᯨ᮪ (S2):');
While Assigned(S2) do
begin
 Writeln(output, S2^.num,' ',S2^.name);
 S2:=S2^.next;
end;
close(output);
end;

var R,Rend,S1,S2:List; Rec:Tlist;
	input:text;
begin
Assign(input, 'B5_F1.IN');
Reset(input);
while not Eof(input) do
with Rec do
begin
 Readln(input, num, name);
 P1(R,Rend,num,name);
end;
close(input);
Writeln('����� �������� 䠩�� ��� �믮������ ��楤��� P2:'); Readln(Rec.name);
P2(Rec.name,R,Rend);
P3(R,Rend,S1,S2);
WriteToFile(R,S1,S2);
end.
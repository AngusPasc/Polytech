program ex6;

type

t=^el;
el = record
name:string[10];
kol:integer;
sl:t;
end;

procedure putsp(var uksp_s,uksp_z:t;var f,h:text); {ᮧ���� 2 ᯨ᪠. ���� ��� ᪫���, ��㣮� ��� ���}
var
ukzv:t;
begin
new(ukzv);           {�ନ�㥬 ᪫��}
uksp_s:=ukzv;
uksp_s^.sl:=nil;
while not EOF(f) do begin
new(ukzv^.sl);
ukzv:=ukzv^.sl;
readln(f,ukzv^.name,ukzv^.kol);
ukzv^.sl:=nil;
end;
new(ukzv);        {�ନ�㥬 ���}
uksp_z:=ukzv;
uksp_z^.sl:=nil;
while not EOF(h) do begin
new(ukzv^.sl);
ukzv:=ukzv^.sl;
readln(h,ukzv^.name,ukzv^.kol);
ukzv^.sl:=nil;
end;
end;

procedure getsp(var uksp_s,uksp_z:t; var g:text); {���� ��楤�� �뢮�� ���� ᯨ᪮� ���� ��� ��㣨�}
var
ukzv:t;
begin
writeln(g,'Na sklade:');
ukzv:=uksp_s^.sl;
while ukzv<>nil do begin
writeln(g,ukzv^.name,ukzv^.kol);
ukzv:=ukzv^.sl;
end;
writeln(g);
writeln(g,'Spisok zayavok:');
ukzv:=uksp_z^.sl;
while ukzv<>nil do begin
writeln(g,ukzv^.name,ukzv^.kol);
ukzv:=ukzv^.sl;
end;
end;

procedure correction(var uksp_s,uksp_z:t);  {��楤�� ���४�஢�� ���祭��}
var
ukzv,temp,p,f:t;  {temp - ����騩 㪠��⥫� ��� ���, ukzv - ��� ᪫���}
begin
temp:=uksp_z^.sl;
p:=uksp_z;  {�।��騩 �������, �㦥� ��� dispose ���, ����� 㤮���⢮७�}
while temp<>nil do begin  {�஡����� �� �ᥬ ���� � �饬 �� ᮮ⢥��⢨� �� ᪫���}
 f:=temp^.sl; {᫥�. �������, ⮦� �㦥� ��� dispose ����}
 ukzv:=uksp_s^.sl;
 while ukzv<>nil do begin
  if temp^.name = ukzv^.name then begin {�᫨ ����� ⠬ � ⠬ ࠢ��, � ��������㥬 ������⢮ � ������ ����室��� ����樨}
   if temp^.kol <= ukzv^.kol then begin
    ukzv^.kol:= ukzv^.kol - temp^.kol;
    dispose(temp);    {�� ᠬ� ��ᯮ� - 㤠����� 㤮���⢮७��� ���}
    p^.sl:=f;
   end;
   if temp^.kol > ukzv^.kol then begin
    temp^.kol:= temp^.kol - ukzv^.kol;
    ukzv^.kol:=0;
    end;
  end;       {����� ��ࠡ�⪨}
  ukzv:=ukzv^.sl;
  end;
  p:=temp; {������ �।��饣� ������� ��� ��ᯮ㧠}
  temp:=temp^.sl;
end;
end;

var
f,h,g:text;
uksp_s,uksp_z:t;

begin             {��������, �� ��� �� ����⭮}
assign(f,'ex6-1.inp');
assign(g,'ex6.out');
assign(h,'ex6-2.inp');
reset(f);
reset(h);
rewrite(g);
putsp(uksp_s,uksp_z,f,h);
close(f);
close(h);
writeln(g,'Do obrabotki:');
getsp(uksp_s,uksp_z,g);
correction(uksp_s,uksp_z);
writeln(g);
writeln(g,'Posle obrabotki:');
getsp(uksp_s,uksp_z,g);
close(g);
end.
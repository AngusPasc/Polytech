{�������� �⥪� �� ��䠢�⭮�� ᯨ᪠
�뢮� �⮣� �⥪� � ���⭮� ���浪�, �.�. ���� ����ᠭ�� ��室�� ����
��⠢�� � �㦭�� ���� �⥪� ����� 䠬���� �� ��ண�, �����஢. ᯨ᪠}

program bilet08;
uses crt;

type
    a = ^stack;
    stack = record
      fam: string;
      pred: a;
      check: boolean;
    end;

procedure makestack(var last: a);    {������� �⥪}
var
f: text;
uk: a;
begin
assign(f,'sort.inp');
reset(f);
new(uk);
uk^.pred:=nil;       {������� ���� ������� � ��� 㪠���. nil}
readln(f,uk^.fam);
last:=uk;
uk^.check:=true;   {����⨫� ��� ��� ������ ������� �⥪� ��� �뢮��}
while not eof(f) do begin
new(uk);
uk^.pred:=last;    {������ ��� ������ ������� �� ������}
readln(f,uk^.fam);
last:=uk;          {���������� ����� ������ � ���孨� �������}
end;
close(f);
end;

procedure vivod(var head1: a;var f: text);
label 1;
var
uk: a;
begin
uk:=head1;                  {���⠢��� 㪠� �� ������}
1: while uk^.pred^.check<> true do     {�஡����� 横��� �� �⬥祭���� ��}
uk:=uk^.pred;                                                 {�뢮�}
if uk<>head1 then begin        {�᫨ �� ��⠫��� � ������, �}
   writeln(f,uk^.pred^.fam);   {�뢮��� ������ �� ⮣�, �� ���஬ �⮨�}
   uk^.check:=true;            {����砥� �����騩 ������� ��� �뢮��}
   uk:=head1;                  {���� ���⭮ � ������ � �����塞 横�}
goto 1;
end
else begin                   {�᫨ ��⠫��� 㪠��⥫�� � ������}
   writeln(f,uk^.pred^.fam);  {�뢮��� ������ � ������}
   uk^.check:=true;           {������ ������ ��� �뢥������}
   writeln(f,uk^.fam);        {�뢮��� ������}
end;
uk:=head1;                    {��� ����୮�� �뢮�� ����� ������}
while uk^.pred<>nil do begin  {祪� � ��������, �஬� ᠬ��� �������}
uk^.check:=false;
uk:=uk^.pred; end;
end;

procedure adding(var last: a);
var
f: text;                 {temp - �⠥� �� 䠩��, uk - ����騩,obmen - }
uk,obmen,temp: a;
begin
assign(f,'other.inp');
reset(f);
new(obmen);
while not eof(f) do begin
new(temp);                   {�뤥�塞 ���� ��� ������ ������� � �⠥�}
readln(f,temp^.fam);
uk:=last;                    {㪠��⥫� ��堥� �� ������}
if uk^.fam < temp^.fam then begin   {�᫨ ���� ������� �����}
   obmen^.fam:=temp^.fam;
   temp^.fam:=uk^.fam;        {���塞 � ������ � ����� ���� ���⠬�}
   uk^.fam:=obmen^.fam;
   temp^.pred:=uk^.pred;      {� ���� ���ᨬ ���� ��᫥ ������}
   uk^.pred:=temp^.pred;
end;
if uk^.fam >= temp^.fam then begin       {�᫨ ���� �����}
   while (uk^.pred^.fam > temp^.fam) do begin  {�饬 ����}
   if uk^.pred=nil then break;
   uk:=uk^.pred; end;
   if uk^.pred=nil then begin    {�᫨ ���� ������ ���� ᠬ� ������}
   new(uk^.pred);
   uk^.check:=false;             {�� ᮧ���� ����� �祩�� � �����}
   uk:=uk^.pred;
   uk^.fam:=temp^.fam;           {� ����뢠�� � ��� ����� ������ �������}
   uk^.check:=true;
   dispose(temp); {����塞 ��譨� �६���� �������}
   end else begin         {�᫨ ���� �㤥� � �।���}
   temp^.pred:=uk^.pred;  {���� ��४��뢠�� 㪠��⥫�}
   uk^.pred:=temp;
   {temp^.check:=false;} {����易⥫쭮}
   end;
end;
end;
close(f);
end;

var
head: a;
f1: text;

begin
clrscr;
makestack(head);
assign(f1,'rez.out');
rewrite(f1);
writeln(f1,'  �� ��⠢��:');
vivod(head,f1);
adding(head);
writeln(f1,'  ��᫥ ��⠢��:');
vivod(head,f1);
writeln('Done');
close(f1);
readkey;
end.
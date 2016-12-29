program bilet10;
uses crt;

type
    uk = ^elem;
    elem = record
         fam : string;
         next, prev : uk;
         end;

var first, last : uk;
    F1, F3: text;

procedure p1(var first, last : uk);
var p, before: uk;
begin
    new(p);
    p^.next := nil;
    p^.prev := nil;
    first := p;
    last := p;

    while not eof(F1) do
    begin
        new(p^.next);
        p := p^.next;
        p^.prev := last;
        readln(F1, p^.fam);
        last := p;
    end;

    new(p^.next);
    p := p^.next;
    p^.prev := last;
    last := p;
    last^.next := nil;
end;

procedure p2(var first, last: uk);
var n: string; cur: uk;
begin
    writeln('print right or left?');
    readln(n);
    if n = 'right' then
    begin
       cur := first^.next;
       while cur^.next <> nil do
       begin
           writeln(F3, cur^.fam);
           cur := cur^.next;
       end;
    end
    else if n = 'left' then
    begin
       cur := last^.prev;
       while cur <> first do
       begin
           writeln(F3, cur^.fam);
           cur := cur^.prev;
       end;
    end;
    writeln(F3);
end;
         {
procedure p33(var first, last: uk);
var cur : uk;
begin
    cur := first^.next^.next;
    while (cur <> nil) or (cur^.next <> nil) do
    begin
       writeln(F3, cur^.fam);
       cur := cur^.next^.next;
    end;
end;      }

procedure p3(var first, last: uk);
var cur, sled: uk;
begin
    cur := first;
    while (cur^.next^.next <> nil) do
    begin
       sled := cur^.next^.next;
       cur^.next := sled;
       sled^.prev := cur;
       cur := sled;
    end;
    if sled <> last then
    begin
    sled^.next := last;
    last^.prev := sled;
    end;
end;

begin
    clrscr;
    assign(F1,'f10.inp');
    reset(F1);
    assign(F3,'f10.out');
    rewrite(F3);

    p1(first, last);
    p2(first, last);

    p3(first, last);
    p2(first, last);

    close(F1);
    close(F3);
end.
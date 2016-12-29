program bilet3;
uses crt;

type
    uk = ^elem;
    elem = record
         num : integer;
         author: string;
         name: string;
         next, prev: uk;
         end;

var first, last: uk;
    F1, F2: text;

procedure p1(var first, last: uk);
var nov, p: uk;
    str: string; i, j: integer;
begin
    new(p);
    p^.next := nil;
    p^.prev := nil;
    first := p;
    new(p^.next);
    p := p^.next;
    p^.next := nil;
    p^.prev := first;
    last := p;

    while not eof(F1) do
    begin
        new(nov);
        readln(F1, str);
        i := 1;
        nov^.num := 0;
        while str[i] <> ' ' do
        begin
            nov^.num := nov^.num * 10 + ord(str[i]) - 48;
            i := i + 1;
        end;
        i := i + 1;
        j := i;
        while str[j] <> ' ' do
          j := j + 1;
        nov^.author := copy(str, i, j - i);
        i := j +1 ;
        nov^.name := copy(str, i, length(str) - i + 1);

        p := first;
        while (p^.next^.next <> nil) and (p^.next^.num < nov^.num) do
           p := p^.next;
        nov^.next := p^.next;
        p^.next := nov;
        nov^.prev := p;
        p := nov^.next;
        p^.prev := nov;
    end;
end;

procedure p2(var first, last: uk);
var nov, p: uk;
    str: string;
    i, j: integer;
begin
    writeln('Enter new:');
    new(nov);
        readln(str);
        i := 1;
        nov^.num := 0;
        while str[i] <> ' ' do
        begin
            nov^.num := nov^.num * 10 + ord(str[i]) - 48;
            i := i + 1;
        end;
        i := i + 1;
        j := i;
        while str[j] <> ' ' do
          j := j + 1;
        nov^.author := copy(str, i, j - i);
        i := j +1 ;
        nov^.name := copy(str, i, length(str) - i + 1);

        p := first;
        while (p^.next^.next <> nil) and (p^.next^.num < nov^.num) do
           p := p^.next;
        nov^.next := p^.next;
        p^.next := nov;
        nov^.prev := p;
        p := nov^.next;
        p^.prev := nov;
end;

procedure p3(var first, last: uk);
var cur: uk;
begin
    cur := first^.next;
    while cur^.next <> nil do
    begin
        writeln(F2, cur^.num:2, ' ', cur^.author,' ', cur^.name);
        cur := cur^.next;
    end;
    writeln(F2);

    cur := last^.prev;
    while cur^.prev <> nil do
    begin
        writeln(F2, cur^.num:2, ' ', cur^.author,' ', cur^.name);
        cur := cur^.prev;
    end;
    writeln(F2);
    writeln(F2,'***************************');
    writeln(F2);
end;

procedure p4;
var tg: string; p: uk;
begin
   writeln;
   writeln('Find Author:');
   readln(tg);

   writeln(F2, 'author: ');
   p := first;
   while p^.next <> nil do
   begin
       if p^.author = tg then
           writeln(F2, 'book: ', p^.name);
       p := p^.next;
   end;
end;


BEGIN
    clrscr;
    assign(F1, 'f3.inp');
    reset(F1);
    assign(F2, 'f3.out');
    rewrite(F2);

    p1(first, last);
    p3(first, last);

    p2(first, last);
    p3(first, last);

    p4;

    close(F1);
    close(F2);
end.
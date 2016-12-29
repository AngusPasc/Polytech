program bilet12;

type
    uk = ^sach;
    sach = record
         num: integer;
         tg : string[10];
         ts : string[10];
         year: integer;
         price : integer;
         prev, next : uk;
         end;

var first, last : uk;
    F1, F2: text;

procedure p1(var first, last: uk);
var nov : uk;
begin
    new(nov);
    nov^.prev := nil;
    nov^.next := nil;
    readln(F1, nov^.num, nov^.tg, nov^.ts, nov^.year, nov^.price);
    first := nov;
    last := nov;
    while not eof(F1) do
     begin
         new(nov^.next);
         nov := nov^.next;
         nov^.prev := last;
         nov^.next := nil;
         readln(F1, nov^.num, nov^.tg, nov^.ts, nov^.year, nov^.price);
         last := nov;
     end;
end;

procedure p2(var first, last: uk);
var cur : uk;
begin
    writeln(F2,'from first to last:');
    cur := first;
    while cur <> nil do
     begin
         writeln(F2, cur^.num,'  ', cur^.tg,'  ', cur^.ts,'  ',cur^.year,'  ',cur^.price);
         cur := cur^.next;
     end;
    writeln(F2);
    writeln(F2,'from last to first:');
    cur := last;
    while cur <> nil do
     begin
         writeln(F2, cur^.num,'  ', cur^.tg,'  ',cur^.ts,'  ',cur^.year,'  ',cur^.price);
         cur := cur^.prev;
     end;
end;

procedure p3(var first, last : uk);
var cur, p, q, t : uk;
begin
    cur := first;
    while cur <> last do
     begin
       p := cur;
       q := cur^.next;
       while q <> first do
        begin
          if q^.tg < p^.tg then
           begin
             new(t);
             t^.tg := p^.tg; t^.ts := p^.ts; t^.year := p^.year; t^.price := p^.price;
             p^.tg := q^.tg; p^.ts := q^.ts; p^.year := q^.year; p^.price := q^.price;
             q^.tg := t^.tg; q^.ts := t^.ts; q^.year := t^.year; q^.price := t^.price;
             dispose(t);
           end;
          q := q^.prev;
          p := p^.prev;
        end;
       cur := cur^.next;
     end;
end;

BEGIN
    assign(F1,'f12.inp');
    reset(F1);
    assign(F2,'f12.out');
    rewrite(F2);

    p1(first,last);
    p2(first, last);
    writeln(F2,'***********************');
    p3(first,last);
    p2(first, last);

    close(F1);
    close(F2);
end.
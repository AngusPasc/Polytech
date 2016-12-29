program bilet5;

type
    uk = ^tro;
    tro = record
        fam: string[10];
        num : integer;
        prev, next : uk;
        end;

var first, last, first1, last1, first2, last2 : uk;
    F1, F3: text;

procedure p1(var H: text; var first, last: uk);
var nov: uk;
begin
    new(nov);
    nov^.prev := nil; nov^.next := nil;
    readln(H, nov^.fam, nov^.num);
    first := nov;
    last := nov;
    while not eof(H) do
     begin
         new(nov^.next);
         nov := nov^.next;
         nov^.prev := last;
         nov^.next := nil;
         readln(H, nov^.fam, nov^.num);
         last := nov;
     end;
end;

procedure p2(var G: text; var first, last: uk);
var cur : uk;
begin
    cur := first;
    while cur <> nil do
     begin
         writeln(G, cur^.fam, cur^.num);
         cur := cur^.next;
     end;
end;

procedure p3(var first1, last1, first2, last2: uk);
var cur, p, q, t : uk;
begin
    first1 := first;
    cur := first1;
    while cur <> last do
     begin
         p := cur;
         q:= cur^.next;
         while q <> first do
          begin
              if q^.fam < p^.fam then
                 begin
                    new(t);
                    t^.fam := p^.fam; t^.num := p^.num;
                    p^.fam := q^.fam; p^.num := q^.num;
                    q^.fam := t^.fam; q^.num := t^.num;
                    dispose(t);
                 end;
              p := p^.prev;
              q := q^.prev;
          end;
         cur := cur^.next;
     end;
    last1 := cur;

    first2 := first;
    cur := first2;
    while cur <> last do
     begin
         p := cur;
         q:= cur^.next;
         while q <> first do
          begin
              if q^.num < p^.num then
                 begin
                    new(t);
                    t^.fam := p^.fam; t^.num := p^.num;
                    p^.fam := q^.fam; p^.num := q^.num;
                    q^.fam := t^.fam; q^.num := t^.num;
                    dispose(t);
                 end;
              p := p^.prev;
              q := q^.prev;
          end;
         cur := cur^.next;
     end;
    last2 := cur;
end;

BEGIN
    assign(F1,'f5.inp');
    reset(F1);
    assign(F3,'f5.out');
    rewrite(F3);

    p1(F1, first, last);
    p2(F3, first, last);
    writeln(F3);
    p3(first1, last1, first2, last2);
    p2(F3, first1, last1);
    writeln(F3);
    p2(F3, first2, last2);

    close(F1);
    close(F3);
end.
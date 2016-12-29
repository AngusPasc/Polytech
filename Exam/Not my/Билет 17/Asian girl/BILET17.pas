program bilet17;

type
    data = record
         num: integer;
         name: string;
         end;
    ff = file of data;

    uk = ^elem;
    elem = record
         inf: data;
         next: uk;
         end;

var first1, first2: uk;
    H1, H2: ff;
    F1, F2, F3: text;

procedure p1(var H: ff; var G: text);
var a: data;
begin
    while not eof(G) do
     begin
         readln(G, a.num, a.name);
         write(H, a);
     end;
end;

procedure p5(var first: uk);
var cur: uk;
begin
    cur := first^.next;
    while cur^.next <> nil do
     begin
         writeln(f3,cur^.inf.num, ' ', cur^.inf.name);
         cur := cur^.next;
     end;
end;

procedure p2(var H: ff; var first: uk);
var cur, nov, pred: uk;
begin

    new(first);
    first^.inf.name := 'a';
    first^.next := nil;

    new(first^.next);
    first^.next^.next := nil;
    first^.next^.inf.name := 'ZZZZZZZZZ';

    while not eof(H) do
     begin
         cur := first^.next;
         pred := first;

         new(nov);
         read(H, nov^.inf);

         while (cur <> nil) and
         (cur^.inf.name < nov^.inf.name) do
         begin
              pred := cur;
               cur := cur^.next;
         end;

         pred^.next := nov;
         nov^.next := cur;
     end;
end;

procedure p4(var first1, first2: uk);
var pred, p1, p2, temp: uk;
begin
    pred := first1;
    p1 := pred^.next;
    p2 := first2^.next;
    while p1 <> nil do
     begin
         if p2^.inf.name < p1^.inf.name then
           begin
               temp := p2;
               p2 := p2^.next;
               pred^.next := temp;
               temp^.next := p1;
           end;
         pred := pred^.next;
         p1 := pred^.next;
     end;
end;



BEGIN
    assign(F3, 'f17.out');
    rewrite(F3);

    assign(F1, 'v1.inp');
    reset(F1);
    assign(H1, 'o1.tip');
    rewrite(H1);
    p1(H1, F1);
    close(H1);
    close(F1);

    assign(H1,'o1.tip');
    reset(H1);
    p2(H1, first1);
    close(H1);

    writeln(F3,'list1:');
    p5(first1);
    writeln(F3);


    assign(F2,'v2.inp');
    reset(F2);
    assign(H2, 'o2.tip');
    rewrite(H2);
    p1(H2, F2);
    close(H2);
    close(F2);

    assign(H2,'o2.tip');
    reset(H2);
    p2(H2, first2);
    close(H2);

    writeln(F3,'list2:');
    p5(first2);
    writeln(F3);


    writeln(F3,'2 list:');
    p4(first1, first2);
    p5(first1);

    close(F3);
end.
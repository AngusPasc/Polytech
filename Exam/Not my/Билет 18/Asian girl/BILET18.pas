program bilet18;
uses crt;

type
    uk = ^elem;
    elem = record
         num: integer;
         inf: string;
         next, sort: uk;
         end;

var root: uk;
    F1, F2: text;

procedure p1(var first: uk);
var p, ai, ci, bi, j, bm, am, min, temp, bj,cj, aj: uk;  {a-after, b-before}
begin
    new(p);
    first := p;
    while not eof(F1) do
    begin
        new(p^.next);
        p^.sort := p^.next;
        p := p^.next;
        readln(F1, p^.num, p^.inf);
    end;
    new(p^.next);
    p^.sort := p^.next;
    p^.next^.next := nil;
    p^.sort^.sort := nil;

    bi := first;
    ci := bi^.sort;
    while ci^.sort <> nil do
    begin
        ai := ci^.sort;
        bm := bi;
        min := ci;
        am := ai;

        bj := bi;
        cj := ci;
        while cj <> nil do
        begin
            aj := cj^.sort;
            if cj^.inf < min^.inf then
            begin
                bm := bj;
                min := cj;
                am := aj;
            end;
            bj := cj;
            cj := cj^.sort;
        end;

        if ai = min then
        begin
            bi^.sort := min;
            min^.sort := ci;
            ci^.sort := am;
        end
        else
        begin
            bi^.sort := min;
            min^.sort := ai;
            bm^.sort := ci;
            ci^.sort := am;
        end;
        temp := ci;
        ci := min;
        min := temp;

        bi := ci;
        ci := ci^.sort;
    end;
end;

procedure p2(var first: uk);
var j, nov, pred, cur : uk;
begin
    writeln('Enter new:');
    new(nov);
    readln(nov^.num, nov^.inf);

    j := first;
    while j^.next^.next <> nil do j := j^.next;
    nov^.next := j^.next;
    j^.next := nov;
                       {
    pred := first;
    cur := first^.sort;
    while (cur <> nil) and (cur^.inf < nov^.inf) do
    begin
       pred := pred^.sort;
       cur := cur^.sort;
    end;
    pred^.sort := nov;
    nov^.sort := cur;
                      }
    cur := first;
    while (cur^.sort <> nil) and (cur^.sort^.inf < nov^.inf) do
    cur := cur^.sort;
    nov^.sort := cur^.sort;
    cur^.sort := nov;
end;

procedure p3(var first: uk);
var cur: uk;
begin
    writeln(F2, 'by original:');
    cur := first^.next;
    while cur^.next <> nil do
    begin
        writeln(F2, cur^.num:2,' ', cur^.inf);
        cur := cur^.next;
    end;

    writeln(F2);
    writeln(F2, 'by sorted:');
    cur := first^.sort^.sort;
    while cur <> nil do
    begin
        writeln(F2, cur^.num:2,' ', cur^.inf);
        cur := cur^.sort;
    end;
end;

BEGIN
    clrscr;
    assign(F1,'f18.inp');
    reset(F1);
    assign(f2,'f18.out');
    rewrite(F2);

    p1(root);
    p3(root);
    writeln(F2,'***************************');
    p2(root);
    p3(root);

    close(F1);
    close(F2);
end.
program bilet13;
uses crt;
type
    uk = ^diem;
    diem = record
         x, y, f : integer;
         next : uk;
         end;

var first, first2, first3, cur : uk;
    F1, F2 : text;

procedure p1(var first : uk);
var cur, ukzv, t, before, nov : uk;
begin
    new(ukzv);
    readln(f1,ukzv^.x, ukzv^.y, ukzv^.f);
    ukzv^.next := nil;
    first := ukzv;
    while not eof(F1) do
      begin
          before := first;
          new(nov);
          readln(F1, nov^.x, nov^.y, nov^.f);
          while (before^.next <> nil) or (nov^.x >  before^.x) do
            before := befroe^.next;
          nov^.next := before^.next;
          before^.next := nov;
      end;
                               {
    cur := first;
    while cur <> nil do
      begin
          ukzv := cur^.next;
          while ukzv <> nil do
            begin
                if ukzv^.x < cur^.x then
                   begin
                       t^.x := ukzv^.x; t^.y := ukzv^.y; t^.f := ukzv^.f;
                       ukzv^.x := cur^.x; ukzv^.y := cur^.y; ukzv^.f := cur^.f;
                       cur^.x := t^.x; cur^.y := t^.y; cur^.f := t^.f;
                   end
                else if ukzv^.x = cur^.x then
                     if ukzv^.y < cur^.y then
                        begin
                            t^.y := ukzv^.y; t^.f := ukzv^.f;
                            ukzv^.y := cur^.y; ukzv^.f := cur^.f;
                            cur^.y := t^.y; cur^.f := t^.f;
                        end;
                ukzv := ukzv^.next;
            end;
          cur := cur^.next;
      end;                    }
end;

procedure p2(var first2 : uk);
label l1;
var p, q: uk;
begin
     p := first;
    l1: if p^.f <> 0 then begin
                                new(q);
                                q^.x := p^.x; q^.y := p^.y; q^.f := p^.f;
                                q^.next := nil;
                                first2 := q;
                          end
                     else begin p := p^.next; goto l1; end;
    while p <> nil do
      begin
          if p^.f <> 0 then begin new(q^.next); q := q^.next;
          q^.x := p^.x; q^.y := p^.y; q^.f := p^.f; q^.next := nil; end;
          p := p^.next;
      end;
end;

procedure p22(var first: uk);
var before, p , q: uk;
begin
    before := first;
    if before^.f = 0 then before := before^.next;
    while before <> nil do
    begin
        p := before^.next;
        if p^.f = 0 then before^.next := p^.next;
        before := before^.next;
    end;
end;

procedure p3(var first3 : uk);
label l2;
var p, q : uk;
    c: integer;
begin
    writeln('Enter c');
    readln(c);
    p := first;
   l2: if p^.f > c then begin new(q); q^.x := p^.x; q^.y := p^.y; q^.f := p^.f;
                    q^.next := nil; first3 := q; end
                  else begin p := p^.next; goto l2; end;

    while p <> nil do
      begin
          if p^.f > c then
             begin
                  new(q^.next); q := q^.next;
                 q^.x := p^.x;
                 q^.y := p^.y;
                 q^.f := p^.f;
                 q^.next := nil;

             end;
          p := p^.next;
      end;
                           {
    while p <> nil do
    begin
        if p^.y > c then
        begin
           if first3 = nil then
           begin
              new(q);
              q^.next := nil;
              q^.x := p^.x;
              q^.y := p^.y;
              q^.f := p^.f;
              first3  := q;
           end
           else
           begin
              new(q^.next);
              q := q^.next;
              q^.x := p^.x;
              q^.y := p^.y;
              q^.f := p^.f;
              q^.next := nil;
           end;
        end;
        p := p^.next;
    end;                  }
end;

procedure p4(var cur : uk);
begin
    while cur <> nil do
      begin
          writeln(F2, cur^.x:2,'  ', cur^.y:2,'  ', cur^.f:2);
          cur := cur^.next;
      end;
end;

BEGIN

    assign(F1,'bilet13.inp');
    reset(F1);
    assign(F2,'f13.out');
    rewrite(F2);

    writeln(F2, 'p1');
    writeln(F2);
    p1(first);
    cur := first;
    p4(cur);

    writeln(F2);
    writeln(F2, 'p2');
    p2(first2);
    cur := first2;
    p4(cur);

    writeln(F2);
    writeln(F2, 'p3');
    p3(first3);
    cur := first3;
    p4(cur);

    writeln(F2);
    writeln(F2,'p22');
    p22(first);
    cur := first;
    p4(cur);

    close(F1);
    close(F2);
end.
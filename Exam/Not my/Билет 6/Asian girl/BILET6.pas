program bilet6;

type
    uk = ^elem;
    elem = record
         sp: string[10];
         sl: integer;
         next : uk;
         end;

var first1, first2, first3: uk;
    F1, F2, F3: text;

procedure p1(var H: text; var first: uk);
var p : uk;
begin
    new(p);
    p^.next := nil;
    readln(H, p^.sp, p^.sl);
    first := p;
    while not eof(H) do
     begin
         new(p^.next);
         p := p^.next;
         p^.next := nil;
         readln(H, p^.sp, p^.sl);
     end;
end;

procedure p2(var G: text; var first: uk);
var cur : uk;
begin
    cur := first;
    while cur <> nil do
     begin
         writeln(G, cur^.sp, cur^.sl);
         cur := cur^.next;
     end;
end;

procedure p3(var first1, first2, first3: uk);
var a1, a2, temp, p: uk;
begin
    a1 := first1;
    while a1 <> nil do
     begin
         a2 := first2;
         while a2 <> nil do
          begin
              if a2^.sp = a1^.sp then
                 if a2^.sl < a1^.sl then begin
                                            a1^.sl := a1^.sl - a2^.sl;
                                            a2^.sl :=0;
                                         end
                                    else begin
                                            a2^.sl := a2^.sl - a1^.sl;
                                            a1^.sl := 0;
                                         end;
              a2:= a2^.next;
          end;
         a1 := a1^.next;
     end;

    a2 := first2;
    while a2 <> nil do
     begin                       {
         if a2^.sl = 0 then
            begin
               temp := a2;
               a2 := temp^.next;
               dispose(temp);
            end
         else a2 := a2^.next;   }
         if a2^.sl <> 0 then
            begin
              if first3 = nil then
                begin
                new(p);
                p^.next :=nil;
                p^.sp := a2^.sp;
                p^.sl := a2^.sl;
                first3 := p;
                end
              else begin
                new(p^.next);
                p := p^.next;
                p^.next :=nil;
                p^.sp := a2^.sp;
                p^.sl := a2^.sl;
              end;
            end;
         a2 := a2^.next;
     end;
end;

BEGIN
    assign(F1,'sklad.inp');
    reset(F1);
    assign(F2,'zayava.inp');
    reset(F2);
    assign(F3,'f6.out');
    rewrite(F3);

    p1(F1, first1);
    p1(F2, first2);
    writeln(F3,'sklad:');
    p2(F3, first1);
    writeln(F3);
    writeln(F3,'zayavka:');
    p2(F3, first2);
    writeln(F3,'**************************');
    p3(first1, first2, first3);
    writeln(F3,'sklad:');
    p2(F3, first1);
    writeln(F3);
    writeln(F3,'zayavka:');
    p2(F3, first3);

    close(F1);
    close(F2);
    close(F3);
end.
program bilet20;
uses crt;

type
    uk = ^elem;
    elem = record
         name : string[10];
         price: integer;
         day: string[10];
         num: integer;
         next: uk;
         end;

var first, last, cur: uk;
    F1, F2: text;

procedure p1(var first, last: uk);
var p: uk;
begin
    new(p);
    p^.next := nil;
    first := p;
    first^.name := 'AAAAA';
    first^.day := '00000000';
    while not eof(F1) do
     begin
         new(p^.next);
         p := p^.next;
         readln(F1, p^.name, p^.day, p^.price, p^.num);
         p^.next := nil;
     end;
    new(p^.next);
    p := p^.next;
    p^.next := nil;
    last := p;
    last^.name := 'ZZZZZ';
    last^.day := '9999999999';
end;

procedure p2(var first, last: uk);
var cur, nov: uk;
vstavleno: boolean;
begin
    new(nov);
    writeln('Enter new name:');
    readln(nov^.name);
    writeln('Enter day:');
    readln(nov^.day);
    writeln('Enter price:');
    readln(nov^.price);
    writeln('Enter num:');
    readln(nov^.num);

    vstavleno := false;
    cur := first^.next;
    while cur^.next <> nil do
     begin
         if (nov^.name = cur^.name) and (nov^.day = cur^.day)
         and (nov^.price = cur^.price) then
         begin
           cur^.num := cur^.num + nov^.num;
           vstavleno := true;
           break;
         end;
         cur := cur^.next;
     end;

    if vstavleno = false then
     begin
       cur := first;
       while cur^.next <> last do
       begin
         if nov^.name < cur^.next^.name then
         begin
             nov^.next := cur^.next;
             cur^.next := nov;
             break;
         end;
         cur := cur^.next;
       end;
     end;
end;

procedure p3(var first, last: uk);
var pred, cur, sled: uk; sort: boolean;
begin
 repeat
    sort := true;
    pred := first;
    cur := first^.next;
    sled := cur^.next;
    while sled^.next <> nil do
     begin
         if sled^.day > cur^.day then
           begin
               sort := false;
               cur^.next := sled^.next;
               sled^.next := cur;
               pred^.next := sled;
           end;
         pred := cur;
         cur := cur^.next;
         sled := cur^.next;
     end;
 until sort;
end;

procedure p4(var cur : uk);
begin
    while cur^.next <> nil do
     begin
         writeln(F2, cur^.name, cur^.day,' ', cur^.price:4,' ', cur^.num:4);
         cur := cur^.next;
     end;

end;

BEGIN
    clrscr;
    assign(F1, 'f20.inp');
    reset(F1);
    assign(F2, 'f20.out');
    rewrite(F2);

    p1(first, last);
    cur := first^.next;
    p4(cur);
    writeln(F2,'******************');
    p2(first, last);
    cur := first^.next;
    p4(cur);
    writeln(f2);
    p3(first, last);


    cur := first^.next;
    p4(cur);

    close(F1);
    close(f2);
end.
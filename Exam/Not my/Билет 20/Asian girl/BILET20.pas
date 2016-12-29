program bilet20;
uses crt;
label l1;

type
    data = record
       name : string[10];
       day : string[10];
       price, num : integer;
       end;
    ff = file of data;

    uk = ^sp;
    sp = record
       inf: data;
       next : uk;
       end;

var first, last, cur : uk;
    b : integer; str: data;
    F1: ff; F2: text;

procedure p1(var first, last: uk);
var p: uk;
    nov: data;
begin
    new(p);
    p^.next := nil;
    first := p;
    while not eof(F1) do
      begin
         new(p^.next);
         p := p^.next;
         read(F1, nov);
         p^.inf := nov;
      end;
    new(p^.next);
    p:= p^.next;
    last := p;
end;

procedure p2(var first,last: uk; var nov: data);
begin


  cur := first^.next;
  while cur <> nil do
  begin
    if (nov.name = cur^.inf.name) and (nov.day = cur^.inf.day)
    and (nov.price = cur^.inf.price)
       then cur^.inf.num := cur^.inf.num + nov.num
       else if cur = last then begin
                                   last^.inf := nov;
                                   new(last^.next);
                                   last := last^.next;
                                   last^.next := nil;
                                 end
                            else cur := cur^.next;
  end;
end;

procedure p3(var first, last: uk);
var pred, cur, sled : uk; sort :boolean;
begin
  repeat
    sort := true;
    pred := first;
    cur := pred^.next;
    sled := cur^.next;
    while sled^.next <> last do
     begin
         if sled^.inf.day < cur^.inf.day then
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

procedure p4(var first: uk);
var cur: uk;
begin
    cur := first^.next;
    while cur <> last do
     begin
         write(F2, cur^.inf.name, cur^.inf.day,'  ', cur^.inf.price:4,'  ', cur^.inf.num:3);
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
    p4(first);
    writeln(F2,'******************');
    writeln(F2);
l1: writeln('Enter new? Yes-1, No-0');
    readln(b);
    if b = 1 then
       begin
          writeln('Enter new:');
          read(str.name, str.day, str.price, str.num);
          p2(first,last,str);
          goto l1
       end;
    p3(first, last);
    p4(first);

    close(F1);
    close(F2);
end.
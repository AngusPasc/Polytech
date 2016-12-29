program bilet8;

type
    stack = ^elem;
    elem = record
         fam: string;
         next: stack;
         end;

procedure p1(var H: text; var top: stack);
var p: stack;
begin
    new(p);
    p^.next := nil;
    readln(H, p^.fam);
    {root := p;   }
    while not eof(H) do
    begin
        new(top);
        readln(H, top^.fam);
        top^.next := p;
        p := top;
    end;
    top := p;
end;

procedure p2(var G: text; var root: stack);
var top, p, head : stack;
begin
    top := root;
    new(p);
    p^.next := nil;
    p^.fam := top^.fam;
    top := top^.next;
    while top <> nil do
    begin
        new(head);
        head^.next := p;
        head^.fam := top^.fam;
        p := head;
        top := top^.next;
    end;

    while head <> nil do
    begin
        writeln(G, head^.fam);
        head := head^.next;
    end;
end;
                        {
procedure p2(var G: text; var top: stack);
var p: stack; s: string;
begin
   p := top;
   while p^.next <> nil do
   begin
       if p^.next^.next = nil then
       begin
          writeln(G, p^.next^.fam);
          p2(G, top);
       end
       else p := p^.next;
   end;
end;                    }

procedure p3(var G: text; var top: stack);
var nov, p : stack;
begin
  while not eof(G) do
  begin
    new(nov);
    readln(G, nov^.fam);
    if nov^.fam > top^.fam then
    begin
       nov^.next := top;
       top := nov;
    end
    else
    begin
       p := top^.next;
       while (p^.next <> nil) and (p^.next^.fam > nov^.fam) do
         p := p^.next;
       if p^.next <> nil then
       begin
         nov^.next := p^.next;
         p^.next := nov;
       end
       else
       begin
           p^.next := nov;
           nov^.next := nil;
       end;
    end;
  end;
end;

var root: stack;
    F1, F2, F3 : text;

BEGIN
    assign(F1,'v1f8.inp');
    reset(f1);
    assign(F2,'v2f8.inp');
    reset(F2);
    assign(F3,'f8.out');
    rewrite(F3);

    p1(F1, root);
    p2(F3, root);
    writeln(F3);

    p3(F2, root);
    p2(F3, root);

    close(F1);
    close(F2);
    close(F3);
end.
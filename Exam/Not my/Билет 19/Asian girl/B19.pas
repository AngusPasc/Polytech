program b19;

type
p = ^elem;
elem = Record
 s: string[15];
 prev, next: p;
 end;

var
inp, out: text;
root: p;

procedure p1(var root: p;var h:text);
var ci: p;
begin
  new(root);
  readln(h, root^.s);
  root^.prev := nil;
  root^.next := nil;
  ci := root;
  while not eof(h) do
  begin
     new(ci^.next);
     ci^.next^.prev := ci;
     ci := ci^.next;
     readln(h, ci^.s);
     ci^.next := nil;
  end;
end;
procedure p2(var root: p);
var ci, cj, min: p; tmp:string[15];
begin
  ci := root;
  while ci^.next <> nil do
  begin
    min := ci;
    cj := ci^.next;
    while cj <> nil do
    begin
      if cj^.s < min^.s then
        min := cj;
      cj := cj^.next;
    end;

    tmp := ci^.s;
    ci^.s := min^.s;
    min^.s := tmp;

    ci := ci^.next;
  end;
end;
procedure p3(root:p; var ff:text);
begin
  while root<> nil do
  begin
    writeln(ff, root^.s);
    root := root^.next;
  end;
  writeln(ff);
end;
procedure p4(var root:p);
var tmp: p;
begin
  while root<> nil do
  begin
    tmp := root;
    root := root^.next;
    dispose(tmp);
  end;
end;
begin
assign(inp, 'danvlad.inp');
reset(inp);
assign(out, 'rezvlad.out');
rewrite(out);

p1(root, inp);
p3(root, out);
p2(root);
p3(root, out);
p4(root);

close(inp);
close(out);
end.

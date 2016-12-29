program timur;

type
p = ^elem;
elem = Record
  x, y, f: real;
  next: p;
  end;

var
root: p;
inp, out: text;

procedure swap(var ci, cj: p);
var temp: real;
begin
  temp := ci^.x;
  ci^.x := cj^.x;
  cj^.x := temp;

  temp := ci^.y;
  ci^.y := cj^.y;
  cj^.y := temp;

  temp := ci^.f;
  ci^.f := cj^.f;
  cj^.f := temp;
end;
procedure p1(var root: p;var f:text);
var ci,cj: p;
begin
  new(root);
  readln(f,root^.x, root^.y, root^.f);
  root^.next := nil;
  ci := root;

  while not eof(f) do
  begin
    new(ci^.next);
    ci := ci^.next;
    readln(f, ci^.x, ci^.y, ci^.f);
    ci^.next := nil;

    cj := root;
    while cj <> nil do
    begin
        if ci^.x < cj^.x then
          swap(ci, cj)
        else if (ci^.x = cj^.x) and (ci^.y < cj^.y) then
          swap(ci, cj);
        cj := cj^.next;
    end;
  end;
end;
procedure p2(var root: p);
var pred, ci, temp: p;
begin
  pred := nil;
  ci := root;
  while ci <> nil do
  begin
    if ci^.f = 0 then
    begin
        if pred = nil then
          root := ci^.next
        else
          pred^.next := ci^.next;

        ci := ci^.next;
    end
    else begin
      pred := ci;
      ci := ci^.next;
    end;
  end;
end;

procedure p4(root: p; var f: text);
begin
  while root<>nil do
  begin
      writeln(f, root^.x:6:1, root^.y:6:1, root^.f:6:1);
      root := root^.next;
  end;
  writeln(f);
end;
procedure p3(min: real; root: p;var f: text);
begin
    while root <> nil do
    begin
      if root^.f > min then
        writeln(f, root^.x:6:1, root^.y:6:1, root^.f:6:1);
      root := root^.next;
    end;
    writeln(f);
end;
begin
  assign(inp, 'dantimur.inp');
  reset(inp);
  assign(out, 'reztimur.out');
  rewrite(out);

  p1(root, inp);
  p4(root, out);
  p2(root);
  p4(root, out);
  p3(50, root, out);
  p4(root, out);


  close(inp);
  close(out);
end.
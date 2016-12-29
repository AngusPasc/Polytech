program bilet7;

type
    tree = ^uzel;
    uzel = record
         fam : string[10];
         num : integer;
         lf, rt: tree;
         end;

var root, cur: tree;
    f1, f3 : text;

procedure pp1(var root, nov: tree);
begin
  if root = nil then root := nov
  else if nov^.fam < root^.fam then pp1(root^.lf, nov)
                          else pp1(root^.rt, nov);
end;

procedure p1(var H: text; var root: tree);
var p: tree;
begin
   while not eof(H) do
    begin
        new(p);
        p^.lf := nil; p^.rt := nil;
        readln(H, p^.fam, p^.num);
        pp1(root, p);
    end;
end;

procedure p2(var G: text; var root: tree);
begin
    if root <> nil then
      begin
          p2(G, root^.lf);
          writeln(G, root^.fam, root^.num);
          p2(G, root^.rt);
      end;
end;

procedure p3(var G: text; var root: tree);
begin
    if root <> nil then
      begin
          p3(G, root^.rt);
          if (root^.lf = nil) and (root^.rt = nil) then writeln(G, root^.fam, root^.num);
          p3(G, root^.lf);
      end;
end;

BEGIN
    assign(F1,'f7.inp');
    reset(F1);
    assign(F3, 'f7.out');
    rewrite(F3);

    p1(F1, root);
    p2(F3, root);
    writeln(F3);
    p3(F3, root);
    close(F1);
    close(F3);
end.
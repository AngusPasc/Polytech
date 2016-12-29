program bilet11;

type
    ptree = ^elem;
    elem = record
         age : integer;
         num : integer;
         lf, rt: ptree;
         end;

var root: ptree;
    a, s : integer;
    F1, F2: text;

procedure p1(var root: ptree);
label l1;
var t, pred : ptree; c: integer;
begin
    new(root);
    readln(F1, c);
    root^.age := c;
    root^.num := 1;
    root^.lf := nil; root^.rt := nil;
    while not eof(F1) do
     begin
         readln(F1, c);
         t := root;
     l1: if t <> nil then
              begin
                 pred := t;
                 if c = t^.age then t^.num := t^.num + 1
                 else begin
                        if c > t^.age then t := t^.rt
                                      else t := t^.lf;
                        goto l1;
                      end
              end
         else begin
                 new(t);
                 t^.lf := nil; t^.rt := nil;
                 t^.age := c;
                 t^.num := 1;
                 if c > pred^.age then pred^.rt := t
                                  else pred^.lf := t;
              end;
     end;
end;

procedure p2(var cur: ptree);
begin
    if cur <> nil then
      begin
          p2(cur^.lf);
          writeln(F2, 'Age:  ', cur^.age:2,'    Num:  ', cur^.num);
          p2(cur^.rt);
      end;
end;

procedure p3(var cur : ptree);
begin
    if cur <> nil then
      begin
          p3(cur^.lf);
          if cur^.age < a then s := s + cur^.num;
          p3(cur^.rt);
      end;
end;

BEGIN
    assign(F1, 'f11.inp');
    reset(F1);
    assign(f2, 'f11.out');
    rewrite(F2);

    p1(root);
    p2(root);
    writeln(F2);
    a := 30;
    s := 0;
    p3(root);
    writeln(F2,'So nguoi co tuoi nho hon ', a, ' la: ', s);

    close(F1);
    close(F2);
end.
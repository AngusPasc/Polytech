
type

nodePtr = ^node_t;

node_t = record
  name : string[10]; {�������}
  number : integer;
  
  pRIght, pLeft : nodePtr;
end;


{��������� ���������� ������� � ������ (����������)}
procedure addToTree(root : nodePtr; node : nodePtr);
begin
  if node^.number > root^.number then
  begin
  
    if root^.pRight <> nil then
    begin
      addToTree(root^.pRight, node);
    end
    else begin
      root^.pRight := node;
    end;
    
  end
  else begin
  
    if root^.pLeft <> nil then
    begin
      addToTree(root^.pLeft, node);
    end
    else begin
      root^.pLeft := node;
    end;

  end;
end;


{p1}
{�������� �����a �� �����}
procedure createTree(var root : nodePtr);
var
  node : nodePtr;
begin
  new(root);
  root^.pRight := nil;
  root^.pLeft := nil;

  read(root^.number);
  readLn(root^.name);

  while not eof do
  begin
    new(node);
    node^.pRight := nil;
    node^.pLeft := nil;

    read(node^.number);
    readLn(node^.name);

    addToTree(root, node);
  end;
end;


{p2}
{����� ������ �� ������� �����-������-������}
procedure printTree(root : nodePtr);
begin
  if root^.pLeft <> nil then
    printTree(root^.pLeft);

  writeLn(root^.number, ' ', root^.name);

  if root^.pRight <> nil then
    printTree(root^.pRight);
end;


{p3}
{����� ������� ������ ������ ������}
procedure printLeaf(root : nodePtr);
begin
  if root^.pRight <> nil then
    printLeaf(root^.pRight); 
    
  if root^.pLeft <> nil then
    printLeaf(root^.pLeft);
    
  {���� ��� ������� ����������� - ��� ����. �������}
  if (root^.pLeft = nil) and (root^.pRight = nil) then
    writeLn(root^.number, ' _ ', root^.name);
end;


var
pRoot : nodePtr;


begin
  assign(input, 'dan1.inp');
  assign(output, 'res1.out');

  reset(input);
  rewrite(output);

  createTree(pRoot); {������� ������ �� �����}
  
  printTree(pRoot); {������� ������}
  writeLn;
  
  printLeaf(pRoot); {������� ������ ������ ������}
  
  close(input);
  close(output);
end.

type

nodePtr = ^node_t;
elPtr = ^element_t;

{����/���� ������}
node_t = record
  age : integer; {�������}
  count : integer; {���-�� ����������� ������� ��������}
  pLeft, pRight : nodePtr;
end;

{������� ��������� ������}
element_t = record
  pNode : nodePtr; {��������� �� ����, �������� �����������}
  depth : integer; {������� ����� ���� � ������}
  pPrev, pNext : elPtr; {������ ����������}
end;


{���������� �������� � ������}
procedure addElement(root : nodePtr; age : integer);
begin
{������ �� ������, ����� ����� �������}
  while true do
  begin
  
  {���� > �������� - ������� � ������ ���������}
    if age > root^.age then
    begin
    
      if root^.pRight <> nil then {���� ����, ��� ����������}
      begin
        root := root^.pRight;
      end
      else begin {����� - ������� ����}
        new(root^.pRight);
        root := root^.pRight;
        
        root^.pLeft := nil;
        root^.pRight := nil;
        root^.age := age;
        root^.count := 1;
        
        break; {����� �� �����}
      end;
      
    end
    else if age < root^.age then {���� < �������� - ������� � ����� ���������}
    begin
    
      if root^.pLeft <> nil then {���� ����, ��� ����������}
      begin
        root := root^.pLeft;
      end
      else begin {����� - ������� ����}
        new(root^.pLeft);
        root := root^.pLeft;
        
        root^.pLeft := nil;
        root^.pRight := nil;
        root^.age := age;
        root^.count := 1;
        
        break; {����� �� �����}
      end;
    
    end
    else begin {���� = �������� - ��������� �������}
      root^.count := root^.count + 1;
      break; {����� �� �����}
    end;
    
  end;
end;


{P1}
{����������� �������� ������}
procedure createTree(var root : nodePtr);
var
  cPos : byte; {������� ������� � ������}
  age, err : integer; {�������� ��������, ��� ������ ��� �������}
  str : string;
begin
  new(root);
  root^.pLeft := nil;
  root^.pRight := nil;
{������ ������ �������}

  readLn(str); {�������� ������}
  cPos := Pos(',', str); {������� �������, ���������� ��� �� ���������}
  str := copy(str, cPos + 1, Length(str) - cPos); {����� ���������, ���������� ������ ����� ��������}

  Val(str , root^.age, err); {������ � �����}
  
  root^.count := 1;

{������ ���������}
  while not eof do
  begin

    readLn(str); {�������� ������}
    cPos := Pos(',', str); {������� �������, ���������� ��� �� ���������}
    str := copy(str, cPos + 1, Length(str) - cPos); {����� ���������, ���������� ������ ����� ��������}
    
    Val(str , age, err); {��������� � �����}
    
    if err = 0 then {���� ��������� ����� ��� ������}
    begin
      addElement(root, age); {������� � ������}
    end
    else begin
      writeLn('readErr: ' , err, '; str:', str) {���� ��������� � ������� - �������}
    end;

  end;
end;


procedure passList_print(head :elPtr);
begin
  head := head^.pNext; {���������� �������� (�� ��������)}
  
  while head^.pNext<> nil do
  begin
    writeLn('age: ' , head^.pNode^.age, ' count: ', head^.pNode^.count);
    head := head^.pNext;
  end;
  
  writeLn;
end;


{������� �������� � ���������� �������� ��������� ������ (�� ��������)}
procedure passList_create(var head : elPtr);
begin
  new(head);
  head^.pNode := nil;
  head^.pPrev := nil;
  
  new(head^.pNext);
  head^.pNext^.pNode := nil;
  head^.pNext^.pPrev := head;
  head^.pNext^.pNext := nil;
end;


{������� � �������� ������ �������� (����� ��� ������ �� ��������)}
procedure passList_insert(curr : elPtr; node : nodePtr; depth : integer; pos : boolean);
var
  el : elPtr;
begin
  if pos then {������� ������ �� ��������}
  begin
    new(el);
    el^.pNode := node;
    el^.depth := depth;
    
    el^.pNext := curr^.pNext;
    curr^.pNext^.pPrev := el;
    
    el^.pPrev := curr;
    curr^.pNext := el;
  end
  else begin {����� �� ��������}
    new(el);
  
    el^.pNode := node;
    el^.depth := depth;
    
    el^.pPrev := curr^.pPrev;
    curr^.pPrev^.pNext := el;
    
    el^.pNext := curr;
    curr^.pPrev := el;
  end;
end;


{����� ������ �����������. ���������� ��������� ������}
function getPassList(root : nodePtr) : elPtr;
var
  desCount : integer; {����� �������� �� ����. ������ (���� = 0, ���� ������������)}
  passList : elPtr; {�������� ������� (����������) ������ ������}
  curr_list : elPtr; {��� ������ ������}
  curr_tree : nodePtr; {��� ������ ������}
  currDepth : integer; {������� �������. ������������ ��� ������������� ���������,
  ������� ����� ������������������ ������� ��������}
begin
  desCount := 2; {� ����� 2 ������� (����� ���� � ������, �� ������ ��� �� �����)}
  currDepth := -1;
  
  passList_create(passList); {������� ��������� �������� ������ ������}
  
  passList_insert(passList, root, 0, true); {�������� �������� ������� � ������}
  
  {����� ������ � ������}
  while desCount <> 0 do
  begin
    desCount := 0;
    currDepth := currDepth + 1; {��������� �� ����� ������� � ������}
    
    curr_list := passList^.pNext; {����� ��� �������� ����� ������ � ������}
    
    {������ �� ������, ��������� ���������, ������� �� ������� ������}
    while curr_list^.pNext <> nil do
    begin
      
      if curr_list^.depth = currDepth then {���� ������� ����� �� ������� ������ - ������}
      begin
        curr_tree := curr_list^.pNode;
        
        {������� � ������ ���� ��� ��������}
        if curr_tree^.pLeft <> nil then
        begin
          passList_insert(curr_list, curr_tree^.pLeft, currDepth + 1, false); {�������� �����}
          desCount := desCount + 1; {���� 1 ������� �� ������}
        end;
        if curr_tree^.pRight <> nil then
        begin
          passList_insert(curr_list, curr_tree^.pRight, currDepth + 1, true); {�������� ������}
          desCount := desCount + 1; {���� 1 ������� �� ������}
        end;
        
      end;
      
      curr_list := curr_list^.pNext;
    end;
  end;
  
  {� passList �������� �������� � ������� ������ (�����-�������-������)}
  
  getPassList := passList;
end;


{p2}
{����� ������. ����������}
procedure printTree(root : nodePtr);
begin
  passList_print(getPassList(root));
end;


{p3}
{����������� ������ ����� �����������, ������� ������� < ����������}
function getLess(root : nodePtr; age : integer) : integer;
var
  el : elPtr;
  count : integer;
begin
  el := getPassList(root);
  
  el := el^.pNext;
  
  count := 0;
  
  while el^.pNext <> nil do
  begin
    if el^.pNode^.age < age then {���� ���������� � ���� ���� ������ - ���������� ��}
      count := count + el^.pNode^.count;
      
    el := el^.pNext;
  end;
  
  getLess := count;
end;


var
  pRoot : nodePtr; {��������� �� ������ ������}


begin
  assign(input, 'dan1.inp');
  assign(output, 'res1.out');
  
  reset(input);
  rewrite(output);
  
  createTree(pRoot); {������� ������}
  
  printTree(pRoot); {������� �������� �� �����������}
  
  writeLn('less 20: ', getLess(pRoot, 20)); {������� ����� �����, ������ 20}
  
  close(input);
  close(output);
end.

type

elPtr = ^element_t; {��� ��������� �� ������� ������}

{������� ����������� ������}
element_t = record
  number : integer; {�����}
  name : string; {���}
  
  next, prev : elPtr;
end;


var

pHead : elPtr; {��������� �� �������� ������� ������}

pNumList, pNameList : elPtr; {��������� �� ����������� ������}



{P1}
{������ ������ �� �����, ����������� ������}
{������ ����� 1 ������ ������� � ������. � ����� �������������� ��������� ���}
procedure createList(var head : elPtr);
var
  curr : elPtr;
begin
  new(head);head^.prev := nil;
  curr := head;
  
  while not eof do
  begin
    new (curr^.next);
    curr^.next^.prev := curr;
    curr := curr^.next;

    readLn(curr^.number, curr^.name);
  end;

  curr^.next := nil;
end;


{P2}
{������� ������ � �������� ��������� ����}
{clearFile ���������� - �������������� ����, ��� ���������� � �����}
procedure printList(head : elPtr; direction, clearFile : boolean; fileName : string);
var
  OpenFile : text;
begin
  assign(openFile, fileName);
  
  {����� - �������� ����, ��� ������������ ���}
  if clearFile then
  begin
    rewrite(openFile);
  end
  else begin
    append(openFile);
  end;

  head := head^.next;

  {���� ������� ������ � ����� - ������ � �����}
  if not (direction) then
    while head^.next <> nil do
      head := head^.next;

  while true do
  begin
  {�������� ������� ������ �� ����� � ����������� �� ����������� �������}
    if direction and (head = nil) then break;
    if not (direction) and (head^.prev = nil) then break;

    if length(head^.name) > 0 then {���� ���� ��� (����� ��� ��������� ��������� � ������ �������)}
    begin
      writeLn(openFile, head^.number, ' ', head^.name);
    end
    else begin {���� ��� ����� - ������� ������ �����}
      writeLn(openFile, head^.number);
    end;

    {����� ����������� �������}
    if direction then
    begin
      head := head^.next;
    end
    else begin
      head := head^.prev;
    end;
  end;

  writeLn(openFile);
  close(openFile);
end;



{P3}
{��������� ��� ����������� ������. ���� ���������� �� �������, ������ �� �������}
{������� ����� ������ - element_t, ������ �������� prev = nil}
procedure createSubLists(head : elPtr; var numList : elPtr; var nameList : elPtr);
var
  curr : elPtr; {������������ ��� ������� �� ����������� �������}
  currL : elPtr; {������������ ��� ������� �� ��������� ������ (������ � ���������)}
  newEl : elPtr; {��� �������� ���������}
begin
  new(numList);
  numList^.prev := nil;
  numList^.next := nil;
  
  new(nameList);
  nameList^.next := nil;
  nameList^.prev := nil;
  
  currL := head^.next; {������ �������� �������}
  
  {������ �� ��������� ������, ������ �� ������ �������}
  while currL <> nil do
  begin
    curr := numList; {����� ����� ������� ������ ��� ��� � ����}
    
    {����� ����� ������� � ������ �������}
    while curr <> nil do {����� ���� while tru}
    begin
      if (curr^.next^.number > currL^.number) or {���� ����� ����� �������}
          (curr^.next = nil) then {��� ����� �� ����� �����}
      begin
      {������� �������}
        new(newEl);
        newEl^.next := curr^.next; {���������� �����}
        newEl^.prev := nil;
        
        curr^.next := newEl;
        
        newEl^.number := currL^.number;
        break; {������� � ����. �������� �� ������ head}
      end;
      
      curr := curr^.next;
    end;
    
    currL := currL^.next;
  end;
  
  currL := head^.next; {������ ������ ������� (��������� ������ ������)}
  
  while currL <> nil do
  begin
    curr := nameList; {����� ����� ������� ������ ��� ��� � ����}
    
    {����� ����� ������� � ������ �������}
    while curr <> nil do {����� ���� while tru}
    begin
      if (curr^.next^.name > currL^.name) or {���� ����� ����� �������}
          (curr^.next = nil) then {��� ����� �� ����� �����}
      begin
      {������� �������}
        new(newEl);
        newEl^.next := curr^.next; {���������� �����}
        newEl^.prev := nil;
        
        curr^.next := newEl;
        
        newEl^.name := currL^.name;
        break; {������� � ����. �������� �� ������ head}
      end;
      
      curr := curr^.next;
    end;
    
    currL := currL^.next;
  end;
  
end;



begin
  assign(input, 'dan1.inp');
  
  reset(input);
  
  createList(pHead); {������� ������ �� �����}
  
  printList(pHead, true, true, 'res1.out'); {������� � ������ �����������}
  printList(pHead, false, false, 'res1.out'); {������� � ��������}
  
  createSubLists(pHead, pNumList, pNameList); {������� ����������� pNumList � pNameList}
  
  printList(pNumList, true, false, 'res1.out'); {������� ������}
  printList(pNameList, true, false, 'res1.out'); {������� �����}
  
  close(input);

end.
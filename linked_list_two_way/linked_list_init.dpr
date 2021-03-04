program linked_list_init;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  Adr = ^Zveno;
  Zveno = Record
    Element: integer;
    PrevAdr: Adr;
    SuccAdr: Adr;
  End;

function TwoListInit(var currAdr: Adr): integer;
var num, len: integer;
Begin
    len:= 1;
    readln(num);
    currAdr^.Element:= num;
    readln(num);
    while num <> -1 do begin
        new(currAdr^.SuccAdr);
        CurrAdr^.SuccAdr^.PrevAdr:= CurrAdr;
        CurrAdr:= CurrAdr^.SuccAdr;
        CurrAdr^.Element:= num;
        CurrAdr^.SuccAdr:= nil;

        readln(num);
        inc(len);
    end;
    result:= len;
End;

procedure TwoListDispB(var CurrAdr: Adr);
Begin
    while (CurrAdr <> nil) do begin
      write(CurrAdr^.Element, ' ');
      CurrAdr:= CurrAdr^.SuccAdr;
    end;
    writeln;
End;

procedure TwoListDispE(var CurrAdr: Adr);
Begin
    while (CurrAdr <> nil) do begin
      write(CurrAdr^.Element, ' ');
      CurrAdr:= CurrAdr^.PrevAdr;
    end;
    writeln;
End;


procedure TwoListPushBack(var Head: Adr; const num: integer);
var PushAdr: Adr;
Begin
    new(PushAdr);
    PushAdr^.PrevAdr:= nil;
    PushAdr^.SuccAdr:= Head;
    Head^.PrevAdr:= PushAdr;
    PushAdr^.Element:= num;
    Head:= PushAdr;
End;

procedure TwoListPushEnd(var Tail: Adr; const num: integer);
var PushAdr: Adr;
Begin
    new(PushAdr);
    Tail^.SuccAdr:= PushAdr;
    PushAdr^.PrevAdr:= Tail;
    PushAdr^.SuccAdr:= nil;
    PushAdr^.Element:= num;
    Tail:= PushAdr;
End;

procedure TwoListPush(var CurrAdr: Adr; const num, index: integer; var len: integer);
var PushAdr: Adr;
i: integer;
Begin
new(PushAdr);
PushAdr^.Element:= num;
if CurrAdr^.PrevAdr = nil then begin
    for i := 0 to index - 2 do begin
      CurrAdr:= CurrAdr^.SuccAdr;
    end;
    PushAdr^.SuccAdr:= CurrAdr^.SuccAdr;
    CurrAdr^.SuccAdr^.PrevAdr:= PushAdr;
    CurrAdr^.SuccAdr:=PushAdr;
    PushAdr^.PrevAdr:= CurrAdr;
end
else begin
  for i := len downto index + 1 do begin
    CurrAdr:= CurrAdr^.PrevAdr;
  end;
    PushAdr^.SuccAdr:= CurrAdr^.SuccAdr;
    CurrAdr^.SuccAdr^.PrevAdr:= PushAdr;
    CurrAdr^.SuccAdr:=PushAdr;
    PushAdr^.PrevAdr:= CurrAdr;
end;
inc(len);
End;

procedure TwoListDeleteBack(var Head: Adr; var len: integer);
var DelAdr: Adr;
Begin
  DelAdr:= Head;
  Head:= Head^.SuccAdr;
  Head^.PrevAdr:= nil;
  dec(len);
  Dispose(DelAdr);
End;

procedure TwoListDeleteEnd(var Tail: Adr; var len: integer);
var DelAdr: Adr;
Begin
  DelAdr:= Tail;
  Tail:= Tail^.PrevAdr;
  Tail^.SuccAdr:= nil;
  dec(len);
  Dispose(DelAdr);
  dec(len);
End;

procedure TwoListDelete(var CurrAdr: Adr; const index: integer; var len: integer);
var DelAdr: Adr;
i: integer;
Begin
  if CurrAdr^.PrevAdr = nil then begin
    for i := 0 to index - 1 do begin
      CurrAdr:= CurrAdr^.SuccAdr;
    end;
    DelAdr:= CurrAdr;
    CurrAdr^.SuccAdr^.PrevAdr:=CurrAdr^.PrevAdr;
    CurrAdr^.PrevAdr^.SuccAdr:= CurrAdr^.SuccAdr;
    Dispose(DelAdr);
    dec(len);
  end
  else begin
    for i := len - 1 downto index + 1 do begin
      CurrAdr:= CurrAdr^.PrevAdr;
    end;
    DelAdr:= CurrAdr;
    CurrAdr^.SuccAdr^.PrevAdr:=CurrAdr^.PrevAdr;
    CurrAdr^.PrevAdr^.SuccAdr:= CurrAdr^.SuccAdr;
    Dispose(DelAdr);
    dec(len);
  end;
  
End;


var head, tail, currAdr: Adr;
len, i, j:integer;
begin
new(Head);
currAdr:= Head;
 currAdr^.PrevAdr:= nil;
currAdr^.SuccAdr:= nil;
len:= TwoListInit(CurrAdr);
Tail:= CurrAdr;

i:= 3;
randomize;
if i <= len div 2 then CurrAdr:= Head else CurrAdr:= Tail;
TwoListDelete(CurrAdr, 3, len);

CurrAdr:= Head;
TwoListDispB(CurrAdr);
writeln;

readln;

for j := 1 to 10 do begin
if i <= len div 2 then CurrAdr:= Head else CurrAdr:= Tail;
TwoListDelete(CurrAdr, 3, len);
CurrAdr:= Head;
TwoListDispB(CurrAdr);
writeln;

readln;
end;
end.

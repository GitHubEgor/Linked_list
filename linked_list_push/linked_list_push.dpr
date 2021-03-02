program linked_list_push;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  Adr = ^Zveno;
  Zveno = Record
    Element: integer;
    SuccAdr: Adr;
  End;

procedure ListInit(var CurrAdr: Adr);
var number: integer;
Begin
readln(number);
CurrAdr^.Element:= number;
readln(number);
while (number <> -1) do begin
  new(CurrAdr^.SuccAdr);
  CurrAdr:= CurrAdr^.SuccAdr;
  CurrAdr^.Element:= number;
  CurrAdr^.SuccAdr:= nil;
  readln(number);
end;

End;

procedure ListDisp(var CurrAdr: Adr);
Begin
  while CurrAdr <> nil do begin
    write(CurrAdr^.Element, ' ');
    CurrAdr:= CurrAdr^.SuccAdr;
  end;
  writeln;
End;

procedure PushLeft(const number: integer; var MainAdr: Adr);
var PushAdr: Adr;
Begin
  new(PushAdr);
  PushAdr^.Element:= number;
  PushAdr^.SuccAdr:= MainAdr;
  MainAdr:= PushAdr;
End;

procedure PushRight(const number: integer; var CurrAdr: Adr);
var PushAdr: Adr;
Begin
  new(PushAdr);
  PushAdr^.Element:= number;
  PushAdr^.SuccAdr:= nil;
  while (CurrAdr^.SuccAdr <> nil) do begin
    CurrAdr:= CurrAdr^.SuccAdr;
  end;
  New(CurrAdr^.SuccAdr);
  CurrAdr^.SuccAdr:= PushAdr;
End;

procedure Push(const number: integer; index: integer; var CurrAdr: Adr);
var PushAdr: Adr;
Begin
  new(PushAdr);
  PushAdr^.Element:= number;
  PushAdr^.SuccAdr:= nil;

  while index > 1 do begin
    CurrAdr:=CurrAdr^.SuccAdr; 
    dec(index);
  end;

  PushAdr^.SuccAdr:= CurrAdr^.SuccAdr;
  CurrAdr^.SuccAdr:= PushAdr;
End;

var MainAdr, CurrAdr: Adr;
begin
new(MainAdr);
CurrAdr:= MainAdr;
CurrAdr^.SuccAdr:= nil;

writeln('Enter the list');
ListInit(CurrAdr);

CurrAdr:= MainAdr;
write('Our list: ');
ListDisp(CurrAdr);
writeln;
readln;

PushLeft(8, MainAdr);
CurrAdr:= MainAdr;
write('Our list: ');
ListDisp(CurrAdr);
writeln;
readln;
PushLeft(10, MainAdr);
CurrAdr:= MainAdr;
write('Our list: ');
ListDisp(CurrAdr);
writeln;
readln;

CurrAdr:= MainAdr;
PushRight(10, CurrAdr);
write('Our list: ');
CurrAdr:= MainAdr;
ListDisp(CurrAdr);
writeln;
readln;


CurrAdr:= MainAdr;
PushRight(8, CurrAdr);
write('Our list: ');
CurrAdr:= MainAdr;
ListDisp(CurrAdr);
writeln;
readln;

CurrAdr:= MainAdr;
Push(420, 3, CurrAdr);
write('Our list: ');
CurrAdr:= MainAdr;
ListDisp(CurrAdr);
writeln;
readln;

CurrAdr:= MainAdr;
Push(10000, 3, CurrAdr);
write('Our list: ');
CurrAdr:= MainAdr;
ListDisp(CurrAdr);
writeln;
readln;


end.

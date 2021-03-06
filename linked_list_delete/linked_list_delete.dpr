program linked_list_delete;

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
  New(CurrAdr^.SuccAdr);
  CurrAdr:= CurrAdr^.SuccAdr;
  CurrAdr^.Element:= number;
  CurrAdr^.SuccAdr:= nil;
  readln(number);
end;

End;

procedure ListDisp(var CurrAdr: Adr);
Begin
  while (CurrAdr <> nil) do begin
    write(CurrAdr^.Element, ' ');
    CurrAdr:= CurrAdr^.SuccAdr;
  end;
  writeln;
End;

procedure ListDel(var CurrAdr: Adr; const num: integer);
var DelAdr: Adr;
Begin
  DelAdr:= CurrAdr^.SuccAdr;
  while (DelAdr^.Element <> num) and (DelAdr^.SuccAdr <> nil) do begin
    CurrAdr:= CurrAdr^.SuccAdr;
    DelAdr:= CurrAdr^.SuccAdr;
  end;

  if (DelAdr^.Element = num) then begin
  CurrAdr^.SuccAdr:= CurrAdr^.SuccAdr^.SuccAdr;
  Dispose(DelAdr);
  end;
End;

var MainAdr, CurrAdr: Adr;
begin
New(MainAdr);
CurrAdr:= MainAdr;
CurrAdr^.SuccAdr:= nil;
writeln('Enter numbers you want to add to the linked list');
ListInit(CurrAdr);

write('Our linked list: ');
CurrAdr:= MainAdr;
ListDisp(CurrAdr);
readln;

CurrAdr:= MainAdr;
ListDel(CurrAdr, 5323431);
write('Our linked list: ');
CurrAdr:= MainAdr;
ListDisp(CurrAdr);
writeln;
readln;


end.

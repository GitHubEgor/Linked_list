program linked_list_meetings;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  Adr = ^Zveno;
  Zveno = Record
      Element: Char;
      SuccAdr: Adr;
  End;

var MainAdr, CurrAdr: Adr;
Simv: char;
begin
  New(MainAdr);
  MainAdr^.Element:= 'a';
  CurrAdr:= MainAdr;
  CurrAdr^.SuccAdr:= nil;
  Readln(Simv);
  while Simv <> '.' do begin
    New(CurrAdr^.SuccAdr);
    CurrAdr:= CurrAdr^.SuccAdr;
    CurrAdr^.Element:= Simv;
    CurrAdr^.SuccAdr:= nil;
    readln(simv);
  end;

  CurrAdr:= MainAdr;
  while CurrAdr^.SuccAdr <> nil do begin
    write(CurrAdr^.Element);
    CurrAdr:= CurrAdr^.SuccAdr;
  end;

  readln;
  
end.

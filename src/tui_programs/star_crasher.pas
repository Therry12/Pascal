program star_crasher;
uses crt;

const
  Platform_contain = '+----+';
  Platform_width = length(Platform_contain);
  End_distance = 5;

type
  platform = record { platform can't change Height (CurY position). }
    CurX, CurY, dx: integer;
    contain: string;
  end;

procedure Get_Key(var code: integer);
var
  c: char;
begin
  c := ReadKey;
  if c = #0 then
  begin
    c := ReadKey;
    code := -ord(c)
  end
  else
  begin
    code := ord(c)
  end
end;


procedure Set_Platform_Start_Position(var p: platform);
begin
  p.CurX := (ScreenWidth - Platform_width) div 2;
  p.CurY := ScreenHeight - End_distance;
  GotoXY(p.CurX, p.CurY);
end;

procedure Print_Platform(var p: platform);
var
  i: integer;
begin
  for i := 0 to Platform_width do
  begin
    write(Platform_contain[i]);
  end;
  GotoXY(1,1);
end;

procedure Hide_Platform(p: platform);
var
  i: integer;
begin
  GotoXY(p.CurX, p.CurY);
  for i := 0 to Platform_width do
  begin
    write(' ');
  end;
  GotoXY(1, 1);
end;

procedure Move_Platform(var p: platform);
var
  x_dead_zone: integer;
begin
  x_dead_zone := ScreenWidth - Platform_width;
  Hide_Platform(p);
  p.CurX := p.CurX + p.dx;
  if p.CurX > x_dead_zone then
    p.CurX := x_dead_zone
  else
  if (p.CurX < 1) then
    p.CurX := 1;
  GotoXY(p.CurX, p.CurY);
  Print_Platform(p);
end;

procedure Set_Platform_Direction(var p: platform; dx: integer);
begin
  p.dx := dx;
end;

var
  p: platform;
  c: integer;
begin
  clrscr;
  Set_Platform_Start_Position(p);
  Print_Platform(p);
  while true do
  begin
    Get_Key(c);
    case c of
      -75:
      begin
        Set_Platform_Direction(p, -1);
        Move_Platform(p);
      end;
      -77:
      begin
        Set_Platform_Direction(p, 1);
        Move_Platform(p);
      end;
      113: break;
    end;
  end;
  clrscr;
end.

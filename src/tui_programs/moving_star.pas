program moving_star;
uses crt;

const
  Message = 'GoodBye prekrasen!';
  delay_duration = 100;

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

type
  star = record
    CurX, CurY, dx, dy: integer;
  end;

procedure CenterText(var x, y: integer; msg: string);
var
  msg_size: integer;
begin
  msg_size := length(msg);
  GotoXY(1,1);
  x := (ScreenWidth - msg_size) div 2;
  y := ScreenHeight div 2;
  GotoXY(x, y);
end;

procedure Show_Star(s: star);
begin
  GotoXY(s.CurX, s.CurY);
  write('*');
  GotoXY(1,1);
end;

procedure Hide_Star(var s: star);
begin
  GotoXY(s.CurX, s.CurY);
  write(' ');
  GotoXY(1,1);
end;

procedure GoodBye();
var
  x, y: integer;
begin
  clrscr;
  CenterText(x, y, message);
  writeln(message);
  GotoXY(1,1);
  Delay(500)
end;

procedure Move_Star(var s: star);
begin
  Hide_Star(s);
  s.CurX := s.CurX + s.dx;
  if s.CurX > ScreenWidth then
    s.CurX := ScreenWidth
  else
  if s.curX < 1 then
    s.CurX := 1;
  s.CurY := s.CurY + s.dY;
  if s.CurY > ScreenHeight then
    s.CurY := ScreenHeight
  else
  if s.curY < 1 then
    s.CurY := 1;
  Show_Star(s);
end;

procedure Set_Direction(var s: star; dx, dy: integer);
begin
  s.dx := dx;
  s.dy := dy;
end;

var
  s: star;
  c: integer;
begin
  TextColor(Yellow);
  TextBackground(Blue);
  clrscr;
  s.CurX := ScreenWidth div 2;
  s.CurY := ScreenHeight div 2;
  s.dx := 0;
  s.dy := 0;
  Show_Star(s);

  while true do
  begin
    if not KeyPressed then
    begin
      Move_Star(s);
      delay(delay_duration);
      continue;
    end;
    Get_Key(c);
    case c of
      -75: Set_Direction(s, -1, 0);
      -77: Set_Direction(s, 1, 0);
      -72: Set_Direction(s, 0, -1);
      -80: Set_Direction(s, 0, 1);
      32: Set_Direction(s, 0, 0); { stop }
      27: break
    end
  end;
  GoodBye();
end.

program moving_hello;
uses crt;

const
  Message = 'Hello, World!';

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

procedure Show_Message(x, y: integer; msg: string);
begin
    GotoXY(x, y);
    write(msg);
    GotoXY(1, 1)
end;

procedure Hide_Message(x, y: integer; msg: string);
var
  len, i: integer;
begin
  len := length(msg);
  GotoXY(x, y);
  for i := 1 to len do
    write(' ');
  GotoXY(1,1)
end;

procedure Move_Message(var x, y: integer; msg: string; dx, dy: integer);
begin
  Hide_Message(x, y, msg);
  x := x + dx;
  y := y + dy;
  Show_Message(x, y, msg)
end;

var
  Cur_X, Cur_Y, c_size: integer;
  c: integer;
begin
  c_size := 5;
  clrscr;
  Cur_X := (ScreenWidth - length(Message)) div 2;
  Cur_Y := ScreenHeight div 2;
  Show_Message(Cur_X, Cur_Y, Message);
  while true do
  begin
    Get_Key(c);
    if c > 0 then
      break;
    case c of 
      -75: { left arrow }
        Move_Message(Cur_X, Cur_Y, Message, -c_size, 0);
      -77:
        Move_Message(Cur_X, Cur_Y, Message, c_size, 0);
      -72:
        Move_Message(Cur_X, Cur_Y, Message, 0, -c_size);
      -80:
        Move_Message(Cur_X, Cur_Y, Message, 0, c_size);
      end
  end;
  clrscr
end.

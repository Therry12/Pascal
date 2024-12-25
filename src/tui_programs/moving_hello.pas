program moving_hello;
uses crt;


const
  Message = 'Hello, World!';

  Keybinding_Message_1 = '1. You can move msg using arrows on your keyboard.'#10;
  Keybinding_Message_2 = '2. For exit type any key on your keyboard.'#10;

  ARR_SIZE = 2;

type
  KEYBINDINGS_LOCATION = (Left_Upper_Corner, Left_Bottom_Corner,
    Right_Upper_Corner, Right_Bottom_Corner);
    Keybindings_Messages = array [1..ARR_SIZE] of string;

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

procedure Calculate_Greatest_Message_Size(var greatest_size: integer);
var
  Keybindings: Keybindings_Messages = (Keybinding_Message_1, Keybinding_Message_2);
  i: integer;
begin
  for i := 1 to ARR_SIZE do
  begin
    greatest_size := length(Keybindings[1]);
    if length(Keybindings[i]) > greatest_size then
      greatest_size := length(Keybindings[i])
    else
      continue
  end;
end;

procedure Define_Keybindings_Location(location: KEYBINDINGS_LOCATION; msg_size: integer);
var
  Keybindings: Keybindings_Messages = (Keybinding_Message_1, Keybinding_Message_2);
  i: integer;
begin
  case location of
    Left_Upper_Corner:
      GotoXY(1,1);
    Left_Bottom_Corner:
      GotoXY(1, ScreenHeight);
    Right_Upper_Corner:
    begin
      for i := 1 to ARR_SIZE do
      begin
        GotoXY(ScreenWidth - msg_size, i);
        write(Keybindings[i]);
      end;
    end;
    Right_Bottom_Corner:
    begin
      for i := 1 to ARR_SIZE do
      begin
        GotoXY(ScreenWidth - msg_size, ScreenHeight);
        write(Keybindings[i]);
      end;
    end;
  end;
end;


var
  Cur_X, Cur_Y, c_size: integer;
  c, msg_size: integer;

begin
  c_size := 2;
  clrscr;
  Calculate_Greatest_Message_Size(msg_size);
  Define_Keybindings_Location(Right_Bottom_Corner, msg_size);
  Cur_X := (ScreenWidth - length(Message)) div 2;
  Cur_Y := ScreenHeight div 2;
  Show_Message(Cur_X, Cur_Y, Message);
  while true do
  begin
    Get_Key(c);
    if c > 0 then
      break;
    case c of 
      -75:
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

program moving_hello;
uses crt;


const
  Message = 'Hello, World!';

  Keybinding_Message_1 = '1. You can move msg using arrows on your keyboard.'#10;
  Keybinding_Message_2 = '2. For exit type q on your keyboard.'#10;
  Keybinding_Message_3 = '3. You can hide this message using H key'#10;

  ARR_SIZE = 3;

type
  HELP_MESSAGES_LOCATION = (Left_Upper_Corner, Left_Bottom_Corner,
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
  Keybindings: Keybindings_Messages = (Keybinding_Message_1, Keybinding_Message_2, Keybinding_Message_3);
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

procedure Write_Help_Message(msg_size: integer; location: HELP_MESSAGES_LOCATION); { Bad procedure, but idk how to write this normal }
var
  Keybindings: Keybindings_Messages = (Keybinding_Message_1, Keybinding_Message_2, Keybinding_Message_3);
  i: integer;
begin
  if location = Right_Upper_Corner then
  begin
    for i := 1 to ARR_SIZE do
    begin
      GotoXY(ScreenWidth - msg_size, i);
      write(Keybindings[i]);
    end;
  end
  else if location = Right_Bottom_Corner then
  begin
    for i := 1 to ARR_SIZE do
    begin
      GotoXY(ScreenWidth - msg_size, ScreenHeight);
      write(Keybindings[i]);
    end;
  end
  else
  begin
    for i := 1 to ARR_SIZE do
    begin
      write(Keybindings[i]);
    end;
  end;
end;

procedure Define_Keybindings_Location(msg_size: integer; location: HELP_MESSAGES_LOCATION);
begin
  case location of
    Left_Upper_Corner:
    begin
      GotoXY(1,1);
      Write_Help_Message(msg_size, location);
    end;
    Left_Bottom_Corner:
    begin
      GotoXY(1, ScreenHeight);
      Write_Help_Message(msg_size, location);
    end;
    Right_Upper_Corner:
      Write_Help_Message(msg_size, location);
    Right_Bottom_Corner:
      Write_Help_Message(msg_size, location);
  end;
end;

procedure Hide_Help_Message(greatest_size: integer; location: HELP_MESSAGES_LOCATION);
var
  i, j: integer;
begin
  case location of
    Left_Upper_Corner:
    begin
      GotoXY(1,1); { It's errase first line }
      write(' ');
    end;
    Left_Bottom_Corner:
    begin
      for i := 1 to ARR_SIZE do
      begin
        GotoXY(1, ScreenHeight - i);
        for j := 1 to greatest_size do
          write(' ');
      end;
    end;
  end;
  GotoXY(1,1);
end;

var
  _Help_Messages_Location: HELP_MESSAGES_LOCATION;
  Cur_X, Cur_Y, pixel_size: integer;
  c, msg_size: integer;
  Is_Help_Messages_Hidden: boolean;

begin
  pixel_size := 2;
  _Help_Messages_Location := Left_Bottom_Corner;
  Is_Help_Messages_Hidden := False; 

  clrscr;
  Calculate_Greatest_Message_Size(msg_size);
  Define_Keybindings_Location(msg_size, _Help_Messages_Location);
  Cur_X := (ScreenWidth - length(Message)) div 2;
  Cur_Y := ScreenHeight div 2;
  Show_Message(Cur_X, Cur_Y, Message);
  while true do
  begin
    Get_Key(c);
    if c = 113 then { Q key }
      break;
    case c of 
    { Arrows }
      -75:
        Move_Message(Cur_X, Cur_Y, Message, -pixel_size, 0);
      -77:
        Move_Message(Cur_X, Cur_Y, Message, pixel_size, 0);
      -72:
        Move_Message(Cur_X, Cur_Y, Message, 0, -pixel_size);
      -80:
        Move_Message(Cur_X, Cur_Y, Message, 0, pixel_size);
      { Help keys }
      104: { Toggle hide and open help messages}
      begin
        if Is_Help_Messages_Hidden = False then
        begin
          Hide_Help_Message(msg_size, _Help_Messages_Location);
          Is_Help_Messages_Hidden := True;
        end
        else
        begin
          Define_Keybindings_Location(msg_size, _Help_Messages_Location);
          Is_Help_Messages_Hidden := False;
        end;
      end;
    end;
  end;
  clrscr
end.

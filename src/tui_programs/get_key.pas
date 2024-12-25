program get_key;
uses crt;

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

var
  i: integer;

begin
  repeat
    Get_Key(i);
    writeln(i, ' ', ord(i))
  until i = ord(' ');
end.

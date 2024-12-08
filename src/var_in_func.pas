program vars_in_proc;

procedure powers(var cube, fourth: integer; num: integer);
begin
    cube := num * num;
    fourth := num * num * num * num;
end;

var
    cube, fourth: integer;

begin
    powers(cube, fourth, 2);
    writeln('Cube - ', cube, ', fourth - ', fourth);
end.

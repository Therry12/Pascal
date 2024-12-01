program modulo;

var
    x: integer;
    negative: boolean;

begin
    write('Enter number: ');
    read(x);
    negative := x < 0;

    if negative then
        x := -x;
    writeln(x);
end.

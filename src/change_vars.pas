program swap;

var
a, b: integer;
tmp: integer = 0;

begin
    readln(a);
    readln(b);
    if a > b then
    begin
        writeln('Swapping');
        tmp := a;
	a := b;
	b := tmp;
    end
end.

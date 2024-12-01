program print_slash;

var
m, n: integer;

begin
    for m := 1 to 24 do
    begin
        for n := 1 to m - 1 do
	    write(' ');
	writeln('*') 
    end;
end.

program print_Ntimes;

const
    message = 'Hello, World!';
    count = 10;
var
    i: integer;

begin
    for i := 1 to count do
        writeln(message);
end.

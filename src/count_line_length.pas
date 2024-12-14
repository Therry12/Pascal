program line_filter;

var
    count: integer;
    c: char;

begin
    count := 0;
    while not eof do
    begin
        read(c);
        if c = #10 then
        begin
            writeln(count); 
            count := 0
        end
        else
            count := count + 1
    end;
end.

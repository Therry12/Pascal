program simple_sum;

var
    sum, count, n: integer;

begin
    sum := 0;
    count := 0;

    while not SeekEof do
    begin
        read(n);
        sum := sum + n;
        count := count + 1
    end;

    write('Sum - ', sum, ', count - ', count, #10);
end.

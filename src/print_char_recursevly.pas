program print_chars;

procedure print_chars(ch: char; n: integer);
begin
    if n > 0 then
    begin
        write(ch);
        print_chars(ch, n - 1);
    end;
end;

begin
    print_chars('*', 5);
end.

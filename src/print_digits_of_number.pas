program digits_of_number;

procedure print_digits_of_number(num: integer);
begin
    if num > 0 then
    begin
        print_digits_of_number(num div 10);
        write(num mod 10, ' ');
    end
end;

begin
    print_digits_of_number(1234);
    writeln;
end.

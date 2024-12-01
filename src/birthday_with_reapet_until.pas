program birthday_refactor;

var
year: integer;

begin
    write('Please, type in your birthday: ');
    repeat 
        readln(year);
    until (year > 1900) or (year > 2020);
    writeln('The year ', year, ' accepted, thank you')
end.

program birthday;

var
year: integer;
age: integer;
current_year: integer = 2024;

begin
    write('Please, type in your birthday: ');
    readln(year);
    while (year < 1900) or (year > 2020) do
    begin
        writeln('Your date of birthday not valid!');
	write('Please, try again: ');
        readln(year)
    end;
    age := current_year - year;
    writeln('The year ', year, ' accepted, your age ', age);
end.

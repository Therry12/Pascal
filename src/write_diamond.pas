program write_diamond;

procedure write_chars (ch: char; count: integer); 
var
    i: integer;
begin
    for i := 1 to count do
        write(ch);        
end;

procedure write_line_of_diamond (k, n: integer);
begin
    write_chars(' ',n + 1 - k);
    write('*');

    if k > 1 then
    begin
        write_chars(' ', 2 * k - 3);
        write('*')
    end;
    writeln;
end;

var
    n, k, h: integer;

begin
    repeat 
	write('Enter odd number: ');
        read(h)
    until (h > 0) and (h mod 2 = 1);
    n := h div 2;

    for k := 1 to n + 1 do
        write_line_of_diamond(k, n);

    for k := n downto 1 do
        write_line_of_diamond(k, n);
end.

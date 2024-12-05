program is_num_even;

var
input_num: integer;

begin
    write('Enter number: ');
    read(input_num);
    
    if input_num mod 2 = 0 then
	writeln('Num ', input_num ,' is even')

end.

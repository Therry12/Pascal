program write_diamond;

var
n, k, i, h: integer;

begin
    { Ввод нечётного числа }
    repeat 
	write('Enter odd number: ');
        read(h)
    until (h > 0) and (h mod 2 = 1);
    n := h div 2;

    { Вывод верхней части алмаза }
    for k := 1 to n + 1 do
    begin {///}
	    for i := 1 to n + 1 - k do
	        write(' ');
            write('*');
	    if k > 1 then
	begin
	    for i := 1 to 2*k - 3 do
		write(' ');
 	    write('*')
	end;
	    writeln;
    end; {///}

    { Вывод нижней части алмаза }
    for k := n downto 1 do
    begin {///}
	    for i := 1 to n + 1 - k do
	        write(' ');
	    write('*');
        if k > 1 then
	    begin
	        for i := 1 to k*2 - 3 do
	            write(' ');
	        write('*')
	    end;
        writeln;
    end; {///}
end.

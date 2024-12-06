program power;

function power(num: integer; exponent: integer): longint;
var
    i: integer;
    res: integer = 1;
begin
    if exponent = 0 then
        power := 1;
    if exponent = 1 then
        power := num
    else
    begin
        for i := 1 to exponent do
        begin 
            res := res * num;
        end;
        power := res
    end;
end;

var
    input_num, input_exponent, res: integer;
begin
    write('Enter num and exponent: ');
    read(input_num);
    read(input_exponent);

    res := power(input_num, input_exponent);
    writeln(res);
end.

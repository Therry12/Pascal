program cube;

function cube (num: real): real;
begin
     cube := num*num*num;
end;

var
    input_num: real;
    res: real;

begin
    readln(input_num);
    res := cube(input_num);
    writeln('Cube is ', res:3:1);
end.

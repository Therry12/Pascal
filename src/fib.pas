program fibonacci;

function fibonacci(num: integer): longint;
var
    i: integer;
    p, q, r: longint;

begin
    if num <= 0 then
    begin
        fibonacci := 0;
        exit
    end;

    r := 0;
    q := 1;
    for i := 2 to num do
    begin
        p := r;
        r := q;
        q := p + r;
    end;
    fibonacci := q;
end;

var
    res, num: integer;

begin
    num := 5;
    res := fibonacci(num);
    writeln('Fib ', num, ' is ', res);
end.

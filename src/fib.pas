program fibonacci;

function fibonacci(num: integer): longint;
var
    i: integer;
    p, q, r: longint;

begin
    if num <= 0 then
        fibonacci := 1
    else
    begin
    r := 0;
    q := 1;
    for i := 2 to num do
    begin
        p := r;
        r := q;
        q := p + r;
    end;
    fibonacci := q;
    end
end;

var
    res: integer;

begin
    res := fibonacci(10);
    writeln('Fib 5 is ', res);
end.

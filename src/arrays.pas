program arrays;

type
    real_100 = array [1..100] of real;

var
    x: real_100;

begin
    x[0] := 1;
    writeln(x[0]:0:1)
end.

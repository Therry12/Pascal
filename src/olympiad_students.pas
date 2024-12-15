program count_students;

const
    Max_Schools = 3;
    Max_Students = 100;

type
    Counter_Array = array [1..Max_Schools] of integer;

var
    Counters: Counter_Array;
    i, c, n: integer;

begin
    {$I-}
    for i := 1 to Max_Schools do
        Counters[i] := 0;
    
    while not eof do
    begin
        readln(c);
        if IOResult <> 0 then
        begin
            writeln('Incorrect data');
            halt(1)
        end;
        
        n := c div Max_Students;
        if (n < 1) or (n > Max_Schools) then
        begin
            writeln('Illegal schoold id: ', n, ' [', c, ']');
            halt(1)
        end;
        Counters[n] := Counters[n] + 1
    end;
    n := 1;
    for i := 2 to Max_Schools do
        if Counters[i] < Counters[n] then
            n := i;
    for i := 1 to Max_Schools do
        if Counters[i] = Counters[n] then
            writeln(i)
end.


program mul;

procedure ReadInt (var succes: boolean; var number: integer);
var
    c: char;
    res, pos: integer;
begin
    res := 0;
    pos := 0;

    repeat 
        read(c);
        pos := pos + 1;
        until (c <> ' ') and (c <> #10);
        while (c <> ' ') and (c <> #10) do
        begin
            if (c < '0') or (c > '9') then
            begin
                writeln('Unexpected ''', c, ''''' in pos: ', pos);
                readln;
                succes := false;
                exit
            end;
            res := res*10 + ord(c) - ord('0');
            read(c);
            pos := pos + 1
        end;
        number := res;
        succes := true
end;
var
    i,j: integer;
    succes: boolean;

begin
    {$I-}
    write('Enter two numbers: ');
    repeat ReadInt(succes, i);
    until succes;
    repeat ReadInt(succes, j);
    until succes;
    writeln(i, ' * ', j, ' = ', i * j)
end.

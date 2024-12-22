program words_in_string;

var
  c: char;
  words: integer;
begin
  words := 0;
  while not eof do
  begin
    read(c);
    while c <> #10 do
    begin
      read(c);
      if (c = ' ') or (c = #10) then
        words := words + 1;
    end;
  end;
  writeln(words)
end.

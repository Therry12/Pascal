program ratio_and_resolutions;

var
    input_res_1, input_res_2, input_ratio_1, input_ratio_2: integer;
    choice: integer;
begin
    {$I-}
    repeat readln(choice);
    until (IOResult = 0) and ((choice = 0) or (choice = 1)); { #TODO: rewrite this condition to procedure. }

    if choice = 0 then
    begin 
        readln(input_ratio_1, input_ratio_2); { #TODO: add checking for correct input. }
        writeln('Aspect ratio is ', input_ratio_1 / input_ratio_2:0:2, #10)
    end
    else
        readln(input_res_1, input_res_2);
    
end.


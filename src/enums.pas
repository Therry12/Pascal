program enum;

type
    fruits = (Fapple, Fbanana, Forange, Fpineapple);

var
    fruit_banana: fruits;

begin
    fruit_banana := Fbanana;
    write(fruit_banana, #10);
end.

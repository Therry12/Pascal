program enum;

type
    fruits = (apple, banana, orange, pineapple);

var
    fruit_banana: fruits;

begin
    fruit_banana := banana;
    write(fruit_banana, #10);
end.

let rec fib n =
  if n < 2 then 1 else (fib (n-1)) + (fib (n-2));;

for i = 1 to 10 do
  print_int (fib 30);
  print_newline ();
done;;
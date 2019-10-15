(* 1zad *)
fun a -> a;;
let id (x : int) = x;;
let rec ab x = ab x;;
let abca a b c = a(b(c));;


(* 2zad *)
let rec z2 x = 
  if x = 0 
  then 0 
  else 2 * (z2 (x - 1)) + 1;;

let z2t x =
  let rec help = fun n acc ->
    if n > 0
    then help (n-1) (2 * acc + 1)
    else acc
  in help x 0;;

(* 3zad *)
let comp ab ca = 
  fun x -> ab (ca x);;

let rec itr fn i =  
  if i > 1
  then comp fn (itr fn (i - 1))
  else fn;;

let ( *- ) a b =
 if b = 0 then 0 
 else (itr ((+) a ) b) 0;;

let ( ^- ) a b = 
  if b = 0 then 1 
  else (itr (( *-) a) b) 1;;

(* 4zad *)
let stream (n : int ) = ();;
let s_int x = x+1;;

let hd (s : int -> 'a) = s 0
let tl (s : int -> 'a) = fun i -> s (i + 1)
let add s const = fun i -> s i + const
let map s (arg_1 : 'a -> 'b) = fun i -> arg_1 (s i)
let map2 s1 s2 (arg_2: 'a -> 'b -> 'c) = fun i -> arg_2 (s1 i) (s2 i)

let replace s n a = fun i -> 
  if (i mod n) = 0 
  then a 
  else s i

let take s n = fun i -> s (i * n)

let scan (s : int -> 'b) (fn :  'a -> 'b -> 'a) (a : 'a) = 
  fun i -> 
    let rec help i_h acc =
      if i_h = i
      then acc
      else help (i_h + 1) (fn a acc) 
    in
    help 0 (s 0);;

let tabulate s ?(x = 0) y = 
  let rec help r acc = 
    if x = r
    then s r::acc
    else help (r-1) (s r::acc) 
  in
  help y [];;


hd s_int;;
tl s_int;;
hd (add s_int 5);;
hd (map s_int (fun x -> x*x));;
hd (replace s_int 3 100);;
hd (tl (take s_int 5));;
tabulate s_int 4;;




(* 5zad *)
let ctrue a b = a;;
let cfalse a b = b;;

let cand (a : 'a -> 'a -> 'a) (b : 'a -> 'a -> 'a) = 
  if a true false && b true false
  then ctrue
  else cfalse

let cor (a : 'a -> 'a -> 'a) (b : 'a -> 'a -> 'a) = 
  if a true false || b true false
  then ctrue
  else cfalse

let cbool_of_bool bool = fun a b -> if bool then a else b
let bool_of_cbool cbool = cbool true false

(* 6zad *)
let zero (fn : 'a -> 'a) (x : 'a) = x
let succ (n : (('a -> 'a) -> 'a -> 'a))  = fun fn x -> fn (n fn x)

let add n1 n2 : (('a -> 'a) -> 'a -> 'a) = 
  fun fn x -> n1 fn (n2 fn x)

let mul n1 n2 : (('a -> 'a) -> 'a -> 'a) =
    let rec help acc1 acc2 =
    if acc2 (fun x -> x + 1) 1 = n2 (fun x -> x + 1) 1
    then acc1
    else help (add acc1 n1) (succ acc2)
  in 
  help zero zero

let isZero (n : (('a -> 'a) -> 'a -> 'a))  =
 if n (fun x -> x + 1) 1 = zero (fun x -> x + 1) 1 
 then ctrue 
 else cfalse

let cnum_of_int n = 
  let rec help acc i =
    if i >= n 
    then acc
    else help (succ acc) (i + 1)
  in
  help zero 0

let int_of_cnum fn = 
  let rec find acc n =
    if fn (fun x -> x + 1) 1 = acc (fun x -> x + 1) 1
    then n
    else find (succ acc) (n + 1)
  in
  find zero 0

let string_of_cnum fn =
  string_of_int (int_of_cnum fn)
  

let test () =
  print_endline ("0 * 0 - " ^ string_of_cnum (mul zero zero));
  print_endline ("0 * 1 - " ^ string_of_cnum (mul zero (succ zero)));
  print_endline ("1 * 0 - " ^ string_of_cnum (mul (succ zero) zero));
  print_endline ("1 * 1 - " ^ string_of_cnum (mul (succ zero) (succ zero)));
  print_endline ("1 * 2 - " ^ string_of_cnum (mul (succ zero) (succ(succ zero))));
  print_endline ("2 * 1 - " ^ string_of_cnum (mul (succ(succ zero)) (succ zero)));
  print_endline ("2 * 2 - " ^ string_of_cnum (mul (succ(succ zero)) (succ(succ zero))));;

let test2 () =
  print_endline ("0 + 0 - " ^ string_of_cnum (add zero zero));
  print_endline ("0 + 1 - " ^ string_of_cnum (add zero (succ zero)));
  print_endline ("1 + 0 - " ^ string_of_cnum (add (succ zero) zero));
  print_endline ("1 + 1 - " ^ string_of_cnum (add (succ zero) (succ zero)));
  print_endline ("1 + 2 - " ^ string_of_cnum (add (succ zero) (succ(succ zero))));
  print_endline ("2 + 1 - " ^ string_of_cnum (add (succ(succ zero)) (succ zero)));
  print_endline ("2 + 2 - " ^ string_of_cnum (add (succ(succ zero)) (succ(succ zero))));
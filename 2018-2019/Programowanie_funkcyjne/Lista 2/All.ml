let rec map_adv f l = 
  match l with 
  |[] -> []
  |[[]] -> []
  |x::xs -> f x::map_adv f xs;;

let rec sublists = function
  |[] -> [[]]
  |h::t -> let l = sublists t in
    [h]::map_adv (fun x -> h::x) l @ l;;

sublists [1;2];;
sublists [1;2;3];;
sublists [1];;
sublists [];;
sublists [1;2;3;4];;


(* 2zad *)
let cycle ls n =
  let rec aux ls n =
    match ls with
    |[] -> ([], 1, [])
    |h::t -> match (aux t n) with
      |(l, i, _) when i <= n -> ([], i + 1, h::t)
      |(l, i, l1) -> (h::l, i + 1, l1)
  in
  match (aux ls n) with (l, i, t) -> t @ l;;

cycle [1;2;3] 2;;
cycle [1;2;3;4;5] 2;;
cycle [1;2;3] 5;;


(* 3zad *)

let rec merge (cmp : 'a -> 'a -> bool) (l1 : 'b list) (l2 : 'b list) =
  match l1,l2 with
  | l, [] -> l
  | [], l -> l
  | h1::t1, h2::t2 -> 
    if cmp h1 h2
    then h1::(merge cmp t1 (h2::t2))
    else h2::(merge cmp (h1::t1) t2);;

let merge_acc (cmp : 'a -> 'a -> bool) (l1 : 'b list) (l2 : 'b list) =
  let rec help l1 l2 acc  =
    match l1,l2 with
    | [], [] -> acc
    | h::t, [] -> help t [] (h::acc)
    | [], h::t -> help t [] (h::acc)
    | h1::t1, h2::t2 -> 
      if (cmp h1 h2)
      then help t1 (h2::t2) (h1::acc)
      else help (h1::t1) t2 (h2::acc)
  in help l1 l2 [];;

let split ls =
  let rec help ls acc1 acc2 =
    match ls with
    | []        -> acc1, acc2
    | a::[]     -> a::acc1, acc2
    | a::b::[]  -> a::acc1, b::acc2
    | h1::h2::t -> help t (h1::acc1) (h2::acc2)
  in help ls [] []


let rec mergesort (cmp : 'a -> 'a -> bool) (l : 'b list) =
  match l with
  | []    -> []
  | a::[] -> [a]
  | h::t  ->
    match split l with l1, l2 ->
      merge cmp (mergesort cmp l1) (mergesort cmp l2)

let rec mergesort2 (cmp : 'a -> 'a -> bool) (l : 'b list) =
  match l with
  | []    -> []
  | a::[] -> [a]
  | h::t  ->
    match split l with l1, l2 ->
      merge_acc cmp (mergesort cmp l1) (mergesort cmp l2)

(* 4zad *)
let partition (pred : 'a -> bool) (ls : 'a list) =
  let rec help (ls : 'a list) acc1 acc2 =
    match ls with
    | []    -> acc1, acc2
    | h::t  -> 
      if pred h 
      then help t (h::acc1) acc2 
      else help t acc1 (h::acc2)
  in help ls [] []

let rec ( @@ ) l1 l2 =
  match l1 with
  | []    -> l2
  | h::t  -> h::(t @@ l2)

let rec qsort (cmp : 'a -> 'a -> bool) (ls : 'a list) =
  match ls with
  | []    -> []
  | a::[] -> [a]
  | h::t  ->
    match partition (cmp h) t with l1, l2 ->
      (qsort cmp l2) @@ h::(qsort cmp l1);;

(* 5zad *)

let rec concat ls =
  match ls with
  | []  -> []
  | h::t -> h @@ (concat t)

let rec map op ls =
  match ls with
  | []    -> []
  | h::t  -> (op h)::map op t

let rec ins_to_all (x : 'a) (ls : 'a list) =  
  match ls with
  | []    -> [[x]]
  | h::t  -> (x::h::t)::(map (fun y -> h::y) (ins_to_all x t))

let rec perm ls = 
  match ls with
  | h::t  -> concat (map (ins_to_all h) (perm t))
  | _     -> [ls]

(* 6zad *)
let rec suffix ls = 
  match ls with
  | []    -> [[]]
  | h::t  -> ls::suffix t

let prefix ls =
  let rec help ls =
    match ls with
    | []    -> []
    | h::t  -> [h]::(map (fun x -> h::x) (help t)) 
  in []::help ls




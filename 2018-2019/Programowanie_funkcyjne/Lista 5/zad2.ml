(* 2 *)

type move = 
  | Fill of int
  | Drain of int
  | Transfer of int * int

let rec nsols (ls, vol) n = 
  match n with
  | 0 -> LNil
  | d
  


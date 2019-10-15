type component =
  | True
  | False
  | Var of string
  | Con of component * component
  | Dis of component * component
  | Imp of component * component
  | Frame of component * (component list)

let rec find_pos_neg = function 
  | True | False -> ([], [])
  | Var p -> ([p], [])
  | Con (p, q) | Dis (p, q) -> 
    let (x1, y1) = find_pos_neg p in 
    let (x2, y2) = find_pos_neg q in 
    (x1 @ x2, y1 @ y2)
  | Imp (p, q) -> 
    let (x1, y1) = find_pos_neg p in 
    let (x2, y2) = find_pos_neg q in 
    (y1 @ x2, x1 @ y2)
  | Frame (p, h::t) -> 
    let (x1, y1) = find_pos_neg (Imp (p, h)) in
    let (x2, y2) = find_pos_neg (Frame (p, t)) in
    (x1 @ x2, y1 @ y2)
  | Frame (p, []) -> ([], []) ;;
  
  

find_pos_neg (Imp ((Var "p"), (Var "p")));;
find_pos_neg (Imp ((Var "p"), (Con (Imp (Var "q", Var "z"), Var "p"))));;


type formula =  
  | True
  | False
  | Var of string
  | Con of component * component
  | Dis of component * component
  | Imp of component * component

type element = 
  |Frame of formula * proof
  |Form of formula

and proof = element list
;;

let rec form_pos_neg = function 
  | True | False -> ([], [])
  | Var p -> ([p], [])
  | Con (p, q) | Dis (p, q) -> 
    let (x1, y1) = find_pos_neg p in 
    let (x2, y2) = find_pos_neg q in 
    (x1 @ x2, y1 @ y2)
  | Imp (p, q) -> 
    let (x1, y1) = find_pos_neg p in 
    let (x2, y2) = find_pos_neg q in 
    (y1 @ x2, x1 @ y2)

let rec proof_pos_neg = function
  | []    -> [],[]
  | h::t  -> 
    match h with
    | Frame (a, b)  -> 
      let (p,   n) = form_pos_neg a in
      let (p2, n2) = proof_pos_neg b in
        n@p2, p@n2
    | Form form     -> 
      let (p,n) = (form_pos_neg form) in (p, n);;

proof_pos_neg [Frame (Var "p", [Form (Var "p")])]
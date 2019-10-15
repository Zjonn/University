open Syntax
open DebugHelpers

type 'a ret = 
  | RetProp of 'a prop
  | InvalidProof of string


let check (proof : string pt) : string ret =
  let rec aux_check ax p =
    match p with 
    | Ax p -> if List.mem p ax 
      then RetProp p 
      else InvalidProof "Axiom is invalid"

    | TopI -> RetProp Top

    | ConjI (pt1, pt2) -> (match (aux_check ax pt1, aux_check ax pt2) with
        | (RetProp p1, RetProp p2) -> RetProp (Conj (p1, p2))
        | (InvalidProof x, _) | (_, InvalidProof x) -> InvalidProof x)

    | DisjIL (pt, Disj (p, q)) | DisjIR (Disj (p, q), pt) -> 
      (match aux_check ax pt with 
       | RetProp prop -> if prop = p 
         then RetProp (Disj (p, q)) 
         else InvalidProof "Error in DisjIL"
       | InvalidProof x -> InvalidProof x)
    | DisjIL (pt, _) -> InvalidProof "Error in DisjIL"
    | DisjIR (_, pt) -> InvalidProof "Error in DisjIR"

    | ImplI (p, pt) -> (match aux_check (p::ax) pt with
        | RetProp prop -> RetProp (Impl (p, prop))
        | InvalidProof x -> InvalidProof x)

    | BotE p -> RetProp p

    | ConjEL pt -> (match aux_check ax pt with 
        | InvalidProof x -> InvalidProof x
        | RetProp (Conj (p, q)) -> RetProp p
        | _ -> InvalidProof "Error in ConjEL")

    | ConjER pt -> (match aux_check ax pt with 
        | InvalidProof x -> InvalidProof x
        | RetProp (Conj (p, q)) -> RetProp q
        | _ -> InvalidProof "Error in ConjER")

    | DisjE (pt, (ass1, pt1), (ass2, pt2)) -> 
      (match (aux_check ax pt, 
              aux_check (ass1::ax) pt1, 
              aux_check (ass2::ax) pt2) with
      | (RetProp (Disj (p, q)), RetProp r1, RetProp r2) 
        when p = ass1 && q = ass2 && r1 = r2  -> RetProp r1
      | (InvalidProof x, _, _) 
      | (_ , InvalidProof x, _) 
      | (_ , _, InvalidProof x) -> InvalidProof x
      | _ -> InvalidProof "Error in DisjE")

    | ImplE (pt1, pt2) -> 
      (match (aux_check ax pt1, aux_check ax pt2) with 
       | (RetProp p, RetProp (Impl (p1, q))) when p1 = p -> RetProp q
       | (InvalidProof x, _) | (_, InvalidProof x) -> InvalidProof x
       | _ -> InvalidProof "Error in ImplE")
  in aux_check [] proof

let is_kombination prop ax =
  match prop with
  | Conj (a, b) -> List.exists (fun x -> x == a) ax && List.exists (fun x -> x == b)
  | Disj (a, b) -> List.exists (fun x -> x == a) ax || List.exists (fun x -> x == b)
  | Impl (a, b) -> List.exists (fun x -> x == a) ax && List.exists (fun x -> x == b)



    let ps_check (proof : string ps) =
      let rec is_conlusion prop ax = 
        if List.exists (fun x -> x == prop) ax
        then true
        else 
      in
      let rec aux_check ax p = match p with
        | PDone prop -> if is_conlusion prop ax 
          then RetProp prop
          else InvalidProof "can't conclude prop from axioms"
        | PConc (prop, ps) -> if is_conlusion prop ax 
          then aux_check (prop::ax) ps 
          else InvalidProof "can't conclude prop from axioms"
        | PHyp ((ass, ps1), ps2) -> 
          (match aux_check (ass::ax) ps1 with 
           |RetProp p -> (match aux_check (p::ax) ps2 with
               | RetProp p -> RetProp p
               | InvalidProof x -> InvalidProof x)
           | InvalidProof x -> InvalidProof x )

      in aux_check [] proof

let check_and_print (list : string thing list) = 
  let rec for_elem l = match l with
    | [] -> ()
    | head::tail -> (match head with 
        | TGoal (name, goal, proof) -> (match check proof with
            | RetProp p when p = goal-> Printf.printf "%s: true\n" name; (* print p ;*) for_elem tail
            | InvalidProof e -> Printf.printf "%s: false, %s\n" name e; for_elem tail
            | _ -> Printf.printf "%s: false\n" name; for_elem tail)
        | SGoal (name, goal, proof) -> (* ps_print proof ;*) for_elem tail) in
  for_elem list

let _ =
  let lexbuf = Lexing.from_channel stdin in
  let proofs = Parser.file Lexer.token lexbuf
  (* powyższe wiersze wczytują listę dowodów ze standardowego wejścia
     i parsują ją do postaci zdefiniowanej w module Syntax *)
  in check_and_print proofs; print_newline ()


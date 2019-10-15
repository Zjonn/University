open Syntax

let print (p : string prop) =
  let rec print prop =  match prop with
    | Var s -> Printf.printf "(Var %s)" s
    | Top -> Printf.printf "True"
    | Bot -> Printf.printf "False"
    | Conj (p, q) -> 
      Printf.printf "(Conj ";
      print p;
      Printf.printf " ";
      print q;
      Printf.printf ")"
    | Disj (p, q) ->
      Printf.printf "(Disj ";
      print p;
      Printf.printf " ";
      print q;
      Printf.printf ")"
    | Impl (p, q) ->
      Printf.printf "(Impl ";
      print p;
      Printf.printf " ";
      print q;
      Printf.printf ")" in
  print p

let ps_print (ps : string ps) =
  let rec aux_print p = match p with
    | PDone prop ->
      Printf.printf "(-PDone ";
      print prop;
      Printf.printf "-)"
      | PConc (prop, proof) -> 
      Printf.printf "(-PConc ";
      print prop;
      Printf.printf " - ";
      aux_print proof;
      Printf.printf "-)"
      | PHyp ((prop, proof), proof1) -> 
      Printf.printf "(-PHyp (shyp ";
      print prop;
      Printf.printf " -shh- ";
      aux_print proof;
      Printf.printf ") ";
      aux_print proof1;
      Printf.printf "-)" in
  aux_print ps; Printf.printf "\n" 

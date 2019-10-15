(* x jest punktem stałym f <=> f x = x *)
let rec fix f x = f (fix f) x;;

let factorial = fix (fun f -> fun n -> if n = 0 then 1 else n * (f (n - 1)));;



let fact_ref n =
  let tmp = ref (fun _ -> 0) in
  let aux x = if x = 0 then 1 else x * (!tmp (x - 1)) in
  tmp := aux; aux n

let fix_ref =
  let tmp = ref (fun f x -> x) in
  let aux = (fun f x -> f (!tmp f) x) in
  tmp := aux; !tmp

let fix_fact = fix_ref (fun f -> fun n -> if n = 0 then 1 else n*(f (n-1)))
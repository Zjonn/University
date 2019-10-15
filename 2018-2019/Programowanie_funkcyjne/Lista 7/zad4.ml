let fresh, reset = 
  let c = ref 0 in 
  let f x = c := !c + 1; x ^ string_of_int !c 
  and r x = c := x in 
  f, r;;
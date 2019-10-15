(* funkcje z wykładu - moduł Lazy *)
open Lazy;;

type 'a lazyList = 
	| LNil 
	| LCons of 'a * 'a lazyList Lazy.t
;;

let lhd = function
	| LNil -> failwith "lhd failed"
	| LCons (x, _) -> x
;;

let ltl = function
	| LNil -> failwith "ltl failed"
	| LCons (_, lazy t) -> t (* LCons (_, t) -> Lazy.force t *)
;;

let rec lfrom k = LCons (k, lazy (lfrom (k + 1)));;

let rec ltake = function
	| (0, _) -> []
	| (_, LNil) -> []
	| (n, LCons(x, lazy xs)) -> x :: ltake(n - 1, xs)
;;

let rec lmap f = function
	| LNil -> LNil
	| LCons(x, lazy xs) -> LCons(f x, lazy(lmap f xs))
;;

(* zdefiniuj strumień przybliżający wartość liczby π z rosnącą dokładnością *)
let mod_pi_stream = 
	let neg x = (-1.) *. x in 
	let rec aux sum n sign =
		let next = (sum +. sign *. (1. /. n)) in
		LCons (4. *. next, lazy(aux next (n +. 2.) (neg sign)))
	in aux 0. 1. 1.
;;

(* napisz funkcję przekształcającą dowolny strumień *)
let rec mod_map_stream f = function
	| LNil -> LNil
	| LCons(x1, xs)  -> 
		let ys = force xs in
		match ys with 
		| LNil -> LNil (* str. jednoelem *) 
		| LCons(x2, xxs) -> 
			let yys = force xxs in
			match yys with 
			| LNil -> LNil
			| LCons(x3, _) -> 
				LCons(f x1 x2 x3, lazy(mod_map_stream f ys))
;;

(* korzystając z powyższych definicji i transformacji Eulera *)
let mod_euler x y z = z -. ((y -. z) ** 2.) /. (x -. 2. *. y +. z);;
let mod_pi_euler = mod_map_stream mod_euler mod_pi_stream;;

ltake (10, mod_pi_stream);;
ltake (10, mod_map_stream (fun x y z -> [x; y; z]) mod_pi_stream);;
ltake (10, mod_pi_euler);;
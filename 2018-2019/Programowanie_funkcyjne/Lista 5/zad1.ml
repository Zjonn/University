(* funkcje z wykładu - lazy z wykładu *)
type 'a lazyList = 
	| LNil 
	| LCons of 'a * (unit -> 'a lazyList)
;;

let lhd = function
	| LNil -> failwith "lhd failed"
	| LCons (x, _) -> x
;;

let ltl = function
	| LNil -> failwith "ltl failed"
	| LCons (_, xf) -> xf()
;;

let rec lfrom k = 
	LCons (k, function () -> lfrom (k + 1))
;;

let rec ltake = function
	| (0, _) -> []
	| (_, LNil) -> []
	| (n, LCons(x, xf)) -> x :: ltake(n - 1, xf())
;;

let rec toLazyList = function
	| [] -> LNil
	| x :: xs -> LCons(x, function () -> toLazyList xs)
;;

let rec (@$) ll1 ll2 =
	match ll1 with
	| LNil -> ll2
	| LCons(x, xf) -> LCons(x, function () -> (xf()) @$ ll2)
;;

let rec lmap f = function
	| LNil -> LNil
	| LCons(x, xf) -> LCons(f x, function () -> lmap f (xf()) )
;;

let rec lfilter pred = function
	| LNil -> LNil
	| LCons(x,xf) -> if pred x
	then LCons(x, function () -> lfilter pred (xf()) )
	else lfilter pred (xf())
;;

let rec liter f x = LCons(x, function () -> liter f (f x));;

let rec ltakeWithTail = function
	| (0, xq) -> ([], xq)
	| (_, LNil) -> ([], LNil)
	| (n, LCons(x, xf)) ->
	let (l, tail) = ltakeWithTail(n - 1, xf())
	in (x :: l, tail)
;;

(* zdefiniuj strumień przybliżający wartość liczby π z rosnącą dokładnością *)
let pi_stream = 
	let neg x = (-1.) *. x in 
	let rec aux sum n sign = 
		let next = (sum +. sign *. (1. /. n)) in
		LCons (4. *. next, function() -> aux next (n +. 2.) (neg sign))
	in aux 0. 1. 1.
;;

(* napisz funkcję przekształcającą dowolny strumień *)
let rec map_stream f = function
	| LNil -> LNil
	| LCons(x1, xs)  -> 
		let ys = xs() in
		match ys with 
		| LNil -> LNil (* str. jednoelem *) 
		| LCons(x2, xxs) -> 
			let yys = xxs() in
			match yys with 
			| LNil -> LNil
			| LCons(x3, _) -> 
				LCons(f x1 x2 x3,  function() -> map_stream f ys)
;;

(* korzystając z powyższych definicji i transformacji Eulera *)
let euler x y z = z -. ((y -. z) ** 2.) /. (x -. 2. *. y +. z);;
let pi_euler = map_stream euler pi_stream;;

ltake (10, pi_stream);;
ltake (10, map_stream (fun x y z -> [x; y; z]) pi_stream);;
ltake (10, pi_euler);;
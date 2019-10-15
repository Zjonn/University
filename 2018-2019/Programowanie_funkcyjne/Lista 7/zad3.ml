open Hashtbl;;
open List;;

type ('a, 'b) memois = ('a * 'b) list;;

let createTbl = [];;

open List;;
let findValue key tbl = 
	assoc_opt key tbl
;;

let insertValue (key, value) tbl = 
	(key, value) :: tbl
;;


let fib_memo n = 
	let rec aux n tbl = 
		if n <= 1 then (n, tbl) else
		let found = findValue n tbl in
		match found with 
		| Some value -> (value, tbl)
		| None -> 
			let (n2, tbl2) = aux (n - 2) tbl in
			let (n1, tbl1) = aux (n - 1) tbl2 in

			let newValue = n2 + n1 in
			let newTbl = insertValue (n, newValue) tbl1 in

			(newValue, newTbl) 
	in fst (aux n createTbl)
;;


open Hashtbl;;
type ('a, 'b) memois = ('a, 'b) Hashtbl.t

let createTbl = create 0;;


let findValue key tbl = find_opt tbl key;;

let insertValue (key, value) tbl = add tbl key value;;

let rec fib n = if n <= 1 then n else fib (n - 2) + fib (n - 1);;


let fib_memo n = 
	let rec aux n tbl = 
		if n <= 1 then (n, tbl) else
		let found = findValue n tbl in
		match found with 
		| Some value -> (value, tbl)
		| None -> 
			let (n2, tbl2) = aux (n - 2) tbl in
			let (n1, tbl1) = aux (n - 1) tbl2 in

			let newValue = n2 + n1 in
			let newTbl = insertValue (n, newValue) tbl1;tbl in

			(newValue, newTbl) 
	in fst (aux n createTbl)
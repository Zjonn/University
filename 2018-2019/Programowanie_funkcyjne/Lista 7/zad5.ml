(* -n osób stoi w okręgu
-rozpoczynając od wskazanej osoby, przebiegamy po okręgu, usuwając co m-tą osobę
-po usunięciu każdej osoby odliczanie odbywa się w nowo powstałym okręgu 
-proces aż do usunięcia wszystkich osób
-permutacja Józefa typu (7,3) <3,6,2,7,5,1,4>  *)

type 'a lnode = {item: 'a; mutable next: 'a lnode};;

let mk_circular_list e =
	let rec x = {item = e; next = x} (* jest jedynym i następnym samego siebie *)
	in x
;;


let insert_head e l =
	let x = {item = e; next = l.next}
	in l.next <- x; l
;;

let insert_tail e l =
	let x = {item = e; next = l.next}
	in l.next <- x; x
;;

let first ln = 
	(ln.next).item;;

let elim_head l = 
	l.next <- (l.next).next; l;;


let mk_circular_list_in_range n = 
	let rec aux a b =
		if a > b then []
		else b :: aux a (b - 1)
	in  	 
	let l = mk_circular_list 1 in
	List.fold_right insert_tail (aux 2 n) l
;;


let rec rotate n lc = 
	if n = 0 then lc
	else rotate (n - 1) lc.next
;;

let jozef_perm (n, m) = 
	let rec aux cl = 
		if cl == cl.next 
			then [cl.item]
		else 
			let rotation = rotate (m - 1) cl in
			let eliminated = first rotation in
			let rest = elim_head rotation in 
			eliminated :: aux rest 
	in aux (mk_circular_list_in_range n)
;;
let atoi_r list =
    let rec aux l acc =
        match l with
        | []    -> acc
        | h::t  -> aux t (acc*10 + int_of_char h - 48)
    in aux list 0;;

let atoi list = List.fold_left (fun x y -> x*10 + int_of_char y - 48) 0 list;;

(*2zad*)
let horner_r list arg =
    let rec aux l acc =
        match l with
        | []    -> acc
        | h::t  -> aux t (h +. acc *. arg) 
    in aux list 0.;;

let horner list arg = List.fold_left (fun x y -> y +. x *. arg) 0. list

(*3zad*)
let  fold_right_r fn list arg =
     let rec aux l acc =
        match l with
        | []    -> acc
        | h::t  -> aux t (fn acc h)
    in aux (List.rev list) arg

let fold_right fn list arg = List.fold_left fn arg (List.rev list)

(*4zad*)

(*8zad*)
type 'a mtx = 'a list list;;
type mtx_data = {columns : int; rows : int};;
exception Mtx of string;;

let mtx_dim (matrix : 'a mtx) = 
    if matrix = [] || matrix = [[]]
    then raise (Mtx "Macierze 0 wymiarowe nie sa obslugiwane")
    else
    let columns = List.fold_left (fun x _ -> x + 1) 0 (List.hd matrix) in
    let rec aux rows acc =
        match rows with
        | []    -> acc
        | h::t  -> 
        if columns = List.fold_left (fun x _ -> x + 1) 0 h
        then  aux t (acc+1)
        else raise (Mtx "Wszystkie wiersze musza posiadac taka sama liczbe kolumn")
    in {columns = columns; rows = aux matrix 0};;

(*9zad*)
let rec list_elem elem list =
    match elem, list with
    | _, []  -> raise (Mtx "Ta macierz nie ma tylu kolumn")
    | 0,h::t -> h
    | _,_::t -> list_elem (elem - 1) t

let rec mtx_row row (h::t) =
    match row with
    | 0  -> h
    | _  -> mtx_row (row - 1) t

let rec mtx_column column matrix =
    match matrix with
    | []    -> []
    | h::t  -> (list_elem column h)::(mtx_column column t);;

let mtx_elem column row matrix =
    let ls = mtx_row row matrix in
    list_elem column ls;;
     
(*10zad*)
let transpose matrix =
    let rec aux mt itr =
        match mt with
        | []    -> []
        | h::t  -> (mtx_column itr matrix)::aux t (itr + 1)
    in aux (List.hd matrix) 0

(*11zad*)
let rec mtx_add mtx1 mtx2 =
    match mtx1, mtx2 with
    | [],[]             -> []
    | h1::t1, h2::t2    -> 
        (List.map2 (fun a b -> a + b) h1 h2)::mtx_add t1 t2
    | _, _              -> raise (Mtx "Nie mozna dodac macierzy, maja rozne rozmiary")
    
(*12zad*)

let scalar_prod v1 v2 =
    List.fold_left2 (fun x y z -> x + y * z) 0 v1 v2

(*13zad*)

let mtx_apply mtx v =
    List.map2 (fun x _ -> scalar_prod x v) mtx v

let mtx_mul mtx_1 mtx_2 =
    let rec aux m =
        match m with
        | []    -> []
        | h::t  -> (mtx_apply mtx_1 h)::(aux t) 
    in transpose (aux (transpose mtx_2))

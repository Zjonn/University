(* 2zad Rozważmy typ danych dla drzew binarnych, zdefiniowany następująco: 

type α btree = Leaf | Node of α btree * α * α btree
Mówimy, że drzewo jest zbalansowane, jeśli dla każdego węzła v liczby węzłów w lewym i prawym poddrzewie zakorzenionym w v różnią się co najwyżej o 1. *)
type 'a btree = 
    Leaf 
  | Node of 'a btree * 'a * 'a btree
;;

(* Napisz efektywną funkcję sprawdzającą czy dane drzewo jest zbalansowane. *)
let isBalanced btree = 
  let rec balanceFactor btree_ = 
      match btree_ with
      | Leaf -> 1
      | Node(tl, _, tr) -> 
          let hl = balanceFactor tl in 
          let hr = balanceFactor tr in 
          if hl = -1 || hr = -1 then -1
          else 
              if abs(hr - hl) > 1 then -1
              else hl + hr + 1
      in
      balanceFactor btree > -1
;; 

(* Napisz funkcję, która dla zadanej listy etykiet tworzy zbalansowane drzewo, dla którego tę listę można otrzymać przechodząc je w porządku preorder. *)
open List;;

let revall listOfLists =
  let rec aux list_ =
      match list_ with
      [] -> [] 
      | h :: t -> List.rev h :: aux t
  in aux listOfLists 
;;

let halveLists labels = 
  let half = List.length labels / 2 in
  let rec aux list_ ind acc = 
      match list_ with 
      | [] -> acc
      | h :: t -> 
          if ind < half then
              match acc with
              | [x; y] -> aux t (ind + 1) [h :: x; y]
            else match acc with
              | [x; y] -> aux t (ind + 1) [x; h :: y]
  in revall(aux labels 0 [[]; []])
;;

let buildBalancedTree labels =
  let rec aux tree = 
      match tree with 
      | [] -> Leaf
      | h :: t -> 
          match (halveLists t) with
          | halvedh :: halvedt :: [] -> Node(aux halvedh, h, aux halvedt)
  in aux labels
;;

(* testy *)
let test = 
  let testRevall = 
      revall [[1; 2]; [3; 4]] = [[2; 1]; [4; 3]] &&
      revall [[1]; [2; 3; 4]; [5; 6]] = [[1]; [4; 3; 2]; [6; 5]]
  in
  let testIsBalanced = 
      let t1 = Node(Node(Leaf, 1, Leaf), 1, Node(Leaf, 1, Leaf)) in
      let t2 = Node(Node(Leaf, 2, Node(Leaf, 3, Leaf)), 1, Leaf) in
      isBalanced t1 && isBalanced t2 = false
  in
  let testHalveList = 
      halveLists [1; 2; 3; 4; 5; 6; 7] = [[1; 2; 3]; [4; 5; 6; 7]] &&
      halveLists [1; 2; 3] = [[1]; [2; 3]] &&
      halveLists [1; 2; 3; 4] = [[1; 2]; [3; 4]]
  in
  let testBuildBalancedTree = 
      buildBalancedTree [1; 2; 3] = Node (Node (Leaf, 2, Leaf), 1, Node (Leaf, 3, Leaf)) &&
      buildBalancedTree [1; 2; 3; 4] = Node (Node (Leaf, 2, Leaf), 1, Node (Leaf, 3, Node (Leaf, 4, Leaf)))
  in testRevall && testIsBalanced && testHalveList && testBuildBalancedTree

(*3zad*)
(* druga reprezentacja *)
type 'a mtree_lst = MTree of 'a * ('a mtree_lst) list;;
open List;;

let sndBFS structure =
	let rec aux str =
		match str with
		| [] -> []
		| MTree(h, l)::t -> h :: aux (t @ l)
	in aux structure
;;

let sndDFS structure =
	let rec aux str =
		match str with
		| [] -> []
		| MTree(h, l)::t -> h :: aux (l @ t)
	in aux structure
;;

(* pierwsza reprezentacja *)
type 'a mtree = MNode of 'a * 'a forest
and 'a forest = EmptyForest | Forest of 'a mtree * 'a forest;;

let rec listOfTrees forest = 
	match forest with 
	| EmptyForest -> []
	| Forest(tree, restOfForests) -> tree :: listOfTrees restOfForests

let fstBFS structure = 
	let rec search list_ =
		match list_ with
		| [] -> []
		| (MNode (tree, forests)) :: t -> tree :: search (t @ (listOfTrees forests))
	in search [structure]
;;

let fstDFS structure = 
	let rec search list_ =
		match list_ with
		| [] -> []
		| (MNode (tree, forests)) :: t -> tree :: search ((listOfTrees forests) @ t)
	in search [structure]
;;

(* testy *)
let test =
	let forest_ = MNode(1, Forest(MNode(2, Forest(MNode(4, EmptyForest), EmptyForest)), Forest(MNode(3, EmptyForest), EmptyForest)))
	in
	let forest_2_ = MNode(1, Forest(MNode(2, Forest(MNode(3, Forest(MNode(4, EmptyForest), EmptyForest)), EmptyForest)), Forest(MNode(5, Forest(MNode(6, Forest(MNode(7, EmptyForest), EmptyForest)), EmptyForest)), Forest(MNode(8, EmptyForest), EmptyForest))))
	in 
	let testSecondRepr = 
		sndBFS [MTree(1, [])] = [1] &&
		sndBFS [MTree(1, [MTree(2, [MTree(3, [MTree(5, [])])])])] = [1; 2; 3; 5] &&
		sndDFS [MTree(1, [])] = [1] && 
		sndDFS [MTree(1, [MTree(2, [MTree(3, [MTree(5, [])])])])] = [1; 2; 3; 5]
	in 
	let testFirstRepr = 
		fstBFS forest_ = [1; 2; 3; 4] && 
		fstBFS forest_2_ = [1; 2; 5; 8; 3; 6; 4; 7] &&

		fstDFS forest_ = [1; 2; 4; 3] &&
		fstDFS forest_2_ = [1; 2; 3; 4; 5; 6; 7; 8]
	in 
	testSecondRepr && testFirstRepr 
;;

(* static graph module *)

module type VERTEX =
sig
  type t
  type label

  val equal : t -> t -> bool
  val create : label -> t
  val label : t -> label  
end

module Vertex : VERTEX with type label = int =
struct
  type label = int
  type t = label

  let equal v1 v2 = v1 == v2
  let create l = l
  let label v = v
end

module type EDGE = 
sig
  type t 
  type label
  type vertex

  val equal : t -> t -> bool
  val create : vertex -> label -> vertex -> t
  val label : t -> label
  val src : t -> vertex
  val dst : t -> vertex
end

module Edge : EDGE with type vertex = Vertex.t and type label = string = 
struct
  type label = string
  type vertex = Vertex.t
  type t = vertex * label * vertex

  let equal e1 e2 = e1 == e2
  let create v1 l v2 = (v1,l,v2)
  let label e = match e with (_,l,_) -> l
  let src = function (v,_,_) -> v
  let dst = function (_,_,v) -> v

end

module type GRAPH =
  sig
  (* typ reprezentacji grafu *)
  type t

  module V : VERTEX
  type vertex = V.t

  module E : EDGE with type vertex = vertex
  type edge = E.t

end

module IntGraph : GRAPH with module V = Vertex and module E = Edge =
struct

  module V = Vertex
  type vertex = V.t

  module E = Edge
  type edge = E.t

  type t = edge list * vertex list

  (* funkcje modyfikacji *) 
  let empty = ([],[])
  let add_v g v = (fst g, v::snd g)
  let add_e g e = (e::fst g, E.src e :: E.dst e :: snd g)


end

module type VERTEX =
sig
  type t
  type label

  val compare : t -> t -> int
  val create : label -> t
  val label : t -> label  
end

module type EDGE = 
sig
  type t 
  type label
  type vertex

  val compare : t -> t -> int
  val create : vertex -> label -> vertex -> t
  val label : t -> label
  val src : t -> vertex
  val dst : t -> vertex
end
wq
module Vertex : VERTEX with type label = int = 
struct
  type label = int
  type t = label

  let compare = Pervasives.compare
  let create l = l
  let label v = v
end

module Edge : EDGE with type vertex = Vertex.t and type label = string =
struct
  type label = string
  type vertex = Vertex.t
  type t = vertex * label * vertex

  let compare = Pervasives.compare
  let create v1 l v2 = (v1,l,v2)
  let label e = match e with (_,l,_) -> l
  let src = function (v,_,_) -> v
  let dst = function (_,_,v) -> v
end

module type GRAPH =
sig
  (* typ reprezentacji grafu *)
  type t

  module V : VERTEX
  type vertex = V.t

  module E : EDGE with type vertex = vertex
  type edge = E.t

  (* funkcje wyszukiwania *)
  val mem_v : t -> vertex -> bool
  val mem_e : t -> edge -> bool
  val mem_e_v : t -> vertex -> vertex -> bool
  val find_e : t -> vertex -> vertex -> edge
  val succ : t -> vertex -> vertex list
  val pred : t -> vertex -> vertex list
  val succ_e : t -> vertex -> edge list
  val pred_e : t -> vertex -> edge list

  (* funkcje modyfikacji *) 
  val empty : t
  val add_e : t -> edge -> t
  val add_v : t -> vertex -> t
  val rem_e : t -> edge -> t
  val rem_v : t -> vertex -> t

  (* iteratory *)
  val fold_v : (vertex -> 'a -> 'a) -> t -> 'a -> 'a
  val fold_e : (edge -> 'a -> 'a) -> t -> 'a -> 'a
end

module Graph (Vertex : VERTEX) (Edge : EDGE with type vertex = Vertex.t) 
  : GRAPH with module V = Vertex and module E = Edge =
struct
  module V = Vertex
  type vertex = V.t

  module E = Edge
  type edge = E.t

  module VSet = Set.Make(V)
  module ESet = Set.Make(E)

  type t = VSet.t * ESet.t

  exception EdgeNotFound

  let vertices g = fst g
  let edges g = snd g

  let mem_v g v = VSet.mem v (vertices g)
  let mem_e g e = ESet.mem e (edges g)

  let mem_e_v g v1 v2 = 
    if ESet.elements @@ ESet.filter (fun e -> E.src e == v1 && E.dst e == v2) (edges g) == [] 
    then false 
    else true

  let find_e g v1 v2 = 
    let el = ESet.elements @@ ESet.filter (fun e -> E.src e == v1 && E.dst e == v2) (edges g) in
    if el == [] 
    then raise EdgeNotFound 
    else List.hd el

  let empty = (VSet.empty, ESet.empty)
  let add_e g e = let vertices' = VSet.add (E.src e) (vertices g) in
    (VSet.add (E.dst e) (vertices'), ESet.add e (edges g))

  let add_v g v = (VSet.add v (vertices g), edges g)
  let rem_e g e = (vertices g, ESet.remove e (edges g))
  let rem_v g v = (VSet.remove v (vertices g), edges g)
  let fold_v f g s = VSet.fold f (vertices g) s
  let fold_e f g s = ESet.fold f (edges g) s
  let succ_e g v = ESet.elements @@ ESet.filter (fun e -> E.src e == v) (edges g)
  let pred_e g v = ESet.elements @@ ESet.filter (fun e -> E.dst e == v) (edges g)
  let succ g v = List.map E.dst @@ succ_e g v
  let pred g v = List.map E.src @@ pred_e g v
end

module IntGraph = Graph (Vertex) (Edge);;

let graph = IntGraph.empty;;
let v1 = Vertex.create 1;;
let v2 = Vertex.create 2;;
let e12 = Edge.create v1 "1 -> 2" v2;;
let graph = IntGraph.add_e graph e12;;
let v1succ = IntGraph.succ graph v1 |> List.map Vertex.label;;
let v1succ_e = IntGraph.succ_e graph v1 |> List.map Edge.label;;
let e21 = Edge.create v2 "2 -> 1" v1;;
let graph = IntGraph.add_e graph e21;; (* cycle *)
let e21' = Edge.create v2 "2 -> 1'" v1;;
let graph = IntGraph.add_e graph e21';; (* double edge *)
let found_v1_v2 = IntGraph.find_e graph v1 v2 |> IntGraph.E.label;;

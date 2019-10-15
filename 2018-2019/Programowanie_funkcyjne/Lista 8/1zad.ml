module type PQueue =
  sig
    type priority
    type 'a t

    exception EmptyPQueue

    val empty : 'a t
    val insert : 'a t -> priority -> 'a -> 'a t
    val remove : 'a t -> priority * 'a * 'a t
end

module PQueue =
  struct
    type priority = int
    type 'a t = ('a * priority) list

    exception EmptyPQueue

    let empty = []

    let insert que prio elem =
      let rec aux ls =
        match ls with
        | []        -> (elem, prio)::[]
        | (e, p)::t ->
          if p > prio
          then (elem,prio)::(e,p)::t
          else (e, p)::(aux t)
      in aux que

    let remove que =
      match que with
      | []        -> raise EmptyPQueue
      | (e,p)::t  -> p, e, t

end


let queue_sort l = 
  let rec aux q = function
      | [] -> q
      | x::xs -> aux (PQueue.insert q x x) xs
  and
  aux' q =
      try  
          match PQueue.remove q with
          | _, e, q' -> e :: aux' q'
      with
          PQueue.EmptyPQueue -> [] 
  
  in 
  aux' (aux PQueue.empty l)


module type ORDTYPE =
sig
    type t
    type comparison = LT | EQ | GT
    val compare : t -> t -> comparison
end

module PQueue (OrdType : ORDTYPE) : PQueue with type priority = OrdType.t =
struct
    type priority = OrdType.t
    type 'a t = (priority * 'a) list

    exception EmptyPQueue

    let empty = []

    let insert q p e = 
        let rec aux = function
            | [] -> [p,e]
            | x::xs -> match OrdType.compare (fst x) p with
                | OrdType.GT | OrdType.EQ -> (p,e)::x::xs
                | OrdType.LT -> x::aux xs
        in
            aux q
    
    let remove = function 
        | [] -> raise EmptyPQueue
        | x::xs -> fst x, snd x, xs
end

module OrdInt : ORDTYPE with type t = int =
struct
    type t = int
    type comparison = LT | EQ | GT

    let compare l r = if l < r then LT else if l > r then GT else EQ

end

let int_queue_sort l = 
    let module IntPQueue = PQueue(OrdInt) in
    let rec aux q = function
        | [] -> q
        | x::xs -> aux (IntPQueue.insert q x x) xs
    and
    aux' q =
        try  
            match IntPQueue.remove q with
            | _, e, q' -> e :: aux' q'
        with
            IntPQueue.EmptyPQueue -> [] 
    
    in 
    aux' (aux IntPQueue.empty l)



let sort (type s) (module Ord : ORDTYPE with type t = s) (l : s list) =
    let module Queue = PQueue(Ord) in
    let rec to_queue q = function
        | [] -> q
        | x::xs -> to_queue (Queue.insert q x x) xs
    and
    from_queue q = 
        try
            match Queue.remove q with
            | _, e, q' -> e :: from_queue q'
        with
            Queue.EmptyPQueue -> []
    in
        from_queue (to_queue Queue.empty l)







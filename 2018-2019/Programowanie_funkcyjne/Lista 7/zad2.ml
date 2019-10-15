type 'a list_mutable = LMnil | LMcons of 'a * 'a list_mutable ref

let rec concat_copy l1 l2 = 
  match l1 with
  | LMnil   -> l2
  | LMcons(h, t) -> LMcons(h, ref (concat_copy !t l2))

let rec concat_share l1 l2 =
  match l1 with
  | LMnil   -> l2
  | LMcons(h, t) when !t = LMnil -> t := l2 ; l1
  | LMcons(h, t) -> t := concat_share !t l2 ; l1
module F = Format

type address = int

type t = (string * address) list

let addr_index = ref 0

let new_address () = 
  let cur_addr = !addr_index in
  let _ = addr_index := cur_addr + 1 in
  cur_addr

let empty = []

let reset () = addr_index := 0

let insert x n s = (x, n) :: s

let rec find x s = 
  match s with
  | [] -> failwith ("Free identifier " ^ x)
  | (x', n) :: t -> if x' = x then n else find x t 

let mem x s = List.exists (fun (x', _) -> x = x') s

let pp fmt s = 
  let s = List.sort (fun (_, a1) (_, a2) -> Int.compare a1 a2) s in
  let rec pp_impl fmt s = 
    match s with
    | [] -> F.fprintf fmt "]"
    | (x, v) :: t -> F.fprintf fmt "(%s, a%d) %a" x v pp_impl t
  in
  F.fprintf fmt "[ %a" pp_impl s

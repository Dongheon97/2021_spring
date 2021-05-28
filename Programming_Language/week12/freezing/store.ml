module F = Format

type value = 
  | NumV of int 
  | ClosureV of string * Ast.expr * t
  | FreezedV of Ast.expr * t
and t = (string * value) list

let times = ref 0

let empty = []

let insert x n s = (x, n) :: s

let rec find x s = 
  match s with
  | [] -> failwith ("Free identifier " ^ x)
  | (x', n) :: t -> if x' = x then n else find x t 

let rec pp_v fmt v =
  match v with
  | NumV i -> F.fprintf fmt "%d" i
  | ClosureV (p, e, _) -> F.fprintf fmt "<λ%s.%a, ...>" p Ast.pp_e e 
  | FreezedV (e, _) -> F.fprintf fmt "#%a, ...#" Ast.pp_e e 

and pp fmt s = 
  let rec pp_impl fmt s = 
    match s with
    | [] -> F.fprintf fmt "]"
    | (x, v) :: t when !times < 5 -> 
        let _ = times := !times + 1 in
        F.fprintf fmt "(%s, %a) %a" x pp_v v pp_impl t
    | _ -> F.fprintf fmt " ... ]"
  in
  let _ = times := 0 in
  F.fprintf fmt "[ %a" pp_impl s

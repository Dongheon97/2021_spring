module F = Format

type t = (string * (string list * Ast.expr)) list

let empty = []

let insert x plist body s = (x, (plist, body))::s

let rec find x s = 
        match s with
        | (func_name, (plist, body))::t ->
                        if func_name = x then (plist, body)
                        else find x t
        | [] -> failwith ("Free identifier " ^ x)


let pp fmt s = 
  let rec pp_impl fmt s = 
    match s with
    | [] -> F.fprintf fmt "]"
    | (x, (p, e)) :: t -> F.fprintf fmt "(%s, (%s, %a)) %a" x p Ast.pp_e e pp_impl t
  in
  F.fprintf fmt "[ %a" pp_impl s

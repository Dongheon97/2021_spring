module F = Format

type t = (string * int) list

let empty = []

let insert x n s = (x, n)::s 
        (* x = string, n = int*)

let rec find x s =
        match s with
        | (a, b)::t ->
                if a=x then b
                else find x t
        | [] -> failwith ( "Free identifier " ^ x)      

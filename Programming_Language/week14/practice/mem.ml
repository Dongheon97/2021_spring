module F = Format

type value = 
  | NumV of int 
  | BoolV of bool
  | AddressV of Env.address
and t = (Env.address * value) list

let empty = []

let insert x n s = 
  let rec replace x n s' =
    match s' with
    | [] -> failwith "Not exists"
    | (x', n') :: t -> 
        begin
          if x' = x then (x, n) :: t
          else (x', n') :: (replace x n t)
        end
  in
  try
    replace x n s
  with Failure _ ->
    (x, n) :: s

let rec find x s = 
  match s with
  | [] -> failwith (F.asprintf "Uninitialized memory location: a%d" x)
  | (x', n) :: t -> if x' = x then n else find x t 

let pp_v fmt v =
  match v with
  | NumV i -> F.fprintf fmt "%d" i
  | BoolV b -> F.fprintf fmt "%b" b
  | AddressV a -> F.fprintf fmt "a%d" a

let pp fmt s = 
  let s = List.sort (fun (a1, _) (a2, _) -> Int.compare a1 a2) s in
  let rec pp_impl fmt s = 
    match s with
    | [] -> F.fprintf fmt "]"
    | (x, v) :: t -> F.fprintf fmt "(a%d, %a) %a" x pp_v v pp_impl t
  in
  F.fprintf fmt "[ %a" pp_impl s

module F = Format

type expr = 
  | Num of int
  | Add of expr * expr  
  | Sub of expr * expr
  | Id of string
  | LetIn of string * expr * expr
  | FCall of string * expr

type fundef = 
  | FDef of string * string * expr

type f1vae =
  | Prog of fundef * expr

let rec pp_e fmt e = 
  match e with
  | Num n -> F.fprintf fmt "(Num %d)" n 
  | Add (e1, e2) -> F.fprintf fmt "(Add %a %a)" pp_e e1 pp_e e2
  | Sub (e1, e2) -> F.fprintf fmt "(Sub %a %a)" pp_e e1 pp_e e2
  | Id x -> F.fprintf fmt "(Id %s)" x
  | LetIn (x, e1, e2) -> F.fprintf fmt "(LetIn %s %a %a)" x pp_e e1 pp_e e2
  | FCall (f, e) -> F.fprintf fmt "(FCall %s %a)" f pp_e e

let pp_fd fmt (FDef (f, p, e)) = 
  F.fprintf fmt "(FDef %s %s %a)" f p pp_e e 

let pp fmt (Prog (fd, e)) = 
  F.fprintf fmt "(Prog %a %a)" pp_fd fd pp_e e
  

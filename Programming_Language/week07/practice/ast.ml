module F = Format

type vae =
  | Num of int
  | Add of vae * vae
  | Sub of vae * vae
  | Id of string
  | LetIn of string * vae * vae

let rec pp fmt expr = 
  match expr with
  | Num n -> F.fprintf fmt "(Num %d)" n 
  | Add (e1, e2) -> F.fprintf fmt "(Add %a %a)" pp e1 pp e2
  | Sub (e1, e2) -> F.fprintf fmt "(Sub %a %a)" pp e1 pp e2
  | Id x -> F.fprintf fmt "(Id %s)" x
  | LetIn (x, e1, e2) -> F.fprintf fmt "(LetIn %s %a %a)" x pp e1 pp e2
  

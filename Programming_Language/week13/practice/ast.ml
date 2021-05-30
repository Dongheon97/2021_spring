module F = Format

type expr = 
  | Num of int
  | Var of string
  | Bool of bool
  | Add of expr * expr
  | Sub of expr * expr
  | Lt of expr * expr
  | Gt of expr * expr
  | Eq of expr * expr
  | And of expr * expr
  | Or of expr * expr

type stmt =
  | AssignStmt of string * expr
  | IfStmt of expr * stmt list * (stmt list) option

type program = Program of stmt list
  
let rec pp_e fmt e = 
  match e with
  | Num n -> F.fprintf fmt "(Num %d)" n
  | Var x -> F.fprintf fmt "(Var %s)" x
  | Bool b -> F.fprintf fmt "(Bool %b)" b
  | Add (e1, e2) -> F.fprintf fmt "(And %a + %a)" pp_e e1 pp_e e2
  | Sub (e1, e2) -> F.fprintf fmt "(And %a - %a)" pp_e e1 pp_e e2
  | Lt (e1, e2) -> F.fprintf fmt "(Lt %a < %a)" pp_e e1 pp_e e2
  | Gt (e1, e2) -> F.fprintf fmt "(Gt %a > %a)" pp_e e1 pp_e e2
  | Eq (e1, e2) -> F.fprintf fmt "(Eq %a == %a)" pp_e e1 pp_e e2
  | And (e1, e2) -> F.fprintf fmt "(And %a && %a)" pp_e e1 pp_e e2
  | Or (e1, e2) -> F.fprintf fmt "(Or %a || %a)" pp_e e1 pp_e e2

let rec pp_slist fmt slist = 
  match slist with
  | [] -> ()
  | h :: t -> F.fprintf fmt " %a; %a" pp_s h pp_slist t

and pp_s fmt s = 
  match s with
  | AssignStmt (x, e) -> F.fprintf fmt "(AssignStmt %s = %a)" x pp_e e
  | IfStmt (e, true_stmts, false_stmts_opt) -> 
      begin
        match false_stmts_opt with
        | None -> 
            F.fprintf fmt "(IfStmt (%a)? [%a])" pp_e e pp_slist true_stmts
        | Some false_stmts -> 
            F.fprintf fmt "(IfStmt (%a)? [%a] : [%a])" pp_e e pp_slist true_stmts pp_slist false_stmts
      end

let pp fmt (Program e) = 
  let pp_list = (fun fmt stmts -> List.iter (fun stmt -> F.fprintf fmt " %a;" pp_s stmt) stmts) in
  F.fprintf fmt "(Program [%a ])" pp_list e

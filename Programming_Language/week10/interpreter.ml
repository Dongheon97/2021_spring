module F = Format

(* practice & homework *)
let rec interp_e (s : Store.t) (e : Ast.expr) : Store.value = 
        match e with
        | Num n -> NumV n
        | Add (e1, e2) -> 
                       begin 
                              match interp_e(s)(e1), interp_e(s)(e2) with
                              | NumV r1, NumV r2 -> NumV (r1 + r2)
                              | _ -> failwith (Format.asprintf "Invalid addition: %a + %a" Ast.pp_e e1 Ast.pp_e e2)
                       end
        | Sub (e1, e2) ->
                       begin 
                              match interp_e(s)(e1), interp_e(s)(e2) with
                              | NumV r1, NumV r2 -> NumV (r1 - r2) 
                              | _ -> failwith (Format.asprintf "Invalid subtraction: %a - %a" Ast.pp_e e1 Ast.pp_e e2)
                       end
        | Id x -> Store.find x s
        | LetIn (x, e1, e2) -> interp_e (Store.insert x (interp_e s e1) s) (e2) 
        | App (e1, e2) ->
                       begin
                              match interp_e(s)(e1) with
                              | ClosureV (param, expr, t) -> interp_e (Store.insert param (interp_e(s)(e2)) t) (expr) 
                              | _ -> failwith (Format.asprintf "Not a function: %a" Ast.pp_e e1)
                       end
        | Fun (param, expr) -> ClosureV (param, expr, s)

(* practice & homework *)
let interp (p : Ast.fvae) : Store.value = 
        match p with
        | Prog expr -> interp_e (Store.empty) (expr)

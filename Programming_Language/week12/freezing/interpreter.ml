module F = Format

(* practice & homework *)
let rec interp_e (s : Store.t) (e : Ast.expr) : Store.value =
        match e with
        | Num n -> Store.NumV n
        | Add (e1, e2) ->
                        begin
                                match interp_e(s)(e1), interp_e(s)(e2) with
                                | NumV r1, NumV r2 -> Store.NumV (r1 + r2)
                                | _ -> failwith (F.asprintf "Invalid addition: %a + %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Sub (e1, e2) ->
                        begin
                                match interp_e(s)(e1), interp_e(s)(e2) with
                                | NumV r1, NumV r2 -> Store.NumV (r1 - r2)
                                | _ -> failwith (F.asprintf "Invalid subtraction: %a - %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Id x -> 
                        begin
                                match Store.find x s with
                                | FreezedV (expr, t) -> interp_e(t)(expr)
                                | result -> result
                        end
        | LetIn (x, e1, e2) -> interp_e (Store.insert x (interp_e(s)(e1)) s) (e2)
        | RLetIn (x, e1, e2) -> 
                        begin 
                                match interp_e(s)(e1) with
                                | ClosureV (x', expr, s') -> 
                                                let rec s'' = (x, (Store.ClosureV (x', expr, s'')))::s' in (interp_e s'' e2)
                                | _ -> failwith (F.asprintf "Not a function : %a" Ast.pp_e e1)
                        end
        | App (e1, e2) ->
                        begin
                                match interp_e(s)(e1) with
                                | ClosureV (param, expr, t) -> interp_e (Store.insert param (Store.FreezedV (e2, s)) t) (expr)
                                | _ -> failwith (F.asprintf "Not a function: %a" Ast.pp_e e1)
                        end
        | Fun (param, expr) -> Store.ClosureV (param, expr, s)
        | Lt (e1, e2) ->
                        begin
                                match interp_e(s)(e1), interp_e(s)(e2) with
                                | NumV r1, NumV r2 ->
                                                if r1 < r2 then Store.ClosureV("x", Fun("y", Id "x"), s)
                                                else Store.ClosureV("x", Fun("y", Id "y"), s)
                                | _ -> failwith (F.asprintf "Invalid less-than: %a < %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
  

(* practice & homework *)
let interp (p : Ast.fvae) : Store.value =
        match p with 
        | Prog expr -> interp_e(Store.empty)(expr)
  

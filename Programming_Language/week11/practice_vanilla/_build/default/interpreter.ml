module F = Format

(* practice & homework *)
let rec interp_e (s : Store.t) (e : Ast.expr) : Store.value =  (* LT 연산 오류 : "Invalid less-than: %a < %a" *)
        match e with
        | Bool b -> BoolV b
        | Num n -> NumV n
        | Add (e1, e2) -> 
                        begin 
                                match interp_e(s)(e1), interp_e(s)(e2) with
                                | NumV r1, NumV r2 -> NumV (r1 + r2)
                                | _ -> failwith (F.asprintf "Invalid addition: %a + %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Sub (e1, e2) -> 
                        begin
                                match interp_e(s)(e1), interp_e(s)(e2) with
                                | NumV r1, NumV r2 -> NumV (r1 - r2)
                                | _ -> failwith (F.asprintf "Invalid subtraction: %a - %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Id x -> Store.find x s 
        | LetIn (x, e1, e2) -> interp_e (Store.insert x (interp_e s e1) s) (e2)
        | App (e1, e2) ->
                        begin 
                                match interp_e(s)(e1) with
                                | ClosureV (param, expr, t) -> interp_e (Store.insert param (interp_e(s)(e2)) t) (expr)
                                | _ -> failwith (F.asprintf "Not a function: %a" Ast.pp_e e1)
                        end 
        | Fun (param, expr) -> ClosureV (param, expr, s)
        | Cond (e1, e2, e3) -> 
                        begin 
                                match interp_e(s)(e1) with
                                | BoolV true -> interp_e(s)(e2)
                                | BoolV false -> interp_e(s)(e3)
                                | _ -> failwith (F.asprintf "Not a bool value: %a" Ast.pp_e e1)
                        end
        | Lt (e1, e2) ->
                        begin 
                                match interp_e(s)(e1), interp_e(s)(e2) with
                                | NumV r1, NumV r2 -> 
                                                if r1<r2 then BoolV true
                                                else BoolV false
                                | _ -> failwith (F.asprintf "Invalid less-than: %a < %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        
                                

(* practice & homework *)
let interp (p : Ast.fvae) : Store.value = 
        match p with
        | Prog expr -> interp_e (Store.empty) (expr)

module F = Format

let rec interp_e (fenv : FEnv.t) (s : Store.t) (e : Ast.expr) : int = 
        (* write your code *)
        match e with
        | Num n -> n
        | Add (a, b) -> interp_e(fenv)(s)(a) + interp_e(fenv)(s)(b)
        | Sub (a, b) -> interp_e(fenv)(s)(a) - interp_e(fenv)(s)(b)
        | Id x -> Store.find x s
        | LetIn (x, a, b) -> interp_e(fenv)(Store.insert x (interp_e(fenv)(s)(a)) s) (b)
        | FCall (x, expr_list) ->
                        begin
                                match (FEnv.find x fenv) with
                                | (plist, body) ->
                                                let rec impl param_lst expr_lst s =
                                                        match param_lst, expr_lst with
                                                        | param::t1, expr::t2 -> impl t1 t2 (Store.insert (param) (interp_e fenv s expr) (s))
                                                        | [], [] -> s
                                                        | _ -> failwith "Parameter matching error."
                                                in
                                                let stored_list = impl plist expr_list s in
                                                interp_e (fenv) (stored_list) (body)
                        end

let interp_d (fenv : FEnv.t) (fd : Ast.fundef) : FEnv.t = 
        (* write your code *)
        match fd with
        | FDef (x, plist, body) -> FEnv.insert(x)(plist)(body)(fenv)

(* practice *)
let interp (p : Ast.f1vae) : int = 
        (* write your code *)
        match p with
        | Prog (def_list, expr) -> 
                        begin
                        let rec impl def_lst fenv = 
                                match def_lst with
                                | def::t -> impl t (interp_d(fenv)(def))
                                | [] -> fenv
                        in
                        let fenv = impl def_list FEnv.empty in
                        interp_e (fenv) (Store.empty) (expr)
                        end

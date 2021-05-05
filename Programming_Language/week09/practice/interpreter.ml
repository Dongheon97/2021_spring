module F = Format

let rec interp_e (fenv : FEnv.t) (s : Store.t) (e : Ast.expr) : int = 
        (* write your code *)
        match e with
        | Num n -> n
        | Add (a, b) -> interp_e(fenv)(s)(a) + interp_e(fenv)(s)(b)
        | Sub (a, b) -> interp_e(fenv)(s)(a) - interp_e(fenv)(s)(b)
        | Id x -> Store.find x s
        | LetIn (x, a, b) -> interp_e (fenv) (Store.insert x (interp_e(fenv)(s)(a)) s) (b)
        | FCall (x, a) -> 
                        begin
                                match FEnv.find x fenv with
                                | (param, expr) -> interp_e (fenv)(Store.insert param (interp_e (fenv)(s)(a)) s)(expr)
                                                                
                        end 


let interp_d (fd : Ast.fundef) : FEnv.t = 
	(* write your code : definition of function *)
        match fd with
        | FDef (x, param, body) -> FEnv.insert (x) (param) (body) (FEnv.empty)  
        
        


(* practice *)
let interp (p : Ast.f1vae) : int = 
	(* write your code *)
        match p with
        | Prog (def, expr) -> interp_e (interp_d def) (Store.empty) (expr)
        

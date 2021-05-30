module F = Format

(* practice & homework *)
let rec interp_e (e : Ast.expr) (s : Store.t) : Store.value = 
        match e with
        | Num n -> NumV n
        | Bool b -> BoolV b
        | Var x -> Store.find x s
        | Add (e1, e2) -> 
                        begin 
                                match interp_e(e1)(s), interp_e(e2)(s) with
                                | NumV r1, NumV r2 -> NumV (r1 + r2)
                                | _ -> failwith (F.asprintf "Invalid addition: %a + %a" Ast.pp_e e1 Ast.pp_e e2) 
                        end
        | Sub (e1, e2) -> 
                        begin 
                                match interp_e(e1)(s), interp_e(e2)(s) with
                                | NumV r1, NumV r2 -> NumV (r1 - r2)
                                | _ -> failwith (F.asprintf "Invalid subtraction: %a - %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Lt (e1, e2) -> 
                        begin
                                match interp_e(e1)(s), interp_e(e2)(s) with
                                | NumV r1, NumV r2 ->
                                                if r1 < r2 then BoolV true 
                                                else BoolV false
                                | _ -> failwith (F.asprintf "Invalid less-than: %a < %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Gt (e1, e2) ->
                        begin
                                match interp_e(e1)(s), interp_e(e2)(s) with
                                | NumV r1, NumV r2 ->
                                                if r1 > r2 then BoolV true
                                                else BoolV false
                                | _ -> failwith (F.asprintf "Invalid greater-than: %a > %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Eq (e1, e2) ->
                        begin 
                                match interp_e(e1)(s), interp_e(e2)(s) with
                                | NumV r1, NumV r2 ->
                                                if r1 = r2 then BoolV true
                                                else BoolV false
                                | BoolV b1, BoolV b2 -> 
                                                if b1 = b2 then BoolV true
                                                else BoolV false
                                | _ -> failwith (F.asprintf "Invalid equal-to: %a == %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | And (e1, e2) -> 
                        begin 
                                match interp_e(e1)(s), interp_e(e2)(s) with
                                | BoolV b1, BoolV b2 -> BoolV (b1 && b2)
                                | _ -> failwith (F.asprintf "Invalid logical-and: %a && %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Or (e1, e2) ->
                        begin 
                                match interp_e(e1)(s), interp_e(e2)(s) with
                                | BoolV b1, BoolV b2 -> BoolV (b1 || b2)
                                | _ -> failwith (F.asprintf "Invalid logical-or: %a || %a" Ast.pp_e e1 Ast.pp_e e2)
                        end


(* practice & homework *)
let rec interp_s (stmt : Ast.stmt) (s : Store.t) : Store.t = 
        match stmt with
        | AssignStmt (x, expr) -> Store.insert x (interp_e expr s) s
        | IfStmt (expr, stmt_lst, stmt_lstOpt) -> 
                        begin
                                match interp_e(expr)(s) with
                                | BoolV b ->
                                                let rec impl_rec stmt_lst s =
                                                                match stmt_lst with
                                                                | stmt::t -> impl_rec t (interp_s(stmt)(s))
                                                                | [] -> s
                                                        in  
                                                if b = true then impl_rec stmt_lst s                                                    
                                                else 
                                                        begin
                                                                match stmt_lstOpt with
                                                                | None -> s
                                                                | Some lst -> impl_rec lst s
                                                        end

                                | _ -> failwith (F.asprintf "Not a boolean: %a" Ast.pp_e expr)
                        end
  

(* practice & homework *)
let interp (p : Ast.program) : Store.t = 
        let rec impl stmt_lst s =
                match stmt_lst with
                | stmt::t -> impl t (interp_s stmt s)
                | [] -> s
        in
        match p with
        | Program stmt_lst -> impl stmt_lst Store.empty

module F = Format

(* practice & homework *)
let rec interp_e (e : Ast.expr) ((env, mem) : Env.t * Mem.t) : Mem.value = 
        match e with
        | Num n -> NumV n
        | Bool b -> BoolV b
        | Var x -> Mem.find (Env.find x env) (mem)
        | Ref x -> AddressV (Env.find x env) (* &x : x의 주소값 *)
        | Deref x ->  (* *x : x 주소값의 value  *)
                        begin
                                match Mem.find(Env.find x env)(mem) with
                                | AddressV addr -> Mem.find (addr) mem
                                | _ -> failwith (F.asprintf "Not a memory address: %s" x)
                        end
        | Add (e1, e2) ->
                        begin
                                match interp_e(e1)((env, mem)), interp_e(e2)((env, mem)) with
                                | NumV r1, NumV r2 -> NumV (r1 + r2)
                                | _ -> failwith (F.asprintf "Invalid addition: %a + %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Sub (e1, e2) ->
                        begin 
                                match interp_e(e1)((env, mem)), interp_e(e2)((env, mem)) with
                                | NumV r1, NumV r2 -> NumV (r1 - r2)
                                | _ -> failwith (F.asprintf "Invalid subtraction: %a - %a" Ast.pp_e e1 Ast.pp_e e2)
                        end 
        | Lt (e1, e2) ->
                        begin
                                match interp_e(e1)((env, mem)), interp_e(e2)((env,mem)) with
                                | NumV r1, NumV r2 ->
                                                if r1 < r2 then BoolV true
                                                else BoolV false
                                | _ -> failwith (F.asprintf "Invalid less-than: %a < %a" Ast.pp_e e1 Ast.pp_e e2)
                        end
        | Gt (e1, e2) ->
                        begin
                                match interp_e(e1)((env, mem)), interp_e(e2)((env, mem)) with
                                | NumV r1, NumV r2 ->
                                                if r1 > r2 then BoolV true
                                                else BoolV false
                                | _ -> failwith (F.asprintf "Invalid greater-than: %a < %a" Ast.pp_e e1 Ast.pp_e e2)
                        end     
        | Eq (e1, e2) ->
                        begin
                                match interp_e(e1)((env, mem)), interp_e(e1)((env, mem)) with
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
                                match interp_e(e1)((env, mem)), interp_e(e2)((env, mem)) with
                                | BoolV b1, BoolV b2 -> BoolV (b1 && b2)
                                | _ -> failwith (F.asprintf "Invalid logical-and: %a && %a" Ast.pp_e e1 Ast.pp_e e2)     
                        end
        | Or (e1, e2) -> 
                        begin 
                                match interp_e(e1)((env, mem)), interp_e(e2)((env, mem)) with
                                | BoolV b1, BoolV b2 -> BoolV (b1 || b2)
                                | _ -> failwith (F.asprintf "Invalid logical-or: %a || %a" Ast.pp_e e1 Ast.pp_e e2)
                        end               
                                                
 
(* practice & homework *)
let rec interp_s (stmt : Ast.stmt) ((env, mem) : Env.t * Mem.t) : Env.t * Mem.t =
        let rec impl_s stmt_lst (env, mem) =
                match stmt_lst with
                | stmt::t -> impl_s t (interp_s(stmt)(env, mem))
                | [] -> (env, mem)
        in
        match stmt with
        | VarDeclStmt x -> (* var x *) 
                        begin
                                match Env.mem(x)(env) with
                                | false -> ((Env.insert (x) (Env.new_address()) env), mem) 
                                | true -> failwith (F.asprintf "%s is already declared." x)
                        end
        | StoreStmt (e1, e2) -> (* *e1 = e2 *)
                        begin
                                match interp_e(e1)(env, mem) with
                                | AddressV addr -> (env, (Mem.insert (addr) (interp_e(e2)(env, mem)) (mem)))
                                | _ -> failwith (F.asprintf "Not a memory addresss: %a" Ast.pp_e e1)
                        end
        | IfStmt (expr, true_stmts, false_stmtsOpt) -> 
                        begin
                                match interp_e(expr)(env,mem) with
                                | BoolV b -> 
                                                if b = true then impl_s true_stmts (env, mem)
                                                else 
                                                        begin 
                                                                match false_stmtsOpt with
                                                                | None -> (env, mem)
                                                                | Some stmts -> impl_s stmts (env, mem)
                                                        end
                                | _ -> failwith (F.asprintf "Not a boolean : %a" Ast.pp_e expr)
                        end
        | WhileStmt (expr, stmts) -> 
                       begin
                              let rec impl_while expr stmt_lst (env, mem) =
                                      match interp_e expr (env, mem) with
                                      | BoolV b -> 
                                             if b=true then
                                                     begin
                                                        impl_while expr stmt_lst (impl_s stmt_lst (env, mem))
                                                     end   
                                             else (env, mem)
                                      | _ -> failwith (F.asprintf "Not a boolean : %a" Ast.pp_e expr)
                              in 
                              impl_while expr stmts (env, mem)
                        end 
  
(* practice & homework *)
let interp (p : Ast.program) : Env.t * Mem.t = 
        let rec impl stmt_lst (env, mem) =
                match stmt_lst with
                | stmt::t -> impl t (interp_s stmt (env, mem))
                | [] -> (env, mem)
        in
        match p with
        | Program stmts -> impl stmts (Env.empty, Mem.empty)        (* addr_index : 시작 주소, empty : 빈 메모리 *)
 

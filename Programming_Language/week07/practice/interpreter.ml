module F = Format

(* practice *)
let rec interp (s : Store.t) (e : Ast.vae) : int =
       match e with
       | Num n -> n
       | Add (a, b) -> interp(s)(a) + interp(s)(b)
       | Sub (a, b) -> interp(s)(a) - interp(s)(b)
       | Id x -> 
                begin
                        match Store.find x s with
                        | n -> n
                end     
       | LetIn (x, a, b) -> interp (Store.insert x (interp(s)(a)) s) (b)              
       

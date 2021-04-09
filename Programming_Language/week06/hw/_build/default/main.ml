module F = Format

(* Test cases *)
let _ =
        let a = Ast.Num 1 in (* a = Num 1 *)
        let b = Ast.Num 3 in (* b = Num 3 *)
        let c = Ast.Num 4 in (* c = Num 4 *)
        let d = Ast.Add (a, b) in (* d = Add (Num 1, Num 3) *)
        let e = Ast.Sub (c, d) in (* e = Sub (Add (Num 1, Num 3), Num 4) *)
        let f = Ast.Neg (Ast.Num 7) in (* f = Neg (Num 7) *)
        let g = Ast.Sub (e, f) in (* e = Sub (Sub (Add (Num 1, Num 3), Num 4), Neg (Num 7)) *)
        let _ = F.printf "a = %a\n" Ast.pp a in
        let _ = F.printf "interp a = %d\n" (Interpreter.interp a) in (* 1 *)
        let _ = F.printf "b = %a\n" Ast.pp b in 
        let _ = F.printf "interp b = %d\n" (Interpreter.interp b) in (* 3 *)
        let _ = F.printf "c = %a\n" Ast.pp c in
        let _ = F.printf "interp c = %d\n" (Interpreter.interp c) in (* 4 *)
        let _ = F.printf "d = %a\n" Ast.pp d in
        let _ = F.printf "interp d = %d\n" (Interpreter.interp d) in (* 4 *)
        let _ = F.printf "e = %a\n" Ast.pp e in
        let _ = F.printf "interp e = %d\n" (Interpreter.interp e) in (* 0 *)
        let _ = F.printf "f = %a\n" Ast.pp f in
        let _ = F.printf "interp f = %d\n" (Interpreter.interp f) in (* -7 *)
        let _ = F.printf "g = %a\n" Ast.pp g in
        let _ = F.printf "interp g = %d\n" (Interpreter.interp g) in (* 7 *)
        ()

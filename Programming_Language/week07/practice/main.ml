module F = Format

(* Test cases *)
let _ = 
  let a = Ast.Num 1 in (* a = (Num 1) *)
  let b = Ast.Num 3 in (* b = (Num 3) *)
  let c = Ast.Num 4 in (* c = (Num 4) *)
  let d = Ast.Add (a, b) in (* d = (Add (Num 1) (Num 3)) *)
  let e = Ast.Sub (c, d) in (* e = (Sub (Add (Num 1) (Num 3)) (Num 4)) *)
  let f = Ast.Id "x" in (* f = (Id x) *)
  let g = Ast.Id "y" in (* g = (Id y) *)
  let h = Ast.Add (f, e) in (* h = (Add (Id x) (Sub (Add (Num 1) (Num 3)) (Num 4))) *)
  let i = Ast.LetIn ("x", d, h) in (* i = (LetIn x (Add (Num 1) (Num 3)) (Add (Id x) (Sub (Add (Num 1) (Num 3)) (Num 4))))  *)
  let j = Ast.Sub (g, (Num 2)) in (* j = (Sub (Id y) (Num 2)) *)
  let k = Ast.LetIn ("y", i, j) in (* k = (LetIn y (Add (Num 1) (Num 3)) (Add (Id x) (Sub (Add (Num 1) (Num 3)) (Num 4))) (Sub (Id y) (Num 2))) *)
  let _ = F.printf "a = %a\n" Ast.pp a in
  let _ = F.printf "interp a = %d\n" (Interpreter.interp Store.empty a) in (* 1 *)
  let _ = F.printf "b = %a\n" Ast.pp b in 
  let _ = F.printf "interp b = %d\n" (Interpreter.interp Store.empty b) in (* 3 *)
  let _ = F.printf "c = %a\n" Ast.pp c in
  let _ = F.printf "interp c = %d\n" (Interpreter.interp Store.empty c) in (* 4 *)
  let _ = F.printf "d = %a\n" Ast.pp d in
  let _ = F.printf "interp d = %d\n" (Interpreter.interp Store.empty d) in (* 4 *)
  let _ = F.printf "e = %a\n" Ast.pp e in
  let _ = F.printf "interp e = %d\n" (Interpreter.interp Store.empty e) in (* 0 *)
  let _ = F.printf "f = %a\n" Ast.pp f in
  let _ = try F.printf "interp f = %d\n" (Interpreter.interp Store.empty f) with Failure e -> F.printf "Runtime error: %s\n" e in (* Runtime error: Free identifier x *)
  let _ = F.printf "g = %a\n" Ast.pp g in
  let _ = try F.printf "interp g = %d\n" (Interpreter.interp Store.empty g) with Failure e -> F.printf "Runtime error: %s\n" e in (* Runtime error: Free identifier y *)
  let _ = F.printf "h = %a\n" Ast.pp h in
  let _ = try F.printf "interp h = %d\n" (Interpreter.interp Store.empty h) with Failure e -> F.printf "Runtime error: %s\n" e in (* Runtime error: Free identifier x *)
  let _ = F.printf "i = %a\n" Ast.pp i in
  let _ = F.printf "interp i = %d\n" (Interpreter.interp Store.empty i) in (* 4 *)
  let _ = F.printf "j = %a\n" Ast.pp j in
  let _ = try F.printf "interp j = %d\n" (Interpreter.interp Store.empty j) with Failure e -> F.printf "Runtime error: %s\n" e in (* Runtime error: Free identifier y *)
  let _ = F.printf "k = %a\n" Ast.pp k in
  let _ = F.printf "interp k = %d\n" (Interpreter.interp Store.empty k) in (* 2 *)
  ()

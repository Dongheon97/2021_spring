module F = Format

(* Test cases *)
let _ = 
  try
  let open Ast in
  let open Interpreter in
  let open ParserMain in
  let p1 = parse "(fun x -> x + 1)" in
  let p2 = parse "(fun x -> x + 1) 2" in
  let p3 = parse "let x = (fun x -> x + 1) in x 2" in
  let p4 = parse "let x = (fun x -> x - 1) in x 3" in
  let p5 = parse "let foo = (fun x -> x - 1) in let bar = (fun x -> x + 1) in foo (bar 3)" in
  let p6 = parse "let foo = (fun x -> x 3) in let bar = (fun x -> x + 1) in (foo bar)" in
  let p7 = parse "let foo x = x + 3 in foo 7" in
  let p8 = parse "let z = 9 in let foo x = x + z in foo 7" in
  let p9 = parse "let z = 9 in let foo x = x + z in let z = 3 in foo 7" in
  let p10 = parse "let z = 9 in let foo x = (fun y -> x + z + y) in foo 1 5" in
  let p11 = parse "let z = 9 in let foo x y = x + z + y in foo 3 1" in
  let p12 = parse "let z = 9 in let foo = (fun x y -> x + z - y) in foo 5 9" in
  let p13 = parse "let x y z = y z in x (fun x -> x + 10) 3" in
  let p14 = parse "(fun x y z -> x + y + z)" in
  let p15 = parse "(fun x y z -> x + y + z) 1" in
  let p16 = parse "(fun x y z -> x + y + z) 1 2" in
  let p17 = parse "(fun x y z -> x + y + z) 1 2 3" in
  let _ = F.printf "AST: %a\n" pp p1 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p1) in (* <λx.(Add (Id x, Num 1)) , []> *)
  let _ = F.printf "AST: %a\n" pp p2 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p2) in (* 3 *)
  let _ = F.printf "AST: %a\n" pp p3 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p3) in (* 3 *)
  let _ = F.printf "AST: %a\n" pp p4 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p4) in (* 2 *)
  let _ = F.printf "AST: %a\n" pp p5 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p5) in (* 3 *)
  let _ = F.printf "AST: %a\n" pp p6 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p6) in (* 4 *)
  let _ = F.printf "AST: %a\n" pp p7 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p7) in (* 10 *)
  let _ = F.printf "AST: %a\n" pp p8 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p8) in (* 16 *)
  let _ = F.printf "AST: %a\n" pp p9 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p9) in (* 16 *)
  let _ = F.printf "AST: %a\n" pp p10 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p10) in (* 15 *)
  let _ = F.printf "AST: %a\n" pp p11 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p11) in (* 13 *)
  let _ = F.printf "AST: %a\n" pp p12 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p12) in (* 5 *)
  let _ = F.printf "AST: %a\n" pp p13 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p13) in (* 13 *)
  let _ = F.printf "AST: %a\n" pp p14 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p14) in (* <λx.(Fun y -> (Fun z -> (Add (Id x) (Add (Id y) (Id z))))), []> *)
  let _ = F.printf "AST: %a\n" pp p15 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p15) in (* <λy.(Fun z -> (Add (Id x) (Add (Id y) (Id z)))), [ (x, 1) ]> *)
  let _ = F.printf "AST: %a\n" pp p16 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p16) in (* <λz.(Add (Id x) (Add (Id y) (Id z))), [ (y, 2) (x, 1) ]> *)
  let _ = F.printf "AST: %a\n" pp p17 in
  let _ = F.printf "RES: %a\n" Store.pp_v (interp p17) in (* 6 *)
  ()
  with 
  | Lexer.LexError msg -> F.printf "[ERR] Undefined token: %s\n" msg
  | Parser.Error -> F.printf "[ERR] Wrong grammar\n" 
  

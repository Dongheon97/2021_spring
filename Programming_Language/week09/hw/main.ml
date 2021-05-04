module F = Format

(* Test cases *)
let _ = 
  try
  let open Ast in
  let open Interpreter in
  let open ParserMain in
  let p1 = parse "def foo x = x endef foo(1)" in
  let p2 = parse "def foo x = x + 2 endef foo(1)" in
  let p3 = parse "def foo x = x + 2 endef let x = 3 in foo(x)" in
  let p4 = parse "def foo x = x + 2 endef let x = 3 in let y = 2 in foo(x - y)" in
  let p5 = parse "def foo x = x + 2 endef let x = foo(0) in let y = foo(2) in foo(x - y)" in
  let p6 = parse "def foo x = let y = 7 in x + y endef let x = foo(0) in let y = foo(2) in foo(x - y)" in
  let p7 = parse "def foo x = let y = 7 in x + y endef let x = let y = 5 in foo(y) in let y = foo(2) in foo(x - y)" in
  let p8 = parse "def foo = 3 endef foo()" in
  let p9 = parse "3" in
  let p10 = parse "def add x y = x + y endef def sub x y = x - y endef def double x = x + x endef let x = add(1,2) in let y = sub(2,3) in let z = double(3) in x + y + z" in
  let p11 = parse "def add3 x y z = x + y + z endef add3(1+2,2+3,3+4)" in
  let _ = F.printf "AST: %a\n" pp p1 in
  let _ = F.printf "RES: %n\n" (interp p1) in (* 1 *)
  let _ = F.printf "AST: %a\n" pp p2 in
  let _ = F.printf "RES: %n\n" (interp p2) in (* 3 *)
  let _ = F.printf "AST: %a\n" pp p3 in
  let _ = F.printf "RES: %n\n" (interp p3) in (* 5 *)
  let _ = F.printf "AST: %a\n" pp p4 in
  let _ = F.printf "RES: %n\n" (interp p4) in (* 3 *)
  let _ = F.printf "AST: %a\n" pp p5 in
  let _ = F.printf "RES: %n\n" (interp p5) in (* 0 *)
  let _ = F.printf "AST: %a\n" pp p6 in
  let _ = F.printf "RES: %n\n" (interp p6) in (* 5 *)
  let _ = F.printf "AST: %a\n" pp p7 in
  let _ = F.printf "RES: %n\n" (interp p7) in (* 10 *)
  let _ = F.printf "AST: %a\n" pp p8 in
  let _ = F.printf "RES: %n\n" (interp p8) in (* 3 *)
  let _ = F.printf "AST: %a\n" pp p9 in
  let _ = F.printf "RES: %n\n" (interp p9) in (* 3 *)
  let _ = F.printf "AST: %a\n" pp p10 in
  let _ = F.printf "RES: %n\n" (interp p10) in (* 8 *)
  let _ = F.printf "AST: %a\n" pp p11 in
  let _ = F.printf "RES: %n\n" (interp p11) in (* 15 *)
  ()
  with 
  | Lexer.LexError msg -> F.printf "[ERR] Undefined token: %s\n" msg
  | Parser.Error -> F.printf "[ERR] Wrong grammar\n" 
  

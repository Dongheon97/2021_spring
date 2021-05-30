module F = Format

let run_test (program : string) : unit =
  try 
    let p = ParserMain.parse program in
    let _ = F.printf "Program : %s\n" program in
    let _ = F.printf "AST : %a\n" Ast.pp p in
    try F.printf "Interp : %a\n\n" Store.pp (Interpreter.interp p) with Failure e -> F.printf "[Runtime-Error] %s\n" e
  with 
  | Lexer.LexError msg -> F.printf "[ERR] Undefined token: %s\n" msg
  | Parser.Error -> F.printf "[ERR] Wrong grammar\n" 

(* Test cases *)
let _ = 
  let tests = 
    [ 
      "x = 3;"
    ; "x = 3; y = 4;"
    ; "x = 3; if (x < 3) { y = 1; } else { y = 99; }"
    ; "x = 3; if (x > 3) { x = 1; } else { x = 99; }"
    ]
  in
  List.iter run_test tests

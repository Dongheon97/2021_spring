module F = Format

let run_test (program : string) : unit =
  try 
    let _ = Env.reset() in
    let _ = F.printf "Program : %s\n" program in
    let p = ParserMain.parse program in
    let _ = F.printf "AST : %a\n" Ast.pp p in
    try
      let env,mem = Interpreter.interp p in
      let _ = F.printf "Env: %a\n" Env.pp env in
      F.printf "Mem: %a\n\n" Mem.pp mem
    with Failure e -> F.printf "[Runtime-Error] %s\n\n" e
  with 
  | Lexer.LexError msg -> F.printf "[ERR] Undefined token: %s\n" msg
  | Parser.Error -> F.printf "[ERR] Wrong grammar\n" 

(* Test cases *)
let _ = 
  let tests = 
    [ 
      "var x; x = 3;"
    ; "var x; var y; x = 3; y = 4;"
    ; "var x; var y; x = 3; if (x < 3) { y = 1; } else { y = 99; }"
    ; "var x; x = 3; if (x > 3) { x = 1; } else { x = 99; }"
    ; "var x; var y; var z; x = 3; y = &x; z = &y; if(x>3){ **z = *y - 1; }"
    ; "var pc; var c; var z; c = 5; pc = &c; z = *pc;"
    ; "var pc; var c; var z; c = 5; pc = &c; c = 1; z = *pc;"
    ; "var pc; var c; var d; var w; var z; c = 5; d = -15; pc = &c; z = *pc; pc = &d; w = *pc;"
    ; "var x; var y; x = 3; y = 0; while(x>0){ y = y + x; x = x - 1; } "
    ; "var x; var y; x = 10; y = -100; while(x + y < 0){ x = x+1; y = y+1; }"
    ; "x = 3;"
    ; "var x; x = 3; while(x){ x = x + 1; }"
    ; "var x; while(x < 0){ x = x + 1; }"
    ; "var x; x = 3; var y; y = &x; x = &y; var w; w = *y; var z; z = *w;"
    ]
  in
  List.iter run_test tests

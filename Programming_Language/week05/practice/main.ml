module F = Format

(* Test cases *)
let _ =
        let a = Lexer.lex ['1'] in (* a = Int 1 *)
        let b = Lexer.lex ['5';'7';'9'] in (* b = Int 579 *)
        let c = Lexer.lex ['0';'1';'4'] in (* c = Int 14 *)
        let d = Lexer.lex ['-';'4';'3'] in (* d = Int -43 *)
        let _ = F.printf "a = %a\n" Lexer.pp a in
        let _ = F.printf "b = %a\n" Lexer.pp b in
        let _ = F.printf "c = %a\n" Lexer.pp c in 
        let _ = F.printf "d = %a\n" Lexer.pp d in
        try
                let _ = Lexer.lex ['3';'a';'6'] in ()
        with Failure e ->
                F.printf "Exception occurs : %s\n" e (* Exception occurs : Not a valid integer *)

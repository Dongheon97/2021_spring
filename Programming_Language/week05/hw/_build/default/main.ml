module F = Format

(* Test cases *)
let _ =
        let a = Lexer.lex ['1'] in (* a = Int 1 *)
        let b = Lexer.lex ['5';'7';'9'] in (* b = Int 579 *)
        let c = Lexer.lex ['0';'1';'4'] in (* c = Int 14 *)
        let d = Lexer.lex ['-';'4';'3'] in (* d = Int -43 *)
        let e = Lexer.lex ['v';'a';'r'] in (* e = Var var *)
        let f = Lexer.lex ['x';'_';'z'] in (* f = Var x_z *)
        let g = Lexer.lex ['t';'M';'\''] in (* g = Var tM\' *)
        let h = Lexer.lex ['x';'0';'Y';'_';'\''] in (* h = x0Y_\' *)
        let _ = F.printf "a = %a\n" Lexer.pp a in
        let _ = F.printf "b = %a\n" Lexer.pp b in
        let _ = F.printf "c = %a\n" Lexer.pp c in
        let _ = F.printf "d = %a\n" Lexer.pp d in
        let _ = F.printf "e = %a\n" Lexer.pp e in
        let _ = F.printf "f = %a\n" Lexer.pp f in
        let _ = F.printf "g = %a\n" Lexer.pp g in
        let _ = F.printf "h = %a\n" Lexer.pp h in
        try
                let _ = Lexer.lex ['V';'a';'r'] in ()
        with Failure e ->
                F.printf "Exception occurs : %s\n" e (* Exception occurs : Not a valid integer or a valid variable*)

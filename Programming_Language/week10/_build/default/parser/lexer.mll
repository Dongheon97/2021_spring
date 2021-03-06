{
  open Parser

  exception LexError of string
}

rule token = parse
| "let" { KW_LET }
| "fun" { KW_FUN }
| "in" { KW_IN }
| "->" { OP_RARROW }
| '(' { LSPAREN }
| ')' { RSPAREN }
| '+' { OP_PLUS }
| '-' { OP_MINUS }
| '=' { OP_EQ }
| ['a'-'z']['a'-'z''A'-'Z''_''-''0'-'9''\'']* as name { ID name }
| ['0'-'9']['0'-'9']* as num { NUMBER (int_of_string num) }
| "//" { comment lexbuf }
| [' ' '\t']+ { token lexbuf }
| '\n' { token lexbuf }
| eof {EOF}
| _ as c { raise (LexError (Format.asprintf "Invalid token: %c" c)) }

and comment = parse
| [^'\n']+ { comment lexbuf }
| '\n' { token lexbuf }

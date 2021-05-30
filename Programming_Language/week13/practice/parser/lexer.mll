{
  open Parser

  exception LexError of string
}

rule token = parse
| "true" { KW_TRUE }
| "false" { KW_FALSE }
| "if" { KW_IF }
| "else" { KW_ELSE }
| '(' { LSPAREN }
| ')' { RSPAREN }
| '{' { LMPAREN }
| '}' { RMPAREN }
| '+' { OP_PLUS }
| '-' { OP_MINUS }
| '=' { OP_ASSIGN }
| "==" { OP_EQ }
| '<' { OP_LT }
| '>' { OP_GT }
| "&&" { OP_AND }
| "||" { OP_OR }
| ';' { SEMICOLON }
| ['a'-'z']['a'-'z''A'-'Z''_''-''0'-'9''\'']* as name { ID name }
| ['0'-'9']['0'-'9']* as num { NUMBER (int_of_string num) }
| '-'['0'-'9']['0'-'9']* as num { NUMBER (int_of_string num) }
| "//" { comment lexbuf }
| [' ' '\t']+ { token lexbuf }
| '\n' { token lexbuf }
| eof {EOF}
| _ as c { raise (LexError (Format.asprintf "Invalid token: %c" c)) }

and comment = parse
| [^'\n']+ { comment lexbuf }
| '\n' { token lexbuf }

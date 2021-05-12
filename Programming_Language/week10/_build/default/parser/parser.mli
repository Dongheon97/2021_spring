
(* The type of tokens. *)

type token = 
  | RSPAREN
  | OP_RARROW
  | OP_PLUS
  | OP_MINUS
  | OP_EQ
  | NUMBER of (int)
  | LSPAREN
  | KW_LET
  | KW_IN
  | KW_FUN
  | ID of (string)
  | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.fvae)

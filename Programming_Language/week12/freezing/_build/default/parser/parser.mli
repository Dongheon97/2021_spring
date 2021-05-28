
(* The type of tokens. *)

type token = 
  | RSPAREN
  | OP_RARROW
  | OP_PLUS
  | OP_MINUS
  | OP_LT
  | OP_EQ
  | NUMBER of (int)
  | LSPAREN
  | KW_TRUE
  | KW_THEN
  | KW_REC
  | KW_LET
  | KW_IN
  | KW_IF
  | KW_FUN
  | KW_FALSE
  | KW_ELSE
  | ID of (string)
  | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.fvae)

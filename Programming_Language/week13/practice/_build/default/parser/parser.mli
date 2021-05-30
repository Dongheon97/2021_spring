
(* The type of tokens. *)

type token = 
  | SEMICOLON
  | RSPAREN
  | RMPAREN
  | OP_PLUS
  | OP_OR
  | OP_MINUS
  | OP_LT
  | OP_GT
  | OP_EQ
  | OP_ASSIGN
  | OP_AND
  | NUMBER of (int)
  | LSPAREN
  | LMPAREN
  | KW_TRUE
  | KW_IF
  | KW_FALSE
  | KW_ELSE
  | ID of (string)
  | EOF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)

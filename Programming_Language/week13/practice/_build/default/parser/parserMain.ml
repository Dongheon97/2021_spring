let parse p =
  Parser.program Lexer.token (Lexing.from_string p)

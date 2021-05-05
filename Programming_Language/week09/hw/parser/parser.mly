%token KW_LET KW_DEF KW_ENDEF KW_IN
%token LSPAREN RSPAREN 
%token OP_PLUS OP_MINUS OP_EQ OP_COMMA
%token <string> ID
%token <int> NUMBER
%token EOF 
%type <Ast.f1vae> main
%start main
%%

main:
  | expr EOF { Ast.Prog ([], $1) }
  | decl_list expr EOF { Ast.Prog ($1, $2) }
  ;
decl_list:
  | decl { [$1] }
  | decl decl_list { $1 :: $2 }
  ;
decl: 
  | KW_DEF ID OP_EQ expr KW_ENDEF { Ast.FDef ($2, [], $4) }
  | KW_DEF ID plist OP_EQ expr KW_ENDEF { Ast.FDef ($2, $3, $5) }
  ;
plist:
  | ID { [$1] }
  | ID plist { $1 :: $2 }
  ;
expr: 
  | KW_LET ID OP_EQ expr KW_IN expr { Ast.LetIn ($2, $4, $6) }
  | ID LSPAREN RSPAREN { Ast.FCall ($1, []) }
  | ID LSPAREN elist RSPAREN { Ast.FCall ($1, $3) }
  | snd_expr { $1 }
  | snd_expr OP_PLUS expr { Ast.Add ($1, $3) }
  | snd_expr OP_MINUS expr { Ast.Sub ($1, $3) }
  ;
elist:
  | expr { [$1] }
  | expr OP_COMMA elist { $1 :: $3 }
  ;
snd_expr:
  | NUMBER { Ast.Num $1 }
  | LSPAREN expr RSPAREN { $2 }
  | OP_MINUS LSPAREN expr RSPAREN { Ast.Sub (Ast.Num 0, $3) }
  | ID { Ast.Id $1 }

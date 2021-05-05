%token KW_LET KW_DEF KW_ENDEF KW_IN
%token LSPAREN RSPAREN 
%token OP_PLUS OP_MINUS OP_EQ
%token <string> ID
%token <int> NUMBER
%token EOF 
%type <Ast.f1vae> main
%start main
%%

main:
  decl expr EOF { Ast.Prog ($1, $2) }
  ;
decl: 
  KW_DEF ID ID OP_EQ expr KW_ENDEF { Ast.FDef ($2, $3, $5) }
  ;
expr: 
  | KW_LET ID OP_EQ expr KW_IN expr { Ast.LetIn ($2, $4, $6) }
  | ID LSPAREN expr RSPAREN { Ast.FCall ($1, $3) }
  | snd_expr { $1 }
  | snd_expr OP_PLUS expr { Ast.Add ($1, $3) }
  | snd_expr OP_MINUS expr { Ast.Sub ($1, $3) }
  ;
snd_expr:
  | NUMBER { Ast.Num $1 }
  | LSPAREN expr RSPAREN { $2 }
  | OP_MINUS LSPAREN expr RSPAREN { Ast.Sub (Ast.Num 0, $3) }
  | ID { Ast.Id $1 }

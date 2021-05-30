%token KW_TRUE KW_FALSE KW_IF KW_ELSE 
%token LSPAREN RSPAREN LMPAREN RMPAREN
%token OP_PLUS OP_MINUS OP_ASSIGN OP_EQ OP_LT OP_GT OP_AND OP_OR SEMICOLON
%token <string> ID
%token <int> NUMBER
%token EOF 
%left OP_AND OP_OR
%left OP_EQ
%left OP_LT OP_GT
%left OP_PLUS OP_MINUS
%nonassoc high
%type <Ast.program> program
%start program
%%

program:
  | stmts EOF { Ast.Program $1 }
  ;
stmts: 
  | stmt stmts { $1 :: $2 }
  | stmt { [$1] }
  ;
stmt:
  | ID OP_ASSIGN expr SEMICOLON { Ast.AssignStmt ($1, $3) }
  | KW_IF LSPAREN expr RSPAREN LMPAREN stmts RMPAREN { Ast.IfStmt ($3, $6, None) }
  | KW_IF LSPAREN expr RSPAREN LMPAREN stmts RMPAREN KW_ELSE LMPAREN stmts RMPAREN { Ast.IfStmt ($3, $6, Some $10) }
  ;
expr:
  | NUMBER { Ast.Num $1 }
  | ID { Ast.Var $1 }
  | KW_TRUE { Ast.Bool true }
  | KW_FALSE { Ast.Bool false }
  | LSPAREN expr RSPAREN { $2 }
  | expr OP_PLUS expr %prec high { Ast.Add ($1, $3) }
  | expr OP_MINUS expr %prec high { Ast.Sub ($1, $3) }
  | expr OP_LT expr { Ast.Lt ($1, $3) }
  | expr OP_GT expr { Ast.Gt ($1, $3) }
  | expr OP_EQ expr { Ast.Eq ($1, $3) }
  | expr OP_AND expr { Ast.And ($1, $3) }
  | expr OP_OR expr { Ast.Or ($1, $3) }

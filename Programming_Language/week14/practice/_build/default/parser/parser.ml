
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | SEMICOLON
    | RSPAREN
    | RMPAREN
    | OP_STAR
    | OP_REF
    | OP_PLUS
    | OP_OR
    | OP_MINUS
    | OP_LT
    | OP_GT
    | OP_EQ
    | OP_ASSIGN
    | OP_AND
    | NUMBER of (
# 5 "parser/parser.mly"
       (int)
# 24 "parser/parser.ml"
  )
    | LSPAREN
    | LMPAREN
    | KW_WHILE
    | KW_VAR
    | KW_TRUE
    | KW_IF
    | KW_FALSE
    | KW_ELSE
    | ID of (
# 4 "parser/parser.mly"
       (string)
# 37 "parser/parser.ml"
  )
    | EOF
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState54
  | MenhirState51
  | MenhirState45
  | MenhirState43
  | MenhirState40
  | MenhirState35
  | MenhirState32
  | MenhirState28
  | MenhirState25
  | MenhirState23
  | MenhirState21
  | MenhirState19
  | MenhirState17
  | MenhirState15
  | MenhirState13
  | MenhirState7
  | MenhirState1
  | MenhirState0

let rec _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_run13 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | KW_TRUE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LSPAREN ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | NUMBER _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | OP_REF ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | OP_STAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | KW_TRUE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | LSPAREN ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NUMBER _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | OP_REF ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | OP_STAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_TRUE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | LSPAREN ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | NUMBER _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | OP_REF ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | OP_STAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | KW_TRUE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | LSPAREN ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | NUMBER _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | OP_REF ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | OP_STAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | KW_TRUE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | LSPAREN ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | NUMBER _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | OP_REF ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | OP_STAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | KW_TRUE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LSPAREN ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NUMBER _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | OP_REF ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | OP_STAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | KW_TRUE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | LSPAREN ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | NUMBER _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | OP_REF ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | OP_STAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_goto_stmts : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.stmt list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RMPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | KW_ELSE ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LMPAREN ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | ID _v ->
                        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
                    | KW_IF ->
                        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState51
                    | KW_VAR ->
                        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState51
                    | KW_WHILE ->
                        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState51
                    | OP_STAR ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | EOF | ID _ | KW_IF | KW_VAR | KW_WHILE | OP_STAR | RMPAREN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((_menhir_stack, _menhir_s), _, (_3 : (Ast.expr))), _, (_6 : (Ast.stmt list))) = _menhir_stack in
                let _v : (Ast.stmt) = 
# 27 "parser/parser.mly"
                                                     ( Ast.IfStmt (_3, _6, None) )
# 298 "parser/parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RMPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (_3 : (Ast.expr))), _, (_6 : (Ast.stmt list))), _, (_10 : (Ast.stmt list))) = _menhir_stack in
            let _v : (Ast.stmt) = 
# 28 "parser/parser.mly"
                                                                                   ( Ast.IfStmt (_3, _6, Some _10) )
# 326 "parser/parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.stmt))), _, (_2 : (Ast.stmt list))) = _menhir_stack in
        let _v : (Ast.stmt list) = 
# 20 "parser/parser.mly"
               ( _1 :: _2 )
# 342 "parser/parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RMPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (_3 : (Ast.expr))), _, (_6 : (Ast.stmt list))) = _menhir_stack in
            let _v : (Ast.stmt) = 
# 29 "parser/parser.mly"
                                                        ( Ast.WhileStmt (_3, _6) )
# 358 "parser/parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (Ast.stmt list))) = _menhir_stack in
            let _v : (Ast.program) = 
# 17 "parser/parser.mly"
              ( Ast.Program _1 )
# 379 "parser/parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Ast.program)) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_AND ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | OP_EQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OP_GT ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OP_LT ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_OR ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 38 "parser/parser.mly"
                         ( _2 )
# 425 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr))) = _menhir_stack in
        let _v : (Ast.expr) = 
# 39 "parser/parser.mly"
                                 ( Ast.Add (_1, _3) )
# 441 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_EQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OP_GT ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OP_LT ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | OP_AND | OP_ASSIGN | OP_OR | RSPAREN | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 45 "parser/parser.mly"
                    ( Ast.Or (_1, _3) )
# 465 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr))) = _menhir_stack in
        let _v : (Ast.expr) = 
# 40 "parser/parser.mly"
                                  ( Ast.Sub (_1, _3) )
# 481 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | OP_AND | OP_ASSIGN | OP_EQ | OP_GT | OP_LT | OP_OR | RSPAREN | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 41 "parser/parser.mly"
                    ( Ast.Lt (_1, _3) )
# 499 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | OP_AND | OP_ASSIGN | OP_EQ | OP_GT | OP_LT | OP_OR | RSPAREN | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 42 "parser/parser.mly"
                    ( Ast.Gt (_1, _3) )
# 523 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_GT ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OP_LT ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | OP_AND | OP_ASSIGN | OP_EQ | OP_OR | RSPAREN | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 43 "parser/parser.mly"
                    ( Ast.Eq (_1, _3) )
# 551 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_EQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OP_GT ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OP_LT ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | OP_AND | OP_ASSIGN | OP_OR | RSPAREN | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 44 "parser/parser.mly"
                     ( Ast.And (_1, _3) )
# 581 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_AND ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | OP_ASSIGN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | KW_TRUE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | LSPAREN ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | NUMBER _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | OP_REF ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | OP_STAR ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28)
        | OP_EQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OP_GT ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OP_LT ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_OR ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_AND ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | OP_EQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OP_GT ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OP_LT ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_OR ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (_2 : (Ast.expr))), _, (_4 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.stmt) = 
# 26 "parser/parser.mly"
                                          ( Ast.StoreStmt (_2, _4) )
# 665 "parser/parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_AND ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | OP_EQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OP_GT ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OP_LT ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_OR ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LMPAREN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | ID _v ->
                    _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
                | KW_IF ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState35
                | KW_VAR ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35
                | KW_WHILE ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState35
                | OP_STAR ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState35
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_AND ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | OP_EQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OP_GT ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OP_LT ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_OR ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LMPAREN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | ID _v ->
                    _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
                | KW_IF ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState43
                | KW_VAR ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState43
                | KW_WHILE ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState43
                | OP_STAR ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState43
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_AND ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | OP_EQ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | OP_GT ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | OP_LT ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OP_MINUS ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | OP_OR ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 810 "parser/parser.ml"
            ))), _, (_3 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.stmt) = 
# 25 "parser/parser.mly"
                                ( Ast.StoreStmt (Ast.Ref _1, _3) )
# 815 "parser/parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.stmt) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
    | KW_IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | KW_VAR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | KW_WHILE ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | OP_STAR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState54
    | EOF | RMPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (Ast.stmt))) = _menhir_stack in
        let _v : (Ast.stmt list) = 
# 21 "parser/parser.mly"
         ( [_1] )
# 850 "parser/parser.ml"
         in
        _menhir_goto_stmts _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (
# 4 "parser/parser.mly"
       (string)
# 871 "parser/parser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : (Ast.expr) = 
# 35 "parser/parser.mly"
               ( Ast.Deref _2 )
# 877 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (
# 4 "parser/parser.mly"
       (string)
# 900 "parser/parser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : (Ast.expr) = 
# 34 "parser/parser.mly"
              ( Ast.Ref _2 )
# 906 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "parser/parser.mly"
       (int)
# 919 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 5 "parser/parser.mly"
       (int)
# 927 "parser/parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 32 "parser/parser.mly"
           ( Ast.Num _1 )
# 932 "parser/parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | KW_TRUE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | LSPAREN ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | NUMBER _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | OP_REF ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | OP_STAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.expr) = 
# 36 "parser/parser.mly"
            ( Ast.Bool true )
# 968 "parser/parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.expr) = 
# 37 "parser/parser.mly"
             ( Ast.Bool false )
# 979 "parser/parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "parser/parser.mly"
       (string)
# 986 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 4 "parser/parser.mly"
       (string)
# 994 "parser/parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 33 "parser/parser.mly"
       ( Ast.Var _1 )
# 999 "parser/parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | KW_TRUE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | LSPAREN ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | NUMBER _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | OP_REF ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | OP_STAR ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LSPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | KW_TRUE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | LSPAREN ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | NUMBER _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
        | OP_REF ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | OP_STAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), (_2 : (
# 4 "parser/parser.mly"
       (string)
# 1158 "parser/parser.ml"
            ))) = _menhir_stack in
            let _v : (Ast.stmt) = 
# 24 "parser/parser.mly"
                        ( Ast.VarDeclStmt _2 )
# 1163 "parser/parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LSPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | KW_TRUE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | LSPAREN ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | NUMBER _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
        | OP_REF ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | OP_STAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "parser/parser.mly"
       (string)
# 1218 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | OP_ASSIGN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | KW_TRUE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | LSPAREN ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | NUMBER _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | OP_REF ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | OP_STAR ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program) =
  fun lexer lexbuf ->
    let _menhir_env = {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = Obj.magic ();
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | KW_IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_VAR ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_WHILE ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | OP_STAR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 1297 "parser/parser.ml"

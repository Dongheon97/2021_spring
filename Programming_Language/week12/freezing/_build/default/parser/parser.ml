
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | RSPAREN
    | OP_RARROW
    | OP_PLUS
    | OP_MINUS
    | OP_LT
    | OP_EQ
    | NUMBER of (
# 5 "parser/parser.mly"
       (int)
# 17 "parser/parser.ml"
  )
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
    | ID of (
# 4 "parser/parser.mly"
       (string)
# 32 "parser/parser.ml"
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
  | MenhirState52
  | MenhirState49
  | MenhirState47
  | MenhirState46
  | MenhirState44
  | MenhirState43
  | MenhirState42
  | MenhirState41
  | MenhirState40
  | MenhirState38
  | MenhirState37
  | MenhirState36
  | MenhirState35
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState30
  | MenhirState27
  | MenhirState26
  | MenhirState25
  | MenhirState24
  | MenhirState22
  | MenhirState21
  | MenhirState20
  | MenhirState19
  | MenhirState17
  | MenhirState15
  | MenhirState13
  | MenhirState12
  | MenhirState8
  | MenhirState7
  | MenhirState6
  | MenhirState2
  | MenhirState0

let rec _menhir_run13 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | KW_TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LSPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | NUMBER _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | KW_TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | LSPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NUMBER _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | KW_TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | LSPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | NUMBER _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_goto_id_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 160 "parser/parser.ml"
        ))), _, (_2 : (string list))) = _menhir_stack in
        let _v : (string list) = 
# 62 "parser/parser.mly"
               ( _1 :: _2 )
# 165 "parser/parser.ml"
         in
        _menhir_goto_id_list _menhir_env _menhir_stack _menhir_s _v
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_RARROW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | KW_THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState12 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19)
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12)
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | KW_ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState20 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21)
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20)
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | EOF | KW_ELSE | KW_IN | KW_THEN | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (_2 : (Ast.expr))), _), _, (_4 : (Ast.expr))), _), _, (_6 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 20 "parser/parser.mly"
                                                   ( Ast.App (Ast.App (_2, _4), _6) )
# 412 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | KW_IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState24 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25)
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | EOF | KW_ELSE | KW_IN | KW_THEN | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (_3 : (
# 4 "parser/parser.mly"
       (string)
# 495 "parser/parser.ml"
            ))), _), _, (_5 : (Ast.expr))), _), _, (_7 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 22 "parser/parser.mly"
                                                     ( Ast.RLetIn (_3, _5, _7) )
# 504 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | KW_IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState31 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState32
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32)
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | EOF | KW_ELSE | KW_IN | KW_THEN | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (_3 : (
# 4 "parser/parser.mly"
       (string)
# 587 "parser/parser.ml"
            ))), _, (_4 : (string list))), _, (_6 : (Ast.expr))), _), _, (_8 : (Ast.expr))) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 31 "parser/parser.mly"
                                                             ( 
      let rec f = function
        | [] -> failwith "[Err] Wrong grammar"
        | [x] -> Ast.Fun (x, _6)
        | h :: t -> Ast.Fun (h, f t)
      in
      Ast.RLetIn (_3, f _4, _8)
    )
# 603 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33)
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState36 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37)
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36)
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | EOF | KW_ELSE | KW_IN | KW_THEN | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (_2 : (
# 4 "parser/parser.mly"
       (string)
# 686 "parser/parser.ml"
            ))), _), _, (_4 : (Ast.expr))), _), _, (_6 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 21 "parser/parser.mly"
                                              ( Ast.LetIn (_2, _4, _6) )
# 694 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38)
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | KW_IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState41 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42)
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | EOF | KW_ELSE | KW_IN | KW_THEN | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (_2 : (
# 4 "parser/parser.mly"
       (string)
# 777 "parser/parser.ml"
            ))), _, (_3 : (string list))), _, (_5 : (Ast.expr))), _), _, (_7 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 23 "parser/parser.mly"
                                                      ( 
      let rec f = function
        | [] -> failwith "[Err] Wrong grammar"
        | [x] -> Ast.Fun (x, _5)
        | h :: t -> Ast.Fun (h, f t)
      in
      Ast.LetIn (_2, f _3, _7)
    )
# 792 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43)
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState47 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _), _, (_3 : (string list))), _, (_5 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 51 "parser/parser.mly"
                                                  ( 
      let rec f = function
        | [] -> failwith "[Err] Wrong grammar"
        | [x] -> Ast.Fun (x, _5)
        | h :: t -> Ast.Fun (h, f t)
      in
      f _3
    )
# 840 "parser/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState49 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 46 "parser/parser.mly"
                         ( _2 )
# 879 "parser/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState52 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.fvae) = 
# 17 "parser/parser.mly"
           ( Ast.Prog _1 )
# 900 "parser/parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Ast.fvae)) = _v in
            Obj.magic _1
        | ID _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
        | KW_FALSE ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
        | OP_LT ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | OP_MINUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | OP_PLUS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52)
    | _ ->
        _menhir_fail ()

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "parser/parser.mly"
       (string)
# 932 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | OP_EQ | OP_RARROW ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 946 "parser/parser.ml"
        ))) = _menhir_stack in
        let _v : (string list) = 
# 61 "parser/parser.mly"
       ( [_1] )
# 951 "parser/parser.ml"
         in
        _menhir_goto_id_list _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_goto_term : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 | MenhirState2 | MenhirState46 | MenhirState42 | MenhirState40 | MenhirState37 | MenhirState35 | MenhirState32 | MenhirState30 | MenhirState25 | MenhirState7 | MenhirState21 | MenhirState19 | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_1 : (Ast.expr)) = _v in
        let _v : (Ast.expr) = 
# 39 "parser/parser.mly"
         ( _1 )
# 969 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_3 : (Ast.expr)) = _v in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 41 "parser/parser.mly"
                      ( Ast.Add (_1, _3) )
# 981 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_3 : (Ast.expr)) = _v in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 42 "parser/parser.mly"
                       ( Ast.Sub (_1, _3) )
# 993 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_3 : (Ast.expr)) = _v in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 43 "parser/parser.mly"
                    ( Ast.Lt (_1, _3) )
# 1005 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState52 | MenhirState49 | MenhirState47 | MenhirState41 | MenhirState43 | MenhirState36 | MenhirState38 | MenhirState31 | MenhirState33 | MenhirState24 | MenhirState26 | MenhirState12 | MenhirState20 | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (Ast.expr)) = _v in
        let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
        let _v : (Ast.expr) = 
# 40 "parser/parser.mly"
              ( Ast.App (_1, _2) )
# 1016 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "parser/parser.mly"
       (int)
# 1168 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 5 "parser/parser.mly"
       (int)
# 1176 "parser/parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 47 "parser/parser.mly"
           ( Ast.Num _1 )
# 1181 "parser/parser.ml"
     in
    _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_FUN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState2 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44)
    | KW_IF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_LET ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | LSPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | NUMBER _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 49 "parser/parser.mly"
            ( Ast.Fun ("x", Ast.Fun ("y", Ast.Id "x")) )
# 1231 "parser/parser.ml"
     in
    _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
        | ID _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | OP_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState34 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | KW_FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | KW_IF ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34)
    | KW_REC ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | OP_EQ ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState6 in
                let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | ID _v ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
                | KW_FALSE ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                | KW_IF ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                | KW_LET ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                | KW_TRUE ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                | LSPAREN ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                | NUMBER _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | KW_IF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | KW_LET ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | KW_TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | LSPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | NUMBER _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 50 "parser/parser.mly"
             ( Ast.Fun ("x", Ast.Fun ("y", Ast.Id "y")) )
# 1366 "parser/parser.ml"
     in
    _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "parser/parser.mly"
       (string)
# 1373 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 4 "parser/parser.mly"
       (string)
# 1381 "parser/parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 48 "parser/parser.mly"
       ( Ast.Id _1 )
# 1386 "parser/parser.ml"
     in
    _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v

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

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.fvae) =
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
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | KW_FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LET ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LSPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NUMBER _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 1436 "parser/parser.ml"

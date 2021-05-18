
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
    | KW_LET
    | KW_IN
    | KW_IF
    | KW_FUN
    | KW_FALSE
    | KW_ELSE
    | ID of (
# 4 "parser/parser.mly"
       (string)
# 31 "parser/parser.ml"
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
  | MenhirState41
  | MenhirState38
  | MenhirState36
  | MenhirState35
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState30
  | MenhirState29
  | MenhirState26
  | MenhirState25
  | MenhirState24
  | MenhirState23
  | MenhirState21
  | MenhirState20
  | MenhirState19
  | MenhirState18
  | MenhirState16
  | MenhirState14
  | MenhirState12
  | MenhirState11
  | MenhirState7
  | MenhirState6
  | MenhirState5
  | MenhirState2
  | MenhirState0

let rec _menhir_run12 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | KW_FALSE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | KW_TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | LSPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | NUMBER _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_run14 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | KW_FALSE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | KW_TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | LSPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | NUMBER _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14

and _menhir_run16 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | KW_FALSE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | KW_TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | LSPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | NUMBER _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_goto_id_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 150 "parser/parser.ml"
        ))), _, (_2 : (string list))) = _menhir_stack in
        let _v : (string list) = 
# 53 "parser/parser.mly"
               ( _1 :: _2 )
# 155 "parser/parser.ml"
         in
        _menhir_goto_id_list _menhir_env _menhir_stack _menhir_s _v
    | MenhirState5 ->
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
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
            | KW_FALSE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29
            | KW_IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState29
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState29
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState33 ->
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
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | KW_FALSE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | KW_IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState35
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
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | KW_THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState11 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
            | KW_FALSE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | KW_IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState18
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18)
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11)
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | KW_ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState19 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | KW_FALSE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | KW_IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20)
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19)
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | EOF | KW_ELSE | KW_IN | KW_THEN | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (_2 : (Ast.expr))), _), _, (_4 : (Ast.expr))), _), _, (_6 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 20 "parser/parser.mly"
                                                   ( Ast.App (Ast.App (_2, _4), _6) )
# 368 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21)
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | KW_IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState23 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
            | KW_FALSE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | KW_IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24)
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23)
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | EOF | KW_ELSE | KW_IN | KW_THEN | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (_2 : (
# 4 "parser/parser.mly"
       (string)
# 451 "parser/parser.ml"
            ))), _), _, (_4 : (Ast.expr))), _), _, (_6 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 21 "parser/parser.mly"
                                              ( Ast.LetIn (_2, _4, _6) )
# 459 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25)
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | KW_IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState30 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
            | KW_FALSE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | KW_IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31)
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30)
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | EOF | KW_ELSE | KW_IN | KW_THEN | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (_2 : (
# 4 "parser/parser.mly"
       (string)
# 542 "parser/parser.ml"
            ))), _, (_3 : (string list))), _, (_5 : (Ast.expr))), _), _, (_7 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 22 "parser/parser.mly"
                                                      ( 
      let rec f = function
        | [] -> failwith "[Err] Wrong grammar"
        | [x] -> Ast.Fun (x, _5)
        | h :: t -> Ast.Fun (h, f t)
      in
      Ast.LetIn (_2, f _3, _7)
    )
# 557 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32)
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState36 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _), _, (_3 : (string list))), _, (_5 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 42 "parser/parser.mly"
                                                  ( 
      let rec f = function
        | [] -> failwith "[Err] Wrong grammar"
        | [x] -> Ast.Fun (x, _5)
        | h :: t -> Ast.Fun (h, f t)
      in
      f _3
    )
# 605 "parser/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState38 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 37 "parser/parser.mly"
                         ( _2 )
# 644 "parser/parser.ml"
             in
            _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState41 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.fvae) = 
# 17 "parser/parser.mly"
           ( Ast.Prog _1 )
# 665 "parser/parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Ast.fvae)) = _v in
            Obj.magic _1
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | KW_FALSE ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | KW_TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | LSPAREN ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | NUMBER _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | OP_LT ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | OP_MINUS ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | OP_PLUS ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41)
    | _ ->
        _menhir_fail ()

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "parser/parser.mly"
       (string)
# 697 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | OP_EQ | OP_RARROW ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 711 "parser/parser.ml"
        ))) = _menhir_stack in
        let _v : (string list) = 
# 52 "parser/parser.mly"
       ( [_1] )
# 716 "parser/parser.ml"
         in
        _menhir_goto_id_list _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_goto_term : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 | MenhirState2 | MenhirState35 | MenhirState31 | MenhirState29 | MenhirState24 | MenhirState6 | MenhirState20 | MenhirState18 | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_1 : (Ast.expr)) = _v in
        let _v : (Ast.expr) = 
# 30 "parser/parser.mly"
         ( _1 )
# 734 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_3 : (Ast.expr)) = _v in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 32 "parser/parser.mly"
                      ( Ast.Add (_1, _3) )
# 746 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_3 : (Ast.expr)) = _v in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 33 "parser/parser.mly"
                       ( Ast.Sub (_1, _3) )
# 758 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_3 : (Ast.expr)) = _v in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 34 "parser/parser.mly"
                    ( Ast.Lt (_1, _3) )
# 770 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState41 | MenhirState38 | MenhirState36 | MenhirState30 | MenhirState32 | MenhirState23 | MenhirState25 | MenhirState11 | MenhirState19 | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_2 : (Ast.expr)) = _v in
        let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
        let _v : (Ast.expr) = 
# 31 "parser/parser.mly"
              ( Ast.App (_1, _2) )
# 781 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
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
# 897 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 5 "parser/parser.mly"
       (int)
# 905 "parser/parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 38 "parser/parser.mly"
           ( Ast.Num _1 )
# 910 "parser/parser.ml"
     in
    _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | KW_FALSE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | KW_FUN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState2 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33)
    | KW_IF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
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
# 40 "parser/parser.mly"
            ( Ast.Fun ("x", Ast.Fun ("y", Ast.Id "x")) )
# 960 "parser/parser.ml"
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
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | OP_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState5 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | KW_FALSE ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | KW_IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | KW_LET ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | KW_TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | LSPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | NUMBER _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | KW_FALSE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | KW_IF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 41 "parser/parser.mly"
             ( Ast.Fun ("x", Ast.Fun ("y", Ast.Id "y")) )
# 1047 "parser/parser.ml"
     in
    _menhir_goto_term _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "parser/parser.mly"
       (string)
# 1054 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 4 "parser/parser.mly"
       (string)
# 1062 "parser/parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 39 "parser/parser.mly"
       ( Ast.Id _1 )
# 1067 "parser/parser.ml"
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
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | KW_FALSE ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_IF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
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
  

# 1117 "parser/parser.ml"

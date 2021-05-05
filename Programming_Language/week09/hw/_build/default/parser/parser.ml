
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | RSPAREN
    | OP_PLUS
    | OP_MINUS
    | OP_EQ
    | OP_COMMA
    | NUMBER of (
# 5 "parser/parser.mly"
       (int)
# 16 "parser/parser.ml"
  )
    | LSPAREN
    | KW_LET
    | KW_IN
    | KW_ENDEF
    | KW_DEF
    | ID of (
# 4 "parser/parser.mly"
       (string)
# 26 "parser/parser.ml"
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
  | MenhirState45
  | MenhirState42
  | MenhirState36
  | MenhirState33
  | MenhirState30
  | MenhirState29
  | MenhirState22
  | MenhirState17
  | MenhirState14
  | MenhirState12
  | MenhirState9
  | MenhirState7
  | MenhirState4
  | MenhirState2
  | MenhirState0

let rec _menhir_goto_decl_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.fundef list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | KW_LET ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | LSPAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | NUMBER _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | OP_MINUS ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42)
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.fundef))), _, (_2 : (Ast.fundef list))) = _menhir_stack in
        let _v : (Ast.fundef list) = 
# 17 "parser/parser.mly"
                   ( _1 :: _2 )
# 91 "parser/parser.ml"
         in
        _menhir_goto_decl_list _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_plist : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 107 "parser/parser.ml"
        ))), _, (_2 : (string list))) = _menhir_stack in
        let _v : (string list) = 
# 25 "parser/parser.mly"
             ( _1 :: _2 )
# 112 "parser/parser.ml"
         in
        _menhir_goto_plist _menhir_env _menhir_stack _menhir_s _v
    | MenhirState29 ->
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
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
            | KW_LET ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState36
            | LSPAREN ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState36
            | NUMBER _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
            | OP_MINUS ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState36
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36)
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

and _menhir_goto_main : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.f1vae) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (Ast.f1vae)) = _v in
    Obj.magic _1

and _menhir_goto_decl : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.fundef) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | KW_DEF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | ID _ | KW_LET | LSPAREN | NUMBER _ | OP_MINUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (Ast.fundef))) = _menhir_stack in
        let _v : (Ast.fundef list) = 
# 16 "parser/parser.mly"
         ( [_1] )
# 175 "parser/parser.ml"
         in
        _menhir_goto_decl_list _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_goto_elist : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr list))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr list) = 
# 37 "parser/parser.mly"
                        ( _1 :: _3 )
# 195 "parser/parser.ml"
         in
        _menhir_goto_elist _menhir_env _menhir_stack _menhir_s _v
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 210 "parser/parser.ml"
            ))), _, (_3 : (Ast.expr list))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.expr) = 
# 30 "parser/parser.mly"
                             ( Ast.FCall (_1, _3) )
# 217 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "parser/parser.mly"
       (string)
# 232 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | OP_EQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 246 "parser/parser.ml"
        ))) = _menhir_stack in
        let _v : (string list) = 
# 24 "parser/parser.mly"
       ( [_1] )
# 251 "parser/parser.ml"
         in
        _menhir_goto_plist _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_goto_snd_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | OP_MINUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | KW_LET ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LSPAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | NUMBER _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | OP_MINUS ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14)
    | OP_PLUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | KW_LET ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LSPAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NUMBER _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | OP_MINUS ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12)
    | EOF | KW_ENDEF | KW_IN | OP_COMMA | RSPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
        let _v : (Ast.expr) = 
# 31 "parser/parser.mly"
             ( _1 )
# 310 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 32 "parser/parser.mly"
                          ( Ast.Add (_1, _3) )
# 332 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (_1 : (Ast.expr))), _, (_3 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 33 "parser/parser.mly"
                           ( Ast.Sub (_1, _3) )
# 343 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState17 | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OP_COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | KW_LET ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | LSPAREN ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | NUMBER _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | OP_MINUS ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr list) = 
# 36 "parser/parser.mly"
         ( [_1] )
# 376 "parser/parser.ml"
             in
            _menhir_goto_elist _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | KW_IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | KW_LET ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | LSPAREN ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | NUMBER _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | OP_MINUS ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), (_2 : (
# 4 "parser/parser.mly"
       (string)
# 421 "parser/parser.ml"
        ))), _, (_4 : (Ast.expr))), _, (_6 : (Ast.expr))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (Ast.expr) = 
# 28 "parser/parser.mly"
                                    ( Ast.LetIn (_2, _4, _6) )
# 429 "parser/parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_2 : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 41 "parser/parser.mly"
                         ( _2 )
# 447 "parser/parser.ml"
             in
            _menhir_goto_snd_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (_3 : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 42 "parser/parser.mly"
                                  ( Ast.Sub (Ast.Num 0, _3) )
# 472 "parser/parser.ml"
             in
            _menhir_goto_snd_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | KW_ENDEF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), (_2 : (
# 4 "parser/parser.mly"
       (string)
# 493 "parser/parser.ml"
            ))), _), _, (_4 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.fundef) = 
# 20 "parser/parser.mly"
                                  ( Ast.FDef (_2, [], _4) )
# 501 "parser/parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | KW_ENDEF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), (_2 : (
# 4 "parser/parser.mly"
       (string)
# 522 "parser/parser.ml"
            ))), _, (_3 : (string list))), _, (_5 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.fundef) = 
# 21 "parser/parser.mly"
                                        ( Ast.FDef (_2, _3, _5) )
# 530 "parser/parser.ml"
             in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v
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
            let (_menhir_stack, _menhir_s, (_1 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.f1vae) = 
# 12 "parser/parser.mly"
             ( Ast.Prog ([], _1) )
# 552 "parser/parser.ml"
             in
            _menhir_goto_main _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (_1 : (Ast.fundef list))), _, (_2 : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _v : (Ast.f1vae) = 
# 13 "parser/parser.mly"
                       ( Ast.Prog (_1, _2) )
# 574 "parser/parser.ml"
             in
            _menhir_goto_main _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
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
    | LSPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | KW_LET ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LSPAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | NUMBER _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | OP_MINUS ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "parser/parser.mly"
       (int)
# 684 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (_1 : (
# 5 "parser/parser.mly"
       (int)
# 692 "parser/parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 40 "parser/parser.mly"
           ( Ast.Num _1 )
# 697 "parser/parser.ml"
     in
    _menhir_goto_snd_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | KW_LET ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | LSPAREN ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | NUMBER _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | OP_MINUS ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
        | OP_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
            | KW_LET ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState7
            | LSPAREN ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7
            | NUMBER _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
            | OP_MINUS ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState7
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7)
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

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | OP_EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState29 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | KW_LET ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | LSPAREN ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | NUMBER _v ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
            | OP_MINUS ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 4 "parser/parser.mly"
       (string)
# 815 "parser/parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LSPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | KW_LET ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | LSPAREN ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | NUMBER _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | OP_MINUS ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | RSPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState9 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 845 "parser/parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _2 = () in
            let _v : (Ast.expr) = 
# 29 "parser/parser.mly"
                       ( Ast.FCall (_1, []) )
# 852 "parser/parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9)
    | EOF | KW_ENDEF | KW_IN | OP_COMMA | OP_MINUS | OP_PLUS | RSPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (_1 : (
# 4 "parser/parser.mly"
       (string)
# 864 "parser/parser.ml"
        ))) = _menhir_stack in
        let _v : (Ast.expr) = 
# 43 "parser/parser.mly"
       ( Ast.Id _1 )
# 869 "parser/parser.ml"
         in
        _menhir_goto_snd_expr _menhir_env _menhir_stack _menhir_s _v
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

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.f1vae) =
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
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | KW_DEF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | KW_LET ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LSPAREN ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NUMBER _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | OP_MINUS ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 923 "parser/parser.ml"

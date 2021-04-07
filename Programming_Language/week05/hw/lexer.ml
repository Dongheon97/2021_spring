module F = Format

type t = 
        | Int of int
        | Var of string

type state = 
        | S0
        | S1
        | S2
        | S3

let char_to_int c = (int_of_char c) - 48 
let char_to_str c = Char.escaped c

(* lex : char list -> t *)
let lex chars =
          (* lex_impl : state -> char list -> int -> string -> t *)
          (* write your code *)
        let rec lex_impl state chars i str =
                match state with
                |S0 -> 
                                begin
                                        match chars with
                                        | h::t ->
                                                        begin 
                                                                match h with
                                                                | '0'..'9' -> lex_impl S3 t (i*10+(char_to_int h)) str
                                                                | '-' ->
                                                                                begin 
                                                                                        match (lex_impl S1 t i str) with
                                                                                        | Int n -> Int (-1*n)
                                                                                        | _ -> failwith "Not a valid integer or a valid variable"
                                                                                end
                                                                | 'a'..'z' -> lex_impl S2 t i (str^(char_to_str h)) 
                                                                | _ -> failwith "Not a valid integer or a valid variable"
                                                        end
                                        | [] -> failwith "Not a valid integer or a valid variable"
                                end
                |S1 -> 
                                begin
                                        match chars with
                                        | h::t ->
                                                        begin
                                                                match h with
                                                                | '0'..'9' -> lex_impl S3 t (i*10+(char_to_int h)) str
                                                                | _ -> failwith "Not a valid integer or a valid variable"
                                                        end
                                        | [] -> failwith "Not a valid integer or a valid variable"
                                end
                |S2 ->
                                begin 
                                        match chars with
                                        | h::t ->
                                                        begin
                                                                match h with
                                                                | '0'..'9' -> lex_impl S2 t i (str^(char_to_str h))
                                                                | 'a'..'z' -> lex_impl S2 t i (str^(char_to_str h))
                                                                | 'A'..'Z' -> lex_impl S2 t i (str^(char_to_str h))
                                                                | '\'' -> lex_impl S2 t i (str^(char_to_str h))
                                                                | '_' -> lex_impl S2 t i (str^(char_to_str h))
                                                                | _ -> failwith "Not a valid integer or a valid variable"
                                                        end
                                        | [] -> Var str
                                end

                |S3 -> 
                                begin 
                                        match chars with
                                        | h::t ->
                                                        begin 
                                                                match h with
                                                                | '0'..'9' -> lex_impl S3 t (i*10+(char_to_int h)) str
                                                                | _ -> failwith "Not a valid integer or a valid variable"
                                                        end
                                        |[] -> Int i
                                end
        in
        lex_impl S0 chars 0 ""


let pp fmt v = 
        match v with
        | Int i -> F.fprintf fmt "Int %d" i
        | Var x -> F.fprintf fmt "Var %s" x 

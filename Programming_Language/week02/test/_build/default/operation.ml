
module Interp = struct
        type unop = Neg
        type binop = Add | Sub | Mul | Div
        type exp = Constant of int | Unary of unop * exp | Binary of exp * binop * exp
                                                                                         (*
                                                                                          *         let operation op =
                                                                                                  *                         match op with
                                                                                                  *                                         | Neg -> -
                                                                                                  *                                                         | Add -> +
                                                                                                  *                                                                         | Sub -> -
                                                                                                  *                                                                                         | Mul -> *
                                                                                                  *                                                                                                         | Div -> /
                                                                                                  *                                                                                                                         | _ -> failwith "Not support yet"
                                                                                                  *                                                                                                                         *)
        let rec eval i=
                match i with
                | Constant c -> c
                | Unary (Neg, u) -> -(eval u)
                | Binary (bi1, Add, bi2) -> (eval bi1) + (eval bi2)
                | Binary (bi3, Sub, bi4) -> (eval bi3) - (eval bi4)
                | Binary (bi5, Mul, bi6) -> (eval bi5) * (eval bi6)
                | Binary (bi7, Div, bi8) -> (eval bi7) / (eval bi8)
end

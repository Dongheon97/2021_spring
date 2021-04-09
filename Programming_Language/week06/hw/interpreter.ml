module F = Format

let rec interp (e : Ast.ae) : int =
        match e with
        | Num(n) -> n
        | Add(x, y) -> interp(x) + interp(y)
        | Sub(x, y) -> interp(x) - interp(y)
        | Neg(x) -> - interp(x)

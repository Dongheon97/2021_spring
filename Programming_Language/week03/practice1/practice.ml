
type unary_number = Z | S of unary_number

let rec add n m = 
        match n with
        | Z -> m
        | S unary_number -> S(add unary_number m)

let rec mul n m acc = 
        match m with
        | Z -> acc
        | S unary_number -> mul n unary_number (add n acc)



let rec print_un fmt f =
        match f with
        | Z -> Format.fprintf fmt "Z"
        | S(unary_number) -> Format.fprintf fmt "(S %a)" print_un unary_number



(* test case *)
let _ =
        let a = add (S(S(S(S(S Z))))) (S Z) in
        let _ =  Format.printf "a = %a\n" print_un a in
        let b = mul (S(S(S Z))) (S(S(S Z))) Z in
        Format.printf "b = %a\n" print_un b 





let split li =
        let rec aux acc1 acc2 li = 
                match li with 
                | [] -> (List.rev acc1, List.rev acc2)
                | (h1, h2)::t -> aux (h1::acc1) (h2::acc2) t 
        in
        aux [] [] li

let combine li1 li2 = 
        let rec aux acc li1 li2 =
                match li1, li2 with
                | [], [] -> List.rev acc
                | h1::t1, h2::t2 -> aux((h1, h2)::acc) t1 t2 
                | _ -> failwith "Error : Different length"
        in
        aux [] li1 li2




module F = Format

type t = (string * string) list

let empty = []

let add key value map =
        if map=empty then (key, value)::map     (* case 1 : add to empty list *)
        else                                    (* case 2 : add to not empty list *)
                let rec update key value map =
                       match map with
                       | (k, v)::t ->
                                       if k=key then (key, value)::t     (* update value *)
                                       else (k, v)::(update key value t) (* search recursively *)
                       | [] -> (key, value)::map (* tuple (key, value) is not in map -> just add tuple *)
                in
                update key value map


let rec find key map =
       match map with
       | (k, v)::t -> 
                       if k=key then v
                       else find key t (* search recursively *)
       | _ -> failwith "No such key exists"
         

let erase key map =
        let rec erase_rec key map =
               match map with
               | (k, v)::t -> 
                               if k=key then t                  (* key is in map -> delete *)
                               else (k, v)::(erase_rec key t)   (* search key recursively *)
               | _ -> failwith "No such key exists"
        in
        erase_rec key map


let print_map fmt map = 
        let rec print_map_impl map = 
                match map with
                | [] -> ()
                | (k, v) :: t ->
                                let () = F.fprintf fmt "(%s, %s) " k v in
                                print_map_impl t
        in
        let () = F.fprintf fmt "[ " in
        let () = print_map_impl map in
        F.fprintf fmt "]"

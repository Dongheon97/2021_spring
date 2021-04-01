module F = Format

(* Test cases *)
let _ =
        let empty_map = ListMap.empty in (* empty_map = [] *)
        let map1 = ListMap.add "name" "kihoon" empty_map in  (* map1 = [(name, kihoon)] *)
        let map1' = ListMap.add "age" "23" map1 in (* map1' = [(age, 23); (name, kihoon)] *)
        let map1'' = ListMap.add "city" "Daejeon" map1' in (* map1'' = [(city, Daejeon); (age, 23); (name, kihoon)] *)
        let name = ListMap.find "name" map1'' in (* name = kihoon *)
        let city = ListMap.find "city" map1'' in (* city = Daejeon *)
        let age = ListMap.find "age" map1'' in (* age = 23 *)
        let map2 = ListMap.erase "age" map1'' in (* map2 = [(city, Daejeon); (name, kihoon)] *)
        let map2' = ListMap.erase "name" map1'' in (* map2 = [(city, Daejeon); (age, 23)] *)
        let map2'' = ListMap.erase "city" map1'' in (* map2 = [(age, 23); (name, kihoon)] *)
        let () = F.printf "EMPTY_MAP : %a\n" ListMap.print_map empty_map in
        let () = F.printf "MAP1: %a\n" ListMap.print_map map1 in
        let () = F.printf "MAP1': %a\n" ListMap.print_map map1' in
        let () = F.printf "MAP1'': %a\n" ListMap.print_map map1'' in
        let () = F.printf "MAP2: %a\n" ListMap.print_map map2 in
        let () = F.printf "MAP2': %a\n" ListMap.print_map map2' in
        let () = F.printf "MAP2'': %a\n" ListMap.print_map map2'' in
        let () = F.printf "NAME : %s\n" name in
        let () = F.printf "CITY : %s\n" city in
        let () = F.printf "AGE : %s\n" age in
        let _ =
               try
                      let _ = ListMap.find "name" map2' in ()
                     with (Failure e) -> F.printf "Exception occurs : %s\n" e  (* Exception occurs : No such key exists *)
        in
        try
               let _ = ListMap.erase "city" map2'' in ()
              with (Failure e) -> F.printf "Exception occurs : %s\n" e  (* Exception occurs : No such key exists *)

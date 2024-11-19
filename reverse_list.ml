let rec reverse_list_1 lst acc = 
  match lst with
  | [] -> acc
  | hd::tl -> (reverse_list_1 tl (hd::acc))

let reverse_list lst = reverse_list_1 lst [];;

(* reverse_list [1;2;3;4] *)

List.iter (fun c -> Printf.printf "%d\n" c) (reverse_list [1;2;3;4])
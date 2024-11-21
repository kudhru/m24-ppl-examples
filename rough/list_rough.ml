(* let numbers_list_1 = [1; 3;] *)
let numbers_list_1 = [1; 3; 4; 6; 7; 8]
let numbers_list_2 = [1; 3; 5; 7; 9]
(* let first_even_1 = List.find (fun x -> x mod 2 = 0) numbers_list_1
let () = Printf.printf "First even number in first list: %d\n" first_even_1 *)
let (s_list, ns_list) = List.partition (fun x -> x mod 2 = 0) numbers_list_1
let () = List.iter (fun x -> Printf.printf "Found: %d\n" x) s_list
let () = List.iter (fun x -> Printf.printf "Not Found: %d\n" x) ns_list
let () = 
  try
    let first_even_2 = List.find (fun x -> x mod 2 = 0) numbers_list_2 in
    Printf.printf "First even number in second list: %d\n" first_even_2
  with Not_found -> 
    Printf.printf "No even numbers found in second list\n"
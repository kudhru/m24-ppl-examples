let rec print_list = function
  | [] -> ()
  (* | [x] -> Printf.printf "%d" x  *)
  | h :: t -> 
    Printf.printf "%d " h; 
    print_list t

let list1 = [1; 2; 3; 4]
let list2 = [10; 20; 30; 40; 50]
let sum1 = List.map (fun x -> Printf.printf "%d\n" x) list1
(* let sums = List.map2 (fun x y -> x * y) list1 list2 *)

let () =
  Printf.printf "Element-wise sums: ";
  (* print_list sums; *)
  (* print_list sum1; *)
  print_newline ()

(* let list1 = [1; 2; 3; 4; 5]
let list2 = [10; 20; 30; 40; 50]
let list3 = list1 @ list2;;

print_list list3

let () = 
    let list1 = [1; 2; 3; 4; 5] in
    let list2 = [10; 20; 30; 40; 50] in
    let list3 = list1 @ list2 in
    print_list list3 *)

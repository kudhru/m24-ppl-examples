let rec partition_helper lst f acc1 acc2 =
  match lst with
  | [] -> (acc1, acc2)
  | hd::tl -> 
    if f hd then 
      partition_helper tl f (hd::acc1) acc2 
    else
      partition_helper tl f acc1 (hd::acc2) 

let partition f lst = partition_helper lst f [] []

let (s_lst, ns_lst) = 
  partition (fun x -> x mod 2 = 0) [1;2;3;5;7;8;9;10]

let () = List.iter (fun x -> Printf.printf "Found %d\n" x) s_lst
let () = List.iter (fun x -> Printf.printf "Not Found %d\n" x) ns_lst


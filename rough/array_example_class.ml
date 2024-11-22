let arr2 = Array.init 5 (fun i -> i*2);;
Array.iter (fun x -> Printf.printf "%d " x) arr2;
Printf.printf "\n";;

let arr2 = [|20; 10; 4; 8; 15|];;
Printf.printf "arr2 before sorting: ";
Array.iter (fun x -> Printf.printf "%d " x) arr2;
Printf.printf "\n";;

Array.sort compare arr2;
Printf.printf "arr2 after sorting: ";
Array.iter (fun x -> Printf.printf "%d " x) arr2;
Printf.printf "\n";;

let compare_custom a b =
  if a > b then -1
  else if a = b then 0
  else 1;;

  Array.sort compare_custom arr2;

  Printf.printf "arr2 after custom sorting: ";
  Array.iter (fun x -> Printf.printf "%d " x) arr2;
  Printf.printf "\n";;
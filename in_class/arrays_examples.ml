(* Define arr1 at the top level *)
let arr0 = [| 2; 3; 4; 5; 6; 7; 8 |];;
Array.map (fun x -> x + 1) arr0;;
(* Array.iter (fun x -> Printf.printf "%d " x) arr0; *)
Printf.printf "\n";;

let arr1 = Array.make 5 0;;
Array.iter (fun x -> Printf.printf "%d " x) arr1;
Printf.printf "\n";;

(* Define arr2 at the top level *)
let arr2 = Array.init 5 (fun i -> i * 2);;
Array.iter (fun x -> Printf.printf "%d " x) arr2;
Printf.printf "\n";;
  
(* Array.make creates a new array with the given length filled with the given value *)
let arr2 = Array.init 5 (fun i -> i * 2) in
Printf.printf "arr2: ";
Array.iter (fun x -> Printf.printf "%d " x) arr2;
Printf.printf "\n";;

(* Array.length returns the length of an array *)
let len = Array.length arr1 in
Printf.printf "Length of arr1: %d\n" len;;

(* Array access using .() syntax *)
let first = arr2.(4) in
Printf.printf "First element of arr2: %d\n" first;;
arr2.(0) <- 10;
Printf.printf "arr2 after setting first element to 10: ";
Array.iter (fun x -> Printf.printf "%d " x) arr2;
Printf.printf "\n";;

(* Array.copy creates a shallow copy *)
let arr3 = Array.copy arr2 in
Printf.printf "arr3 (copy of arr2): ";
Array.iter (fun x -> Printf.printf "%d " x) arr3;
Printf.printf "\n";;

(* Array.map applies a function to each element *)
let arr4 = Array.map (fun x -> x + 1) arr2 in
Printf.printf "arr4 (arr2 + 1): ";
Array.iter (fun x -> Printf.printf "%d " x) arr4;
Printf.printf "\n";;

(* Array.iter performs an action on each element *)
Printf.printf "Printing arr2: ";
Array.iter (fun x -> Printf.printf "%d " x) arr2;
Printf.printf "\n";;

(* Array.fold_left reduces array to single value from left *)
let sum = Array.fold_left (+) 0 arr2 in
Printf.printf "Sum of arr2: %d\n" sum;;

(* Array.to_list converts array to list *)
let lst = Array.to_list arr2 in
Printf.printf "arr2 as list: ";
List.iter (fun x -> Printf.printf "%d " x) lst;
Printf.printf "\n";;

(* Array.of_list converts list to array *)
let arr5 = Array.of_list [1; 2; 3; 4; 5] in
Printf.printf "arr5 from list: ";
Array.iter (fun x -> Printf.printf "%d " x) arr5;
Printf.printf "\n";;

(* Array.append concatenates two arrays *)
let arr6 = Array.append arr1 arr2 in
Printf.printf "arr6 (arr1 + arr2): ";
Array.iter (fun x -> Printf.printf "%d " x) arr6;
Printf.printf "\n";;

(* Array.sub extracts a slice of the array *)
let slice = Array.sub arr2 1 3 in
Printf.printf "slice of arr2 (3 elements from index 1): ";
Array.iter (fun x -> Printf.printf "%d " x) slice;
Printf.printf "\n";;

(* Array.sort sorts the array in place *)
Printf.printf "arr2 before sorting: ";
Array.iter (fun x -> Printf.printf "%d " x) arr2;
Printf.printf "\n";;
Array.sort compare arr2;
Printf.printf "arr2 after sorting: ";
Array.iter (fun x -> Printf.printf "%d " x) arr2;
Printf.printf "\n";;

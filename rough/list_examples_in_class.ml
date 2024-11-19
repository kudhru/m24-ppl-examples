let rec total l =
  match l with
  | [] -> 0
  | h :: t -> h + total t

(* let () = *)
let result = (total [1; 2; 3; 4; 5]);;
(* in *)
(Printf.printf "Total: %d\n" result)

let rec total_tr l acc =
  match l with
  | [] -> acc
  | h :: t -> total_tr t (acc + h)

let total_tail l = total_tr l 0

let () =
  let result_tail = total_tail [1; 2; 3; 4; 5] in
  Printf.printf "Total tail: %d\n" result_tail


(* let len l = List.length l *)
let l = [1; 2; 3; 4; 5]
let sum = (total l)
let len = (List.length l)
let average = (if len = 0 then 0 else sum / len)
let average l =
  let sum = (total l) in
  let len = (List.length l) in
  (if len = 0 then 0 else sum / len)
  (* (if (List.length l) = 0 then 0 else (total l) / (List.length l)) *)
let average l =
  (* let sum = (total l) in
  let len = (List.length l) in *)
  (* (if len = 0 then 0 else sum / len) *)
  (if (List.length l) = 0 then 0 else (total l) / (List.length l))

(* let average l =
  let sum = (total l)
  let len = (List.length l)
  (if len = 0 then 0 else sum / len) *)

let () =
  let avg = average [1; 2; 3; 4; 5] in
  Printf.printf "Average: %d\n" avg

let rec length l =
  match l with
  | [] -> 0
  | _ :: t -> 1 + length t;;

let () =
  let len = length [1; 2; 3; 4; 5] in
  Printf.printf "Length: %d\n" len

let rec length_tr l acc =
  match l with
  | [] -> acc
  | _ :: t -> length_tr t (acc + 1);;

let () =
  let len = length_tr [1; 2; 3; 4; 5] 0 in
  Printf.printf "Length tail: %d\n" len

let rec print_list = function
  | [] -> ()
  (* | [x] -> Printf.printf "%d" x  *)
  | h :: t -> 
    Printf.printf "%d " h; 
    print_list t

let () =
  let list1 = [1; 2; 3; 4; 5] in
  let list2 = [6; 7; 8; 9; 10] in
  let appended = list1 @ list2 in
  Printf.printf "Final list: ";
  print_list appended;
  print_newline ()

(* let append list1 list2 =  *)

let () =
  let numbers = [1; 2; 3; 4; 5] in
  let doubled = List.map (fun x -> x * 2) numbers in
  Printf.printf "Doubled numbers: ";
  print_list doubled;
  print_newline ()

let rec map funct lst = 
  match lst with
  | [] -> []
  | h::t -> (funct h) :: (map funct t)

let () =
  let numbers = [1; 2; 3; 4; 5] in
  let strings = List.map string_of_int numbers in
  Printf.printf "Numbers converted to strings: ";
  List.iter (Printf.printf "%s ") strings;
  print_newline ()

let list1 = [1; 2; 3; 4; 5]
let list2 = [10; 20; 30; 40; 50]
let sums = List.map2 (+) list1 list2

let () =
  Printf.printf "Element-wise sums: ";
  print_list sums;
  print_newline ()

let () =
  let numbers = [4; 5; 6] in
  let multipliers = [2; 3; 4] in
  let products = List.map2 (fun x y -> x * y) numbers multipliers in
  Printf.printf "Element-wise products: ";
  print_list products;
  print_newline ()

let () =
  let numbers = [1; 2; 3; 4; 5] in
  Printf.printf "Printing numbers with iter: ";
  List.iter (fun x -> Printf.printf "%d " x) numbers;
  print_newline ()

let () = 
  let words = ["Hello"; "World"; "OCaml"] in
  Printf.printf "Printing strings with iter: ";
  List.iter (Printf.printf "%s ") words;
  print_newline ()

let test_numbers = [1; 2; 3; 4; 5]
let has_three = List.mem 3 test_numbers
let has_seven = List.mem 7 test_numbers

let test_fruits = ["apple"; "banana"; "orange"]
let has_banana = List.mem "banana" test_fruits  
let has_grape = List.mem "grape" test_fruits

let () =
  Printf.printf "Is 3 in the list? %b\n" has_three;
  Printf.printf "Is 7 in the list? %b\n" has_seven;
  Printf.printf "Is \"banana\" in the list? %b\n" has_banana;
  Printf.printf "Is \"grape\" in the list? %b\n" has_grape

let numbers_all_positive = [1; 2; 3; 4; 5]
let numbers_with_negative = [1; -2; 3; 4; 5]
let all_positive_1 = List.for_all (fun x -> x > 0) numbers_all_positive
let all_positive_2 = List.for_all (fun x -> x > 0) numbers_with_negative
let () = 
  Printf.printf "Are all numbers positive in first list? %b\n" all_positive_1;
  Printf.printf "Are all numbers positive in second list? %b\n" all_positive_2

let strings_list_1 = ["cat"; "dog"; "bird"]
let strings_list_2 = ["cat"; "dog"; "elephant"]
let has_short_word_1 = List.exists (fun s -> String.length s <= 3) strings_list_1
let has_short_word_2 = List.exists (fun s -> String.length s <= 3) strings_list_2
let () = 
  Printf.printf "Does first list have words of length 3 or less? %b\n" has_short_word_1;
  Printf.printf "Does second list have words of length 3 or less? %b\n" has_short_word_2

let numbers_list_1 = [1; 3; 4; 6; 7; 8]
let numbers_list_2 = [1; 3; 5; 7; 9]
let first_even_1 = List.find (fun x -> x mod 2 = 0) numbers_list_1
let () = Printf.printf "First even number in first list: %d\n" first_even_1
let () = 
  try
    let first_even_2 = List.find (fun x -> x mod 2 = 0) numbers_list_2 in
    Printf.printf "First even number in second list: %d\n" first_even_2
  with Not_found -> 
    Printf.printf "No even numbers found in second list\n"

let mixed_numbers_1 = [1; 2; 3; 4; 5; 6]
let mixed_numbers_2 = [-3; -2; -1; 0; 1; 2]
let evens_1 = List.filter (fun x -> x mod 2 = 0) mixed_numbers_1
let positives_2 = List.filter (fun x -> x > 0) mixed_numbers_2
let () = 
  Printf.printf "Even numbers from first list: ";
  List.iter (Printf.printf "%d ") evens_1;
  print_newline ();
  Printf.printf "Positive numbers from second list: ";
  List.iter (Printf.printf "%d ") positives_2;
  print_newline ()

let number_set_1 = [1; 2; 3; 4; 5; 6; 7; 8]
let number_set_2 = [10; 20; 30; 40; 50]
let (less_than_5_1, greater_equal_5_1) = List.partition (fun x -> x < 5) number_set_1
let (divisible_by_20_2, not_divisible_20_2) = List.partition (fun x -> x mod 20 = 0) number_set_2
let () =
  Printf.printf "First partition - Numbers less than 5: ";
  List.iter (Printf.printf "%d ") less_than_5_1;
  print_newline ();
  Printf.printf "First partition - Numbers greater than or equal to 5: ";
  List.iter (Printf.printf "%d ") greater_equal_5_1;
  print_newline ();
  Printf.printf "Second partition - Numbers divisible by 20: ";
  List.iter (Printf.printf "%d ") divisible_by_20_2;
  print_newline ();
  Printf.printf "Second partition - Numbers not divisible by 20: ";
  List.iter (Printf.printf "%d ") not_divisible_20_2;
  print_newline ()

let fold_numbers = [1; 2; 3; 4; 5]
let add element acc = element + acc
let sum_right = List.fold_right add fold_numbers 0
let sum_left = List.fold_left add 0 fold_numbers
let () =
  Printf.printf "Sum using fold_right: %d\n" sum_right;
  Printf.printf "Sum using fold_left: %d\n" sum_left

let strings_to_fold = ["Hello"; " "; "World"; "!"]
let concat element acc = element ^ acc
let concat_right = List.fold_right concat strings_to_fold ""
let concat_left = List.fold_left concat "" strings_to_fold
let () =
  Printf.printf "Concatenation using fold_right: %s\n" concat_right;
  Printf.printf "Concatenation using fold_left: %s\n" concat_left

let unsorted_nums = [5; 2; 8; 1; 9; 3]
let sorted_ascending = List.sort compare unsorted_nums
let sorted_descending = List.sort (fun a b -> compare b a) unsorted_nums
let () =
  Printf.printf "Sorted ascending: ";
  List.iter (Printf.printf "%d ") sorted_ascending;
  print_newline ();
  Printf.printf "Sorted descending: ";
  List.iter (Printf.printf "%d ") sorted_descending;
  print_newline ()

let assoc_list_1 = [("apple", 1); ("banana", 2); ("cherry", 3)]
let assoc_list_2 = [("dog", "woof"); ("cat", "meow"); ("cow", "moo")]
let apple_value = List.assoc "apple" assoc_list_1
let has_banana = List.mem_assoc "banana" assoc_list_1
let has_fish = List.mem_assoc "fish" assoc_list_2
let () =
  Printf.printf "Value associated with 'apple': %d\n" apple_value;
  Printf.printf "Does list contain 'banana'? %b\n" has_banana;
  Printf.printf "Does list contain 'fish'? %b\n" has_fish

let pairs_list = [(1, "one"); (2, "two"); (3, "three")]
let numbers, strings = List.split pairs_list
let () =
  Printf.printf "Split numbers: ";
  List.iter (Printf.printf "%d ") numbers;
  print_newline ();
  Printf.printf "Split strings: ";
  List.iter (Printf.printf "%s ") strings;
  print_newline ()

let nums_to_combine = [1; 2; 3]
let strings_to_combine = ["one"; "two"; "three"]
let combined = List.combine nums_to_combine strings_to_combine
let () =
  Printf.printf "Combined pairs:\n";
  List.iter (fun (n, s) -> Printf.printf "(%d, %s) " n s) combined;
  print_newline ()
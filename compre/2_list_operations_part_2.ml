(*
    OCaml Question: Variations of List Functions

    In this assignment, you will implement interesting variations of commonly used list functions in OCaml. 
    You are not allowed to use any built-in list functions like `List.map`, `List.filter`, `List.length`, etc. 
    Instead, you must write your own recursive implementations.

    **Functions to Implement:**
    1. `split_list`: Splits a list into two lists: one with elements at odd positions and another with elements at even positions.
       - Example: `[1; 2; 3; 4; 5]` becomes `([1; 3; 5], [2; 4])`.
    2. `rotate_list`: Rotates a list by N places to the left.
       - Example: Rotating `[1; 2; 3; 4; 5]` by 2 places gives `[3; 4; 5; 1; 2]`.
    3. `flatten_nested_list`: Flattens a nested list into a single list.
       - Example: `[[1; 2]; [3]; [4; 5; 6]]` becomes `[1; 2; 3; 4; 5; 6]`.
    4. `pairwise_sum`: Computes a list of sums of pairs of elements from two lists.
       - Example: Pairwise sum of `[1; 2; 3]` and `[4; 5; 6]` is `[5; 7; 9]`.

    **Specifications:**
    - Use recursion and pattern matching to implement each function.
    - Test all functions in the `main` function with sample inputs.

    Your task is to:
    - Complete the implementations for the specified functions.
    - Write a `main` function to demonstrate the functionality with test cases.

    **Provided Skeleton Code:**
*)

(*
    Function: split_list
    Description:
    - Splits a list into two lists: one with elements at odd positions and another with elements at even positions.
    Parameters:
    - `lst` : The input list.
    Returns:
    - A pair of lists `(odd_list, even_list)`.
*)
let rec split_list (lst: 'a list) : 'a list * 'a list =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: rotate_list
    Description:
    - Rotates a list by N places to the left.
    Parameters:
    - `lst` : The input list.
    - `n` : The number of places to rotate.
    Returns:
    - A new list rotated by N places.
    Example:
    - `rotate_list [1; 2; 3; 4; 5] 2` returns `[3; 4; 5; 1; 2]`.
*)
let rec rotate_list (lst: 'a list) (n: int) : 'a list =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: flatten_nested_list
    Description:
    - Flattens a nested list into a single list.
    Parameters:
    - `nested_lst` : A list of lists to flatten.
    Returns:
    - A single list containing all elements of the nested lists.
*)
let rec flatten_nested_list (nested_lst: 'a list list) : 'a list =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: pairwise_sum
    Description:
    - Computes a list of sums of pairs of elements from two lists.
    Parameters:
    - `lst1` : The first list.
    - `lst2` : The second list.
    Returns:
    - A list of pairwise sums.
    Example:
    - `pairwise_sum [1; 2; 3] [4; 5; 6]` returns `[5; 7; 9]`.
*)
let rec pairwise_sum (lst1: int list) (lst2: int list) : int list =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: main
    Description:
    - Demonstrates the use of all implemented functions with sample test cases.
    Parameters:
    - Unit
    Returns:
    - Unit
*)
let main () =
  let lst = [1; 2; 3; 4; 5] in
  let nested_lst = [[1; 2]; [3]; [4; 5; 6]] in
  let lst1 = [1; 2; 3] and lst2 = [4; 5; 6] in
  
  let odd_list, even_list = split_list lst in
  Printf.printf "Split list %s into:\n  Odd positions: %s\n  Even positions: %s\n"
    (String.concat "; " (List.map string_of_int lst))
    (String.concat "; " (List.map string_of_int odd_list))
    (String.concat "; " (List.map string_of_int even_list));

  Printf.printf "Rotate list %s by 2 places: %s\n"
    (String.concat "; " (List.map string_of_int lst))
    (String.concat "; " (List.map string_of_int (rotate_list lst 2)));

  Printf.printf "Flatten nested list %s: %s\n"
    (String.concat "; " (List.map (fun sublist -> "[" ^ String.concat "; " (List.map string_of_int sublist) ^ "]") nested_lst))
    (String.concat "; " (List.map string_of_int (flatten_nested_list nested_lst)));

  Printf.printf "Pairwise sum of %s and %s: %s\n"
    (String.concat "; " (List.map string_of_int lst1))
    (String.concat "; " (List.map string_of_int lst2))
    (String.concat "; " (List.map string_of_int (pairwise_sum lst1 lst2)))

(* Entry point *)
let () = main ()

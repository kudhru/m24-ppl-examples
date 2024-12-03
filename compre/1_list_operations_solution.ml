(*
    OCaml Question: Implementing and Extending List Functions

    In this assignment, you will implement various functions to manipulate lists in OCaml. 
    You are not allowed to use any built-in list functions like `List.length`, `List.map`, `List.filter`, etc. 
    Instead, you will write your own recursive implementations.

    Additionally, you will implement some interesting variations of common list functions.

    **Functions to Implement:**
    1. `list_length`: Calculate the length of a list.
    2. `list_reverse`: Reverse a list.
    3. `remove_every_nth`: Remove every Nth element from a list.
    4. `alternating_sum`: Compute the alternating sum of the elements in a list.
       - Example: For `[1; -2; 3; -4; 5]`, the result is `1 - (-2) + 3 - (-4) + 5 = 15`.

    **Specifications:**
    - Use recursion and pattern matching to implement each function.
    - Test all functions in the `main` function with sample inputs.

    Your task is to:
    - Complete the implementations for the specified functions.
    - Write a `main` function to demonstrate the functionality with test cases.

    **Provided Skeleton Code:**
*)

(*
    Function: list_length
    Description:
    - Calculates the length of a list.
    Parameters:
    - `lst` : The list whose length is to be calculated.
    Returns:
    - An integer representing the length of the list.
*)
let rec list_length (lst: 'a list) : int =
  match lst with
  | [] -> 0
  | _::tail -> 1 + list_length tail

(*
    Function: list_reverse
    Description:
    - Reverses a list.
    Parameters:
    - `lst` : The list to be reversed.
    Returns:
    - A new list containing the elements of the input list in reverse order.
*)
let rec list_append (lst1: 'a list) (lst2: 'a list) : 'a list =
  match lst1 with
  | [] -> lst2
  | head::tail -> head::(list_append tail lst2)

let rec list_reverse (lst: 'a list) : 'a list =
  match lst with
  | [] -> []
  | head::tail -> list_append (list_reverse tail) [head]

(*
    Function: remove_every_nth
    Description:
    - Removes every Nth element from a list.
    Parameters:
    - `lst` : The input list.
    - `n` : The index (1-based) of elements to be removed.
    Returns:
    - A new list with every Nth element removed.
    Example:
    - `remove_every_nth [1; 2; 3; 4; 5; 6] 2` returns `[1; 3; 5]`.
*)
let rec remove_every_nth_helper (lst: 'a list) (n: int) (count: int) : 'a list =
  match lst with
  | [] -> []
  | head::tail -> 
    if count = n then remove_every_nth_helper tail n 1
    else head::(remove_every_nth_helper tail n (count + 1))

let rec remove_every_nth (lst: 'a list) (n: int) : 'a list =
  remove_every_nth_helper lst n 1

(*
    Function: alternating_sum
    Description:
    - Computes the alternating sum of elements in a list.
    Parameters:
    - `lst` : The input list.
    Returns:
    - An integer representing the alternating sum.
    Example:
    - `alternating_sum [1; -2; 3; -4; 5]` returns `15`.
*)
let rec alternating_sum_helper (lst: int list) (sign: int) : int =
  match lst with
  | [] -> 0
  | head::tail -> head * sign + alternating_sum_helper tail (-sign)

let rec alternating_sum (lst: int list) : int =
  alternating_sum_helper lst 1

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
  let lst = [1; -2; 3; -4; 5; -6; 7; -8; 9; -10] in
  Printf.printf "Length of %s: %d\n" 
    (String.concat "; " (List.map string_of_int lst)) (list_length lst);
  Printf.printf "Reverse of %s: %s\n" 
    (String.concat "; " (List.map string_of_int lst))
    (String.concat "; " (List.map string_of_int (list_reverse lst)));
  Printf.printf "Remove every 4th from %s: %s\n" 
    (String.concat "; " (List.map string_of_int lst))
    (String.concat "; " (List.map string_of_int (remove_every_nth lst 4)));
  Printf.printf "Alternating sum of %s: %d\n" 
    (String.concat "; " (List.map string_of_int lst))
    (alternating_sum lst)

(* Entry point *)
let () = main ()
(*
    Medium-Level OCaml Question: Higher-Order Functions

    In this assignment, you will implement functions that either:
    1. Take other functions as input parameters.
    2. Return functions as their result.

    This will test your understanding of higher-order functions, a key concept in functional programming.

    **Functions to Implement:**
    1. `apply_n_times`: Applies a given function `f` to a value `x` exactly `n` times.
       - Example: `apply_n_times (fun x -> x * 2) 1 3` returns `8` (applies `x * 2` three times starting from 1).
    2. `compose`: Returns a function that is the composition of two functions `f` and `g`.
       - Example: If `f x = x + 1` and `g x = x * 2`, then `(compose f g) 3` should return `7` (`f(g(3))`).
    3. `make_multiplier`: Returns a function that multiplies its input by a fixed number.
       - Example: `make_multiplier 3` returns a function that, when called with `5`, returns `15`.
    4. `filter_with_function`: Filters a list based on a given boolean function.
       - Example: `filter_with_function (fun x -> x mod 2 = 0) [1; 2; 3; 4]` returns `[2; 4]`.

    **Specifications:**
    - Use recursion where applicable.
    - Test all functions in the `main` function with sample inputs.

    Your task is to:
    - Complete the implementations for the specified functions.
    - Write a `main` function to demonstrate the functionality with test cases.

    **Provided Skeleton Code:**
*)

(*
    Function: apply_n_times
    Description:
    - Applies a given function `f` to a value `x` exactly `n` times.
    Parameters:
    - `f` : A function to apply.
    - `x` : The initial value.
    - `n` : The number of times to apply `f`.
    Returns:
    - The result of applying `f` to `x` `n` times.
*)
let rec apply_n_times (f: 'a -> 'a) (x: 'a) (n: int) : 'a =
  if n = 0 then x else apply_n_times f (f x) (n - 1)

(*
    Function: compose
    Description:
    - Returns a function that is the composition of two functions `f` and `g`.
    Parameters:
    - `f` : The first function to apply.
    - `g` : The second function to apply.
    Returns:
    - A new function that applies `f` to the result of `g`.
*)
let compose (f: 'b -> 'c) (g: 'a -> 'b) : 'a -> 'c =
  fun x -> f (g x)

(*
    Function: make_multiplier
    Description:
    - Returns a function that multiplies its input by a fixed number.
    Parameters:
    - `n` : The multiplier.
    Returns:
    - A function that takes an integer and returns the product of the integer and `n`.
*)
let make_multiplier (n: int) : int -> int =
  fun x -> n * x

(*
    Function: filter_with_function
    Description:
    - Filters a list based on a given boolean function.
    Parameters:
    - `f` : A function that takes an element of the list and returns `true` or `false`.
    - `lst` : The list to filter.
    Returns:
    - A new list containing only elements for which `f` returns `true`.
*)
let rec filter_with_function (f: 'a -> bool) (lst: 'a list) : 'a list =
  match lst with
  | [] -> []
  | head::tail -> if f head then head::(filter_with_function f tail) else filter_with_function f tail

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
  (* apply_n_times test *)
  let result1 = apply_n_times (fun x -> x * 2) 1 3 in
  Printf.printf "Result of applying (x -> x * 2) 3 times to 1: %d\n" result1;

  (* compose test *)
  let composed = compose (fun x -> x + 1) (fun x -> x * 2) in
  Printf.printf "Result of composed function (x -> x + 1) and (x -> x * 2) applied to 3: %d\n" (composed 3);

  (* make_multiplier test *)
  let multiplier = make_multiplier 3 in
  Printf.printf "Result of multiplier function for 3 applied to 5: %d\n" (multiplier 5);

  (* filter_with_function test *)
  let filtered = filter_with_function (fun x -> x mod 2 = 0) [1; 2; 3; 4] in
  Printf.printf "Result of filtering even numbers from [1; 2; 3; 4]: %s\n"
    (String.concat "; " (List.map string_of_int filtered))

(* Entry point *)
let () = main ()

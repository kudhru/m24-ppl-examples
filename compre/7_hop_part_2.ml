(*
    Advanced-Level OCaml Question: Higher-Order Functions with Dynamic Function Composition

    In this assignment, you will implement advanced functions that:
    1. Take other functions as input parameters.
    2. Return functions as results.
    3. Dynamically compose and apply multiple functions in a list.

    Your goal is to implement functions that require you to combine recursion, higher-order functions, and function composition.

    **Functions to Implement:**
    1. `compose_all`: Composes a list of functions into a single function.
       - Example: If `f1 x = x + 1`, `f2 x = x * 2`, and `f3 x = x - 3`, then `compose_all [f1; f2; f3] 5` returns `(f1 (f2 (f3 5)))`.
    2. `pipeline`: Applies a list of functions sequentially to a given input.
       - Example: If `f1 x = x + 1`, `f2 x = x * 2`, and `f3 x = x - 3`, then `pipeline [f1; f2; f3] 5` returns `((f3 (f2 (f1 5))))`.
    3. `conditional_apply`: Returns a function that applies a given function only if a condition is met.
       - Example: `conditional_apply (fun x -> x mod 2 = 0) (fun x -> x * 2)` returns a function that doubles the input only if it is even.
    4. `partition_map`: Maps a list to two separate lists using two functions `f1` and `f2`, depending on a condition.
       - Example: If `f1 x = x + 1`, `f2 x = x * 2`, and the condition is `x > 5`, then `partition_map (fun x -> x > 5) f1 f2 [4; 6; 8]` returns `([7; 9], [8])`.

    **Specifications:**
    - Use recursion, higher-order functions, and function composition.
    - Test all functions in the `main` function with comprehensive test cases.

    Your task is to:
    - Complete the implementations for the specified functions.
    - Write a `main` function to demonstrate the functionality with test cases.

    **Provided Skeleton Code:**
*)

(*
    Function: compose_all
    Description:
    - Composes a list of functions into a single function.
    Parameters:
    - `fs` : A list of functions to compose.
    Returns:
    - A single function that represents the composition of all functions in `fs`.
    Example:
    - `compose_all [f1; f2; f3] x` is equivalent to `f1 (f2 (f3 x))`.
*)
let rec compose_all (fs: ('a -> 'a) list) : 'a -> 'a =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: pipeline
    Description:
    - Applies a list of functions sequentially to a given input.
    Parameters:
    - `fs` : A list of functions to apply.
    - `x` : The input value.
    Returns:
    - The result of applying all functions in `fs` sequentially to `x`.
    Example:
    - `pipeline [f1; f2; f3] x` is equivalent to `f3 (f2 (f1 x))`.
*)
let rec pipeline (fs: ('a -> 'a) list) (x: 'a) : 'a =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: conditional_apply
    Description:
    - Returns a function that applies a given function only if a condition is met.
    Parameters:
    - `cond` : A condition function that returns true or false.
    - `f` : A function to apply.
    Returns:
    - A function that applies `f` only if `cond` is true.
    Example:
    - `conditional_apply (fun x -> x mod 2 = 0) (fun x -> x * 2)` creates a function that doubles even numbers.
*)
let conditional_apply (cond: 'a -> bool) (f: 'a -> 'a) : 'a -> 'a =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: partition_map
    Description:
    - Maps a list to two separate lists using two functions, based on a condition.
    Parameters:
    - `cond` : A condition function that determines which mapping function to use.
    - `f1` : A function to apply if `cond` is true.
    - `f2` : A function to apply if `cond` is false.
    - `lst` : The list to map.
    Returns:
    - A pair of lists `(list1, list2)` where:
      - `list1` contains elements mapped by `f1`.
      - `list2` contains elements mapped by `f2`.
*)
let rec partition_map (cond: 'a -> bool) (f1: 'a -> 'b) (f2: 'a -> 'b) (lst: 'a list) : 'b list * 'b list =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: main
    Description:
    - Demonstrates the use of all implemented functions with comprehensive test cases.
    Parameters:
    - Unit
    Returns:
    - Unit
*)
let main () =
  (* compose_all test *)
  let f1 = fun x -> x + 1 in
  let f2 = fun x -> x * 2 in
  let f3 = fun x -> x - 3 in
  let composed = compose_all [f1; f2; f3] in
  Printf.printf "Result of compose_all [f1; f2; f3] applied to 5: %d\n" (composed 5);

  (* pipeline test *)
  let pipelined = pipeline [f1; f2; f3] 5 in
  Printf.printf "Result of pipeline [f1; f2; f3] applied to 5: %d\n" pipelined;

  (* conditional_apply test *)
  let conditional = conditional_apply (fun x -> x mod 2 = 0) (fun x -> x * 2) in
  Printf.printf "Result of conditional_apply for 4: %d\n" (conditional 4);
  Printf.printf "Result of conditional_apply for 5: %d\n" (conditional 5);

  (* partition_map test *)
  let cond = fun x -> x > 5 in
  let mapped1, mapped2 = partition_map cond (fun x -> x + 1) (fun x -> x * 2) [4; 6; 8] in
  Printf.printf "partition_map result:\n  True case: %s\n  False case: %s\n"
    (String.concat "; " (List.map string_of_int mapped1))
    (String.concat "; " (List.map string_of_int mapped2))

(* Entry point *)
let () = main ()

(*
    OCaml Question: Basic Calculator for Arithmetic Expressions

    You are tasked with implementing a basic calculator in OCaml that evaluates simple arithmetic expressions. 
    The calculator should handle the following types of expressions:
    - Addition
    - Subtraction
    - Multiplication
    - Division (integer division)

    The expressions are represented as a recursive variant type, and the calculator evaluates them using recursive functions and pattern matching.

    **Specifications:**
    - Define a recursive variant `expr` to represent arithmetic expressions.
    - Implement the following functions:
        1. `evaluate`:
            - Evaluates a given expression and returns the result as an integer.
        2. `to_string`:
            - Converts a given expression into a string representation.

    **Example:**
    - The expression `(3 + 5) * 2` is represented as:
      `Mul (Add (Num 3, Num 5), Num 2)`
    - The `evaluate` function should return `16`.
    - The `to_string` function should return the string `"((3 + 5) * 2)"`.

    Your task is to:
    - Complete the implementations for the `evaluate` and `to_string` functions.
    - Test your implementation in the `main` function with sample expressions.

    **Provided Types:**
*)

(* Recursive variant to represent arithmetic expressions *)
type expr =
  | Num of int
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr

(*
    Function: evaluate
    Description:
    - Evaluates the given arithmetic expression.
    Parameters:
    - `e` : An expression of type `expr`.
    Returns:
    - The result of evaluating the expression as an integer.
*)
let rec evaluate (e: expr) : int =
  match e with
  | Num n -> n
  | Add (e1, e2) -> evaluate e1 + evaluate e2
  | Sub (e1, e2) -> evaluate e1 - evaluate e2
  | Mul (e1, e2) -> evaluate e1 * evaluate e2
  | Div (e1, e2) -> evaluate e1 / evaluate e2

(*
    Function: to_string
    Description:
    - Converts the given arithmetic expression into a string representation.
    Parameters:
    - `e` : An expression of type `expr`.
    Returns:
    - A string representing the expression.
*)
let rec to_string (e: expr) : string =
  match e with
  | Num n -> string_of_int n
  | Add (e1, e2) -> "(" ^ to_string e1 ^ " + " ^ to_string e2 ^ ")"
  | Sub (e1, e2) -> "(" ^ to_string e1 ^ " - " ^ to_string e2 ^ ")"
  | Mul (e1, e2) -> "(" ^ to_string e1 ^ " * " ^ to_string e2 ^ ")"
  | Div (e1, e2) -> "(" ^ to_string e1 ^ " / " ^ to_string e2 ^ ")"

(*
    Function: main
    Description:
    - Demonstrates the use of `evaluate` and `to_string` functions with sample expressions.
    Parameters:
    - Unit
    Returns:
    - Unit
*)
let main () =
  let expr1 = Add (Num 3, Num 5) in
  let expr2 = Mul (expr1, Num 2) in
  let expr3 = Div (Sub (Num 10, Num 4), Num 2) in

  Printf.printf "Expression: %s\n" (to_string expr1);
  Printf.printf "Evaluates to: %d\n" (evaluate expr1);

  Printf.printf "Expression: %s\n" (to_string expr2);
  Printf.printf "Evaluates to: %d\n" (evaluate expr2);

  Printf.printf "Expression: %s\n" (to_string expr3);
  Printf.printf "Evaluates to: %d\n" (evaluate expr3)

(* Entry point *)
let () = main ()

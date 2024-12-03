(*
    OCaml Question: Family Tree Representation and Queries

    You are tasked with implementing a simple family tree system in OCaml. A family tree represents individuals and their relationships (parent-child). 
    Your goal is to:
    - Represent the family tree using a recursive variant.
    - Implement functions to:
        1. Find all descendants of a given person.
        2. Calculate the depth of the family tree.
        3. Generate a string representation of the family tree in a hierarchical format.

    **Specifications:**
    - Define a recursive variant `family_tree` to represent the family tree.
    - Implement the following functions:
        1. `find_descendants`:
            - Returns a list of all descendants of a given person in the tree.
        2. `tree_depth`:
            - Calculates the depth of the family tree.
        3. `to_string`:
            - Generates a string representation of the family tree.

    **Example:**
    - A family tree where:
      - "Alice" is the root with children "Bob" and "Carol".
      - "Bob" has a child "David".
      - "Carol" has children "Eve" and "Frank".
    - Should be represented as:
      `Node ("Alice", [Node ("Bob", [Leaf "David"]); Node ("Carol", [Leaf "Eve"; Leaf "Frank"])])`
    - The `find_descendants` function should return:
        - For "Alice": `["Bob"; "David"; "Carol"; "Eve"; "Frank"]`
        - For "Bob": `["David"]`
    - The `tree_depth` function should return `3`.
    - The `to_string` function should return:
      ```
      Alice
        Bob
          David
        Carol
          Eve
          Frank
      ```

    Your task is to:
    - Complete the implementations for the `find_descendants`, `tree_depth`, and `to_string` functions.
    - Test your implementation in the `main` function with a sample family tree.

    **Provided Types:**
*)

(* Recursive variant to represent the family tree *)
type family_tree =
  | Leaf of string
  | Node of string * family_tree list

(*
    Function: find_descendants
    Description:
    - Finds all descendants of the given person in the family tree.
    Parameters:
    - `tree` : The family tree to search in.
    - `person` : The person whose descendants are to be found.
    Returns:
    - A list of strings representing the descendants of the given person.
*)
let rec find_descendants (tree: family_tree) (person: string) : string list =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: tree_depth
    Description:
    - Calculates the depth of the family tree.
    Parameters:
    - `tree` : The family tree whose depth is to be calculated.
    Returns:
    - An integer representing the depth of the family tree.
*)
let rec tree_depth (tree: family_tree) : int =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: to_string
    Description:
    - Generates a hierarchical string representation of the family tree.
    Parameters:
    - `tree` : The family tree to represent.
    - `indent` : The level of indentation for the current person.
    Returns:
    - A string representing the family tree.
*)
let rec to_string (tree: family_tree) (indent: int) : string =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: main
    Description:
    - Demonstrates the use of `find_descendants`, `tree_depth`, and `to_string` functions with a sample family tree.
    Parameters:
    - Unit
    Returns:
    - Unit
*)
let main () =
  let tree = 
    Node ("Alice", [
      Node ("Bob", [Leaf "David"]);
      Node ("Carol", [Leaf "Eve"; Leaf "Frank"])
    ])
  in

  Printf.printf "Family tree depth: %d\n" (tree_depth tree);
  Printf.printf "Descendants of Alice: %s\n"
    (String.concat ", " (find_descendants tree "Alice"));
  Printf.printf "Descendants of Bob: %s\n"
    (String.concat ", " (find_descendants tree "Bob"));
  Printf.printf "Family tree structure:\n%s" (to_string tree 0)

(* Entry point *)
let () = main ()

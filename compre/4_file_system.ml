(*
    OCaml Question: Representing and Manipulating a File System

    You are tasked with implementing a simple representation of a file system using OCaml. The file system consists of:
    - Files, which are represented by their names and sizes.
    - Directories, which may contain files or other directories.

    Your goal is to:
    - Represent the file system using a recursive variant.
    - Implement functions to:
        1. Calculate the total size of a directory, including all files and subdirectories.
        2. Generate a string representation of the file system in a tree-like format.

    **Specifications:**
    - Define a recursive variant `fs` to represent the file system.
    - Implement the following functions:
        1. `total_size`:
            - Calculates the total size of a directory.
        2. `to_string`:
            - Generates a string representation of the file system.

    **Example:**
    - A directory containing:
      - A file named "file1.txt" with size 100.
      - A subdirectory containing:
        - A file named "file2.txt" with size 200.
      - Should be represented as:
        `Dir ("root", [File ("file1.txt", 100); Dir ("subdir", [File ("file2.txt", 200)])])`
    - The `total_size` function should return `300`.
    - The `to_string` function should return a tree-like format:
      ```
      root/
        file1.txt (100)
        subdir/
          file2.txt (200)
      ```

    Your task is to:
    - Complete the implementations for the `total_size` and `to_string` functions.
    - Test your implementation in the `main` function with sample file system structures.

    **Provided Types:**
*)

(* Recursive variant to represent the file system *)
type fs =
  | File of string * int
  | Dir of string * fs list

(*
    Function: total_size
    Description:
    - Calculates the total size of a directory, including all files and subdirectories.
    Parameters:
    - `fs` : The file system (or directory) to calculate the size of.
    Returns:
    - The total size as an integer.
*)
let rec total_size (fs: fs) : int =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: to_string
    Description:
    - Generates a tree-like string representation of the file system.
    Parameters:
    - `fs` : The file system (or directory) to represent.
    - `indent` : The level of indentation for the current directory.
    Returns:
    - A string representing the file system.
*)
let rec to_string (fs: fs) (indent: int) : string =
  (* Implementation goes here *)
  failwith "Not implemented"

(*
    Function: main
    Description:
    - Demonstrates the use of `total_size` and `to_string` functions with sample file system structures.
    Parameters:
    - Unit
    Returns:
    - Unit
*)
let main () =
  let fs = 
    Dir ("root", [
      File ("file1.txt", 100);
      Dir ("subdir", [
        File ("file2.txt", 200);
        File ("file3.txt", 300)
      ])
    ])
  in

  Printf.printf "Total size: %d\n" (total_size fs);
  Printf.printf "File system structure:\n%s" (to_string fs 0)

(* Entry point *)
let () = main ()

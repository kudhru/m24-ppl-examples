(* Function to check if a number is even *)
  let is_even n = n mod 2 = 0

(* Function to calculate the square of a number *)
let square n = n * n

(* Function to calculate the sum of squares of even numbers in a list *)
let sum_of_squares lst =
  lst
  |> List.filter is_even  (* Filter only even numbers *)
  |> List.map square      (* Map each number to its square *)
  |> List.fold_left ( + ) 0  (* Sum up all the squares *)

  let main () =
    (* Input list 1 *)
    let numbers1 = [1; 2; 3; 4; 5] in
    let result1 = sum_of_squares numbers1 in
    Printf.printf "The sum of squares of even numbers in [1; 2; 3; 4; 5] is: %d\n" result1;
  
    (* Input list 2 *)
    let numbers2 = [6; 7; 8; 9; 10] in
    let result2 = sum_of_squares numbers2 in
    Printf.printf "The sum of squares of even numbers in [6; 7; 8; 9; 10] is: %d\n" result2;
  
    (* Input list 3 *)
    let numbers3 = [11; 12; 13; 14; 15] in
    let result3 = sum_of_squares numbers3 in
    Printf.printf "The sum of squares of even numbers in [11; 12; 13; 14; 15] is: %d\n" result3
  
  (* Entry point *)
  let () = main ()
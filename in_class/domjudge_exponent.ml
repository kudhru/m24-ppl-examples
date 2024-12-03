(* Main function *)
let () =
  (* Read the number of test cases directly as an integer *)
  let test_cases = Scanf.scanf "%d " (fun x -> x) in
  for _ = 1 to test_cases do
    (* Read num1 and num2 *)
    let (num1, num2) = Scanf.scanf "%d %d " (fun a b -> (a, b)) in
    (* Initialize result for exponentiation *)
    let result = ref 1 in
    (* Perform exponentiation iteratively *)
    for _ = 1 to num2 do
      result := !result * num1;
    done;
    (* Print the result *)
    Printf.printf "%d\n" !result;
  done;
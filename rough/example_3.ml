let square_and_print arg =
  try
    let num = int_of_string arg in
    Printf.printf "%d\n" (num * num)
  with
  | Failure _ -> Printf.printf "Error: '%s' is not a valid integer.\n" arg

let () =
  (* Start from index 1 to skip the program name in Sys.argv *)
  for i = 1 to Array.length Sys.argv - 1 do
    square_and_print Sys.argv.(i)
  done
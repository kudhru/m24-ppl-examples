  let string_array = [|"Siddharth"; "Aditya"; "Anadi"; "Shreyas"; "Pratyush"; "Navya"|];;

  Array.sort compare string_array;;

  Printf.printf "after default sorting: ";
  Array.iter (fun x -> print_string x) string_array;
  Printf.printf "\n";;

  let compare_string_length a b =
    if (String.length a > String.length b)
      then -1
  else if (String.length a < String.length b)
    then 1
  else 0;;

  Array.sort compare_string_length string_array;;
  
  Printf.printf "after custom sorting: ";
  Array.iter (fun x -> print_string x) string_array;
  Printf.printf "\n";;
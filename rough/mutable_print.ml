let xyz = "Immutable";;
print_string xyz;;

let abc = ref "hello";;
print_string abc.contents;;
print_string !abc;;
Printf.printf "\n";;

abc.contents <- "World";;
print_string !abc;;
Printf.printf "\n";;
(* !abc;;
abc := "World";;
!abc *)

type record_mutable = {mutable record_field : int};;
let cd = {record_field=10};;
cd.record_field <- 20;;
print_int cd.record_field;;
Printf.printf "\n";;
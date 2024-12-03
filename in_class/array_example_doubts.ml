let a = ref 10;;
a := 20;;
Printf.printf "%d\n" !a;;



let arr0 = [| 2; 3; 4; 5; 6; 7; 8 |];;
let arr1 = Array.map (fun x -> x + 1) arr0;;
Array.iter (fun x -> Printf.printf "%d " x) arr0;;
Printf.printf "\n";;
Array.iter (fun x -> Printf.printf "%d " x) arr1;;
Printf.printf "\n";;

arr0.(5) <- 70;;
Array.iter (fun x -> Printf.printf "%d " x) arr0;;
Printf.printf "\n";;

let lst0 = [20; 30; 40; 50; 60; 70; 80 ];;
let lst1 = List.map (fun x -> x + 1) lst0;;
List.iter (fun x -> Printf.printf "%d " x) lst0;;
Printf.printf "\n";;
List.iter (fun x -> Printf.printf "%d " x) lst1;;
Printf.printf "\n";;



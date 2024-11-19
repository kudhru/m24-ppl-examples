
let rec append lst1 lst2 = 
  match lst1 with
  | [] -> lst2
  | hd::tl -> hd::(append tl lst2);;

let rec flatten_list_helper lst = 
  match lst with
  | [] -> []
  | hd::tl -> append hd (flatten_list_helper tl)
  
  let flatten_list lst = flatten_list_helper lst

let rec parse_list str index acc_list acc_char = 
  if str.[index] = '[' then 
      parse_list str (index+1) acc_list acc_char
  else if str.[index] = ';' then
      (String.of_seq (List.to_seq acc_char))::(parse_list str (index+1) acc_list [])
  else if str.[index] = ']' then
      (String.of_seq (List.to_seq acc_char))::acc_list
  else
      parse_list str (index+1) acc_list (List.append acc_char [str.[index]])


      let rec parse_master_helper str index stack_contents acc_list =
        if index >= (String.length str) then 
            acc_list
    (*     else if (str.[index] = '[' && index = 0) then
            parse_master_helper str (index+1) (stack_contents) acc_list *)
        else if (str.[index] = '[') then
            parse_master_helper str (index+1) (index::stack_contents) acc_list
    (*     else if (str.[index] = ']' && stack_contents = []) then
            (match stack_contents with
            | hd_index::tl -> parse_master_helper str (index+1) tl acc_list) *)
        else if (str.[index] = ']') then
            (match stack_contents with
            | hd_index::tl -> parse_master_helper str (index+1) tl ((parse_list str hd_index [] [])::acc_list))
        else
            parse_master_helper str (index+1) stack_contents acc_list
    
    let parse_master str = flatten_list (parse_master_helper str 0 [] [])


let double_level_lst = "[[1;4];[3;4;5];]";;

parse_master_helper double_level_lst 0 [] []
(* Quiz Questions on Recursive Variants, Pattern Matching, and Functions *)

(* Q1: What does this function return for the input [1;2;3]? *)
let rec sum_list lst = 
  match lst with
  | [] -> 0
  | x::xs -> x + sum_list xs

(* Q2: What is the type of this function? *)
let rec length lst = 
  match lst with
  | [] -> 0
  | _::xs -> 1 + length xs

(* Q3: What does this pattern matching expression return for color = Red? *)
type color = Red | Blue | Green
let color_to_string c = 
  match c with
  | Red -> "red"
  | Blue -> "blue"
  | Green -> "green"

(* Q4: What does this function return for tree = Node(Leaf, 5, Leaf)? *)
type 'a tree = 
  | Leaf 
  | Node of 'a tree * 'a * 'a tree

let rec tree_height t = 
  match t with
  | Leaf -> 0
  | Node(left, _, right) -> 1 + max (tree_height left) (tree_height right)

(* Q5: What does this function return for the input "hello"? *)
let rec string_length str = 
  if str = "" then 0
  else 1 + string_length (String.sub str 1 (String.length str - 1))

(* Q6: What is returned for lst = [1;2;3]? *)
let rec reverse lst = 
  match lst with
  | [] -> []
  | x::xs -> reverse xs @ [x]

(* Q7: What does this function return for n = 5? *)
let rec factorial n = 
  match n with
  | 0 -> 1
  | n -> n * factorial (n-1)

(* Q8: What is returned when calling count_evens [1;2;3;4;5;6]? *)
let rec count_evens lst = 
  match lst with
  | [] -> 0
  | x::xs -> (if x mod 2 = 0 then 1 else 0) + count_evens xs

(* Q9: What does this function return for lst = ["a";"b";"c"]? *)
let rec join_strings lst = 
  match lst with
  | [] -> ""
  | [x] -> x
  | x::xs -> x ^ "," ^ join_strings xs

(* Q10: What is returned for lst = [1;2;3;4;5] and n = 3? *)
let rec take n lst = 
  match n, lst with
  | 0, _ -> []
  | _, [] -> []
  | n, x::xs -> x :: take (n-1) xs

(* Advanced Quiz Questions *)

(* Q11: What does this function return for lst = [[1;2];[3];[4;5;6]]? *)
let rec flatten lst = 
  match lst with
  | [] -> []
  | x::xs -> x @ flatten xs

(* Q12: What is the type and result for tree = Node(Node(Leaf,1,Leaf), 2, Node(Leaf,3,Leaf))? *)
let rec tree_map f t = 
  match t with
  | Leaf -> Leaf
  | Node(l, v, r) -> Node(tree_map f l, f v, tree_map f r)

(* Q13: What does this return for expr = Add(Mul(Num 2, Num 3), Num 4)? *)
type expr = 
  | Num of int
  | Add of expr * expr
  | Mul of expr * expr
  | Neg of expr

let rec eval = function
  | Num n -> n
  | Add(e1, e2) -> eval e1 + eval e2
  | Mul(e1, e2) -> eval e1 * eval e2
  | Neg(e) -> -(eval e)

(* Q14: What does this return for lst = [1;2;2;3;3;3;4]? *)
let rec compress lst =
  match lst with
  | [] -> []
  | [x] -> [x]
  | x::y::rest -> 
      if x = y then compress (y::rest)
      else x :: compress (y::rest)

(* Q15: What's returned for input: partition (fun x -> x mod 2 = 0) [1;2;3;4;5;6]? *)
let rec partition p lst =
  match lst with
  | [] -> ([], [])
  | x::xs ->
      let (trues, falses) = partition p xs in
      if p x then (x::trues, falses)
      else (trues, x::falses)

(* Q16: What does this return for lst = [1;2;3] and n = 2? *)
let rec all_sublists_of_length n lst =
  if n = 0 then [[]]
  else match lst with
    | [] -> []
    | x::xs -> 
        let with_x = List.map (fun l -> x::l) (all_sublists_of_length (n-1) xs) in
        let without_x = all_sublists_of_length n xs in
        with_x @ without_x

(* Q17: What's the result for tree = Node(Node(Leaf,1,Leaf), 2, Node(Leaf,3,Leaf))? *)
let rec tree_fold f acc t =
  match t with
  | Leaf -> acc
  | Node(l, v, r) ->
      let acc' = tree_fold f acc l in
      let acc'' = f acc' v in
      tree_fold f acc'' r

(* Q18: What does this return for lst = ["cat";"dog";"bird"]? *)
type 'a option_tree = 
  | Empty
  | Node of 'a * 'a option_tree list

let rec make_trie lst =
  match lst with
  | [] -> Empty
  | str::rest ->
      let subtrie = make_trie rest in
      Node(str, [subtrie])

(* Q19: What's returned for input: group [1;1;2;2;2;3;4;4]? *)
let rec group lst =
  match lst with
  | [] -> []
  | x::xs ->
      let rec take_while p = function
        | [] -> [], []
        | y::ys when p y -> 
            let (matched, rest) = take_while p ys in
            (y::matched, rest)
        | ys -> [], ys in
      let (same, rest) = take_while (fun y -> y = x) (x::xs) in
      same :: group rest

(* Q20: What does this return for n = 3? *)
let rec generate_balanced_parens n =
  if n = 0 then [""]
  else
    let rec combine l r acc =
      match l, r with
      | [], _ | _, [] -> acc
      | x::xs, y::ys ->
          combine xs ys (acc @ [x ^ "(" ^ y ^ ")"]) in
    let smaller = generate_balanced_parens (n-1) in
    combine smaller smaller []

(* Answers:
   Q1: 6 (adds all numbers in the list)
   Q2: 'a list -> int (takes any type of list and returns an integer)
   Q3: "red" (converts the Red variant to a string)
   Q4: 1 (height of a simple tree with one root and two leaves)
   Q5: 5 (counts the characters in "hello")
   Q6: [3;2;1] (reverses the list)
   Q7: 120 (calculates 5!)
   Q8: 3 (counts even numbers in the list)
   Q9: "a,b,c" (joins strings with commas)
   Q10: [1;2;3] (takes first 3 elements from the list)
   Q11: [1;2;3;4;5;6] (flattens list of lists)
   Q12: ('a -> 'b) -> 'a tree -> 'b tree, transforms each value in the tree
   Q13: 10 (evaluates arithmetic expression: (2*3)+4)
   Q14: [1;2;3;4] (removes consecutive duplicates)
   Q15: ([2;4;6], [1;3;5]) (splits list into even and odd numbers)
   Q16: [[1;2];[1;3];[2;3]] (all possible sublists of length 2)
   Q17: 6 (when using (+) and 0 as parameters, sums all values)
   Q18: Creates a simple prefix tree from strings
   Q19: [[1;1];[2;2;2];[3];[4;4]] (groups consecutive equal elements)
   Q20: ["((()))"; "(()())"; "(())()"; "()(())"; "()()()"] (generates valid parentheses)
*)

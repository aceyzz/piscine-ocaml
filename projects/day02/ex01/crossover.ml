(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   crossover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/25 12:12:38 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/29 10:46:35 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let crossover list_a list_b =
  let rec contains element lst =
    match lst with
    | [] -> false
    | head :: tail ->
        if head = element then true
        else contains element tail
  in
  let rec build_result lst =
    match lst with
    | [] -> []
    | head :: tail ->
        if contains head list_b then head :: build_result tail
        else build_result tail
  in
  build_result list_a

(* main de test *)
let print_test list_a list_b list_result =
  let print_list lst =
    Printf.printf "[%s]\n" (String.concat "; " (List.map string_of_int lst))
  in
  Printf.printf "List A: ";
  print_list list_a;
  Printf.printf "List B: ";
  print_list list_b;
  Printf.printf "Result: ";
  print_list list_result;
  Printf.printf "\n"

let () =
  print_test [1; 2; 3; 4; 5] [4; 5; 6; 7; 8] (crossover [1; 2; 3; 4; 5] [4; 5; 6; 7; 8]);
  print_test [10; 20; 30] [40; 50; 60] (crossover [10; 20; 30] [40; 50; 60]);
  print_test [] [1; 2; 3] (crossover [] [1; 2; 3]);
  print_test [1; 2; 3] [] (crossover [1; 2; 3] []);
  print_test [42; 84] [42; 42; 42; 84; 84; 84] (crossover [42; 84] [42; 42; 42; 84; 84; 84]);
  print_test [1; 1; 2; 2] [1; 2] (crossover [1; 1; 2; 2] [1; 2])

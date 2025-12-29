(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   encode.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/25 11:25:38 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/29 10:46:33 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(*
  exemples :
    [a, a, a, b, c, c, a] devient [(3, a), (1, b), (2, c), (1, a)]
*)

let encode list =
  let rec count_repetitions value counter remaining_list =
    match remaining_list with
    | head :: tail when head = value -> count_repetitions value (counter + 1) tail
    | _ -> (counter, remaining_list)
  in
  let rec encode_remaining remaining_list =
    match remaining_list with
    | [] -> []
    | first_element :: rest_of_list ->
        let (number_of_times, rest_after_group) = count_repetitions first_element 1 rest_of_list
        in (number_of_times, first_element) :: encode_remaining rest_after_group
  in
  encode_remaining list

(* main de test *)
let print_encoded input =
  let print_list lst =
    Printf.printf "[%s]\n" (String.concat ", " lst)
  in
  let print_result lst =
    match lst with
    | [] -> print_string "()\n"
    | _ -> List.iter (fun (n, v) -> Printf.printf "(%d, %s) " n v) lst; print_newline ()
  in
  Printf.printf "Input:   \t"; print_list input;
  Printf.printf "Encoded: \t"; print_result (encode input);
  print_newline ()

let () =
  print_encoded ["a"; "a"; "a"; "b"; "c"; "c"; "a"];
  print_encoded [];
  print_encoded ["hello"; "hello"; "hello"; "42"; "42"; "world"];
  print_encoded ["single"];

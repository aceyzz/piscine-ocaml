(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sequence.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/25 12:12:44 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/25 13:38:12 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* suite de conway - "look-and-say" *)
let sequence n =
  let rec append left right =
    match left with
    | [] -> right
    | head :: tail -> head :: append tail right
  in

  let digit_to_string digit =
    match digit with
    | 0 -> "0" | 1 -> "1" | 2 -> "2" | 3 -> "3" | 4 -> "4" | 5 -> "5" | 6 -> "6" | 7 -> "7" | 8 -> "8" | 9 -> "9"
    | _ -> ""
  in

  let rec digits_to_string digits =
    match digits with
    | [] -> ""
    | d :: rest -> digit_to_string d ^ digits_to_string rest
  in

  let rec int_to_digits value =
    if value < 10 then [value]
    else append (int_to_digits (value / 10)) [value mod 10]
  in

  let rec count_run value count remaining =
    match remaining with
    | head :: tail ->
        if head = value then count_run value (count + 1) tail
        else (count, remaining)
    | [] -> (count, [])
  in

  let rec next_term digits =
    match digits with
    | [] -> []
    | head :: tail ->
        let (count, rest_after_run) = count_run head 1 tail in
        let count_digits = int_to_digits count in
        append (append count_digits [head]) (next_term rest_after_run)
  in

  let rec iterate current_digits step =
    if step = n then current_digits
    else iterate (next_term current_digits) (step + 1)
  in

  if n < 1 then ""
  else digits_to_string (iterate [1] 1)

(* main de test *)
let print_sequence_test n =
  Printf.printf "Test pour \'n = %d\' ->\t \"%s\"\n" n (sequence n)

let () =
  List.iter print_sequence_test [-1; 0; 1; 2; 3; 4; 5; 6; 7]

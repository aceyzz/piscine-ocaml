(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   gray.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/25 12:12:40 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/29 10:46:37 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let gray n =
  let rec power_of_two exponent =
    if exponent = 0 then 1 else 2 * power_of_two (exponent - 1)
  in

  let rec build_gray_string current_value remaining_bits =
    if remaining_bits = 0 then ""
    else
      let current_bit = current_value mod 2 in
      let shifted_bit = (current_value / 2) mod 2 in
      let gray_bit =
        if current_bit = shifted_bit then '0'
        else '1'
      in
      build_gray_string (current_value / 2) (remaining_bits - 1) ^ String.make 1 gray_bit
  in

  let rec print_gray_values current_index total_values =
    if current_index = total_values then print_newline ()
    else
      let gray_string = build_gray_string current_index n in
      print_string gray_string;
      if current_index + 1 <> total_values then print_char ' ';
      print_gray_values (current_index + 1) total_values
  in

  if n < 1 then
    begin
      print_endline "Error";
    end
  else
    print_gray_values 0 (power_of_two n)

(* main de test *)
let () =
    gray 1;
    gray 2;
    gray 3;
    gray 0;
    gray (-1)

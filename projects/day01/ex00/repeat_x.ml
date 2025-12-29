(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_x.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 09:52:32 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/29 17:34:30 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_x n =
  if n < 0 then "Error"
  else if n = 0 then ""
  else "x" ^ repeat_x (n - 1)

(* main de test *)
let () =
  print_string "Test with [-1]: "; print_endline (repeat_x (-1));
  print_string "Test with [0]: "; print_endline (repeat_x 0);
  print_string "Test with [1]: "; print_endline (repeat_x 1);
  print_string "Test with [2]: "; print_endline (repeat_x 2);
  print_string "Test with [5]: "; print_endline (repeat_x 5)

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   tak.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 10:47:33 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/23 11:02:48 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec tak x y z =
  if y < x then tak (tak (x - 1) y z) (tak (y - 1) z x) (tak (z - 1) x y)
  else z

(* main de test *)
let () =
  print_string "Test with [1, 2, 3]: "; print_int (tak 1 2 3); print_newline ();
  print_string "Test with [5, 23, 7]: "; print_int (tak 5 23 7); print_newline ();
  print_string "Test with [9, 1, 0]: "; print_int (tak 9 1 0); print_newline ();
  print_string "Test with [1, 1, 1]: "; print_int (tak 1 1 1); print_newline ();
  print_string "Test with [0, 42, 0]: "; print_int (tak 0 42 0); print_newline ();
  print_string "Test with [23498, 98734, 98776]: "; print_int (tak 23498 98734 98776); print_newline ();

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ackermann.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 10:31:36 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/23 10:42:25 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ackermann m n =
  if m < 0 || n < 0 then -1
  else if m = 0 then n + 1
  else if n = 0 then ackermann (m - 1) 1
  else ackermann (m - 1) (ackermann m (n - 1))

(* main de test *)
let () =
  print_endline "-- Tests simples --";
  print_string "Test with [-1, 7]: "; print_int (ackermann (-1) 7); print_newline ();
  print_string "Test with [0, 0]: "; print_int (ackermann 0 0); print_newline ();
  print_string "Test with [2, 3]: "; print_int (ackermann 2 3); print_newline ();
  
  print_endline "\n---- Test long ----";
  print_string "Test with [4, 1]: "; print_int (ackermann 4 1); print_newline ()

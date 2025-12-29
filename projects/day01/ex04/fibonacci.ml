(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   fibonacci.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 10:58:32 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/29 10:46:27 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let fibonacci n =
  let rec loop k a b =
    if k = 0 then a
    else loop (k - 1) b (a + b)
  in
  if n < 0 then -1
  else loop n 0 1

(* main de test *)
let () =
  print_string "Test with [-42]: "; print_int (fibonacci (-42)); print_newline ();
  print_string "Test with [1]: "; print_int (fibonacci 1); print_newline ();
  print_string "Test with [3]: "; print_int (fibonacci 3); print_newline ();
  print_string "Test with [6]: "; print_int (fibonacci 6); print_newline ()

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_string.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 09:52:32 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/29 10:06:16 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_string ?(str="x") n =
  if n < 0 then "Error"
  else if n = 0 then ""
  else str ^ repeat_string ~str:str (n - 1)

(* main de test *)
let () =
  print_string "Test with [-1]: "; print_endline (repeat_string (-1));
  print_string "Test with [0]: "; print_endline (repeat_string 0);
  print_string "Test with \"Toto\" and [1]: "; print_endline (repeat_string ~str:"Toto" 1);
  print_string "Test with [2]: "; print_endline (repeat_string 2);
  print_string "Test with \"a\" and [5]: "; print_endline (repeat_string ~str:"a" 5);
  print_string "Test with \"what\" and [3]: "; print_endline (repeat_string ~str:"what" 3)

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_power.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 09:33:59 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/23 09:37:04 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_power number power =
  if power = 0 then 1
  else number * ft_power number (power - 1)

(* main test *)
let main () =
  print_string "Test with [2, 4]: "; print_int (ft_power 2 4); print_endline " (must be 16)";
  print_string "Test with [3, 0]: "; print_int (ft_power 3 0); print_endline " (must be 1)";
  print_string "Test with [0, 5]: "; print_int (ft_power 0 5); print_endline " (must be 0)"

let () = main ()

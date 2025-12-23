(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_test_sign.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 09:28:39 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/23 09:30:15 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_test_sign number =
	if number >= 0 then
		print_endline "positive"
	else
		print_endline "negative"

(* main de test *)
let main () =
	print_string "Test with [42]: "; ft_test_sign 42;
	print_string "Test with [0]: "; ft_test_sign 0;
	print_string "Test with [-42]: "; ft_test_sign (-42)

let () = main ()

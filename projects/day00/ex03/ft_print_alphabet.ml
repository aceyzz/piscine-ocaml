(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_alphabet.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 09:36:17 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/23 09:37:55 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_alphabet () =
  let rec alphabet_loop letter =
    if letter <= 'z' then 
      begin
        print_char letter;
        alphabet_loop (char_of_int (int_of_char letter + 1))
      end
  in
  alphabet_loop 'a';
  print_char '\n'

(* main de test *)
let () = ft_print_alphabet ()

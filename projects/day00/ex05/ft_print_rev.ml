(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_rev.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 09:39:21 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/23 09:41:42 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_rev str =
  let rec loop i =
    if i >= 0 then
      begin
        print_char (String.get str i);
        loop (i - 1)
      end
  in
  loop (String.length str - 1);
  print_char '\n'

(* main de test *)
let main () =
  print_string "test with \'Hello world !\': "; ft_print_rev "Hello world !";
  print_string "test with \'\': "; ft_print_rev ""

let () = main ()

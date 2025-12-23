(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 09:38:30 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/23 09:38:43 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb () =
  let print_combo a b c =
    print_int a;
    print_int b;
    print_int c;
    if a = 7 && b = 8 && c = 9 then ()
    else
      print_string ", "
  in
  let rec loop_a a =
    if a <= 7 then
      loop_b a (a + 1)
  and loop_b a b =
    if b <= 8 then loop_c a b (b + 1)
    else loop_a (a + 1)
  and loop_c a b c =
    if c <= 9 then
      begin
        print_combo a b c;
        loop_c a b (c + 1)
      end
    else
      loop_b a (b + 1)
  in
  loop_a 0;
  print_string "\n"

(* main de test *)
let () = ft_print_comb ()

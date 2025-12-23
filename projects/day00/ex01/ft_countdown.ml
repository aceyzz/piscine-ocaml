(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_countdown.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/23 09:30:50 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/23 09:31:40 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_countdown number =
  if number <= 0 then
    begin
      print_int 0;
      print_char '\n'
    end
  else
    begin
      print_int number;
      print_char '\n';
      ft_countdown (number - 1)
    end

(* main de test *)
let main () =
  print_string "Countdown from 3:\n"; ft_countdown 3;
  print_string "Countdown from 0:\n"; ft_countdown 0;
  print_string "Countdown from -1:\n"; ft_countdown (-1)

let () = main ()

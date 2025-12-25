(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/25 16:45:59 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/25 17:01:35 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  print_endline "Test de Value.all:";
  List.iter (fun value ->
    Printf.printf "  toString: %s  |  toStringVerbose: %s  |  toInt: %d\n" 
      (Value.toString value) 
      (Value.toStringVerbose value) 
      (Value.toInt value)
  ) Value.all;

  print_endline "\nTest de next:";
  Printf.printf "  next T2: %s\n" (Value.toString (Value.next Value.T2));
  Printf.printf "  next Jack: %s\n" (Value.toString (Value.next Value.Jack));
  Printf.printf "  next King: %s\n" (Value.toString (Value.next Value.King));

  print_endline "\nTest de previous:";
  Printf.printf "  previous As: %s\n" (Value.toString (Value.previous Value.As));
  Printf.printf "  previous Queen: %s\n" (Value.toString (Value.previous Value.Queen));
  Printf.printf "  previous T3: %s\n" (Value.toString (Value.previous Value.T3));

  print_endline "\nTest des cas d'erreur:";
  (try
    let _ = Value.next Value.As in
    print_endline "  ERROR: next As devrait échouer"
  with Invalid_argument msg ->
    Printf.printf "  next As -> Invalid_argument: %s\n" msg);

  (try
    let _ = Value.previous Value.T2 in
    print_endline "  ERROR: previous T2 devrait échouer"
  with Invalid_argument msg ->
    Printf.printf "  previous T2 -> Invalid_argument: %s\n" msg)

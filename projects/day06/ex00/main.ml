(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 08:00:53 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 08:19:30 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  print_endline "## Test creation d'un people avec le nom John";
  let person1 = new People.people "John" in
  
  print_endline "\n## Test de la methode \'to_string\' du People John";
  Printf.printf "%s\n" person1#to_string;
  
  print_endline "\n## Test \'talk\' du People John";
  person1#talk;
  
  print_endline "\n## Test \'die\' du People John";
  person1#die;

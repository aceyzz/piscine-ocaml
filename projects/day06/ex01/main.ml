(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 08:00:53 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 08:37:53 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  print_endline "=== Création d'un People (sidekick) ===";
  let rose = new People.people "Rose Tyler" in
  
  print_endline "\n=== Création du Docteur ===";
  let doctor = new Doctor.doctor "cedmulle" 900 rose in
  
  print_endline "\n=== Test de la méthode \'to_string\' ===";
  Printf.printf "%s\n" doctor#to_string;
  
  print_endline "\n=== Test de la méthode \'talk\' ===";
  doctor#talk;
  
  print_endline "\n=== Test de la méthode \'use_sonic_screwdriver\' ===";
  doctor#use_sonic_screwdriver;
  
  print_endline "\n=== Test de la méthode \'travel_in_time 2000 2020\' ===";
  doctor#travel_in_time 2000 2020;
  Printf.printf "Après \'travel_in_time\' : %s\n" doctor#to_string;
  
  print_endline "\n=== Test de la méthode \'travel_in_time 2020 1960\' ===";
  doctor#travel_in_time 2020 1960;
  Printf.printf "Après \'travel_in_time\' : %s\n" doctor#to_string;
  
  print_endline "\n=== Test de la méthode \'regenerate\' (indirect) ===";
  Printf.printf "HP actuel: %d\n" doctor#get_hp;
  doctor#take_damage 80;
  doctor#take_damage 30;
  Printf.printf "HP final après régénération: %d\n" doctor#get_hp;

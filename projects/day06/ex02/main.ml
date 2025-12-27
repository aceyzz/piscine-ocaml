(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 08:00:53 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 09:20:02 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  Random.self_init ();
  
  print_endline "=== Création ===";
  let rose = new People.people "Rose Tyler" in
  let clara = new People.people "Clara Oswald" in
  let doctor = new Doctor.doctor "cedmulle" 900 rose in
  let dalek1 = new Dalek.dalek in
  let dalek2 = new Dalek.dalek in
  print_endline "";
  
  print_endline "=== Test \'dalek#to_string\' ===";
  Printf.printf "[dalek1] %s\n" dalek1#to_string;
  Printf.printf "[dalek2] %s\n" dalek2#to_string;
  
  print_endline "\n=== Test \'dalek#talk\' ===";
  print_string "[dalek1] "; dalek1#talk;
  print_string "[dalek2] "; dalek2#talk;
  print_string "[dalek1] "; dalek1#talk;
  print_string "[dalek2] "; dalek2#talk;
  
  print_endline "\n=== Début de la bataille! ===\n";

  print_endline "  Round 1: Le Docteur affronte le premier Dalek";
  print_string "[doctor] "; doctor#talk;
  print_string "[dalek1] "; dalek1#talk;
  print_string "[doctor] "; doctor#use_sonic_screwdriver;

  print_endline "\n  Round 2: Le premier Dalek attaque Clara";
  Printf.printf "[dalek1] Shield du Dalek avant attaque: %b\n" dalek1#get_shield;
  print_string "[dalek1] Le Dalek attaque Clara! (appel de \'exterminate clara\')\n";
  print_string "[clara] "; dalek1#exterminate clara;
  Printf.printf "[dalek1] Shield du Dalek après attaque: %b\n" dalek1#get_shield;

  print_endline "\n  Round 3: Le second Dalek entre en scène";
  print_string "[dalek2] "; dalek2#talk;
  Printf.printf "[dalek2] Shield du Dalek2 avant attaque: %b\n" dalek2#get_shield;
  print_string "[dalek2] Le Dalek2 attaque Rose! (appel de \'exterminate rose\') ";
  dalek2#exterminate rose;
  Printf.printf "[dalek2] Shield du Dalek2 après attaque: %b\n" dalek2#get_shield;

  print_endline "\n  Round 4: Le Docteur contre-attaque";
  print_string "[doctor] "; doctor#use_sonic_screwdriver;
  print_string "[doctor] "; print_endline "Le Docteur désactive le premier Dalek!";
  print_string "[dalek1] "; dalek1#die;

  print_endline "\n  Round 5: Le dernier Dalek fuit";
  print_string "[dalek2] "; dalek2#talk;
  print_string "[dalek2] "; dalek2#die;

  print_endline "\n=== Fin de la bataille ===";
  print_string "[doctor] "; doctor#talk;
  print_endline "Le Docteur a sauvé l'univers... une fois de plus!"

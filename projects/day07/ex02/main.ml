(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 09:47:24 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 10:54:15 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  let methane = new Alkane.methane in
  let ethane = new Alkane.ethane in
  let octane = new Alkane.octane in
  let propane = new Alkane.alkane 3 in
  let dodecane = new Alkane.alkane 12 in
  let methane2 = new Alkane.methane in
  
  print_endline "## Test 'to_string'";
  print_endline (methane#to_string);
  print_endline (ethane#to_string);
  print_endline (octane#to_string);
  print_endline (propane#to_string);
  print_endline (dodecane#to_string);
  
  print_endline "\n## Test des méthodes d'accès (#name et #formula)";
  Printf.printf "  [methane] name: %s\n" methane#name;
  Printf.printf "  [methane] formula: %s\n" methane#formula;
  Printf.printf "  [ethane] name: %s\n" ethane#name;
  Printf.printf "  [ethane] formula: %s\n" ethane#formula;
  Printf.printf "  [octane] name: %s\n" octane#name;
  Printf.printf "  [octane] formula: %s\n" octane#formula;
  Printf.printf "  [propane] name: %s\n" propane#name;
  Printf.printf "  [propane] formula: %s\n" propane#formula;
  Printf.printf "  [dodecane] name: %s\n" dodecane#name;
  Printf.printf "  [dodecane] formula: %s\n" dodecane#formula;
  
  print_endline "\n## Test 'equals'";
  Printf.printf "  methane equals methane2: %b (doit etre true)\n" (methane#equals methane2);
  Printf.printf "  methane equals ethane: %b (doit etre false)\n" (methane#equals ethane);
  Printf.printf "  octane equals octane: %b (doit etre true)\n" (octane#equals octane);
  
  print_endline "\n## Vérification formule CnH2n+2";
  Printf.printf "  [methane] n=1: formule attendue CH4, obtenue: %s\n" methane#formula;
  Printf.printf "  [ethane] n=2: formule attendue C2H6, obtenue: %s\n" ethane#formula;
  Printf.printf "  [propane] n=3: formule attendue C3H8, obtenue: %s\n" propane#formula;
  Printf.printf "  [octane] n=8: formule attendue C8H18, obtenue: %s\n" octane#formula;
  Printf.printf "  [dodecane] n=12: formule attendue C12H26, obtenue: %s\n" dodecane#formula;

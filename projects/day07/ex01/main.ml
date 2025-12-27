(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 09:47:24 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 10:54:11 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  let water = new Molecule.water in
  let co2 = new Molecule.carbon_dioxide in
  let h2 = new Molecule.dihydrogen in
  let o2 = new Molecule.dioxygen in
  let bromomethane = new Molecule.bromomethane in
  let water2 = new Molecule.water in
  let co2_2 = new Molecule.carbon_dioxide in
  let tnt = new Molecule.tnt in
  
  print_endline "## Test 'to_string'";
  print_endline (water#to_string);
  print_endline (co2#to_string);
  print_endline (h2#to_string);
  print_endline (o2#to_string);
  print_endline (bromomethane#to_string);
  print_endline (tnt#to_string);
  
  print_endline "\n## Test des méthodes d'accès";
  Printf.printf "  [water] name: %s\n" water#name;
  Printf.printf "  [water] formula: %s\n" water#formula;
  Printf.printf "  [co2] name: %s\n" co2#name;
  Printf.printf "  [co2] formula: %s\n" co2#formula;
  Printf.printf "  [h2] name: %s\n" h2#name;
  Printf.printf "  [h2] formula: %s\n" h2#formula;
  Printf.printf "  [o2] name: %s\n" o2#name;
  Printf.printf "  [o2] formula: %s\n" o2#formula;
  Printf.printf "  [bromomethane] name: %s\n" bromomethane#name;
  Printf.printf "  [bromomethane] formula: %s\n" bromomethane#formula;
  
  print_endline "\n## Test de 'equals'";
  Printf.printf "  water equals water2: %b (doit etre true)\n" (water#equals water2);
  Printf.printf "  water equals co2: %b (doit etre false)\n" (water#equals co2);
  Printf.printf "  co2 equals co2_2: %b (doit etre true)\n" (co2#equals co2_2);
  Printf.printf "  h2 equals o2: %b (doit etre false)\n" (h2#equals o2);
  
  print_endline "\n## Test de la notation de Hill (TNT: N3H5O6C7 doit devenir C7H5N3O6)";
  print_string "  "; print_endline (tnt#to_string);
  Printf.printf "  Formule attendue: C7H5N3O6, obtenue: %s\n" tnt#formula;

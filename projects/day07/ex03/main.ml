(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 09:47:24 by cedmulle          #+#    #+#             *)
(*   Updated: 2026/01/10 16:02:49 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  let water = new Molecule.water in
  let h2 = new Molecule.dihydrogen in
  let o2 = new Molecule.dioxygen in
  let methane = new Alkane.methane in
  let co2 = new Molecule.carbon_dioxide in
  
  let combustion_methane = new Reaction.simple_reaction [(methane, 1); (o2, 2)] [(co2, 1); (water, 2)] in
  let water_formation = new Reaction.simple_reaction [(h2, 2); (o2, 1)] [(water, 2)] in
  let unbalanced_reaction = new Reaction.simple_reaction [(h2, 1); (o2, 1)] [(water, 1)] in
  let combustion_methane2 = new Reaction.simple_reaction [(methane, 1); (o2, 2)] [(co2, 1); (water, 2)] in
  
  print_endline "## Test 'to_string'";
  print_endline ("  [combustion_methane] " ^ combustion_methane#to_string);
  print_endline ("  [water_formation] " ^ water_formation#to_string);
  print_endline ("  [unbalanced] " ^ unbalanced_reaction#to_string);
  
  print_endline "\n## Test 'get_start'";
  Printf.printf "  [combustion_methane] nombre de reactifs: %d\n" (List.length combustion_methane#get_start);
  List.iter (fun (mol, count) ->
    Printf.printf "    - %d x %s\n" count mol#name
  ) combustion_methane#get_start;
  
  print_endline "\n## Test 'get_result'";
  Printf.printf "  [combustion_methane] nombre de produits: %d\n" (List.length combustion_methane#get_result);
  List.iter (fun (mol, count) ->
    Printf.printf "    - %d x %s\n" count mol#name
  ) combustion_methane#get_result;
  
  print_endline "\n## Test 'is_balanced'";
  Printf.printf "  [combustion_methane] is_balanced: %b (doit etre true)\n" combustion_methane#is_balanced;
  Printf.printf "  [water_formation] is_balanced: %b (doit etre true)\n" water_formation#is_balanced;
  Printf.printf "  [unbalanced] is_balanced: %b (doit etre false)\n" unbalanced_reaction#is_balanced;
  
  print_endline "\n## Test 'equals'";
  Printf.printf "  [combustion_methane] equals [combustion_methane2]: %b (doit etre true)\n" (combustion_methane#equals combustion_methane2);
  Printf.printf "  [combustion_methane] equals [water_formation]: %b (doit etre false)\n" (combustion_methane#equals water_formation);
  
  print_endline "\n## Verification conservation des atomes";
  print_endline "  [combustion_methane] CH4 + 2 O2 -> CO2 + 2 H2O";
  print_endline "    Reactifs: C(1) H(4) O(4)";
  print_endline "    Produits: C(1) H(4) O(4)";
  Printf.printf "    Balanced: %b\n" combustion_methane#is_balanced;

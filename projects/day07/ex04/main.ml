(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 09:47:24 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 10:54:29 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  let methane = new Alkane.methane in
  let ethane = new Alkane.ethane in
  let octane = new Alkane.octane in
  
  let combustion1 = new Alkane_combustion.alkane_combustion [methane] in
  let combustion2 = new Alkane_combustion.alkane_combustion [ethane] in
  let combustion3 = new Alkane_combustion.alkane_combustion [octane] in
  let combustion_mixed = new Alkane_combustion.alkane_combustion [methane; ethane] in
  let combustion_duplicates = new Alkane_combustion.alkane_combustion [methane; methane; methane] in
  
  print_endline "## Test des combustions non équilibrées";
  print_endline ("  [combustion1] " ^ combustion1#to_string);
  Printf.printf "  is_balanced: %b (doit etre false)\n" combustion1#is_balanced;
  
  print_endline "\n## Test de la méthode 'balance'";
  let balanced1 = combustion1#balance in
  let balanced2 = combustion2#balance in
  let balanced3 = combustion3#balance in
  let balanced_mixed = combustion_mixed#balance in
  
  print_endline ("  [methane balanced] " ^ balanced1#to_string);
  Printf.printf "  is_balanced: %b (doit etre true)\n" balanced1#is_balanced;
  
  print_endline ("  [ethane balanced] " ^ balanced2#to_string);
  Printf.printf "  is_balanced: %b (doit etre true)\n" balanced2#is_balanced;
  
  print_endline ("  [octane balanced] " ^ balanced3#to_string);
  Printf.printf "  is_balanced: %b (doit etre true)\n" balanced3#is_balanced;
  
  print_endline ("  [mixed balanced] " ^ balanced_mixed#to_string);
  Printf.printf "  is_balanced: %b (doit etre true)\n" balanced_mixed#is_balanced;
  
  print_endline "\n## Test 'get_start' et 'get_result' (équilibrées)";
  print_endline "  [methane balanced] Reactifs:";
  List.iter (fun (mol, count) ->
    Printf.printf "    - %d x %s (%s)\n" count mol#name mol#formula
  ) balanced1#get_start;
  print_endline "  [methane balanced] Produits:";
  List.iter (fun (mol, count) ->
    Printf.printf "    - %d x %s (%s)\n" count mol#name mol#formula
  ) balanced1#get_result;
  
  print_endline "\n## Vérification des coefficients stœchiométriques";
  print_endline "  [methane] CH4 + 2 O2 -> CO2 + 2 H2O";
  print_endline ("  Obtenu: " ^ balanced1#to_string);
  
  print_endline "  [ethane] 2 C2H6 + 7 O2 -> 4 CO2 + 6 H2O";
  print_endline ("  Obtenu: " ^ balanced2#to_string);
  
  print_endline "\n## Test exception sur réaction non équilibrée";
  (try
    let _ = combustion1#get_start in
    print_endline "  ERROR: devrait lever une exception"
  with Failure msg ->
    Printf.printf "  OK: Exception levée: %s\n" msg);
  
  (try
    let _ = combustion1#get_result in
    print_endline "  ERROR: devrait lever une exception"
  with Failure msg ->
    Printf.printf "  OK: Exception levée: %s\n" msg);
  
  print_endline "\n## Test suppression de doublons";
  print_endline ("  [combustion_duplicates] avant balance: " ^ combustion_duplicates#to_string);
  let balanced_dup = combustion_duplicates#balance in
  print_endline ("  [combustion_duplicates] après balance: " ^ balanced_dup#to_string);
  print_endline "  Les 3 methanes doivent être traités comme 1 seul";
  Printf.printf "  is_balanced: %b (doit etre true)\n" balanced_dup#is_balanced;

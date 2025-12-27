(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 09:32:45 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 10:54:06 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  let h = new Atom.hydrogen in
  let c = new Atom.carbon in
  let o = new Atom.oxygen in
  let n = new Atom.nitrogen in
  let he = new Atom.helium in
  let fe = new Atom.iron in
  let h2 = new Atom.hydrogen in
  let c2 = new Atom.carbon in
  
  print_endline "## Test \'to_string\'";
  print_endline (h#to_string);
  print_endline (c#to_string);
  print_endline (o#to_string);
  print_endline (n#to_string);
  print_endline (he#to_string);
  print_endline (fe#to_string);
  
  print_endline "\n## Test des méthodes d'accès";
  Printf.printf "  [hydrogen] h#name: %s\n" h#name;
  Printf.printf "  [carbon] c#symbol: %s\n" c#symbol;
  Printf.printf "  [oxygen] o#atomic_number: %d\n" o#atomic_number;
  
  print_endline "\n## Test de \'equals\'";
  Printf.printf "  h equals h2: %b (doit etre true)\n" (h#equals h2);
  Printf.printf "  h equals c: %b (doit etre false)\n" (h#equals c);
  Printf.printf "  c equals c2: %b (doit etre true)\n" (c#equals c2);
  Printf.printf "  o equals n: %b (doit etre false)\n" (o#equals n);

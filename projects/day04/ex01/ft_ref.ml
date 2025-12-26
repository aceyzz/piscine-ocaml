(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_ref.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 08:47:37 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 09:26:39 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type 'a ft_ref = { mutable contents : 'a }
let return x = { contents = x }
let get r = r.contents
let set r x = r.contents <- x
let bind (r : 'a ft_ref) (f : 'a -> 'b ft_ref) : 'b ft_ref =
  f (get r)

(* main de test *)
let () =
  print_endline "Creation de x = 42";
  let x = return 42 in
  print_endline ("Valeur de x: " ^ string_of_int (get x));
  
  print_endline "Appel de \'set x 100\'";
  set x 100;
  print_endline ("Print valeur de x: " ^ string_of_int (get x));
  
  print_endline "\nCreation de y = \"Hello\"";
  let y = return "Hello" in
  print_endline ("Print de y: \"" ^ get y ^ "\"");
  
  print_endline "Appel de \'set y \"World\"\'";
  set y "World";
  print_endline ("Print valeur de y: \"" ^ get y ^ "\"");
  
  print_endline "\nCreation de z = 10 et test de bind avec double et triple";
  let z = return 10 in
  print_endline ("Valeur de z: " ^ string_of_int (get z));

  let z_double = bind z (fun v -> return (v * 2)) in
  print_endline ("Valeur apres double de z: " ^ string_of_int (get z_double));
  
  let z_triple = bind z (fun v -> return (v * 3)) in
  print_endline ("Valeur apres triple de z: " ^ string_of_int (get z_triple))

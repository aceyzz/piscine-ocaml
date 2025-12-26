(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   sum.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 08:48:18 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 10:10:03 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let sum a b = a +. b

(* main de test *)
let () =
  print_endline "Test avec \'sum 1.0 2.0\' - doit etre 3.0";
  print_endline ("sum 1.0 2.0 = " ^ string_of_float (sum 1.0 2.0));
  
  print_endline "\nTest avec \'sum 0.0 0.0\' - doit etre 0.0";
  print_endline ("sum 0.0 0.0 = " ^ string_of_float (sum 0.0 0.0));
  
  print_endline "\nTest avec \'sum (-5.5) 3.2\' - doit etre -2.3";
  print_endline ("sum (-5.5) 3.2 = " ^ string_of_float (sum (-5.5) 3.2));
  
  print_endline "\nTest avec \'sum 42.42 57.58\' - doit etre 100.0";
  print_endline ("sum 42.42 57.58 = " ^ string_of_float (sum 42.42 57.58));
  
  print_endline "\nTest avec \'sum (-10.0) (-20.0)\' - doit etre -30.0";
  print_endline ("sum (-10.0) (-20.0) = " ^ string_of_float (sum (-10.0) (-20.0)));
  
  print_endline "\nTest avec \'sum 0.1 0.2\' - doit etre 0.3";
  print_endline ("sum 0.1 0.2 = " ^ string_of_float (sum 0.1 0.2));
  
  print_endline "\nTest avec \'sum 999999.999 0.001\' - doit etre 1000000.0";
  print_endline ("sum 999999.999 0.001 = " ^ string_of_float (sum 999999.999 0.001));
  
  print_endline "\nTest avec \'sum infinity 1.0\' - doit etre inf";
  print_endline ("sum infinity 1.0 = " ^ string_of_float (sum infinity 1.0));
  
  print_endline "\nTest \'sum neg infinity 1.0\' - doit etre -inf";
  print_endline ("sum neg_infinity 1.0 = " ^ string_of_float (sum neg_infinity 1.0));
  
  print_endline "\nTest avec \'sum nan 1.0\' - doit etre nan";
  print_endline ("sum nan 1.0 = " ^ string_of_float (sum nan 1.0));

  print_endline "\nTest \'sum infinity neg_infinity\' - doit etre nan";
  print_endline ("sum infinity neg_infinity = " ^ string_of_float (sum infinity neg_infinity));

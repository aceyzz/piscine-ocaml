(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   atom.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 09:33:02 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 10:54:28 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(*
https://fr.wikipedia.org/wiki/Tableau_p%C3%A9riodique_des_%C3%A9l%C3%A9ments#Le_tableau_p%C3%A9riodique_standard
*)

class virtual atom (name_val : string) (symbol_val : string) (atomic_number_val : int) =
object
  method name = name_val
  method symbol = symbol_val
  method atomic_number = atomic_number_val
  
  method to_string =
    "Atom: " ^ name_val ^ " (Symbol: " ^ symbol_val ^ ", Atomic number: " ^ string_of_int atomic_number_val ^ ")"
  
  method equals (other : atom) =
    name_val = other#name && 
    symbol_val = other#symbol && 
    atomic_number_val = other#atomic_number
end

(* mandatory *)
class hydrogen =
object
  inherit atom "Hydrogen" "H" 1
end

class carbon =
object
  inherit atom "Carbon" "C" 6
end

class oxygen =
object
  inherit atom "Oxygen" "O" 8
end

(* mes ajouts *)
class nitrogen =
object
  inherit atom "Nitrogen" "N" 7
end

class helium =
object
  inherit atom "Helium" "He" 2
end

class iron =
object
  inherit atom "Iron" "Fe" 26
end

class bromine =
object
  inherit atom "Bromine" "Br" 35
end

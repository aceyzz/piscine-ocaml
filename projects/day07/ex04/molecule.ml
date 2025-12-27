(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   molecule.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 09:47:24 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 10:54:29 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* Notation de Hill: Carbone d'abord, Hydrogène ensuite, puis tous les autres éléments par ordre alphabétique. *)
class virtual molecule (name_val : string) (atoms_list : Atom.atom list) =
object (self)
  method name = name_val
  
  method formula =
    let count_atoms lst =
      let rec count acc = function
        | [] -> acc
        | h :: t ->
            let symbol = h#symbol in
            let exists = List.exists (fun (s, _) -> s = symbol) acc in
            if exists then
              count (List.map (fun (s, n) -> if s = symbol then (s, n + 1) else (s, n)) acc) t
            else
              count ((symbol, 1) :: acc) t
      in
      count [] lst
    in
    let atom_counts = count_atoms atoms_list in
    let c_count = List.filter (fun (s, _) -> s = "C") atom_counts in
    let h_count = List.filter (fun (s, _) -> s = "H") atom_counts in
    let others = List.filter (fun (s, _) -> s <> "C" && s <> "H") atom_counts in
    let sorted_others = List.sort (fun (s1, _) (s2, _) -> compare s1 s2) others in
    let format_element (symbol, count) =
      if count = 1 then symbol else symbol ^ string_of_int count
    in
    let formula_parts = List.map format_element (c_count @ h_count @ sorted_others) in
    String.concat "" formula_parts
  
  (* ajout pour reaction *)
  method get_atoms =
    let rec count acc = function
      | [] -> acc
      | h :: t ->
          let symbol = h#symbol in
          let rec update = function
            | [] -> [(symbol, 1)]
            | (s, n) :: rest ->
                if s = symbol then (s, n + 1) :: rest
                else (s, n) :: update rest
          in
          count (update acc) t
    in
    List.sort (fun (s1, _) (s2, _) -> compare s1 s2) (count [] atoms_list)
  
  method to_string =
    "Molecule: " ^ name_val ^ " (Formula: " ^ self#formula ^ ")"
  
  method equals (other : molecule) =
    name_val = other#name && self#formula = other#formula
end

(* mandatory *)
class water =
object
  inherit molecule "Water" [new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen]
end

class carbon_dioxide =
object
  inherit molecule "Carbon dioxide" [new Atom.carbon; new Atom.oxygen; new Atom.oxygen]
end

(* ajouts persos *)
class dihydrogen =
object
  inherit molecule "Dihydrogen" [new Atom.hydrogen; new Atom.hydrogen]
end

class dioxygen =
object
  inherit molecule "Dioxygen" [new Atom.oxygen; new Atom.oxygen]
end

class bromomethane =
object
  inherit molecule "Bromomethane" [new Atom.carbon; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.bromine]
end

(* exemple du sujet *)
class tnt =
object
  inherit molecule "TNT" [
    new Atom.carbon;
    new Atom.carbon;
    new Atom.carbon;
    new Atom.carbon;
    new Atom.carbon;
    new Atom.carbon;
    new Atom.carbon;
    new Atom.hydrogen;
    new Atom.hydrogen;
    new Atom.hydrogen;
    new Atom.hydrogen;
    new Atom.hydrogen;
    new Atom.nitrogen;
    new Atom.nitrogen;
    new Atom.nitrogen;
    new Atom.oxygen;
    new Atom.oxygen;
    new Atom.oxygen;
    new Atom.oxygen;
    new Atom.oxygen;
    new Atom.oxygen
  ]
end

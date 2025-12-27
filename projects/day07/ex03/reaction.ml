(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   reaction.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 10:20:00 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 10:54:23 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual reaction (start_molecules : (Molecule.molecule * int) list) (result_molecules : (Molecule.molecule * int) list) =
object (self)
  method get_start = start_molecules
  method get_result = result_molecules
  
  method is_balanced =
    let count_atoms molecule_list =
      let rec process acc = function
        | [] -> acc
        | (mol, count) :: t ->
            let mol_atoms = mol#get_atoms in
            let rec multiply_and_add acc_inner = function
              | [] -> acc_inner
              | (symbol, n) :: rest ->
                  let rec update = function
                    | [] -> [(symbol, n * count)]
                    | (s, total) :: r ->
                        if s = symbol then (s, total + n * count) :: r
                        else (s, total) :: update r
                  in
                  multiply_and_add (update acc_inner) rest
            in
            process (multiply_and_add acc mol_atoms) t
      in
      List.sort (fun (s1, _) (s2, _) -> compare s1 s2) (process [] molecule_list)
    in
    count_atoms start_molecules = count_atoms result_molecules
  
  method virtual balance : reaction
  
  method equals (other : reaction) =
    let compare_sides side1 side2 =
      let sorted1 = List.sort (fun (m1, _) (m2, _) -> compare m1#name m2#name) side1 in
      let sorted2 = List.sort (fun (m1, _) (m2, _) -> compare m1#name m2#name) side2 in
      let rec check = function
        | [], [] -> true
        | (mol1, cnt1) :: rest1, (mol2, cnt2) :: rest2 ->
            mol1#equals mol2 && cnt1 = cnt2 && check (rest1, rest2)
        | _ -> false
      in
      check (sorted1, sorted2)
    in
    compare_sides start_molecules other#get_start && compare_sides result_molecules other#get_result
  
  method to_string =
    let format_side molecules =
      let parts = List.map (fun (mol, count) ->
        if count = 1 then mol#formula
        else string_of_int count ^ " " ^ mol#formula
      ) molecules in
      String.concat " + " parts
    in
    format_side start_molecules ^ " -> " ^ format_side result_molecules
end

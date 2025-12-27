(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkane_combustion.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 10:40:09 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 10:54:26 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class alkane_combustion (alkanes : Alkane.alkane list) =
  let rec remove_dup acc = function
    | [] -> List.rev acc
    | h :: t ->
        if List.exists (fun a -> a#equals h) acc then remove_dup acc t
        else remove_dup (h :: acc) t
  in
  let unique_alkanes = remove_dup [] alkanes in
  let o2 = new Molecule.dioxygen in
  let co2 = new Molecule.carbon_dioxide in
  let h2o = new Molecule.water in
  let alkanes_mol = List.map (fun a -> ((a :> Molecule.molecule), 1)) unique_alkanes in
  let start = alkanes_mol @ [((o2 :> Molecule.molecule), 1)] in
  let result = [((co2 :> Molecule.molecule), 1); ((h2o :> Molecule.molecule), 1)] in
object (self)
  inherit Reaction.reaction start result
  
  method balance =
    let extract_n alkane =
      let formula = alkane#formula in
      let rec find idx =
        if idx >= String.length formula then 1
        else if formula.[idx] = 'C' then
          if idx + 1 < String.length formula && formula.[idx + 1] >= '0' && formula.[idx + 1] <= '9' then
            int_of_char formula.[idx + 1] - int_of_char '0'
          else 1
        else find (idx + 1)
      in find 0
    in
    
    let coeffs = List.map (fun alkane ->
      let n = extract_n alkane in
      let o2_num = 3 * n + 1 in
      if o2_num mod 2 = 0 then (alkane, 1, o2_num / 2, n, n + 1)
      else (alkane, 2, o2_num, 2 * n, 2 * (n + 1))
    ) unique_alkanes in
    
    let sum_o2 = List.fold_left (fun acc (_, _, o, _, _) -> acc + o) 0 coeffs in
    let sum_co2 = List.fold_left (fun acc (_, _, _, c, _) -> acc + c) 0 coeffs in
    let sum_h2o = List.fold_left (fun acc (_, _, _, _, h) -> acc + h) 0 coeffs in
    
    let alkanes_balanced = List.map (fun (a, coeff, _, _, _) -> ((a :> Molecule.molecule), coeff)) coeffs in
    let new_start = alkanes_balanced @ [((o2 :> Molecule.molecule), sum_o2)] in
    let new_result = [((co2 :> Molecule.molecule), sum_co2); ((h2o :> Molecule.molecule), sum_h2o)] in
    
    (object
      inherit Reaction.reaction new_start new_result
      method balance = (self :> Reaction.reaction)
    end :> Reaction.reaction)
  
  method get_start =
    if self#is_balanced then start
    else raise (Failure "Reaction is not balanced")
  
  method get_result =
    if self#is_balanced then result
    else raise (Failure "Reaction is not balanced")
end

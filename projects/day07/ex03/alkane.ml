(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   alkane.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 10:10:29 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 10:54:20 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* 
https://fr.wikipedia.org/wiki/Alcane#Typologie
formule: C[n] H[2n+2]
*)

class alkane n =
object
  inherit Molecule.molecule
    (match n with
     | 1 -> "Methane"
     | 2 -> "Ethane"
     | 3 -> "Propane"
     | 4 -> "Butane"
     | 5 -> "Pentane"
     | 6 -> "Hexane"
     | 7 -> "Heptane"
     | 8 -> "Octane"
     | 9 -> "Nonane"
     | 10 -> "Decane"
     | 11 -> "Undecane"
     | 12 -> "Dodecane"
     | _ -> "Unknown alkane")
    (let rec make_list count constructor =
       if count <= 0 then []
       else constructor :: make_list (count - 1) constructor
     in
     let carbons = make_list n (new Atom.carbon) in
     let hydrogens = make_list (2 * n + 2) (new Atom.hydrogen) in
     carbons @ hydrogens)
end

class methane =
object
  inherit alkane 1
end

class ethane =
object
  inherit alkane 2
end

class octane =
object
  inherit alkane 8
end

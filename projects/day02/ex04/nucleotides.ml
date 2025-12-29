(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   nucleotides.ml                                     :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/25 12:12:47 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/29 10:46:41 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type phosphate = string
type deoxyribose = string
type nucleobase = 
  | A
  | T
  | C
  | G
  | None

type nucleotide = {
  v_phosphate : phosphate;
  v_deoxyribose : deoxyribose;
  v_nucleobase : nucleobase;
}

let generate_nucleotide c =
  let base = 
    match c with
    | 'A' -> A
    | 'T' -> T
    | 'C' -> C
    | 'G' -> G
    | _   -> None
  in
  {
    v_phosphate = "phosphate";
    v_deoxyribose = "deoxyribose";
    v_nucleobase = base;
  }

(* main de test *)
let string_of_base = function
  | A -> "A"
  | T -> "T"
  | C -> "C"
  | G -> "G"
  | None -> "None"

let print_test c expected =
  let n = generate_nucleotide c in
  Printf.printf "Input: %c\nAttendu: %s\nObtenu: %s\n\n"
    c (string_of_base expected) (string_of_base n.v_nucleobase)

let () =
  List.iter2 print_test
    ['A'; 'T'; 'C'; 'G'; 'X']
    [A; T; C; G; None]

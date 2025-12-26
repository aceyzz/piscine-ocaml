(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex01.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 12:32:37 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 12:57:40 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module StringHashtbl = Hashtbl.Make(struct
type t = string
let equal = (=)
let hash s =
  (* fonction de hash utilisée : hashing par accumulation *)
    let rec aux i acc =
      if i < 0 then acc
      else aux (i - 1) (acc * 31 + Char.code (String.get s i)) 
    in
    (aux (String.length s - 1) 0) land max_int
end)

(* main donné *)
let () =
  let ht = StringHashtbl.create 5 in
  let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
  let pairs = List.map (fun s -> (s, String.length s)) values in
  List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
  StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   watchtower.ml                                      :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/28 09:24:54 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/28 11:49:45 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* donné par le sujet *)
module type WATCHTOWER = sig
  type hour = int
  val zero : hour
  val add : hour -> hour -> hour
  val sub : hour -> hour -> hour
end

module Watchtower : WATCHTOWER = struct
  type hour = int
  let zero = 12

  let add h1 h2 =
    let sum = (h1 + h2) mod 12 in
    if sum = 0 then zero
    else sum

  let sub h1 h2 =
    let diff = (h1 - h2) mod 12 in
    if diff <= 0 then diff + zero
    else diff
end

(* main de test *)
let () =
  (* mini testeur avec score *)
  let score = ref 0 in
  let total = ref 0 in
  let test_int result expected =
    total := !total + 1;
    if result = expected then score := !score + 1
    else Printf.printf "Échec: attendu %d, obtenu %d\n" expected result;
    result
  in

  print_endline "Test de zero:";
  Printf.printf "  zero = %d\n" Watchtower.zero;

  print_endline "\nTests de add:";
  Printf.printf "  add 3 4 \t= %d (attendu: 7)\n" (test_int (Watchtower.add 3 4) 7);
  Printf.printf "  add 8 5 \t= %d (attendu: 1)\n" (test_int (Watchtower.add 8 5) 1);
  Printf.printf "  add 11 1 \t= %d (attendu: 12)\n" (test_int (Watchtower.add 11 1) 12);
  Printf.printf "  add 10 11 \t= %d (attendu: 9)\n" (test_int (Watchtower.add 10 11) 9);
  Printf.printf "  add 0 7 \t= %d (attendu: 7)\n" (test_int (Watchtower.add 0 7) 7);
  Printf.printf "  add 0 0 \t= %d (attendu: 12)\n" (test_int (Watchtower.add 0 0) 12);

  print_endline "\nTests de sub:";
  Printf.printf "  sub 7 3 \t= %d (attendu: 4)\n" (test_int (Watchtower.sub 7 3) 4);
  Printf.printf "  sub 3 7 \t= %d (attendu: 8)\n" (test_int (Watchtower.sub 3 7) 8);
  Printf.printf "  sub 0 1 \t= %d (attendu: 11)\n" (test_int (Watchtower.sub 0 1) 11);
  Printf.printf "  sub 5 5 \t= %d (attendu: 12)\n" (test_int (Watchtower.sub 5 5) 12);
  Printf.printf "  sub 11 0 \t= %d (attendu: 11)\n" (test_int (Watchtower.sub 11 0) 11);
  Printf.printf "  sub 0 0 \t= %d (attendu: 12)\n" (test_int (Watchtower.sub 0 0) 12);

  print_endline "\nTests des propriétés du monoïde:";
  Printf.printf "  add zero 5 \t\t= %d (attendu: 5)\n" (test_int (Watchtower.add Watchtower.zero 5) 5);
  Printf.printf "  add 5 zero \t\t= %d (attendu: 5)\n" (test_int (Watchtower.add 5 Watchtower.zero) 5);
  Printf.printf "  add (add 3 4) 2 \t= %d (attendu: 9)\n" (test_int (Watchtower.add (Watchtower.add 3 4) 2) 9);
  Printf.printf "  add 3 (add 4 2) \t= %d (attendu: 9)\n" (test_int (Watchtower.add 3 (Watchtower.add 4 2)) 9);

  print_endline "\nTests d'inversion (add/sub):";
  let a = 8 in
  let b = 5 in
  let sum = Watchtower.add a b in
  Printf.printf "  add %d %d \t= %d (attendu: 1)\n" a b (test_int sum 1);
  Printf.printf "  sub %d %d \t= %d (attendu: 8)\n" sum b (test_int (Watchtower.sub sum b) 8);

  print_endline "\n-----------------------------------";
  Printf.printf "\nScore: %d/%d tests réussis\n" !score !total

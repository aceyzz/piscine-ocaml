(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   calc.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/28 10:23:52 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/28 13:33:40 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* donné par le sujet *)
module type MONOID = sig
  type element
  val zero1 : element
  val zero2 : element
  val mul : element -> element -> element
  val add : element -> element -> element
  val div : element -> element -> element
  val sub : element -> element -> element
end

module INT : MONOID with type element = int = struct
  type element = int
  let zero1 = 0
  let zero2 = 1
  let add = (+)
  let sub = (-)
  let mul = ( * )
  let div = (/)
end

module FLOAT : MONOID with type element = float = struct
  type element = float
  let zero1 = 0.0
  let zero2 = 1.0
  let add = (+.)
  let sub = (-.)
  let mul = ( *. )
  let div = ( /. )
end

(* donné par le sujet *)
module type CALC = 
  functor (M : MONOID) ->
    sig
      val add : M.element -> M.element -> M.element
      val sub : M.element -> M.element -> M.element
      val mul : M.element -> M.element -> M.element
      val div : M.element -> M.element -> M.element
      val power : M.element -> int -> M.element
      val fact : M.element -> M.element
    end

module Calc : CALC =
  functor (M : MONOID) -> struct
    let add = M.add
    let sub = M.sub
    let mul = M.mul
    let div = M.div

    let rec power x n =
      match n with
      | 0 -> M.zero2
      | 1 -> x
      | _ -> M.mul x (power x (n - 1))

    let rec fact (x:M.element) = match x with
            | n when n = M.zero1 || n = M.zero2 -> M.zero2
            | n                     -> M.mul n (fact (M.sub n M.zero2))
  end

(* donné par le sujet *)
module Calc_int = Calc(INT)
module Calc_float = Calc(FLOAT)

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
  let test_float result expected =
    total := !total + 1;
    if result = expected then score := !score + 1
    else Printf.printf "Échec: attendu %.6f, obtenu %.6f\n" expected result;
    result
  in

  print_endline "Tests INT:";
  Printf.printf "  zero1 = %d \t zero2 = %d\n" INT.zero1 INT.zero2;

  print_endline "\nTests Calc_int add:";
  Printf.printf "  add 40 2 \t\t= %d (attendu: 42)\n" (test_int (Calc_int.add 40 2) 42);
  Printf.printf "  add (add 5 3) 2 \t= %d (attendu: 10)\n" (test_int (Calc_int.add (Calc_int.add 5 3) 2) 10);
  Printf.printf "  add 5 (add 3 -50) \t= %d (attendu: -42)\n" (test_int (Calc_int.add 5 (Calc_int.add 3 (-50))) (-42));
  Printf.printf "  add 42 zero1 \t\t= %d (attendu: 42)\n" (test_int (Calc_int.add 42 INT.zero1) 42);

  print_endline "\nTests Calc_int sub:";
  Printf.printf "  sub 10 3 \t\t= %d (attendu: 7)\n" (test_int (Calc_int.sub 10 3) 7);
  Printf.printf "  sub (sub 20 5) 3 \t= %d (attendu: 12)\n" (test_int (Calc_int.sub (Calc_int.sub 20 5) 3) 12);
  Printf.printf "  sub 5 (sub 10 -42) \t= %d (attendu: -47)\n" (test_int (Calc_int.sub 5 (Calc_int.sub 10 (-42))) (-47));
  Printf.printf "  sub 42 zero1 \t\t= %d (attendu: 42)\n" (test_int (Calc_int.sub 42 INT.zero1) 42);

  print_endline "\nTests Calc_int mul:";
  Printf.printf "  mul 7 6 \t\t= %d (attendu: 42)\n" (test_int (Calc_int.mul 7 6) 42);
  Printf.printf "  mul (mul 3 4) 2 \t= %d (attendu: 24)\n" (test_int (Calc_int.mul (Calc_int.mul 3 4) 2) 24);
  Printf.printf "  mul 3 (mul 4 -4) \t= %d (attendu: -48)\n" (test_int (Calc_int.mul 3 (Calc_int.mul 4 (-4))) (-48));
  Printf.printf "  mul 42 zero2 \t\t= %d (attendu: 42)\n" (test_int (Calc_int.mul 42 INT.zero2) 42);

  print_endline "\nTests Calc_int div:";
  Printf.printf "  div 20 4 \t\t= %d (attendu: 5)\n" (test_int (Calc_int.div 20 4) 5);
  Printf.printf "  div (div 100 5) 2 \t= %d (attendu: 10)\n" (test_int (Calc_int.div (Calc_int.div 100 5) 2) 10);
  Printf.printf "  div 50 (div 42 -2) \t= %d (attendu: -2)\n" (test_int (Calc_int.div 50 (Calc_int.div 42 (-2))) (-2));
  Printf.printf "  div 42 zero2 \t\t= %d (attendu: 42)\n" (test_int (Calc_int.div 42 INT.zero2) 42);

  print_endline "\nTests Calc_int power:";
  Printf.printf "  power 3 3 \t\t= %d (attendu: 27)\n" (test_int (Calc_int.power 3 3) 27);
  Printf.printf "  power 2 (power 3 2) \t= %d (attendu: 512)\n" (test_int (Calc_int.power 2 (Calc_int.power 3 2)) 512);
  Printf.printf "  power (power 3 2) 2\t= %d (attendu: 81)\n" (test_int (Calc_int.power (Calc_int.power 3 2) 2) 81);
  Printf.printf "  power 5 0 \t\t= %d (attendu: 1)\n" (test_int (Calc_int.power 5 0) 1);
  Printf.printf "  power -2 5 \t\t= %d (attendu: -32)\n" (test_int (Calc_int.power (-2) 5) (-32));

  print_endline "\nTests Calc_int fact:";
  Printf.printf "  fact 5 \t= %d (attendu: 120)\n" (test_int (Calc_int.fact 5) 120);
  Printf.printf "  fact zero1 \t= %d (attendu: 1)\n" (test_int (Calc_int.fact INT.zero1) 1);
  Printf.printf "  fact zero2 \t= %d (attendu: 1)\n" (test_int (Calc_int.fact INT.zero2) 1);

  print_endline "\n-----------------------------------\n";

  print_endline "Tests FLOAT:";
  Printf.printf "  zero1 = %.1f \t zero2 = %.1f\n" FLOAT.zero1 FLOAT.zero2;

  print_endline "\nTests Calc_float add:";
  Printf.printf "  add 40.0 2.0 \t\t\t= %.1f (attendu: 42.0)\n" (test_float (Calc_float.add 40.0 2.0) 42.0);
  Printf.printf "  add (add 5.0 3.0) 2.0 \t= %.1f (attendu: 10.0)\n" (test_float (Calc_float.add (Calc_float.add 5.0 3.0) 2.0) 10.0);
  Printf.printf "  add 5.0 (add 3.0 (-50.0)) \t= %.1f (attendu: -42.0)\n" (test_float (Calc_float.add 5.0 (Calc_float.add 3.0 (-50.0))) (-42.0));
  Printf.printf "  add 42.0 zero1 \t\t= %.1f (attendu: 42.0)\n" (test_float (Calc_float.add 42.0 FLOAT.zero1) 42.0);

  print_endline "\nTests Calc_float sub:";
  Printf.printf "  sub 10.0 3.0 \t\t\t= %.1f (attendu: 7.0)\n" (test_float (Calc_float.sub 10.0 3.0) 7.0);
  Printf.printf "  sub (sub 20.0 5.0) 3.0 \t= %.1f (attendu: 12.0)\n" (test_float (Calc_float.sub (Calc_float.sub 20.0 5.0) 3.0) 12.0);
  Printf.printf "  sub 5.0 (sub 10.0 (-42.0)) \t= %.1f (attendu: -47.0)\n" (test_float (Calc_float.sub 5.0 (Calc_float.sub 10.0 (-42.0))) (-47.0));
  Printf.printf "  sub 42.0 zero1 \t\t= %.1f (attendu: 42.0)\n" (test_float (Calc_float.sub 42.0 FLOAT.zero1) 42.0);

  print_endline "\nTests Calc_float mul:";
  Printf.printf "  mul 7.0 6.0 \t\t\t= %.1f (attendu: 42.0)\n" (test_float (Calc_float.mul 7.0 6.0) 42.0);
  Printf.printf "  mul (mul 3.0 4.0) 2.0 \t= %.1f (attendu: 24.0)\n" (test_float (Calc_float.mul (Calc_float.mul 3.0 4.0) 2.0) 24.0);
  Printf.printf "  mul 3.0 (mul 4.0 (-4.0)) \t= %.1f (attendu: -48.0)\n" (test_float (Calc_float.mul 3.0 (Calc_float.mul 4.0 (-4.0))) (-48.0));
  Printf.printf "  mul 42.0 zero2 \t\t= %.1f (attendu: 42.0)\n" (test_float (Calc_float.mul 42.0 FLOAT.zero2) 42.0);

  print_endline "\nTests Calc_float div:";
  Printf.printf "  div 20.0 4.0 \t\t\t= %.1f (attendu: 5.0)\n" (test_float (Calc_float.div 20.0 4.0) 5.0);
  Printf.printf "  div (div 100.0 5.0) 2.0 \t= %.1f (attendu: 10.0)\n" (test_float (Calc_float.div (Calc_float.div 100.0 5.0) 2.0) 10.0);
  Printf.printf "  div 2.0 (div 100.0 5.0) \t= %.1f (attendu: 0.1)\n" (test_float (Calc_float.div 2.0 (Calc_float.div 100.0 5.0)) 0.1);
  Printf.printf "  div 42.0 zero2 \t\t= %.1f (attendu: 42.0)\n" (test_float (Calc_float.div 42.0 FLOAT.zero2) 42.0);

  print_endline "\nTests Calc_float power:";
  Printf.printf "  power 3.0 3 \t\t\t= %.1f (attendu: 27.0)\n" (test_float (Calc_float.power 3.0 3) 27.0);
  Printf.printf "  power 2.0 (power 3.0 2) \t= %.1f (attendu: 512.0)\n" (test_float (Calc_float.power 2.0 (int_of_float (Calc_float.power 3.0 2))) 512.0);
  Printf.printf "  power (power 3.0 2) 2\t\t= %.1f (attendu: 81.0)\n" (test_float (Calc_float.power (Calc_float.power 3.0 2) 2) 81.0);
  Printf.printf "  power 5.0 0 \t\t\t= %.1f (attendu: 1.0)\n" (test_float (Calc_float.power 5.0 0) 1.0);
  Printf.printf "  power (-2.0) 5 \t\t= %.1f (attendu: -32.0)\n" (test_float (Calc_float.power (-2.0) 5) (-32.0));

  print_endline "\nTests Calc_float fact:";
  Printf.printf "  fact 5.0 \t= %.1f (attendu: 120.0)\n" (test_float (Calc_float.fact 5.0) 120.0);
  Printf.printf "  fact zero1 \t= %.1f (attendu: 1.0)\n" (test_float (Calc_float.fact FLOAT.zero1) 1.0);
  Printf.printf "  fact zero2 \t= %.1f (attendu: 1.0)\n" (test_float (Calc_float.fact FLOAT.zero2) 1.0);

  print_endline "\n-----------------------------------";
  Printf.printf "\nScore: %d/%d tests réussis\n" !score !total
(* j'ai mal aux yeux *)

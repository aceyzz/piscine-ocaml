(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex03.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 12:33:24 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 13:14:24 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* donné par le sujet *)
module type FIXED = sig
  type t
  val of_float : float -> t
  val of_int : int -> t
  val to_float : t -> float
  val to_int : t -> int
  val to_string : t -> string
  val zero : t
  val one : t
  val succ : t -> t
  val pred : t -> t
  val min : t -> t -> t
  val max : t -> t -> t
  val gth : t -> t -> bool
  val lth : t -> t -> bool
  val gte : t -> t -> bool
  val lte : t -> t -> bool
  val eqp : t -> t -> bool (** physical equality *)
  val eqs : t -> t -> bool (** structural equality *)
  val add : t -> t -> t
  val sub : t -> t -> t
  val mul : t -> t -> t
  val div : t -> t -> t
  val foreach : t -> t -> (t -> unit) -> unit
end

(* mon implémentation *)
module type FRACTIONNAL_BITS = sig
  val bits : int
end

module type MAKE = functor (F : FRACTIONNAL_BITS) -> FIXED

module Make : MAKE = functor (F : FRACTIONNAL_BITS) -> struct
  type t = int  
  let scale = 1 lsl F.bits
  let scale_f = float_of_int scale
  let of_float f = int_of_float (f *. scale_f +. 0.5)
  let of_int i = i lsl F.bits
  let to_float x = float_of_int x /. scale_f
  let to_int x = x lsr F.bits
  let to_string x = string_of_float (to_float x)
  let zero = 0
  let one = scale
  let succ x = x + 1
  let pred x = x - 1
  let min a b = if a < b then a else b
  let max a b = if a > b then a else b
  let gth a b = a > b
  let lth a b = a < b
  let gte a b = a >= b
  let lte a b = a <= b
  let eqp a b = a == b
  let eqs a b = a = b
  let add a b = a + b
  let sub a b = a - b
  let mul a b = (a * b) / scale
  let div a b = (a * scale) / b
  let foreach start stop f =
    let rec loop current =
      if current > stop then ()
      else (f current; loop (succ current))
    in
    loop start
end

module Fixed4 : FIXED = Make (struct let bits = 4 end)
module Fixed8 : FIXED = Make (struct let bits = 8 end)

(* main de test *)
let () =
  print_endline "=== Test du sujet ===";
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);
  Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f));
  
  (* mes tests *)
  print_endline "\n=== Test additionnels ===";
  
  print_endline "\n--- Tests of_int / to_int ---";
  let x4 = Fixed4.of_int 5 in
  Printf.printf "Fixed4.of_int 5 -> to_int: %d\n" (Fixed4.to_int x4);
  
  print_endline "\n--- Tests zero / one ---";
  Printf.printf "Fixed4.zero: %s\n" (Fixed4.to_string Fixed4.zero);
  Printf.printf "Fixed4.one: %s\n" (Fixed4.to_string Fixed4.one);
  
  print_endline "\n--- Tests succ / pred ---";
  let a = Fixed4.of_float 1.5 in
  Printf.printf "1.5 -> succ: %s\n" (Fixed4.to_string (Fixed4.succ a));
  Printf.printf "1.5 -> pred: %s\n" (Fixed4.to_string (Fixed4.pred a));
  
  print_endline "\n--- Tests min / max ---";
  let x = Fixed4.of_float 2.5 in
  let y = Fixed4.of_float 3.7 in
  Printf.printf "min(2.5, 3.7): %s\n" (Fixed4.to_string (Fixed4.min x y));
  Printf.printf "max(2.5, 3.7): %s\n" (Fixed4.to_string (Fixed4.max x y));
  
  print_endline "\n--- Tests comparaisons ---";
  Printf.printf "2.5 > 3.7: %b\n" (Fixed4.gth x y);
  Printf.printf "2.5 < 3.7: %b\n" (Fixed4.lth x y);
  Printf.printf "2.5 >= 2.5: %b\n" (Fixed4.gte x x);
  Printf.printf "2.5 <= 2.5: %b\n" (Fixed4.lte x x);
  Printf.printf "2.5 == 2.5 (phys): %b\n" (Fixed4.eqp x x);
  Printf.printf "2.5 = 2.5 (struct): %b\n" (Fixed4.eqs x x);
  
  print_endline "\n--- Tests arithmétiques ---";
  let a = Fixed8.of_float 10.5 in
  let b = Fixed8.of_float 5.25 in
  Printf.printf "10.5 + 5.25 = %s\n" (Fixed8.to_string (Fixed8.add a b));
  Printf.printf "10.5 - 5.25 = %s\n" (Fixed8.to_string (Fixed8.sub a b));
  Printf.printf "10.5 * 5.25 = %s\n" (Fixed8.to_string (Fixed8.mul a b));
  Printf.printf "10.5 / 5.25 = %s\n" (Fixed8.to_string (Fixed8.div a b));

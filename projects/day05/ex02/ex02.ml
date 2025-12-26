(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ex02.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 12:32:35 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 13:03:41 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* donné par le sujet *)
module type PAIR = sig val pair : (int * int) end
module type VAL = sig val x : int end


module type MAKEPROJECTION = functor (P : PAIR) -> VAL

module MakeFst : MAKEPROJECTION = functor (P : PAIR) -> struct
  let x = fst P.pair
end

module MakeSnd : MAKEPROJECTION = functor (P : PAIR) -> struct
  let x = snd P.pair
end

(* donné par le sujet *)
module Pair : PAIR = struct let pair = ( 21, 42 ) end
module Fst : VAL = MakeFst (Pair)
module Snd : VAL = MakeSnd (Pair)

(* main du sujet *)
let () = Printf.printf "Fst.x = %d, Snd.x = %d\n" Fst.x Snd.x

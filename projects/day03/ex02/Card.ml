(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Card.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/25 16:26:03 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/25 17:21:16 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* COLOR de l'ex00 *)
module Color = struct
  type t = Spade | Heart | Diamond | Club

  let all = [Spade; Heart; Diamond; Club]

  let toString = function
    | Spade -> "S"
    | Heart -> "H"
    | Diamond -> "D"
    | Club -> "C"

  let toStringVerbose = function
    | Spade -> "Spade"
    | Heart -> "Heart"
    | Diamond -> "Diamond"
    | Club -> "Club"
end

(* VALUE de l'ex01 *)
module Value = struct
  type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

  let all = [T2; T3; T4; T5; T6; T7; T8; T9; T10; Jack; Queen; King; As]

  let toInt = function
    | T2 -> 1 | T3 -> 2 | T4 -> 3 | T5 -> 4 | T6 -> 5 | T7 -> 6 | T8 -> 7 | T9 -> 8 | T10 -> 9 | Jack -> 10 | Queen -> 11 | King -> 12 | As -> 13

  let toString = function
    | T2 -> "2" | T3 -> "3" | T4 -> "4" | T5 -> "5" | T6 -> "6" | T7 -> "7" | T8 -> "8" | T9 -> "9" | T10 -> "10" | Jack -> "J" | Queen -> "Q" | King -> "K" | As -> "A"

  let toStringVerbose = function
    | T2 -> "2" | T3 -> "3" | T4 -> "4" | T5 -> "5" | T6 -> "6" | T7 -> "7" | T8 -> "8" | T9 -> "9" | T10 -> "10" | Jack -> "Jack" | Queen -> "Queen" | King -> "King" | As -> "As"

  let next = function
    | T2 -> T3 | T3 -> T4 | T4 -> T5 | T5 -> T6 | T6 -> T7 | T7 -> T8 | T8 -> T9 | T9 -> T10 | T10 -> Jack | Jack -> Queen | Queen -> King | King -> As | As -> invalid_arg "Value.next - no possible next value with As."

  let previous = function
    | T2 -> invalid_arg "Value.previous - no possible previous value with T2." | T3 -> T2 | T4 -> T3 | T5 -> T4 | T6 -> T5 | T7 -> T6 | T8 -> T7 | T9 -> T8 | T10 -> T9 | Jack -> T10 | Queen -> Jack | King -> Queen | As -> King
end

(* CARD new *)
type t = {
  value: Value.t;
  color: Color.t
}

(* Constructor *)
let newCard value color = { value; color }

(* All cards *)
let allSpades = List.map (fun v -> newCard v Color.Spade) Value.all
let allHearts = List.map (fun v -> newCard v Color.Heart) Value.all
let allDiamonds = List.map (fun v -> newCard v Color.Diamond) Value.all
let allClubs = List.map (fun v -> newCard v Color.Club) Value.all
let all = allSpades @ allHearts @ allDiamonds @ allClubs

(* Getters *)
let getValue card = card.value
let getColor card = card.color

(* IO *)
let toString card = 
  Printf.sprintf "%s%s" (Value.toString card.value) (Color.toString card.color)
let toStringVerbose card = 
  Printf.sprintf "Card(%s, %s)" (Value.toStringVerbose card.value) (Color.toStringVerbose card.color)

(* Comparaisons *)
let compare c1 c2 =
  let v1 = Value.toInt c1.value in
  let v2 = Value.toInt c2.value in
  if v1 < v2 then -1
  else if v1 > v2 then 1
  else 0
let max c1 c2 =
  if compare c1 c2 >= 0 then c1 else c2
let min c1 c2 =
  if compare c1 c2 <= 0 then c1 else c2
let best = function
  | [] -> invalid_arg "Card.best: empty list"
  | h :: t -> List.fold_left max h t

(* Checks *)
let isOf card color = card.color = color
let isSpade card = card.color = Color.Spade
let isHeart card = card.color = Color.Heart
let isDiamond card = card.color = Color.Diamond
let isClub card = card.color = Color.Club

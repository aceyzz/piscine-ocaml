(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   dalek.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 08:02:08 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 09:10:57 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let generate_random_suffix () =
  let rand_char s = s.[Random.int (String.length s)] in
  let charsMaj = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" in
  let charsMin = "abcdefghijklmnopqrstuvwxyz" in
  let suffix =
    String.init 3 (fun i ->
      if i = 0 then rand_char charsMaj else rand_char charsMin
    )
  in
  suffix

class dalek =
  object (self)
    val _name = "Dalek" ^ generate_random_suffix ()
    val mutable _hp = 100
    val mutable _shield = true
    
    method to_string =
      Printf.sprintf "Name: %s, HP: %d, Shield: %b" _name _hp _shield
    
    method talk =
      let messages = [
        "Explain! Explain!";
        "Exterminate! Exterminate!";
        "I obey!";
        "You are the Doctor! You are the enemy of the Daleks!"
      ] in
      let index = Random.int (List.length messages) in
      Printf.printf "%s\n" (List.nth messages index)
    
    method exterminate (target : People.people) =
      _shield <- not _shield;
      target#die
    
    method die =
      Printf.printf "Emergency Temporal Shift!\n"
    
    (* getters *)
    method get_name = _name
    method get_hp = _hp
    method get_shield = _shield
    
    (* setters *)
    method set_hp new_hp =
      _hp <- new_hp
  end

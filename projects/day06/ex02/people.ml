(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   people.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 08:00:55 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 08:47:40 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class people (initial_name : string) =
  object (self)
    val _name = initial_name
    val mutable _hp = 100
    
    initializer
      Printf.printf "A new person named %s is born!\n" _name
    
    method to_string =
      Printf.sprintf "Name: %s, HP: %d" _name _hp
    
    method talk =
      Printf.printf "I'm %s! Do you know the Doctor?\n" _name
    
    method die =
      Printf.printf "Aaaarghh!\n"

    (* getters *)
    method get_name = _name
    method get_hp = _hp
  end

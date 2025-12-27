(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   doctor.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/27 08:01:50 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/27 09:01:17 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

class doctor (initial_name : string) (initial_age : int) (initial_sidekick : People.people) =
  object (self)
    val _name = initial_name
    val mutable _age = initial_age
    val _sidekick = initial_sidekick
    val mutable _hp = 100
    
    initializer
      Printf.printf "The Doctor %s has arrived! Ready to save the universe!\n" _name
    
    method to_string =
      Printf.sprintf "Name: %s, Age: %d, HP: %d, Sidekick: %s" _name _age _hp _sidekick#get_name
    
    method talk =
      Printf.printf "Hi! I'm the Doctor!\n"
    
    method travel_in_time (start : int) (arrival : int) =
      let time_diff = arrival - start in
      if _age + time_diff < 0 then
      Printf.printf "Impossible to travel in time: age cannot be negative!\n"
      else begin
      _age <- _age + time_diff;
      Printf.printf "_______(_@_)_______\n";
      Printf.printf "| POLICE      BOX |\n";
      Printf.printf "|_________________|\n";
      Printf.printf " | _____ | _____ |\n";
      Printf.printf " | |###| | |###| |\n";
      Printf.printf " | |###| | |###| |\n";
      Printf.printf " | _____ | _____ |\n";
      Printf.printf " | || || | || || |\n";
      Printf.printf " | ||_|| | ||_|| |\n";
      Printf.printf " | _____ |$_____ |\n";
      Printf.printf " | || || | || || |\n";
      Printf.printf " | ||_|| | ||_|| |\n";
      Printf.printf " | _____ | _____ |\n";
      Printf.printf " | || || | || || |\n";
      Printf.printf " | ||_|| | ||_|| |\n";
      Printf.printf " |       |       |\n";
      Printf.printf " *****************\n"
      end
    
    method use_sonic_screwdriver =
      Printf.printf "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii\n"
    
    method private regenerate =
      _hp <- 100

    (* getters *)
    method get_hp = _hp
    method get_name = _name
    method get_age = _age
    method get_sidekick = _sidekick
  end

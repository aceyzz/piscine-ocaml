(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/25 16:26:01 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/25 16:44:01 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  print_endline "Print de chaque elements de Color:";
  List.iter (fun color ->
    Printf.printf "  toString: \"%s\" | toStringVerbose: \"%s\"\n" (Color.toString color) (Color.toStringVerbose color)
  ) Color.all

(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   micronap.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 08:40:49 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 11:11:57 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let my_sleep () = Unix.sleep 1

let micronap n =
  for i = 0 to n - 1 do
    my_sleep ()
  done

(* main de test *)
let () =
  if Array.length Sys.argv >= 2 then
    try
      let n = int_of_string Sys.argv.(1) in
      micronap n;
    with
    | Failure _ -> ()

(* main avec verbose *)
(* 
let () =
  if Array.length Sys.argv >= 2 then
    try
      let n = int_of_string Sys.argv.(1) in
      print_endline ("Sleeping for " ^ string_of_int n ^ " seconds...");
      micronap n;
      print_endline "Done!"
    with
    | Failure _ -> print_endline "Please provide a valid integer."
  else
    print_endline "Usage: ./micronap <number_of_seconds>"
*)

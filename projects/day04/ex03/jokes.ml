(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 08:47:39 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 10:03:06 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let load_jokes filename =
  try
    let ic = open_in filename in
    let content = really_input_string ic (in_channel_length ic) in
    close_in ic;
    let jokes_list = String.split_on_char '\n' content in
    let filtered = List.filter (fun s -> String.length (String.trim s) > 0) jokes_list in
    let trimmed = List.map String.trim filtered in
    Array.of_list trimmed
  with
  | Sys_error msg ->
      print_endline ("Error: " ^ msg);
      exit 1
  | _ ->
      print_endline "Error: Unable to read file";
      exit 1

(* main de test *)
let () =
  if Array.length Sys.argv < 2 then
    begin
      print_endline "Usage: ./jokes <jokes_file>";
      exit 1
    end
  else
    begin
      Random.self_init ();
      let jokes = load_jokes Sys.argv.(1) in
      if Array.length jokes = 0 then begin
        print_endline "Error: No jokes found in file";
        exit 1
    end;
    let index = Random.int (Array.length jokes) in
    print_endline jokes.(index)
  end

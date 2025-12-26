(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   exmaples_of_file.ml                                :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 08:48:14 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 11:05:18 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let parse_csv line =
  let parts = String.split_on_char ',' line in
  let rec split_last lst =
    match lst with
    | [] -> ([], "")
    | [x] -> ([], x)
    | h :: t ->
        let (rest, last) = split_last t in
        (h :: rest, last)
  in
  let (float_strs, class_str) = split_last parts in
  let floats = List.map float_of_string float_strs in
  (Array.of_list floats, class_str)

let examples_of_file filename =
  let ic = open_in filename in
  let content = really_input_string ic (in_channel_length ic) in
  close_in ic;
  let lines = String.split_on_char '\n' content in
  let non_empty = List.filter (fun s -> String.length (String.trim s) > 0) lines in
  List.map parse_csv non_empty

(* main de test *)
let () =
  if Array.length Sys.argv < 2 then begin
    print_endline "Usage: ./examples_of_file <csv_file>";
    exit 1
  end;

  let examples =
    try
      examples_of_file Sys.argv.(1)
    with
    | Sys_error msg -> Printf.eprintf "File error: %s\n" msg; exit 1
    | Failure msg -> Printf.eprintf "Parse error: %s\n" msg; exit 1
    | _ -> Printf.eprintf "Unknown error while parsing file.\n"; exit 1
  in

  print_endline ("Nombre d'exemples: " ^ string_of_int (List.length examples));
  print_endline "\nPremiers 3 exemples:";

  (* test 3 premiers *)
  let first_three = List.filteri (fun i _ -> i < 3) examples in
  List.iter (fun (features, class_label) ->
    print_string "  [";
    for i = 0 to min 3 (Array.length features - 1) do
      print_string (string_of_float features.(i));
      if i < min 3 (Array.length features - 1) then print_string "; "
    done;
    if Array.length features > 4 then print_string "; ...";
    print_endline ("] -> \"" ^ class_label ^ "\"")
  ) first_three;

  (* test full *)
  print_endline "\nUn exemple complet:";
  let (full_features, full_class) = List.hd examples in
  print_string "  Features: [";
  for i = 0 to Array.length full_features - 1 do
    print_string (string_of_float full_features.(i));
    if i < Array.length full_features - 1 then print_string "; ";
    if (i + 1) mod 6 = 0 && i < Array.length full_features - 1 then print_string "\n             "
  done;
  print_endline "]";
  print_endline ("  Classe: \"" ^ full_class ^ "\"")

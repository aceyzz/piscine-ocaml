(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   eu_dist.ml                                         :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 08:48:16 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 10:43:19 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let eu_dist a b =
  let sqrt x = x ** 0.5 in
  let sum = ref 0.0 in
  for i = 0 to Array.length a - 1 do
    let diff = a.(i) -. b.(i) in
    sum := !sum +. (diff *. diff)
  done;
  sqrt !sum

(* main de test *)
let () =
  print_endline "## Test tableau 1 dimension:";
  let p1a = [|0.0|] in
  let p1b = [|10.0|] in
  print_string ("  Distance entre [0.0] et [10.0]: " ^ string_of_float (eu_dist p1a p1b));
  print_endline " | (Expected: 10.0)";

  let p1c = [|42.0|] in
  let p1d = [|-21.0|] in
  print_string ("  Distance entre [42.0] et [-21.0]: " ^ string_of_float (eu_dist p1c p1d));
  print_endline " | (Expected: 63.0)";

  print_endline "\n## Test tableau 2 dimensions:";
  let p2a = [|0.0; 0.0|] in
  let p2b = [|3.0; 4.0|] in
  print_string ("  Distance entre [0.0; 0.0] et [3.0; 4.0]: " ^ string_of_float (eu_dist p2a p2b));
  print_endline " | (Expected: 5.0)";

  let p2c = [|-1.0; -1.0|] in
  let p2d = [|1.0; 1.0|] in
  print_string ("  Distance entre [-1.0; -1.0] et [1.0; 1.0]: " ^ string_of_float (eu_dist p2c p2d));
  print_endline " | (Expected: 2.828...)";
  
  print_endline "\n## Test tableau 3 dimensions:";
  let p3a = [|0.0; 0.0; 0.0|] in
  let p3b = [|1.0; 1.0; 1.0|] in
  print_string ("  Distance entre [0.0; 0.0; 0.0] et [1.0; 1.0; 1.0]: " ^ string_of_float (eu_dist p3a p3b));
  print_endline " | (Expected: 1.732...)";

  let p3c = [|1.0; 2.0; 3.0|] in
  let p3d = [|1.0; 2.0; 3.0|] in
  print_string ("  Distance entre [1.0; 2.0; 3.0] et [1.0; 2.0; 3.0]: " ^ string_of_float (eu_dist p3c p3d));
  print_endline " | (Expected: 0.0)";
  
  print_endline "\n## Test tableau 4 dimensions:";
  let p4a = [|1.5; 2.5; 3.5; 4.5|] in
  let p4b = [|5.5; 6.5; 7.5; 8.5|] in
  print_string ("  Distance entre [1.5; 2.5; 3.5; 4.5] et [5.5; 6.5; 7.5; 8.5]: " ^ string_of_float (eu_dist p4a p4b));
  print_endline " | (Expected: 8.0)";

  let p4c = [|-42.0; -4.0; -2.0; 42.0|] in
  let p4d = [|1.0; 1.0; 1.0; 1.0|] in
  print_string ("  Distance entre [-42.0; -4.0; -2.0; 42.0] et [1.0; 1.0; 1.0; 1.0]: " ^ string_of_float (eu_dist p4c p4d));
  print_endline " | (Expected: 59.699...)";
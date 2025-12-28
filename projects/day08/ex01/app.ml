(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   app.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/28 09:54:38 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/28 13:03:04 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* donné par le sujet *)
module type APP = sig
  type project = string * string * int
  val zero : project
  val combine : project -> project -> project
  val fail : project -> project
  val success : project -> project
end

module App : APP = struct
  type project = string * string * int

  let zero = ("", "", 0)

  let combine (name1, _, grade1) (name2, _, grade2) =
    let new_name = name1 ^ name2 in
    let avg_grade = (grade1 + grade2) / 2 in
    let status = if avg_grade >= 80 then "succeed" else "failed" in
    (new_name, status, avg_grade)

  let fail (name, _, _) = (name, "failed", 0)

  let success (name, _, _) = (name, "succeed", 80)
end

(* main de test *)
let () =
  let print_proj (name, status, grade) =
    Printf.printf "(\"%s\", \"%s\", %d)\n" name status grade
  in

  print_endline "Test de zero:";
  print_string "  "; print_proj App.zero;

  print_endline "\nTests de combine:";
  Printf.printf "  combine (\"A\", \"succeed\", 90) (\"B\", \"succeed\", 85)\t= ";
    print_proj (App.combine ("A", "succeed", 90) ("B", "succeed", 85));
  Printf.printf "  combine (\"C\", \"succeed\", 70) (\"D\", \"succeed\", 75)\t= ";
    print_proj (App.combine ("C", "succeed", 70) ("D", "succeed", 75));
  Printf.printf "  combine (\"E\", \"succeed\", 80) (\"F\", \"succeed\", 80)\t= ";
    print_proj (App.combine ("E", "succeed", 80) ("F", "succeed", 80));

  print_endline "\nTests de fail:";
  Printf.printf "  fail (\"G\", \"succeed\", 95)\t= ";
    print_proj (App.fail ("G", "succeed", 95));
  Printf.printf "  fail (\"H\", \"succeed\", 100)\t= ";
    print_proj (App.fail ("H", "succeed", 100));

  print_endline "\nTests de success:";
  Printf.printf "  success (\"J\", \"failed\", 30)\t= ";
    print_proj (App.success ("J", "failed", 30));
  Printf.printf "  success (\"K\", \"failed\", 0)\t= ";
    print_proj (App.success ("K", "failed", 0));

  print_endline "\nTests des propriétés du monoïde:";
  let proj = ("L", "succeed", 90) in
  Printf.printf "  combine (\"L\", \"succeed\", 90) zero\t= ";
    print_proj (App.combine proj App.zero);
  Printf.printf "  combine zero (\"L\", \"succeed\", 90)\t= ";
    print_proj (App.combine App.zero proj);

  print_endline "\nTest associativité:";
  let p1 = ("A", "succeed", 90) in
  let p2 = ("B", "succeed", 80) in
  let p3 = ("C", "succeed", 70) in
  print_string "  p1 = "; print_proj p1;
  print_string "  p2 = "; print_proj p2;
  print_string "  p3 = "; print_proj p3;
  Printf.printf "  combine (combine p1 p2) p3\t= ";
    print_proj (App.combine (App.combine p1 p2) p3);
  Printf.printf "  combine p1 (combine p2 p3)\t= ";
    print_proj (App.combine p1 (App.combine p2 p3));
  Printf.printf "  combine (combine p3 p1) p2\t= ";
    print_proj (App.combine (App.combine p3 p1) p2);

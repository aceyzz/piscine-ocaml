(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   try.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/28 11:26:50 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/28 13:33:44 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

module Try = struct
  type 'a t =
    | Success of 'a
    | Failure of exn

  let return x = Success x

  let bind m f =
    match m with
    | Failure e -> Failure e
    | Success x ->
      try f x
      with e -> Failure e

  let recover m f =
    match m with
    | Success x -> Success x
    | Failure e ->
      try f e
      with e' -> Failure e'

  let filter m predicate =
    match m with
    | Failure e -> Failure e
    | Success x ->
      try
        if predicate x then Success x
        else Failure (Failure "Filter predicate not satisfied")
      with e -> Failure e

  let flatten m =
    match m with
    | Failure e -> Failure e
    | Success (Failure e) -> Failure e
    | Success (Success x) -> Success x
end

(* main de test *)
let () =
  let print_result result =
    match result with
    | Try.Success x -> Printf.sprintf "Success %d" x
    | Try.Failure _ -> "Failure"
  in
  let safe_div x y =
    if y = 0 then raise Division_by_zero
    else Try.Success (x / y)
  in

  print_endline "Tests return:";
  Printf.printf "  return 42 \t\t= %s\n" (print_result (Try.return 42));
  Printf.printf "  return 0 \t\t= %s\n" (print_result (Try.return 0));

  print_endline "\nTests bind: (Applique une fonction, capture les exceptions)";
  Printf.printf "  bind (return 10) (div 2) \t= %s (attendu: Success 5)\n" (print_result (Try.bind (Try.return 10) (fun x -> safe_div x 2)));
  Printf.printf "  bind (return 10) (div 0) \t= %s (attendu: Failure)\n" (print_result (Try.bind (Try.return 10) (fun x -> safe_div x 0)));
  Printf.printf "  bind Failure f \t\t= %s (attendu: Failure)\n" (print_result (Try.bind (Try.Failure Division_by_zero) (fun x -> safe_div x 2)));

  print_endline "\nTests recover: (Récupère d'une Failure en appliquant une fonction)";
  Printf.printf "  recover (Success 42) f \t= %s (attendu: Success 42)\n" (print_result (Try.recover (Try.Success 42) (fun _ -> Try.Success 0)));
  Printf.printf "  recover Failure (ret 0) \t= %s (attendu: Success 0)\n" (print_result (Try.recover (Try.Failure Division_by_zero) (fun _ -> Try.Success 0)));
  Printf.printf "  recover Failure (raise) \t= %s (attendu: Failure)\n" (print_result (Try.recover (Try.Failure Division_by_zero) (fun _ -> raise Not_found)));

  print_endline "\nTests filter: (vérifie une condition, sinon erreur)";
  Printf.printf "  filter (Success 42) (>20) \t= %s (attendu: Success 42)\n" (print_result (Try.filter (Try.Success 42) (fun x -> x > 20)));
  Printf.printf "  filter (Success 10) (>20) \t= %s (attendu: Failure)\n" (print_result (Try.filter (Try.Success 10) (fun x -> x > 20)));
  Printf.printf "  filter Failure pred \t\t= %s (attendu: Failure)\n" (print_result (Try.filter (Try.Failure Division_by_zero) (fun x -> x > 20)));

  print_endline "\nTests flatten: (Try imbriqué, Success of Failure devient Failure)";
  Printf.printf "  flatten (Success (Success 42)) = %s (attendu: Success 42)\n" (print_result (Try.flatten (Try.Success (Try.Success 42))));
  Printf.printf "  flatten (Success (Failure)) \t= %s (attendu: Failure)\n" (print_result (Try.flatten (Try.Success (Try.Failure Division_by_zero))));
  Printf.printf "  flatten (Failure) \t\t= %s (attendu: Failure)\n" (print_result (Try.flatten (Try.Failure Not_found)));

  print_endline "\nTests combinés: (chaine de plusieurs opérations)";
  let result = Try.return 20
    |> (fun m -> Try.bind m (fun x -> Try.Success (x * 2)))
    |> (fun m -> Try.filter m (fun x -> x > 30))
    |> (fun m -> Try.bind m (fun x -> Try.Success (x + 2)))
  in
  Printf.printf "  20 -> *2 -> filter>30 -> +2 = %s (attendu: Success 42)\n" (print_result result);

  let result2 = Try.return 100
    |> (fun m -> Try.bind m (fun x -> safe_div x 0))
    |> (fun m -> Try.recover m (fun _ -> Try.Success 42))
  in
  Printf.printf "  100 -> div0 -> recover 42 = %s (attendu: Success 42)\n" (print_result result2);

  let result3 = Try.return 10
    |> (fun m -> Try.bind m (fun x -> Try.Success (x * 2)))
    |> (fun m -> Try.filter m (fun x -> x > 50))
    |> (fun m -> Try.bind m (fun x -> Try.Success (x + 1)))
  in
  Printf.printf "  10 -> *2 -> filter>50 -> +1 = %s (attendu: Failure)\n" (print_result result3)

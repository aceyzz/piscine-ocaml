(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   jokes.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/26 08:47:39 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/26 09:53:40 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let jokes = [|
  "Quel est le meilleur moyen d'enlever un chewing-gum dans les cheveux?\nLe cancer.";
  "Comment sortir un bébé d'un mixeur ?\nAvec une paille.";
  "Quelle est la différence entre une pizza et une prostituée ?\nLa pizza on peut la choisir sans champignons.";
  "Que dis un oiseau quand il vole au dessus d'Auschwitz ?\nCuit-cuit.";
  "Qu'est-ce qu'une manifestation d'aveugles?\nUn festival de cannes.";
  "Dis camion\nPouet pouet.";
|]

(* main de test *)
let () =
  Random.self_init ();
  let joke = Random.int (Array.length jokes) in
  print_endline jokes.(joke)

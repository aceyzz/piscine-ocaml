(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: cedmulle <cedmulle@student.42lausanne.ch>  +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2025/12/25 16:26:01 by cedmulle          #+#    #+#             *)
(*   Updated: 2025/12/25 17:25:11 by cedmulle         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(* main de test *)
let () =
  print_endline "Card.newCard:";
  let card1 = Card.newCard Card.Value.As Card.Color.Spade in
  let card2 = Card.newCard Card.Value.T7 Card.Color.Diamond in
  let card3 = Card.newCard Card.Value.Jack Card.Color.Club in
  let card4 = Card.newCard Card.Value.T10 Card.Color.Heart in
  Printf.printf "  %s -> %s\n" (Card.toString card1) (Card.toStringVerbose card1);
  Printf.printf "  %s -> %s\n" (Card.toString card2) (Card.toStringVerbose card2);
  Printf.printf "  %s -> %s\n" (Card.toString card3) (Card.toStringVerbose card3);
  Printf.printf "  %s -> %s\n" (Card.toString card4) (Card.toStringVerbose card4);

  print_endline "\nCard.getValue et Card.getColor:";
  Printf.printf "  card1: value=%s, color=%s\n" 
    (Card.Value.toString (Card.getValue card1)) 
    (Card.Color.toString (Card.getColor card1));
  Printf.printf "  card2: value=%s, color=%s\n" 
    (Card.Value.toString (Card.getValue card2)) 
    (Card.Color.toString (Card.getColor card2));

  print_endline "\nCard.allSpades (5 premières):";
  List.iter (fun card ->
    Printf.printf "  %s\n" (Card.toString card)
  ) (List.filteri (fun i _ -> i < 5) Card.allSpades);

  print_endline "\nCard.allHearts (5 premières):";
  List.iter (fun card ->
    Printf.printf "  %s\n" (Card.toString card)
  ) (List.filteri (fun i _ -> i < 5) Card.allHearts);

  print_endline "\nCard.allDiamonds (5 premières):";
  List.iter (fun card ->
    Printf.printf "  %s\n" (Card.toString card)
  ) (List.filteri (fun i _ -> i < 5) Card.allDiamonds);

  print_endline "\nCard.allClubs (5 premières):";
  List.iter (fun card ->
    Printf.printf "  %s\n" (Card.toString card)
  ) (List.filteri (fun i _ -> i < 5) Card.allClubs);

  print_endline "\nCard.all:";
  Printf.printf "  Total: %d cartes\n" (List.length Card.all);

  print_endline "\nCard.compare:";
  Printf.printf "  compare (7D) (AS): %d\n" (Card.compare card2 card1);
  Printf.printf "  compare (AS) (7D): %d\n" (Card.compare card1 card2);
  Printf.printf "  compare (AS) (AS): %d\n" (Card.compare card1 card1);
  Printf.printf "  compare (7D) (10H): %d\n" (Card.compare card2 card4);

  print_endline "\nCard.max:";
  Printf.printf "  max (7D) (AS): %s\n" (Card.toString (Card.max card2 card1));
  Printf.printf "  max (AS) (7D): %s\n" (Card.toString (Card.max card1 card2));
  Printf.printf "  max (AS) (AS): %s (premier si égal)\n" (Card.toString (Card.max card1 card1));

  print_endline "\nCard.min:";
  Printf.printf "  min (7D) (AS): %s\n" (Card.toString (Card.min card2 card1));
  Printf.printf "  min (AS) (7D): %s\n" (Card.toString (Card.min card1 card2));
  Printf.printf "  min (AS) (AS): %s (premier si égal)\n" (Card.toString (Card.min card1 card1));

  print_endline "\nCard.best:";
  let hand = [
    Card.newCard Card.Value.T3 Card.Color.Heart;
    Card.newCard Card.Value.King Card.Color.Diamond;
    Card.newCard Card.Value.T7 Card.Color.Club;
    Card.newCard Card.Value.Jack Card.Color.Spade
  ] in
  Printf.printf "  best [3H, KD, 7C, JS]: %s\n" (Card.toString (Card.best hand));
  let hand2 = [
    Card.newCard Card.Value.King Card.Color.Heart;
    Card.newCard Card.Value.King Card.Color.Diamond;
  ] in
  Printf.printf "  best [KH, KD]: %s (premier si égal)\n" (Card.toString (Card.best hand2));

  print_endline "\nCard.best - erreur (liste vide):";
  (try
    let _ = Card.best [] in
    print_endline "  ERROR: best [] devrait échouer"
  with Invalid_argument msg ->
    Printf.printf "  best [] -> Invalid_argument: %s\n" msg);

  print_endline "\nCard.isSpade/isHeart/isDiamond/isClub:";
  Printf.printf "  AS isSpade: %b\n" (Card.isSpade card1);
  Printf.printf "  AS isHeart: %b\n" (Card.isHeart card1);
  Printf.printf "  AS isDiamond: %b\n" (Card.isDiamond card1);
  Printf.printf "  AS isClub: %b\n" (Card.isClub card1);
  Printf.printf "  7D isDiamond: %b\n" (Card.isDiamond card2);
  Printf.printf "  JC isClub: %b\n" (Card.isClub card3);
  Printf.printf "  10H isHeart: %b\n" (Card.isHeart card4);

  print_endline "\nCard.isOf:";
  Printf.printf "  AS isOf Spade: %b\n" (Card.isOf card1 Card.Color.Spade);
  Printf.printf "  AS isOf Heart: %b\n" (Card.isOf card1 Card.Color.Heart);
  Printf.printf "  7D isOf Diamond: %b\n" (Card.isOf card2 Card.Color.Diamond);
  Printf.printf "  7D isOf Spade: %b\n" (Card.isOf card2 Card.Color.Spade);

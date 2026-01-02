<img title="42_Piscine-OCaml-day05" alt="42_Piscine-OCaml-day05" src="/utils/banners/day05.png" width="100%">

<br>

## Jour 05 - Functors

- [Sujet](/utils/subjects/05-functors.pdf)  
	- [ex00 - ex00.ml](./ex00/ex00.ml)  
	- [ex01 - ex01.ml](./ex01/ex01.ml)  
	- [ex02 - ex02.ml](./ex02/ex02.ml)  
	- [ex03 - ex03.ml](./ex03/ex03.ml)  
<br>

## Statut

> En attente d'évaluation

<br>

## Détails

### Exercice 00

Découvrir les ensembles de la bibliothèque OCaml. On crée un ensemble spécialisé pour les chaînes avec un functor. On apprend que l’ensemble trie automatiquement et élimine les doublons. On parcourt ensuite l’ensemble pour afficher ses éléments et pour construire une chaîne en les combinant.

### Exercice 01

Découvrir les tables de hachage et leur version basée sur un functor. On crée une table spécialisée pour des clés de type string. On fournit une vraie fonction de hash pour convertir une chaîne en nombre. On apprend que la table associe des clés à des valeurs et que l’ordre d’affichage dépend du hash.

### Exercice 02

Apprendre à écrire ses propres functors simples. On définit un module qui contient une paire d’entiers, puis on fabrique deux functors qui extraient soit le premier soit le second élément. On comprend qu’un functor prend un module en entrée et produit un module en sortie.

### Exercice 03

Créer un type de nombres à virgule fixe avec un functor paramétré par le nombre de bits de précision. On apprend à représenter un nombre réel avec un entier mis à l’échelle. On fournit des conversions, des comparaisons et des opérations arithmétiques. On comprend aussi comment le même code peut produire plusieurs variantes comme Fixed4 et Fixed8.

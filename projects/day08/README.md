<img title="42_Piscine-OCaml-day08" alt="42_Piscine-OCaml-day08" src="/utils/banners/day08.png" width="100%">

<br>

## Jour 08 - Monoids and Monads

- [Sujet](/utils/subjects/08-monoids_and_monads.pdf)  
	- [ex00](./ex00/watchtower.ml)
	- [ex01](./ex01/app.ml)  
	- [ex02](./ex02/calc.ml)  
	- [ex03](./ex03/try.ml)  

<br>

## Statut

> En attente d'évaluation

<br>

## Détails

### Exercice 00

Découvrir la notion de **monoïde** via un exemple concret : une horloge sur 12 heures. On définit un type alias (hour = int), un élément neutre (zero) et deux opérations fermées (`add`/`sub`) qui respectent une arithmétique modulo 12. On apprend à gérer correctement les cas “0” en les remappant sur 12 pour coller au modèle d’horloge. On teste les propriétés attendues (élément neutre, associativité sur `add`, cohérence `add`/`sub`) avec une petite suite de tests.

### Exercice 01

Modéliser un monoïde applicatif sur un **type produit** (`project = string * string * int`). On combine deux projets en concaténant les noms et en calculant une moyenne de notes pour dériver un statut ("succeed" vs "failed"). On introduit des fonctions “constructeurs” fail/success qui normalisent un projet en échec ou succès. On comprend l’intérêt d’un élément neutre (zero) pour composer des valeurs facilement, et on fournit un affichage dédié (`print_proj` dans le main) pour rendre les tests lisibles en soutenance.

### Exercice 02

Généraliser des opérations arithmétiques avec des **modules abstraits** et un **functor**. On définit un module type `MONOID` qui regroupe deux zéros (neutre `add`/`sub` et neutre `mul`/`div`) et les quatre opérations. On instancie deux implémentations concrètes : `INT` et `FLOAT` (avec opérateurs entiers et flottants). On écrit ensuite un functor `Calc` qui “injecte” ces opérations dans une API uniforme, et on ajoute deux fonctions récursives génériques : `power` (puissance entière positive) et `fact` (factorielle) en restant dans le cadre du monoid. On apprend à réutiliser exactement le même code sur des types différents grâce à l’abstraction, puis on valide avec `Calc_int` et `Calc_float`.

### Exercice 03

Introduire une **monade** `Try` pour gérer les exceptions de manière fonctionnelle. On représente un calcul par `Success ’a` ou `Failure exn`, puis on fournit les briques classiques : `return` pour emballer une valeur, `bind` pour chaîner des calculs tout en capturant les exceptions, `recover` pour fournir une stratégie de rattrapage, `filter` pour invalider un succès qui ne respecte pas un prédicat, et `flatten` pour simplifier un `Try` imbriqué. On comprend comment remplacer un flot impératif try/with dispersé par des pipelines de transformations chaînables, testables et prédictibles, tout en conservant la propagation automatique des erreurs.

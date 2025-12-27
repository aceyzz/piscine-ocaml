## Jour 07 - Object Oriented Programming 2

- [Sujet](/utils/subjects/07-oop2.pdf)  
	- [ex00](./ex00/atom.ml)  
	- [ex01](./ex01/molecule.ml)  
	- [ex02](./ex02/alkane.ml)  
	- [ex03](./ex03/alkane_combustion.ml)  

<br>

## Statut

> En attente d'évaluation

<br>

## Détails

### Exercice 00

Mettre en place une hiérarchie de classes autour d’un concept abstrait avec une **classe virtuelle**. On modélise un atome via des méthodes d’accès (name, symbol, atomic_number) et on force l’API via l’héritage. On apprend à comparer des objets avec une méthode `equals` et à produire une représentation courte avec `to_string`. On comprend comment créer des sous-classes concrètes très légères qui fixent uniquement les valeurs du constructeur.

### Exercice 01

Construire une **classe virtuelle molecule** à partir d’une liste d’atomes stockée en interne. On apprend à **compter et agréger** des éléments (symbole → quantité) avec des listes associatives. On implémente le calcul automatique de la formule chimique en respectant la **notation de Hill** (C, puis H, puis le reste trié par ordre alphabétique). On découvre que l’objet ne reçoit pas une formule en dur mais la déduit de sa structure interne. On teste aussi l’égalité de molécules et on valide la formule sur un cas connu (TNT → C7H5N3O6).

### Exercice 02

Spécialiser les molécules avec une famille particulière : les **alcanes**. On génère automatiquement les listes d’atomes selon la loi **CnH2n+2** et on dérive le nom à partir de `n`. On comprend comment factoriser la logique dans une classe alkane paramétrée, puis exposer des classes concrètes (`methane`, `ethane`, `octane`). On vérifie que la formule calculée par la classe molecule reste correcte et qu’on respecte les limites imposées (1 ≤ n ≤ 12).

### Exercice 03

Introduire le concept de **réaction chimique** via une classe virtuelle `reaction` qui relie deux collections de molécules (réactifs / produits) avec coefficients stœchiométriques. On apprend à raisonner en “conservation” en comptant les atomes des deux côtés et en comparant des listes associatives triées. On fournit une méthode `is_balanced` basée sur le comptage total d’atomes, une méthode `to_string` pour afficher une équation, et une méthode `equals` pour comparer deux réactions indépendamment de l’ordre. On comprend que `balance` est un point d’extension : l’API est imposée, l’implémentation concrète vient ensuite.

### Exercice 04

Implémenter une vraie réaction : la **combustion d’alcanes**, en tant que sous-type de `reaction`. On apprend à calculer les **coefficients stœchiométriques minimaux** pour équilibrer automatiquement (alcane + O2 → CO2 + H2O). On gère une liste d’alcanes en supprimant les doublons avant calcul, puis on agrège les coefficients si plusieurs alkanes sont présents. On renforce la robustesse en levant une exception si on demande `get_start`/`get_result` sur une réaction non équilibrée. On valide le résultat avec des cas classiques (méthane, éthane, octane) et on vérifie que `is_balanced` passe à `true` après `balance`.

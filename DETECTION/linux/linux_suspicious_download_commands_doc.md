# Détection de commandes de téléchargement suspectes

## Description
Cette règle détecte l’utilisation de commandes de téléchargement en ligne de commande (wget, curl) susceptibles d’être utilisées pour récupérer des scripts ou binaires malveillants après compromission.

## Sources et prérequis
- Index : kunai
- Source : télémétrie Kunai sur les commandes exécutées
- Champ requis : data.command_line

## Logique de détection
- Recherche les lignes de commande commençant par wget ou curl.
- Remonte ces événements pour analyse par l’analyste SOC.

## Faux positifs possibles
- Téléchargements légitimes réalisés par des administrateurs ou scripts internes.
- Automatisations de déploiement ou mise à jour.

## Mécanismes d’exclusion
- Exclure certains comptes d’administration ou hôtes de déploiement.
- Ajouter des filtres sur les domaines internes de confiance.

## Sévérité recommandée
- High, surtout sur des systèmes de production ou sensibles.

## Pivots d’investigation
- URL ou domaine ciblé par le téléchargement (si visible).
- Utilisateur à l’origine de la commande.
- Fichiers créés sur le disque à la suite du téléchargement.

## Actions d’endiguement
- Supprimer les fichiers téléchargés si malveillants.
- Bloquer les domaines ou adresses IP malveillants au niveau réseau.
- Surveiller les exécutions de fichiers téléchargés.

## Remédiations
- Limiter les accès sortants aux seuls dépôts et sites approuvés.
- Formaliser les procédures de téléchargement en production.

## Références MITRE ATT&CK
- T1105 – Ingress Tool Transfer

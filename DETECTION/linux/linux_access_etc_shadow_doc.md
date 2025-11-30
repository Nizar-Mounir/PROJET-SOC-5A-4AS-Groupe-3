# Accès au fichier /etc/shadow

## Description
Cette règle détecte les tentatives d’accès explicites au fichier /etc/shadow via la commande cat. Ce fichier contient les empreintes de mots de passe des comptes locaux et représente une cible privilégiée pour l’escalade de privilèges et le cracking hors ligne.

## Sources et prérequis
- Index : kunai
- Source : commandes journalisées par Kunai
- Champ requis : data.command_line

## Logique de détection
- Filtre les commandes dont la ligne de commande correspond à cat /etc/shadow.

## Faux positifs possibles
- Rarement légitime en production, sauf dans des contextes de diagnostic très contrôlés.

## Mécanismes d’exclusion
- Éventuellement exclure certains comptes d’administration sur des environnements de test, mais éviter en production.

## Sévérité recommandée
- Critical.

## Pivots d’investigation
- Utilisateur à l’origine de la commande.
- Session et adresse IP source.
- Autres commandes exécutées dans la même session.

## Actions d’endiguement
- Isoler l’hôte si l’accès n’est pas légitime.
- Suspendre ou réinitialiser le compte mis en cause.

## Remédiations
- Renforcer les contrôles d’accès et la journalisation sur /etc/shadow.
- Limiter strictement les comptes pouvant accéder à ces fichiers.

## Références MITRE ATT&CK
- T1003 – OS Credential Dumping

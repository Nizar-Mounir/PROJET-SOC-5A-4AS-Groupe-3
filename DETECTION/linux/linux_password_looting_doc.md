# Activité de password looting

## Description
Cette règle détecte diverses commandes visant des fichiers ou configurations liés aux mots de passe sur des systèmes Linux, telles que /etc/shadow, /etc/passwd ou les fichiers de configuration PAM. Elle couvre plusieurs outils et techniques de préparation au vol de mots de passe.

## Sources et prérequis
- Index : kunai
- Source : commandes journalisées par Kunai
- Champ requis : data.command_line

## Logique de détection
- Filtre un ensemble de commandes connues d’exfiltration ou de préparation de données de mots de passe (cat, grep, unshadow, strings) sur des fichiers sensibles.

## Faux positifs possibles
- Interventions ponctuelles de forensique ou de diagnostic effectuées par des équipes très spécialisées dans un cadre maîtrisé.

## Mécanismes d’exclusion
- Définir des comptes ou périodes spécifiques pour les activités d’audit contrôlé.
- Restreindre les exclusions aux environnements de test ou de lab.

## Sévérité recommandée
- Critical.

## Pivots d’investigation
- Utilisateur ayant exécuté les commandes.
- Hôte concerné et rôle de la machine.
- Corrélation avec des connexions réseau sortantes pouvant indiquer une exfiltration.

## Actions d’endiguement
- Isoler immédiatement la machine concernée.
- Révoquer les identifiants utilisés.
- Déclencher une investigation de compromission plus large si nécessaire.

## Remédiations
- Renforcer la protection des fichiers sensibles (droits, audit).
- Mettre en place des systèmes de détection d’exfiltration.
- Sensibiliser les administrateurs à l’usage de procédures d’investigation encadrées.

## Références MITRE ATT&CK
- T1003 – OS Credential Dumping
- T1552 – Unsecured Credentials

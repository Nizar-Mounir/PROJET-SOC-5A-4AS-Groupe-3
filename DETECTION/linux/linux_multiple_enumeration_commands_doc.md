# Multiples commandes d’énumération

## Description
Cette règle détecte un volume anormal de commandes d’énumération système et réseau (whoami, id, hostname, ifconfig, netstat, etc.) effectuées par un même utilisateur, indicateur possible de reconnaissance post-compromission.

## Sources et prérequis
- Index : kunai
- Source : collecte Kunai des commandes exécutées
- Champs nécessaires : data.command_line, info.task.user

## Logique de détection
- Filtre les commandes prédéfinies d’énumération.
- Regroupe les événements par utilisateur.
- Déclenche une alerte lorsqu’un utilisateur dépasse un seuil de 5 commandes d’énumération.

## Faux positifs possibles
- Sessions d’administration intensives sur des serveurs ou équipements réseau.
- Interventions de support ou de diagnostic légitimes.

## Mécanismes d’exclusion
- Exclure certains comptes d’administration ou bastions.
- Restreindre la détection aux systèmes de production.

## Sévérité recommandée
- Medium à High selon le contexte (plus élevée si l’utilisateur n’est pas un administrateur).

## Pivots d’investigation
- Identité de l’utilisateur (info.task.user).
- Adresse IP d’origine de la session (si disponible).
- Autres commandes exécutées par le même utilisateur sur la même période.

## Actions d’endiguement
- Vérifier la légitimité de la session utilisateur.
- Révoquer ou réinitialiser les identifiants si un compromis est suspecté.

## Remédiations
- Limiter les accès privilégiés aux seuls comptes nécessaires.
- Mettre en place un bastion ou une solution PAM pour encadrer les sessions.

## Références MITRE ATT&CK
- T1087 – Account Discovery
- T1016 – System Network Configuration Discovery
- T1082 – System Information Discovery

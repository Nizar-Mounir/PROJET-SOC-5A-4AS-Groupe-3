# Création d'une tâche planifiée

## Description
Cette règle détecte la création de nouvelles tâches planifiées Windows, un mécanisme de persistance fréquemment utilisé pour exécuter périodiquement des scripts ou binaires malveillants.

## Sources et prérequis
- Index : windows_server, windows_client, windows_dc
- Sources : journaux liés au planificateur de tâches / sécurité
- EventCodes : 4698, 106, 140

## Logique de détection
- Filtre les événements associés à la création ou modification de tâches planifiées.
- Extrait les champs principaux : TaskName, Author, Command.
- Fournit une vue simple permettant à l’analyste d’identifier les tâches suspectes.

## Faux positifs possibles
- Tâches légitimes créées par des logiciels d’administration, de sauvegarde ou de supervision.
- Scripts internes déployés par les équipes IT.

## Mécanismes d’exclusion
- Exclure les tâches dans les chemins standards Microsoft (\\Microsoft\\Windows\\*), si acceptable.
- Mettre en liste blanche certains noms de tâches et auteurs connus.

## Sévérité recommandée
- Medium à High selon la criticité de la machine et la nature de la commande exécutée.

## Pivots d’investigation
- Commande associée à la tâche (binaire, script, arguments).
- Auteur (compte) à l’origine de la création de la tâche.
- Contexte temporel : autres événements suspects autour de la création.

## Actions d’endiguement
- Désactiver ou supprimer la tâche malveillante.
- Isoler la machine si la tâche exécute un implant ou un outil de post-exploitation.

## Remédiations
- Renforcer le contrôle des droits permettant de créer des tâches planifiées.
- Documenter les tâches planifiées légitimes et les revoir régulièrement.

## Références MITRE ATT&CK
- T1053 – Scheduled Task/Job

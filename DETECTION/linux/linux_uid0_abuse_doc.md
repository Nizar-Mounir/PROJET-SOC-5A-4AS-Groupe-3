# Utilisation anormale du compte UID 0

## Description
Cette règle met en évidence les cas où l’UID 0 (super-utilisateur Linux) est associé à un utilisateur dont le nom n’est pas root, ce qui peut signaler une élévation de privilèges abusive ou une configuration non conforme.

## Sources et prérequis
- Index : kunai
- Source : logs Kunai contenant les métadonnées d’exécution
- Champs requis : uid, user dans la charge utile

## Logique de détection
- Recherche les événements où uid vaut 0.
- Exclut les cas où user est root.
- Remonte les autres cas pour investigation.

## Faux positifs possibles
- Configurations particulières où certains comptes de service partagent l’UID 0 (pratique déconseillée).

## Mécanismes d’exclusion
- Documenter les comptes éventuellement mappés sur UID 0 et valider leur légitimité.
- Restrindre la règle à des environnements de production.

## Sévérité recommandée
- High.

## Pivots d’investigation
- Compte utilisateur effectif (user) utilisant l’UID 0.
- Contexte système : commandes exécutées, services démarrés.
- Historique des connexions pour ce compte.

## Actions d’endiguement
- Suspendre le compte si l’usage n’est pas prévu.
- Auditer les configurations de comptes et sudoers.

## Remédiations
- Supprimer les mappings UID 0 non nécessaires.
- Renforcer l’usage de sudo avec journalisation exhaustive.

## Références MITRE ATT&CK
- T1068 – Exploitation for Privilege Escalation
- T1078 – Valid Accounts

# Linux - Password Looting Activity

## Description
Détecte toute tentative d'accès à des fichiers sensibles contenant des informations de mots de passe, tels que /etc/shadow, /etc/passwd ou les fichiers PAM. Cette activité est généralement un indicateur clair de compromission ou d'escalation de privilèges.

## Source de données
- index = kunai  
- eBPF Kunai  
- Champs utilisés : data.command_line

## Logique de détection
La règle vérifie si la commande exécutée fait partie d'une liste de commandes associées à la récupération de mots de passe :
- cat /etc/shadow  
- unshadow /etc/passwd /etc/shadow  
- cat /etc/security/opasswd  
- grep root /etc/shadow  
etc.

## Faux positifs possibles
- Maintenance système effectuée par root  
- Audit de sécurité légitime

## Sévérité
**Élevée**

## Actions recommandées
- Identifier l'utilisateur ayant lancé la commande  
- Vérifier les processus associés  
- Isoler la machine si activité malveillante confirmée  
- Auditer les privilèges du compte utilisé

## MITRE ATT&CK Mapping
- TA0006: Credential Access  
- T1003: OS Credential Dumping  

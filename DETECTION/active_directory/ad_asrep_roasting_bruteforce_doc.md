# Détection AS-REP Roasting (bruteforce)

## Description
Cette règle détecte des tentatives répétées d’AS-REP Roasting caractérisées par un nombre élevé d’échecs de requêtes Kerberos TGT (4768, Failure_Code=0x18) sur des comptes non machines.

## Sources et prérequis
- Index : index AD ou global
- Sourcetype : XmlWinEventLog:Security
- EventCode : 4768
- Champs requis : Failure_Code, Account_Name, Client_Address

## Logique de détection
- Filtre les échecs d’authentification Kerberos avec Failure_Code=0x18.
- Exclut les comptes se terminant par un dollar (comptes machine).
- Regroupe par nom de compte et adresse client.
- Génère une alerte au-delà d’un seuil de tentatives (>5).

## Faux positifs possibles
- Scripts ou applications mal configurés utilisant de mauvais identifiants sur des comptes de service.

## Mécanismes d’exclusion
- Exclure certains comptes de service pendant des phases connues de migration ou de test.
- Ajuster le seuil de count en fonction du niveau de bruit acceptable.

## Sévérité recommandée
- High : un volume élevé d’échecs sur des comptes sensibles est un indicateur d’attaque par mot de passe.

## Pivots d’investigation
- Comptes ciblés (Account_Name).
- Hôtes et IP sources (Client_Address).
- Période temporelle et corrélation avec d’autres alertes AD.

## Actions d’endiguement
- Bloquer l’adresse IP source si l’activité est malveillante.
- Désactiver temporairement les comptes fortement ciblés.

## Remédiations
- Activer la pré-authentification sur les comptes concernés.
- Renforcer la politique de verrouillage de compte et la complexité des mots de passe.

## Références MITRE ATT&CK
- T1558.004 – AS-REP Roasting
- T1110 – Brute Force

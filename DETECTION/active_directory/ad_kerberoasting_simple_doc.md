# Détection Kerberoasting

## Description
Cette règle propose une détection générique de Kerberoasting en identifiant les tickets de service Kerberos (4769) utilisant certains types de chiffrement présents dans les scénarios d’attaque connus.

## Sources et prérequis
- Index : index AD ou global
- Source : XmlWinEventLog:Security
- EventCode : 4769
- Champ requis : Ticket_Encryption_Type

## Logique de détection
- Filtre tous les événements 4769.
- Conserve ceux dont le type de chiffrement correspond à des valeurs ciblées (0x17, 0x12).

## Faux positifs possibles
- Environnements non durcis où ces types de chiffrement sont encore largement utilisés.

## Mécanismes d’exclusion
- Affiner la règle en limitant à certains comptes de service ou à certains contrôleurs de domaine.
- Ajouter des conditions sur les adresses IP ou les hôtes sources.

## Sévérité recommandée
- High, surtout lorsque des comptes de service à privilèges sont concernés.

## Pivots d’investigation
- Comptes de service concernés.
- Hôtes et IP à l’origine des requêtes.
- Volumes de demandes pour un même service.

## Actions d’endiguement
- Surveiller et durcir les comptes de service identifiés.
- Limiter l’accès aux services sensibles depuis des segments non maîtrisés.

## Remédiations
- Migrer vers des types de chiffrement plus robustes (AES).
- Appliquer des mots de passe complexes sur les comptes de service.

## Références MITRE ATT&CK
- T1558.003 – Kerberoasting

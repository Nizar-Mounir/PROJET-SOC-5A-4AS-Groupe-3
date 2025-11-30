# Kerberoasting Activity - Initial Query

## Description
Cette règle détecte des activités compatibles avec Kerberoasting en identifiant des demandes de tickets de service Kerberos (TGS) chiffrés en RC4 pour des comptes de service potentiels, en excluant les comptes machines et krbtgt.

## Sources et prérequis
- Index : index de sécurité AD ou global
- Source : WinEventLog:Security
- EventCode : 4769
- Champs nécessaires : Status, TicketEncryptionType, ServiceName, TargetUserName

## Logique de détection
- Filtre les TGS requests réussies (Status=0x0).
- Restreint aux tickets chiffrés en RC4 (0x17).
- Exclut les services krbtgt et les comptes se terminant par un dollar (comptes machine).
- Exclut également les TargetUserName de type machine.

## Faux positifs possibles
- Services légitimes utilisant encore RC4.
- Scripts d’administration légitimes interrogeant des services spécifiques.

## Mécanismes d’exclusion
- Mettre en liste blanche certains comptes de service métier connus.
- Restreindre la détection à certains segments réseau ou contrôleurs de domaine.

## Sévérité recommandée
- High : la récupération de tickets RC4 pour des comptes de service est un prérequis fort pour Kerberoasting.

## Pivots d’investigation
- Comptes de service ciblés (ServiceName, TargetUserName).
- Hôtes et IP à l’origine des requêtes.
- Corrélation avec d’autres activités suspectes (scan AD, modifications de permissions).

## Actions d’endiguement
- Surveiller et, si nécessaire, restreindre temporairement les comptes de service concernés.
- Isoler les hôtes qui génèrent des volumes anormaux de TGS requests.

## Remédiations
- Durcir les politiques de mots de passe des comptes de service.
- Mettre en place gMSA lorsque possible.
- Réduire la dépendance à RC4.

## Références MITRE ATT&CK
- T1558.003 – Kerberoasting

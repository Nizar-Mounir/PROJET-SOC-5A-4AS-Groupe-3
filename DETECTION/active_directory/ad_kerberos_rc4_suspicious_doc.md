# Suspicious Kerberos RC4 Ticket Encryption

## Description
Cette règle détecte des tickets de service Kerberos (TGS) chiffrés en RC4 avec des options spécifiques, pouvant indiquer des scénarios d’attaque de type Kerberoasting ciblant des comptes de service non standard.

## Sources et prérequis
- Index : index de sécurité AD ou global
- Source : WinEventLog:Security
- EventCode : 4769
- Champs nécessaires : TicketOptions, TicketEncryptionType, ServiceName

## Logique de détection
- Filtre les TGS requests (4769).
- Restreint aux tickets chiffrés en RC4 (0x17) avec TicketOptions 0x40810000.
- Exclut les services se terminant par un signe dollar (comptes machine).

## Faux positifs possibles
- Services légitimes utilisant encore RC4 pour des raisons de compatibilité dans des environnements non durcis.

## Mécanismes d’exclusion
- Documenter et exclure explicitement les services métier connus utilisant RC4.
- Restreindre la règle à certains domaines ou OU si nécessaire.

## Sévérité recommandée
- High : l’usage persistants de RC4 expose les secrets Kerberos au cracking.

## Pivots d’investigation
- Comptes de service ciblés (ServiceName).
- Hôtes et IP à l’origine des requêtes.
- Historique d’authentification Kerberos pour les comptes concernés.

## Actions d’endiguement
- Mettre sous surveillance renforcée les comptes de service identifiés.
- Restreindre temporairement l’usage de ces comptes si un abus est suspecté.

## Remédiations
- Désactiver ou limiter l’usage de RC4 dans les politiques Kerberos.
- Migrer progressivement les services vers AES.
- Renforcer la politique de mot de passe des comptes de service.

## Références MITRE ATT&CK
- T1558.003 – Kerberoasting

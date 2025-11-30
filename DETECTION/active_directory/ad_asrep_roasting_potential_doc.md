# Potential AS-REP Roasting via Kerberos TGT Requests

## Description
Cette règle détecte un comportement compatible avec une attaque d’AS-REP Roasting, ciblant des comptes Active Directory sans pré-authentification Kerberos afin de récupérer des réponses pouvant être soumises à du cracking hors ligne.

## Sources et prérequis
- Index : index de sécurité AD ou index global (index=*)
- Source : WinEventLog:Security
- EventCode : 4768
- Champs nécessaires : TicketEncryptionType, ServiceName, PreAuthType

## Logique de détection
- Filtre les événements Kerberos TGT (4768).
- Restreint aux tickets chiffrés en RC4 (0x17).
- Restreint au service krbtgt.
- Ne conserve que les événements sans pré-authentification (PreAuthType=0).

## Faux positifs possibles
- Comptes de service volontairement configurés sans pré-authentification pour des raisons historiques.

## Mécanismes d’exclusion
- Exclure explicitement les comptes pour lesquels l’absence de pré-authentification est documentée et acceptée.
- Mettre à jour la liste blanche en coordination avec l’équipe AD.

## Sévérité recommandée
- High à Critical, en fonction du type de comptes touchés.

## Pivots d’investigation
- Comptes concernés par les événements 4768 sans pré-auth.
- Adresse IP et hôte source à l’origine des requêtes.
- Volume et fréquence des requêtes par compte ou par IP.

## Actions d’endiguement
- Activer la pré-authentification Kerberos pour les comptes visés lorsque cela est possible.
- Surveiller et éventuellement bloquer les adresses IP d’origine.

## Remédiations
- Mettre en conformité la configuration des comptes AD (pré-auth obligatoire).
- Renforcer la politique de mot de passe des comptes sensibles.
- Mettre en place une supervision pérenne sur les événements 4768 anormaux.

## Références MITRE ATT&CK
- T1558.004 – AS-REP Roasting

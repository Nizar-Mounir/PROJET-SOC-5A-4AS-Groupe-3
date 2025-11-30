# Possible Shadow Credentials Added

## Description
Cette règle détecte des modifications de l’attribut msDS-KeyCredentialLink sur des objets Active Directory. Ces modifications peuvent indiquer l’ajout de Shadow Credentials permettant de contourner les mécanismes d’authentification classiques.

## Sources et prérequis
- Index : index AD ou global
- Source : XmlWinEventLog:Security
- EventCode : 5136
- Champ requis : AttributeLDAPDisplayName

## Logique de détection
- Filtre les événements de modification d’objet AD (5136).
- Identifie les modifications de l’attribut msDS-KeyCredentialLink.

## Faux positifs possibles
- Déploiements légitimes de nouvelles fonctionnalités ou applications utilisant cet attribut.

## Mécanismes d’exclusion
- Documenter les projets ou applications qui modifient cet attribut et les exclure le cas échéant.
- Restreindre la règle aux comptes à privilèges si nécessaire.

## Sévérité recommandée
- Critical lorsque des comptes sensibles sont concernés.

## Pivots d’investigation
- Objet AD impacté par la modification.
- Compte à l’origine de la modification.
- Autres changements récents sur le même objet ou par le même compte.

## Actions d’endiguement
- Révoquer les clés ou valeurs ajoutées de manière non autorisée.
- Suspendre ou restreindre le compte ayant effectué la modification.

## Remédiations
- Renforcer les contrôles d’accès sur les attributs sensibles AD.
- Mettre en place une revue régulière des événements 5136 sur les DC.

## Références MITRE ATT&CK
- T1556.006 – Shadow Credentials

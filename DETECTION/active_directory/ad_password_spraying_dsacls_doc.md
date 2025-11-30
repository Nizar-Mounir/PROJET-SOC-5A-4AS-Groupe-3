# Password spraying

## Description
Cette règle vise à détecter l’utilisation de l’outil dsacls.exe avec les paramètres /user: et /passwd:, ce qui peut indiquer une tentative de password spraying ou de manipulation abusive des permissions sur des objets Active Directory.

## Sources et prérequis
- Index : index endpoints Windows ou global
- Source : WinEventLog:Microsoft-Windows-Sysmon/Operational
- Pré-requis : Sysmon doit journaliser la ligne de commande.

## Logique de détection
- Recherche la présence de dsacls.exe dans le champ brut (_raw).
- Vérifie la présence simultanée des paramètres /user: et /passwd:.
- Met en avant les cas où les mots de passe sont manipulés en ligne de commande.

## Faux positifs possibles
- Scripts d’administration légitimes gérant des ACL AD.
- Outils de migration ou d’audit exécutés par des administrateurs autorisés.

## Mécanismes d’exclusion
- Exclure les comptes d’administration et scripts internes explicitement approuvés.
- Restreindre la détection aux postes utilisateurs et exclure certains serveurs d’administration dédiés.

## Sévérité recommandée
- High : l’exposition de mots de passe en ligne de commande est très sensible.

## Pivots d’investigation
- Compte utilisateur ayant exécuté la commande.
- Hôte à l’origine de l’activité.
- Autres commandes exécutées à proximité temporelle.
- Effets visibles sur les ACL AD.

## Actions d’endiguement
- Suspendre ou restreindre le compte utilisateur si l’activité n’est pas légitime.
- Surveiller étroitement les contrôleurs de domaine pour des changements anormaux.

## Remédiations
- Interdire l’usage de mots de passe en clair dans les scripts d’administration.
- Mettre en place des outils plus sécurisés de gestion d’ACL.
- Former les administrateurs aux bonnes pratiques d’automatisation.

## Références MITRE ATT&CK
- T1110 – Brute Force
- T1098 – Account Manipulation

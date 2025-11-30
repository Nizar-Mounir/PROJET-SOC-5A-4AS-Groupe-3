# Détection – Création de service suspect (EventCode 7045)

## Description
Cette règle détecte la création de nouveaux services Windows via l’événement 7045. Les attaquants utilisent fréquemment les services pour établir de la persistance ou exécuter des charges malveillantes au démarrage.

## Sources et prérequis
- Index : windows_server, windows_client, windows_dc
- Source : journal de sécurité Windows (WinEventLog:Security) ou équivalent
- EventCode : 7045 (création de service)

## Logique de détection
- Filtre les événements de création de service (EventCode 7045 ou signature_id 7045).
- Renomme les champs pour faciliter l’exploitation (service_name, image_path, account).
- Convertit les valeurs en minuscules pour les comparaisons.
- Exclut les services Microsoft usuels (mots-clés microsoft, svchost dans system32).
- Retourne une vue synthétique des services créés pour investigation.

## Faux positifs possibles
- Installation légitime de logiciels ajoutant des services (EDR, supervision, sauvegarde).
- Déploiements applicatifs prévus par l’équipe IT.
- Drivers ou agents internes mis à jour.

## Mécanismes d’exclusion
- Ajouter des filtres sur des chemins ou éditeurs de confiance.
- Mettre en liste blanche certains service_name connus et validés.
- Ajuster la règle en fonction du socle standard de l’entreprise.

## Sévérité recommandée
- High : un service malveillant peut offrir une persistance robuste et difficile à détecter.

## Pivots d’investigation
- Binaire du service (image_path) : hash, signature, réputation externe.
- Compte associé (account) et contexte d’authentification.
- Autres événements de création/modification de service sur le même hôte.
- Processus parent si l’information est disponible (via Sysmon).

## Actions d’endiguement
- Arrêter et désactiver le service malveillant.
- Supprimer le binaire associé si confirmé comme malveillant.
- Isoler l’hôte du réseau si l’activité semble plus large.

## Remédiations
- Restreindre les droits d’administration permettant de créer des services.
- Surveiller en continu les événements 7045 sur les serveurs critiques.
- Mettre en place des procédures de déploiement applicatif documentées.

## Références MITRE ATT&CK
- T1543.003 – Create or Modify System Process: Windows Service

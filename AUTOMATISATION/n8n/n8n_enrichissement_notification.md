# Workflow – Splunk Alert → Enrichissement → IRIS + Teams

## Objectif
Automatiser le traitement d’une alerte Splunk :
- Réception via webhook
- Normalisation et extraction des IOC
- Enrichissement (AbuseIPDB et VirusTotal)
- Création d’une alerte dans DFIR-IRIS
- Notification Microsoft Teams en fonction de la sévérité

## Déclencheur
- Webhook POST
- Path : `/webhook/alert`
- Reçoit le payload Splunk contenant : `search_name`, `result`, `results_link`, `_time`

## Étapes principales du workflow

### 1. Webhook – Réception Splunk
Récupère le JSON brut envoyé par Splunk (body et result).

### 2. Normalisation – Node Python
- Convertit `_time` en ISO 8601
- Extrait IOC :
  - IP : `dest_ip`, `src_ip`, `dvc_ip`
  - Hash : `file_hash`, `md5`, `sha256`
- Corrige l’URL Splunk dans `results_link`
- Calcule la sévérité :
  - base = 3
  - +1 si le titre contient `password`
  - +2 si le titre contient `execve`
- Construit un JSON propre pour IRIS

### 3. Création d’alerte DFIR-IRIS
- POST vers `/alerts/add`
- Champs envoyés :
  - titre, description, source, lien Splunk
  - sévérité, client, timestamp
  - contenu brut + IOC

### 4. Enrichissement IOC

#### IP (si présente) – AbuseIPDB
- Vérifie la réputation de l’adresse IP
- Récupère : `abuseConfidenceScore`, `totalReports`

#### Hash (si présent) – VirusTotal
- Récupère : `malicious`, `harmless`

### 5. Fusion des données
Combine enrichissements + données Splunk normalisées en un seul objet JSON.

### 6. Notification Teams
- Condition : `severity > 2`
- Envoie un message formaté contenant :
  - titre, sévérité, IOC
  - scores VT / AbuseIPDB
  - lien Splunk

## Entrées
- Payload webhook Splunk
- IOC trouvés dans les champs du result
- `results_link`

## Sorties
- Alerte créée dans DFIR-IRIS
- Notification Teams si sévérité > 2

## Dépendances
- Credentials : `dfirIrisApi`, `virusTotalApi`, clé AbuseIPDB
- URL Splunk à ajuster dans la normalisation Python

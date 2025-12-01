# Scan de port horizontal (Kunai)

## Description

Cette règle détecte un scan de port horizontal, c’est-à-dire un grand nombre de ports différents scannés sur une même machine cible par une même source. Ce comportement est caractéristique d’une phase de reconnaissance visant à identifier les services exposés.

## Sources et prérequis

- Index : kunai
- Source : logs Kunai contenant les métadonnées réseau
- Champs requis :
  - data.socket.src_ip
  - data.socket.dst_ip
  - data.socket.dst_port

## Logique de détection

- Regroupe les événements par combinaison (src_ip, dst_ip).
- Calcule le nombre de ports uniques scannés (dc(dst_port)).
- Déclenche une alerte si ce nombre dépasse 20 ports en moins de 5 minutes.

## SPL

```spl
index=*
| stats dc(data.socket.dst_port) AS ports_scanned BY data.socket.src_ip, data.socket.dst_ip
| where ports_scanned > 20
```

## Faux positifs possibles

- Systèmes de supervision effectuant des sondes multi-ports.
- Outils internes de diagnostic réseau.
- Tests de sécurité ou pentests légitimes.

## Mécanismes d’exclusion

- Ajouter en liste d’exclusion les adresses IP de scanners internes autorisés.
- Filtrer les flux provenant des systèmes de monitoring.
- Ajuster le seuil (par exemple > 50 ports) selon le contexte et la volumétrie normale.

## Sévérité recommandée

Medium à High, selon la criticité du segment réseau et des hôtes ciblés.

## Pivots d’investigation

- IP source (data.socket.src_ip)
- IP cible (data.socket.dst_ip) et services exposés
- Historique d’activité de la source
- Corrélation avec d’autres scans

## Actions d’endiguement

- Isoler temporairement l’IP source si elle n’est pas légitime.
- Bloquer les flux suspects au niveau firewall.
- Surveiller les hôtes ciblés pour identifier des tentatives d’exploitation.

## Remédiations

- Réduire la surface d’exposition des services non nécessaires.
- Renforcer les politiques de filtrage réseau.
- Mettre en place des mécanismes de détection plus fins.

## Références MITRE ATT&CK

- T1046 – Network Service Scanning
- T1595 – Active Scanning

# Scan de port vertical (Kunai)

## Description

Cette règle détecte un scan de port vertical, c’est-à-dire un scanning du même port sur de multiples hôtes.  
Ce comportement est typique de phases de reconnaissance visant à identifier une vulnérabilité liée à un service spécifique.

## Sources et prérequis

- Index : kunai
- Source : logs Kunai contenant les métadonnées réseau
- Champs requis :
  - data.socket.src_ip
  - data.socket.dst_ip
  - data.socket.dst_port

## Logique de détection

- Regroupe les événements par combinaison (src_ip, dst_port).
- Calcule le nombre d’hôtes uniques ciblés (dc(dst_ip)).
- Déclenche une alerte si plus de 10 machines sont touchées sur le même port en moins de 5 minutes.

## SPL

```spl
index=*
| stats dc(data.socket.dst_ip) AS hosts_touched BY data.socket.src_ip, data.socket.dst_port
| where hosts_touched > 10
```

## Faux positifs possibles

- Outils de gestion de parc ou inventaire réseau.
- Systèmes automatisés testant la disponibilité d’un service particulier.
- Scans internes autorisés.

## Mécanismes d’exclusion

- Exclure les adresses IP internes utilisées par la supervision.
- Adapter les seuils selon le volume normal de trafic interne.
- Limiter l’application de la règle aux sous-réseaux sensibles.

## Sévérité recommandée

Medium à High selon la criticité des hôtes visés.

## Pivots d’investigation

- IP source (data.socket.src_ip)
- Port ciblé et service associé
- Analyse temporelle : scan rapide ou lent
- Corrélation avec brute-force ou exploitation

## Actions d’endiguement

- Bloquer ou isoler l’IP source si activité non légitime.
- Surveiller les hôtes ciblés pour détecter des tentatives ultérieures.
- Mettre en place du rate limiting ou filtrage firewall.

## Remédiations

- Réduire la surface d’exposition des services.
- Renforcer le cloisonnement réseau.
- Déployer des mécanismes de détection distribués.

## Références MITRE ATT&CK

- T1046 – Network Service Scanning
- T1595 – Active Scanning

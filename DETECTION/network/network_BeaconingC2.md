# Beaconing C2 (Kunai)

## Description

Cette règle détecte des communications régulières et périodiques entre une machine interne et une destination externe.  
Ce comportement est caractéristique d’un canal de Command & Control (C2), où un implant malveillant envoie des requêtes à intervalles stables vers un serveur contrôlé par un attaquant.

## Sources et prérequis
- Index : kunai  
- Source : logs Kunai contenant les métadonnées réseau  
- Champs requis :
  - data.socket.src_ip  
  - data.socket.dst_ip  
  - data.socket.dst_port  
  - _time  

## Logique de détection
- Regroupe les évènements par couple (src_ip, dst_ip) et par minute.
- Calcule pour chaque minute le nombre de requêtes envoyées.
- Mesure la moyenne et l'écart-type du nombre de requêtes par minute.
- Déclenche une alerte si :
  - la moyenne est supérieure à 3 req/min,
  - l’écart-type est inférieur à 1 (forte régularité du trafic).

## SPL
```spl
index=kunai
| bin _time span=1m
| stats count AS req_per_min BY data.socket.src_ip, data.socket.dst_ip, _time
| stats avg(req_per_min) AS avg stdev(req_per_min) AS sd BY data.socket.src_ip, data.socket.dst_ip
| where avg > 3 AND sd < 1
```
## Faux positifs possibles

- Agents EDR/antivirus communiquant régulièrement avec leur serveur de cloud.
- Outils de supervision réseau ou probes de disponibilité.
- Applications cloud effectuant des synchronisations régulières (OneDrive, Teams, Dropbox).
- Health-checks automatisés de load balancers.

## Mécanismes d’exclusion

- Ajouter en liste blanche les destinations légitimes des EDR et solutions de monitoring.
- Filtrer les domaines officiels des éditeurs d’antivirus/cloud.
- Exclure les serveurs internes dont le comportement réseau périodique est documenté.
- Vérifier la correspondance entre l’agent applicatif et le port utilisé.

## Sévérité recommandée

- Critique, car un beaconing est généralement un indicateur fort de compromission active.

## Pivots d’investigation

- IP source (data.socket.src_ip)
- Destination contactée (data.socket.dst_ip)
- Type de protocole et port utilisé
- Processus responsable des connexions sortantes
- Historique complet des communications de l’hôte
- Vérification de persistences sur l’hôte (services, tâches planifiées)

## Actions d’endiguement

- Isoler immédiatement la machine source si la communication n’est pas légitime.
- Bloquer la destination au niveau firewall ou proxy.
- Interrompre toute communication sortante vers l’adresse distante identifiée.
- Surveiller les machines du même segment réseau pour identifier un éventuel cluster de compromission.

## Remédiations

- Supprimer l’implant ou le processus malveillant identifié.
- Rechercher et éliminer les mécanismes de persistance associés.
- Réaliser une analyse approfondie via l’EDR.
- Réinitialiser les identifiants potentiellement compromis.
- Restreindre et contrôler plus finement les flux sortants.
- Mettre en place des règles complémentaires de détection sur les comportements réguliers anormaux.

## Références MITRE ATT&CK

- T1071 – Application Layer Protocol
- T1071.001 – Web Protocols
- T1071.004 – DNS
- TA0011 – Command & Control

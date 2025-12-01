# Linux - Multiple Enumeration Commands

## Description
Cette règle détecte un utilisateur exécutant un nombre anormalement élevé de commandes d’énumération système (whoami, id, hostname, ifconfig…). Ce comportement indique souvent une phase de reconnaissance après une compromission.

## Source de données
- index = kunai  
- eBPF Kunai  
- Champs utilisés : data.command_line, info.task.user

## Logique de détection
Une liste de commandes d’énumération classiques est surveillée.  
Si un utilisateur exécute plus de 5 commandes de cette liste, une alerte est déclenchée.

## Faux positifs possibles
- Scripts d’audit ou de monitoring
- Administrateurs effectuant un diagnostic rapide

## Sévérité
**Moyenne**

## Actions recommandées
- Valider l’identité et le contexte utilisateur
- Vérifier les commandes exécutées avant/après
- Rechercher une compromission potentielle
- Corréler avec les tentatives d'accès root ou shadow

## MITRE ATT&CK
- TA0007 – Discovery  
- T1082 – System Information Discovery  

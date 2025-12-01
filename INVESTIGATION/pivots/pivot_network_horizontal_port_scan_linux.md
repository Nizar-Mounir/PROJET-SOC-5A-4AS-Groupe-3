# Pivot d’investigation – network_horizontal_port_scan_linux

## Pivot de départ
Point d’entrée : activité détectée par la règle `network_horizontal_port_scan_linux`.

## Questions clés
- Quelle machine est source / cible ?
- Activité légitime ou inconnue ?
- L’événement est-il isolé ou répétitif ?
- Quel est le niveau de privilège de l’utilisateur impliqué ?
- Y a-t-il des corrélations avec d’autres alertes ?

## SPL d’enrichissement
```spl
index=* <conditions liées à network_horizontal_port_scan_linux>
```

## Observables importants
- IP source / destination
- Processus parent / enfant
- Horodatage précis des événements
- Compte utilisateur impliqué
- Hash ou commande exécutée (si applicable)

## Menaces associées
- Reconnaissance
- Mouvement latéral
- Élévation de privilèges
- Exfiltration

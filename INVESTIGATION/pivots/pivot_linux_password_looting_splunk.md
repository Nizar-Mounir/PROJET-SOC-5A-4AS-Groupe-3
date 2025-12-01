# Pivot d’investigation – linux_password_looting_splunk

## Pivot de départ
Point d’entrée : activité détectée par la règle `linux_password_looting_splunk`.

## Questions clés
- Quelle machine est source / cible ?
- Activité légitime ou inconnue ?
- L’événement est-il isolé ou répétitif ?
- Quel est le niveau de privilège de l’utilisateur impliqué ?
- Y a-t-il des corrélations avec d’autres alertes ?

## SPL d’enrichissement
```spl
index=* <conditions liées à linux_password_looting_splunk>
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

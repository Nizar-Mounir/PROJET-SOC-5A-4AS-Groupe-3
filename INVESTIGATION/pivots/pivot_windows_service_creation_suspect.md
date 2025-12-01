# Pivot d’investigation – windows_service_creation_suspect

## Pivot de départ
Point d’entrée : activité détectée par la règle `windows_service_creation_suspect`.

## Questions clés
- Quelle machine est source / cible ?
- Activité légitime ou inconnue ?
- L’événement est-il isolé ou répétitif ?
- Quel est le niveau de privilège de l’utilisateur impliqué ?
- Y a-t-il des corrélations avec d’autres alertes ?

## SPL d’enrichissement
```spl
index=* <conditions liées à windows_service_creation_suspect>
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

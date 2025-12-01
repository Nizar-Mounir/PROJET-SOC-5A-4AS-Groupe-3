# Workflow d’investigation – linux_suspicious_download_commands

## Objectif
Décrire les étapes suivies par un analyste N1/N2 pour investiguer une alerte générée par `linux_suspicious_download_commands`.

## Étapes N1
1. Vérifier la sévérité initiale.
2. Identifier la machine source et son rôle.
3. Confirmer si l’activité est toujours en cours.
4. Extraire les IOC principaux (IP, hash, UID, processus).
5. Vérifier les faux positifs potentiels.

## Étapes N2
1. Analyse chronologique complète dans Splunk.
2. Corrélation avec :
   - logs système,
   - authentifications,
   - réseau,
   - exécutions de commandes.
3. Vérifier si l’utilisateur ou processus a effectué d’autres actions suspectes.
4. Identifier l’intention possible (reconnaissance, exploitation, persistance…).
5. Déterminer si l'incident doit être escaladé.

## Kill chain (si applicable)
- Reconnaissance → Exploitation → Mouvement latéral → Impact

## Conclusion
- L'activité est-elle légitime ?
- Incident confirmé ?
- Actions d’endiguement nécessaires ?

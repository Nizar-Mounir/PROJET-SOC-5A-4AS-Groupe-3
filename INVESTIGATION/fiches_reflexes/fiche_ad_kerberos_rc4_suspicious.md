# Fiche réflexe – ad_kerberos_rc4_suspicious

## Contexte
Détection générée par la règle `ad_kerberos_rc4_suspicious`. Une activité potentiellement malveillante a été identifiée par le SOC.

## Sévérité typique
Medium à High selon le contexte et l’environnement.

## Indicateurs clés
- IP source / destination
- Processus ou service impliqué
- Timestamp et fréquence des événements
- Utilisateur concerné (si applicable)

## Actions immédiates (N1)
1. Vérifier la légitimité de l’activité.
2. Identifier la machine source et l’utilisateur associé.
3. Confirmer si l’activité est encore en cours.
4. Escalader si comportement anormal confirmé.

## Analyse approfondie (N2)
1. Rechercher l’historique d’activité lié à l’IOC.
2. Corréler avec d’autres règles du SOC.
3. Vérifier mouvement latéral, tentatives d’accès ou privilèges élevés.
4. Examiner les journaux système et applicatifs.

## SPL complémentaires
```spl
index=* <conditions liées à la règle ad_kerberos_rc4_suspicious>
```

## Pivots d’investigation
- Adresse IP source / cible
- Événements liés à l’utilisateur
- Processus parent / enfant
- Patterns temporels

## Faux positifs courants
- Activité administrative ou automatisée
- Outils internes de scanning ou monitoring
- Scripts de maintenance

## Critères de qualification
- Activité répétée ou étendue ?
- Exécution sur des comptes sensibles ?
- Contextes inhabituels ou machines critiques ?

## Remédiations / recommandations client
- Restreindre les accès
- Durcir les configurations
- Mettre à jour les systèmes
- Surveiller les hôtes impactés

## Communication
- Interne : équipe SOC
- Externe : client si incident confirmé

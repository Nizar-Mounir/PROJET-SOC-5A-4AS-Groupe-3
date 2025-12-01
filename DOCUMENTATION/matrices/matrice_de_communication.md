# Matrice de notification SOC

| Sévérité | Acteurs à notifier                     | Canal                         | Délai                                   | Données transmises |
|----------|-----------------------------------------|-------------------------------|------------------------------------------|---------------------|
| **LOW** (🟩) | Analyste SOC → Équipe SOC               | Teams interne                  | N/A                                      | - Consignation interne uniquement<br>- Contexte<br>- Justification du FP<br>- Aucun contact client |
| **MEDIUM** (🟧) | Analyste SOC → Responsable SOC     | Teams interne                  | < 1h                                     | - Résumé technique<br>- Premiers pivots (process, logs clés)<br>- Aucun contact client |
| **HIGH** (🟥) | Analyste SOC → Responsable SOC → Client | Notification client par Email | Notification < 2h<br>Qualification < 4h | - Synthèse courte<br>- Impact potentiel<br>- Contexte temporel<br>- Menace probable<br>- Actions d’investigation en cours<br>- Risque métier associé |
| **CRITICAL** (🟥🟥) | Analyste SOC → Manager SOC → Client | Appel téléphonique immédiat + Email | Notification < 2h<br>Qualification < 4h | - Synthèse d’urgence<br>- Premiers IOC<br>- Hypothèse d’attaque active<br>- Actions immédiates recommandées |

# Dossier `documentation/` – Documentation SOC et livrables internes

Ce dossier regroupe l’ensemble de la documentation interne du SOC Mini AEGIS.  
Il sert de référence pour comprendre :

- L’architecture de supervision  
- Les procédures de détection et d’investigation  
- Les matrices de triage et de communication  
- Les retours d’expérience après la phase de RUN  

---

## Structure

```text
documentation/
├── architecture/
├── procedures/
├── matrices/
└── run_feedback/
```

---

## `architecture/`

Schémas et documents décrivant :

- L’architecture de supervision globale  
- Les flux de logs (endpoints → collecteur → Splunk)  
- Les composants SOC (Splunk, IRIS, n8n, bastion, VPN, etc.)  

Formats recommandés :

```text
architecture_supervision.drawio
flux_logs.png
architecture_soc.md
```

---

## `procedures/`

Procédures officielles utilisées par le SOC :

- Procédures de **détection** (comment sont gérées les alertes)  
- Procédures d’**investigation** (N1 → N2 → escalade)  
- Procédures d’**outillage (MCO / MCD)** de Splunk, n8n, IRIS…  
- Procédures d’**escalade** interne / client  
- Modèle de **rapport d’investigation**

Exemples :

```text
procedure_detection.md
procedure_investigation_high.md
procedure_mco_splunk.md
modele_rapport_investigation.md
```

---

## `matrices/`

Matrices opérationnelles utilisées par les analystes, par exemple :

- Matrice de **communication client** (qui prévenir, dans quels cas, par quel canal)  
- Matrice de **triage/priorisation** (sévérité, SLA, impact, urgence)  
- Matrice de **classification** des incidents (Low / Medium / High / Critical)

Exemples :

```text
matrice_triage.md
matrice_communication.md
```

---

## `run_feedback/`

Retour d’expérience sur le RUN :

- Erreurs de BUILD détectées pendant le RUN  
- Règles inefficaces ou trop bruyantes  
- Règles manquantes (à ajouter au jeu de détection)  
- Améliorations proposées pour l’outillage / procédures  

Exemple :

```text
retour_run_groupeX.md
```

---

## Convention de nommage

```text
<type>_<nom>.md
```

Exemples :

```text
procedure_investigation_lsass.md
matrice_communication.md
architecture_soc.png
```

---

## Bonnes pratiques

- Toute documentation doit être **compréhensible par un analyste N1**.  
- Faire référence aux dossiers `detection/`, `investigation/` et `automation/` lorsque pertinent.  
- Garder une logique d’**amélioration continue** :  
  - BUILD → RUN → `run_feedback/` → mise à jour des procédures / règles.

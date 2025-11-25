# Dossier `investigation/` – Pivots, workflows & fiches réflexes

Ce dossier contient l’ensemble des éléments nécessaires à l’investigation d’alertes par les analystes SOC.

Il constitue la base opérationnelle utilisée pendant le **RUN**.

---

## Objectifs du dossier

- Standardiser les **pivots d’investigation** par type de règle  
- Définir des **workflows d’investigation structurés**  
- Fournir des **fiches réflexes** pour les analystes N1/N2  
- Uniformiser les **méthodes d’analyse** au sein du SOC

---

## Structure du dossier

```text
investigation/
├── pivots/
├── workflows/
└── fiches_reflexes/
```

### `pivots/`

Contient les **pivots d’investigation** :

- Processus  
- Identifiants (User, SID)  
- Hash  
- Réseau (IP, ports, beaconing)  
- EventCode clé  
- Parent process → child process  

Format recommandé :

```text
pivot_dump_lsass.md
pivot_kerberoasting.md
```

Chaque fichier de pivot doit contenir :

- Pivot de départ  
- Questions à se poser  
- Requêtes SPL type pour l’analyse  
- Observations typiques  
- Menaces associées  

---

### `workflows/`

Workflows complets d’investigation :

- Diagrammes Draw.io  
- Étapes N1/N2  
- Analyse chronologique  
- Reconstruction de la kill chain  
- Qualification finale de l’incident  

Exemples :

```text
workflow_alerte_high.md
workflow_beaconing.drawio
workflow_kerberoasting.md
```

---

### `fiches_reflexes/`

Fiches d’action rapides pour les analystes lors de la détection d’un incident.

Format recommandé :

```text
fiche_dump_lsass.md
fiche_shadow_credentials.md
```

Chaque fiche doit contenir :

- Contexte de la détection  
- Niveau de sévérité typique  
- Actions immédiates (endiguement)  
- Analyses complémentaires à mener  
- Remédiations à proposer au client  
- Communication interne / externe  

---

## Convention de nommage

```text
<prefix>_<technique>.<ext>
```

Avec :  
`prefix` ∈ {`pivot`, `workflow`, `fiche`}  

Exemples :

```text
pivot_lateral_movement.md
workflow_account_compromise.md
fiche_ransomware_initial_access.md
```

---

## Bonnes pratiques

- Les pivots et workflows doivent faire référence au **jeu de règles du dossier `detection/`**.  
- Toute fiche réflexe doit inclure :  
  - Niveau de sévérité cible  
  - Checklist analyste N1  
  - Checklist analyste N2  
  - Actions client recommandées  
- L’ensemble doit être **utilisable pendant RUN sans ambiguïté** : un analyste doit pouvoir suivre les étapes sans contexte supplémentaire.

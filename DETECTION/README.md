# Dossier `detection/` – Règles de détection SOC

Ce dossier contient **l’ensemble du jeu de règles de détection** du SOC Mini AEGIS.  
Chaque règle doit être documentée, versionnée et testée dans l’environnement de BUILD.

---

## Objectif du dossier

- Centraliser **toutes les règles écrites en pseudo-Sigma** (YAML)  
- Centraliser les **recherches Splunk (SPL) et alertes savedsearches.conf**  
- Structurer les règles par **type de source** : Windows, Linux, AD, Réseau  
- Assurer une **cohérence de nommage**, une documentation propre et une maintenabilité  
- Permettre une **intégration directe** dans Splunk via `automation/splunk/`

---

## Structure du dossier

```text
detection/
├── windows/
├── linux/
├── active_directory/
├── network/
└── templates/
```

### `windows/`
Règles basées sur :
- Sysmon  
- Windows Security Log  
- EventCode  
- Processus suspects  
- Techniques MITRE (LOLBIN, dump LSASS, tâches planifiées)

### `linux/`
Règles basées sur :
- Kunai  
- journald  
- Comportements anormaux (énumérations, credential looting, kernel modules)

### `active_directory/`
Détections AD critiques :  
- Kerberoasting  
- AS-REProasting  
- Shadow Credentials  
- DCSync  
- Ajout aux groupes privilégiés

### `network/`
Détections réseau :
- Port scanning (horizontal/vertical)
- Beaconing C2
- Exfiltration
- DNS tunneling

### `templates/`
Modèles standardisés :
- Template Sigma  
- Template documentation de règle  
- Template SPL

---

## Structure d’une règle

Chaque règle doit contenir **trois fichiers** :

1. **Pseudo-Sigma**
   ```text
   ad_kerberoasting.yml
   ```
2. **SPL / savedsearches**  
   ```text
   ad_kerberoasting_splunk.conf
   ```
3. **Documentation**
   ```text
   ad_kerberoasting_doc.md
   ```

---

## Convention de nommage

Format recommandé :

```text
<os|ad|network>_<technique|comportement>_<détail>.<ext>
```

Exemples :

```text
windows_dump_lsass.yml
ad_shadow_credentials.yml
network_beaconing_splunk.conf
linux_password_looting_doc.md
```

---

## Contenu obligatoire dans la documentation d’une règle

Chaque fichier `*_doc.md` doit inclure :

- **Description de la règle**
- **Sources nécessaires (index, sourcetype, EventCode)**
- **Logique de détection**
- **Faux positifs possibles**
- **Mécanismes d’exclusion**
- **Sévérité**
- **Actions d’endiguement**
- **Remédiations**
- **Références MITRE ATT&CK**

---

## Remarques importantes

- **Ne jamais mettre de règles custom Sigma dans des convertisseurs en ligne.**  
- Toujours valider la règle sur **l’environnement de test** avant mise en prod.  
- Toute modification d’une règle doit faire l’objet d’un **commit clair** :

```text
fix(detection): ajustement exclusions Kerberoasting
```

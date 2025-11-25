# Dossier `automation/` – Automatisations Splunk, n8n, scripts

Ce dossier regroupe tout l’outillage technique utilisé pour automatiser le SOC :  

- Alertes Splunk  
- Workflows n8n  
- Scripts (Python/Bash, etc.)  

---

## Structure du dossier

```text
automation/
├── splunk/
├── n8n/
└── scripts/
```

---

## `splunk/` – Alertes & configuration

Ce sous-dossier contient :

- `savedsearches.conf` → définition des alertes Splunk  
- Fichiers de configuration Splunk annexes (`props.conf`, `transforms.conf`, etc.) si nécessaires  
- Dashboards XML (tableaux de bord d’investigation / de monitoring)  

Convention de nommage recommandée :

```text
<technique>_splunk.conf
```

Exemples :

```text
kerberoasting_splunk.conf
dump_lsass_splunk.conf
beaconing_cnc_splunk.conf
```

Objectif :  
Ce sous-dossier doit être **directement déployable** dans une app Splunk, par exemple :  

```text
$SPLUNK_HOME/etc/apps/insa_soc/local/
```

---

## `n8n/` – Workflows d’automatisation

Ce sous-dossier contient les **exports JSON des workflows n8n**.

Exemples :

```text
workflow_notification_client.json
workflow_ticket_IRIS.json
workflow_enrichissement_whois.json
```

Pour chaque workflow JSON, il est recommandé d’ajouter un fichier `.md` associé :

```text
workflow_notification_client.md
```

Ce fichier `.md` doit décrire :

- Le **déclencheur** (webhook, alerte Splunk, cron…)  
- Les **étapes principales** du workflow  
- Les **données d’entrée/sortie**  
- Le **canal de sortie** (Teams, email, ticketing, etc.)  

---

## `scripts/` – Scripts auxiliaires

Scripts utilisés par Splunk, n8n ou les analystes.  

Exemples :

```text
format_notification.py
normalize_log_fields.py
ioc_extractor.py
```

Bonnes pratiques :

- Documenter rapidement l’usage de chaque script en en-tête.  
- Ne jamais stocker de secrets, mots de passe ou tokens directement dans les scripts.  

---

## Convention de nommage globale

```text
<système>_<fonction>.<ext>
```

Exemples :

```text
splunk_beaconing.conf
n8n_notify_high.json
script_enrich_hash.py
```

---

## Bonnes pratiques

- Vérifier systématiquement la **validité syntaxique** des fichiers Splunk (`btool` si nécessaire).  
- Tester chaque workflow n8n dans l’instance de test avant de l’utiliser pour le client.  
- Centraliser ici **tout ce qui automatise** les actions SOC (remontée d’alertes, notifications, enrichissement, ticketing…).  

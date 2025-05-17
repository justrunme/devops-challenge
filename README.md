# DevOps Challenge – Monitoring-Stack

![CI](https://github.com/justrunme/devops-challenge/actions/workflows/ci.yml/badge.svg)

## 🚀 Schnellstart

### 1. Repository klonen

```bash
git clone git@github.com:justrunme/devops-challenge.git
cd devops-challenge
```

---

### 2. Stack starten

```bash
./start.sh
```

> Das Skript startet alle Container und wartet automatisch, bis **alle Services** (Spring Boot, Prometheus, Grafana) wirklich **verfügbar** sind.

---

⚡️ Alternativer Start direkt mit Docker Compose
Du kannst den Stack auch direkt mit Docker Compose starten — ohne Skript:

docker compose up -d
Danach ggf. etwas warten, bis alle Services bereit sind.
Stoppen wie gewohnt mit:
docker compose down


### 3. Was passiert automatisch?

* **Dashboards werden provisioniert** – kein manuelles Importieren mehr nötig.
* **Grafana Data Source** (Prometheus) wird **automatisch angelegt** – keine Handarbeit.
* **Dashboards greifen sofort auf die Daten zu.**
  Alles ist *out of the box* nach dem Start sichtbar.

---

### 4. Zugriff auf die UIs

* **Spring Boot Metrics:** [http://localhost:8080/actuator/prometheus](http://localhost:8080/actuator/prometheus)
* **Prometheus:** [http://localhost:9090/](http://localhost:9090/)
* **Grafana:** [http://localhost:3000/](http://localhost:3000/)
  Login: `admin` / `admin`

---

### 5. Stack stoppen

```bash
docker-compose down
```

---

## 💡 Features

* **Vollautomatisiert:** Kein manuelles Setup in Grafana notwendig.
* Skript prüft die Erreichbarkeit der Services (mit Pausen, wenn nötig).
* **Dashboards und Data Sources** werden direkt verknüpft.
* **Ready to use** für Monitoring, Tests oder Demo.

---

## 🧪 Automatisierte Tests (GitHub Actions)

Dieses Repository enthält eine **vollautomatische CI-Pipeline** mit GitHub Actions:

* **Baut das Spring Boot Projekt** und führt Unit Tests aus (`mvn test`).
* **Startet den gesamten Monitoring-Stack** (`docker compose up`) in der Testumgebung.
* **Prüft die Verfügbarkeit der benutzerdefinierten Prometheus-Metrik** `custom_random_metric` – es wird automatisch überprüft, ob die Metrik nach dem Start tatsächlich geliefert wird.
* Nach dem Testlauf werden alle Container wieder sauber gestoppt.

> Das garantiert, dass das Monitoring-Setup **immer funktioniert** und die wichtigsten Metriken direkt nach dem Start bereitstehen.

---

**Beispiel:**
Alle Checks werden bei jedem Push und Pull Request auf den Branch `main` automatisch durchlaufen.


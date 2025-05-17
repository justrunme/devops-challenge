# DevOps Challenge – Monitoring-Stack

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

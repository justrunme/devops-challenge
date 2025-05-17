# DevOps Challenge – Monitoring-Stack

## Schnellstart

1. **Repository klonen**
   ```bash
   git clone <DEIN-REPO>
   cd <DEIN-REPO>
````

2. **Stack starten**

   ```bash
   ./start.sh
   ```

   > Das Skript startet alle Container und wartet automatisch, bis alle Dienste (Spring Boot, Prometheus, Grafana) **erreichbar** sind.
   > Erst wenn alles bereit ist, wird der nächste Schritt ausgeführt.

3. **Was passiert automatisch?**

   * **Alle Dashboards** werden beim Start **automatisch provisioniert** (kein manuelles Importieren nötig).
   * Die Verbindung von Grafana zu Prometheus (**Data Source**) wird **selbstständig angelegt** – es ist **keine** manuelle Konfiguration mehr nötig.
   * Die Dashboards greifen **direkt auf die richtigen Datenquellen** zu, alles ist “out-of-the-box” nach dem Start sichtbar.

4. **Zugriff auf die UIs**

   * Spring Boot: [http://localhost:8080/actuator/prometheus](http://localhost:8080/actuator/prometheus)
   * Prometheus: [http://localhost:9090/](http://localhost:9090/)
   * Grafana: [http://localhost:3000/](http://localhost:3000/)
     Login: **admin** / **admin**

5. **Stoppen**

   ```bash
   docker-compose down
   ```

---

**Features:**

* **Komplett automatisiert**: Keine händische Einrichtung in Grafana notwendig.
* Das Skript prüft beim Start, ob alle Services erreichbar sind (inkl. Pausen/Waits für Container-Startup).
* Dashboards und Data Source werden automatisch erstellt und verknüpft.
* **Sofort einsatzbereit** für Monitoring und Demo.


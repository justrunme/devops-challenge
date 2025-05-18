#!/bin/bash

# Überprüfe ob Maven installiert ist, installiere falls nicht (nur für macOS mit brew)
if ! command -v mvn &> /dev/null; then
  echo "===> Maven wird installiert (brew benötigt)..."
  if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew nicht gefunden. Bitte installiere Homebrew: https://brew.sh/"
    exit 1
  fi
  brew install maven
fi

# Rechte für Skripte setzen (falls notwendig)
chmod +x start.sh || true

# Spring Boot App bauen
echo "===> Baue die Spring Boot Anwendung..."
cd spring-app
mvn clean package -DskipTests
cd ..

# Docker Compose starten und bauen
echo "===> Starte docker compose..."
docker compose up -d --build

# Funktion: Warte auf HTTP-Service (max. 15x 2 Sekunden)
wait_for_service() {
  local url=$1
  local max_retries=15
  local retry=0
  until [[ $retry -ge $max_retries ]]
  do
    if curl -sf "$url" > /dev/null; then
      return 0
    fi
    ((retry++))
    sleep 2
  done
  return 1
}

echo "===> Überprüfe Verfügbarkeit der Services:"

# Spring Boot prüfen
echo -n "⏳ Spring Boot..."
if wait_for_service "http://localhost:8080/actuator/health"; then
  echo " ✅ Spring Boot läuft (http://localhost:8080/actuator/health)"
else
  echo " ❌ Spring Boot läuft NICHT"
fi

# Prometheus prüfen
echo -n "⏳ Prometheus..."
if wait_for_service "http://localhost:9090"; then
  echo " ✅ Prometheus läuft (http://localhost:9090)"
else
  echo " ❌ Prometheus läuft NICHT"
fi

# Grafana prüfen
echo -n "⏳ Grafana..."
if wait_for_service "http://localhost:3000"; then
  echo " ✅ Grafana läuft (http://localhost:3000)"
else
  echo " ❌ Grafana läuft NICHT"
fi

echo ""
echo "===> Alles ist fertig! Zugänge:"
echo "  Spring Boot: http://localhost:8080/actuator/health"
echo "  Prometheus:  http://localhost:9090"
echo "  Grafana:     http://localhost:3000 (Login: admin/admin)"

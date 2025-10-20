# ============================================================
# sql-chipi-case: Makefile para Windows (PowerShell)
# Gestiona la base de datos PostgreSQL del proyecto
# ============================================================

.PHONY: help setup initdb schema seed clean reset check-day0 check-day1 check-day2 check-day3 check-day4 check-all check-psql solutions-apply solutions-drop check-coherence check-all-with-solutions

# Variables
DB_NAME=chipi_case
DB_USER=postgres
DB_HOST=localhost
DB_PORT=5432

# Auto-detectar PSQL (puedes sobreescribir con: make setup PSQL="C:\ruta\psql.exe")
PSQL ?= $(shell powershell -Command "$$psql = Get-Command psql -ErrorAction SilentlyContinue; if ($$psql) { $$psql.Source } else { (Get-ChildItem 'C:\Program Files\PostgreSQL' -Recurse -Filter psql.exe -ErrorAction SilentlyContinue | Select-Object -First 1).FullName }")

# Verificar que PSQL exista
check-psql:
	@powershell -Command "if ('$(PSQL)' -eq '' -or -not (Test-Path '$(PSQL)' -ErrorAction SilentlyContinue)) { Write-Host '[ERROR] No se encontro psql.exe' -ForegroundColor Red; Write-Host ''; Write-Host 'Soluciones:' -ForegroundColor Yellow; Write-Host '  1. Agrega PostgreSQL al PATH del sistema' -ForegroundColor Cyan; Write-Host '  2. O ejecuta: make setup PSQL=\"C:\ruta\a\psql.exe\"' -ForegroundColor Cyan; Write-Host ''; exit 1 } else { Write-Host '[OK] psql encontrado en: $(PSQL)' -ForegroundColor Green }"

# Colores (solo visibles en terminales con soporte ANSI)
GREEN=\033[0;32m
BLUE=\033[0;34m
RED=\033[0;31m
NC=\033[0m # No Color

help:
	@echo "============================================================"
	@echo "  sql-chipi-case: Base de datos del secuestro de Chipi"
	@echo "============================================================"
	@echo ""
	@echo "SETUP:"
	@echo "  make setup    - Crear DB, esquema y cargar datos"
	@echo "  make reset    - Borrar y recrear todo"
	@echo ""
	@echo "MANTENIMIENTO:"
	@echo "  make clean    - Borrar la base de datos"
	@echo ""
	@echo "VALIDACION (Despues de cada reto):"
	@echo "  make check-day0  - Validar Warmup"
	@echo "  make check-day1  - Validar Reto 1"
	@echo "  make check-day2  - Validar Reto 2"
	@echo "  make check-day3  - Validar Reto 3 (OPCIONAL)"
	@echo "  make check-day4  - Validar Reto 4 (FINAL)"
	@echo "  make check-all   - Validar todo"
	@echo ""
	@echo "CONFIGURACION:"
	@echo "  \$$env:PGPASSWORD=\"tu_password\""
	@echo "  make setup PSQL=\"C:\ruta\a\psql.exe\"  (si no esta en PATH)"
	@echo ""
	@echo "Ejemplo:"
	@echo "  \$$env:PGPASSWORD=\"postgres\""
	@echo "  make setup"
	@echo "  make check-day1"
	@echo ""

initdb: check-psql
	@echo "[1/3] Creando base de datos $(DB_NAME)..."
	"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -c "DROP DATABASE IF EXISTS $(DB_NAME);" 2>nul || echo "DB no existia."
	"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -c "CREATE DATABASE $(DB_NAME);" 
	@echo "[OK] Base de datos $(DB_NAME) creada."

schema: check-psql
	@echo "[2/3] Ejecutando esquema (00_schema.sql)..."
	"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/00_schema.sql
	@echo "[2.5/3] Cargando funciones (02_functions.sql)..."
	"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/02_functions.sql
	@echo "[OK] Tablas y funciones creadas."

seed: check-psql
	@echo "[3/3] Insertando datos iniciales (01_seed.sql)..."
	"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/01_seed.sql
	@echo "[OK] Datos cargados."

clean: check-psql
	@echo "Borrando base de datos $(DB_NAME)..."
	"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -c "DROP DATABASE IF EXISTS $(DB_NAME);"
	@echo "[OK] Base de datos eliminada."

reset: clean setup
	@echo "[OK] Base de datos reiniciada y cargada."

check-day0: check-psql
	@echo "Validando Day 0 (Warmup)..."
	@"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day0_checks.sql

check-day1: check-psql
	@echo "Validando Day 1..."
	@"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day1_checks.sql

check-day2: check-psql
	@echo "Validando Day 2..."
	@"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day2_checks.sql

check-day3: check-psql
	@echo "Validando Day 3 (OPCIONAL)..."
	@"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day3_checks.sql

check-day4: check-psql
	@echo "Validando Day 4 (FINAL)..."
	@"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day4_checks.sql

check-all: check-day0 check-day1 check-day2 check-day3 check-day4
	@echo ""
	@echo "[OK] TODAS LAS VALIDACIONES COMPLETADAS"

# ============================================================
# TARGETS DE INSTRUCTOR (no documentados en help público)
# ============================================================

solutions-apply: check-psql
	@echo "Aplicando soluciones (privadas, local)..."
	@"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f instructor/solutions/apply_all.sql

solutions-drop: check-psql
	@echo "Eliminando vistas de soluciones..."
	@"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f instructor/solutions/drop_all.sql

check-coherence: check-psql
	@echo "Coherence check (estructural, amable)..."
	@"$(PSQL)" -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f instructor/tests/coherence.sql

check-all-with-solutions:
	@echo "Validacion completa CON soluciones aplicadas..."
	@echo ""
	@$(MAKE) solutions-apply
	@echo ""
	@$(MAKE) check-day0
	@$(MAKE) check-day1
	@$(MAKE) check-day2
	@-$(MAKE) check-day3
	@$(MAKE) check-day4
	@echo ""
	@$(MAKE) check-coherence
	@echo ""
	@$(MAKE) solutions-drop
	@echo ""
	@echo "[OK] VALIDACION COMPLETA CON SOLUCIONES FINALIZADA"

setup:
	@echo "Inicializando base de datos chipi_case..."
	@$(MAKE) initdb
	@$(MAKE) schema
	@$(MAKE) seed
	@echo ""
	@echo "============================================================"
	@echo ""
	@echo "      PROYECTO SQL-CHIPI-CASE - COMPLETADO EXITOSAMENTE"
	@echo ""
	@echo "============================================================"
	@echo "RESUMEN:"
	@echo "   Estado: LISTO PARA USAR"
	@echo "   Base: chipi_case (PostgreSQL)"
	@echo "   Tablas: 11 (Day 0-4 completos)"
	@echo "   Retos: day0 warmup -> day4 final"
	@echo "   Misterio: Descubre quien secuestro a Chipi"
	@echo "============================================================"
	@echo "COMIENZA EN:"
	@echo "   1. Abre DBeaver"
	@echo "   2. Conecta a chipi_case"
	@echo "   3. Abre challenges/day0_warmup.md (o day1 si ya sabes SQL)"
	@echo "============================================================"
	@echo ""

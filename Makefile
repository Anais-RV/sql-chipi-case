# ============================================================
# sql-chipi-case: Makefile para Windows (PowerShell)
# Gestiona la base de datos PostgreSQL del proyecto
# ============================================================

.PHONY: help setup initdb schema seed clean reset check-day0 check-day1 check-day2 check-day3 check-day4 check-all

# Variables
DB_NAME=chipi_case
DB_USER=postgres
DB_HOST=localhost
DB_PORT=5432

# Colores (solo visibles en terminales con soporte ANSI)
GREEN=\033[0;32m
BLUE=\033[0;34m
RED=\033[0;31m
NC=\033[0m # No Color

help:
	@echo "╔════════════════════════════════════════════════════════╗"
	@echo "║  sql-chipi-case: Base de datos del secuestro de Chipi  ║"
	@echo "╚════════════════════════════════════════════════════════╝"
	@echo ""
	@echo "🔧 SETUP:"
	@echo "  make setup    → Crear DB, esquema y cargar datos"
	@echo "  make reset    → Borrar y recrear todo"
	@echo ""
	@echo "🧹 MANTENIMIENTO:"
	@echo "  make clean    → Borrar la base de datos"
	@echo ""
	@echo "✅ VALIDACIÓN (Después de cada reto):"
	@echo "  make check-day0  → Validar Warmup"
	@echo "  make check-day1  → Validar Reto 1"
	@echo "  make check-day2  → Validar Reto 2"
	@echo "  make check-day3  → Validar Reto 3 (OPCIONAL)"
	@echo "  make check-day4  → Validar Reto 4 (FINAL)"
	@echo "  make check-all   → Validar todo"
	@echo ""
	@echo "Ejemplo:"
	@echo "  \$$env:PGPASSWORD=\"postgres\""
	@echo "  make setup"
	@echo "  make check-day1"
	@echo ""

initdb:
	@echo "[1/3] Creando base de datos $(DB_NAME)..."
	psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -c "DROP DATABASE IF EXISTS $(DB_NAME);" 2>/dev/null || echo "DB no existía."
	psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -c "CREATE DATABASE $(DB_NAME);" 
	@echo "✓ Base de datos $(DB_NAME) creada."

schema:
	@echo "[2/3] Ejecutando esquema (00_schema.sql)..."
	psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/00_schema.sql
	@echo "[2.5/3] Cargando funciones (02_functions.sql)..."
	psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/02_functions.sql
	@echo "✓ Tablas y funciones creadas."

seed:
	@echo "[3/3] Insertando datos iniciales (01_seed.sql)..."
	psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/01_seed.sql
	@echo "✓ Datos cargados."

clean:
	@echo "🧹 Borrando base de datos $(DB_NAME)..."
	psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -c "DROP DATABASE IF EXISTS $(DB_NAME);"
	@echo "✓ Base de datos eliminada."

reset: clean setup
	@echo "✓ Base de datos reiniciada y cargada."

check-day0:
	@echo "🔍 Validando Day 0 (Warmup)..."
	@psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day0_checks.sql

check-day1:
	@echo "🔍 Validando Day 1..."
	@psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day1_checks.sql

check-day2:
	@echo "🔍 Validando Day 2..."
	@psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day2_checks.sql

check-day3:
	@echo "🔍 Validando Day 3 (OPCIONAL)..."
	@psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day3_checks.sql

check-day4:
	@echo "🔍 Validando Day 4 (FINAL)..."
	@psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/tests/day4_checks.sql

check-all: check-day0 check-day1 check-day2 check-day3 check-day4
	@echo ""
	@echo "✅ ¡TODAS LAS VALIDACIONES COMPLETADAS! 🎉"

# ============================================================
# TARGETS DE INSTRUCTOR (no documentados en help público)
# ============================================================

solutions-apply:
	@echo "🧩 Aplicando soluciones (privadas, local)..."
	@psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f instructor/solutions/apply_all.sql

solutions-drop:
	@echo "🧹 Eliminando vistas de soluciones..."
	@psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f instructor/solutions/drop_all.sql

check-coherence:
	@echo "🔍 Coherence check (estructural, amable)..."
	@psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f instructor/tests/coherence.sql

check-all-with-solutions:
	@echo "🧪 Validación completa CON soluciones aplicadas..."
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
	@echo "✅ ¡VALIDACIÓN COMPLETA CON SOLUCIONES FINALIZADA! 🎉"

setup:
	@echo "🔄 Inicializando base de datos chipi_case..."
	@$(MAKE) initdb
	@$(MAKE) schema
	@$(MAKE) seed
	@echo ""
	@echo "╔══════════════════════════════════════════════════════════════════╗"
	@echo "║                                                                  ║"
	@echo "║      ✅ PROYECTO SQL-CHIPI-CASE - COMPLETADO EXITOSAMENTE      ║"
	@echo "║                                                                  ║"
	@echo "╚══════════════════════════════════════════════════════════════════╝"
	@echo "📊 RESUMEN:"
	@echo "   ✅ Estado: LISTO PARA USAR"
	@echo "   💾 Base: chipi_case (PostgreSQL)"
	@echo "   🧱 Tablas: 11 (Day 0-4 completos)"
	@echo "   🎯 Retos: day0 warmup → day4 final"
	@echo "   🕵️ Misterio: ¡Descubre quién secuestró a Chipi!"
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo "🚀 COMIENZA EN:"
	@echo "   1. Abre DBeaver"
	@echo "   2. Conecta a chipi_case"
	@echo "   3. Abre challenges/day0_warmup.md (o day1 si ya sabes SQL)"
	@echo "═══════════════════════════════════════════════════════════════════"
	@echo ""

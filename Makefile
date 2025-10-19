# ============================================================
# sql-chipi-case: Makefile para Windows (PowerShell)
# Gestiona la base de datos PostgreSQL del proyecto
# ============================================================

.PHONY: help setup initdb schema seed clean reset

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
	@echo "Comandos disponibles:"
	@echo "  make setup    → Crear DB, esquema y cargar datos"
	@echo "  make initdb   → Crear/recrear la base de datos"
	@echo "  make schema   → Crear tablas (esquema)"
	@echo "  make seed     → Insertar datos iniciales"
	@echo "  make clean    → Borrar la base de datos"
	@echo "  make reset    → Borrar y recrear todo (clean + setup)"
	@echo ""
	@echo "Ejemplo:"
	@echo "  \$$env:PGPASSWORD=\"postgres\""
	@echo "  make setup"
	@echo ""

initdb:
	@echo "[1/3] Creando base de datos $(DB_NAME)..."
	psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -c "DROP DATABASE IF EXISTS $(DB_NAME);" 2>/dev/null || echo "DB no existía."
	psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -c "CREATE DATABASE $(DB_NAME);" 
	@echo "✓ Base de datos $(DB_NAME) creada."

schema:
	@echo "[2/3] Ejecutando esquema (00_schema.sql)..."
	psql -h $(DB_HOST) -U $(DB_USER) -p $(DB_PORT) -d $(DB_NAME) -f db/00_schema.sql
	@echo "✓ Tablas creadas."

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

setup:
	@echo "🔄 Inicializando base de datos chipi_case..."
	@$(MAKE) initdb
	@$(MAKE) schema
	@$(MAKE) seed
	@powershell -Command "Write-Host @'
╔══════════════════════════════════════════════════════════════════╗
║                                                                  ║
║      ✅ PROYECTO SQL-CHIPI-CASE - COMPLETADO EXITOSAMENTE      ║
║                                                                  ║
╚══════════════════════════════════════════════════════════════════╝
📊 RESUMEN:
   ✅ Estado: LISTO PARA USAR
   💾 Base: chipi_case (PostgreSQL)
   🧱 Tablas: 8
   🎯 Retos: day1_select_basics + day2_joins_analysis
   🕵️ Misterio: ¡Descubre quién secuestró a Chipi!
═══════════════════════════════════════════════════════════════════
🚀 COMIENZA EN:
   1. Abre DBeaver
   2. Conecta a chipi_case
   3. Abre challenges/day1_select_basics.md
═══════════════════════════════════════════════════════════════════
'@ -ForegroundColor Cyan"

# 🎯 ¡Comienza Aquí Tu Aventura!

> Chipi ha sido secuestrada. Tú eres el investigador. SQL es tu herramienta.

---

## 🚀 Inicio Rápido

¿Primera vez? Empieza aquí:

1. **[Instalación](01_instalacion.md)** - Configurar PostgreSQL, Make y DBeaver
2. **[Cómo Crear Vistas](02_como-crear-vistas.md)** - Tutorial paso a paso con ejemplos
3. **[Comandos Make](03_comandos.md)** - Referencia rápida de comandos

---

## 📖 Guías por Tema

### Instalación y Setup
- **[Guía de Instalación](01_instalacion.md)** - PostgreSQL, Make, DBeaver
- **[Comandos Make](03_comandos.md)** - `make setup`, `make reset`, `make check-day1`

### Trabajar con SQL
- **[Cómo Crear Vistas](02_como-crear-vistas.md)** - Ejemplos paso a paso
- **[SQL Cheatsheet](05_sql-cheatsheet.md)** - SELECT, JOIN, GROUP BY, CTEs

### Ayuda y Resolución de Problemas
- **[Problemas Comunes](06_problemas-comunes.md)** - "psql not found", "password failed", etc.

---

## 🗺️ Flujo de Trabajo Típico

### 1. Setup Inicial (solo una vez)

```powershell
$env:PGPASSWORD="postgres"
make setup
```

### 2. Abrir DBeaver y Conectar

- Host: `localhost`
- Puerto: `5432`
- Database: `chipi_case`
- Usuario: `postgres`

### 3. Resolver Retos

Abre los archivos en orden:
- `challenges/day0_warmup.md` (opcional)
- `challenges/day1_select_basics.md`
- `challenges/day2_joins_analysis.md`
- `challenges/day3_window_functions.md` (opcional)
- `challenges/day4_final.md`

### 4. Crear Vistas con tus Soluciones

```sql
-- Ejemplo: Day 1 - Reto 1
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT nombre, turno FROM alumnos;
```

Ver guía completa: **[Cómo Crear Vistas](02_como-crear-vistas.md)**

### 5. Validar Soluciones

```powershell
make check-day1  # Valida Day 1
make check-day2  # Valida Day 2
# etc.
```

---

## 📋 Documentos de Referencia

### Estructura de la Base de Datos
- **[Schema Reference](04_schema-reference.md)** - Todas las tablas, columnas y diagramas ER

### Historia del Caso
- **[Nota de Secuestro](../lore/nota_secuestro.txt)** - Contexto del misterio
- **[Lore Summary](../lore/LORE_SUMMARY.md)** - Historia completa

---

## ❓ Preguntas Frecuentes

### "¿Dónde escribo mis queries?"

En DBeaver. Lee: **[Cómo Crear Vistas](02_como-crear-vistas.md)**

### "¿Cómo valido mis soluciones?"

```powershell
make check-day1  # Después de resolver Day 1
```

### "¿Qué hago si `psql` no funciona?"

Lee: **[Problemas Comunes](06_problemas-comunes.md)**

### "¿Cómo reseteo la base de datos?"

```powershell
make reset  # Borra y recrea todo
```

---

## 🎯 Objetivo del Proyecto

Descubre **quién secuestró a Chipi** usando solo SQL.

**Pista:** El código de rescate tiene 6 caracteres... ¡búscalo en la base de datos!

---

## 📞 Recursos Adicionales

- **[README Principal](../README.md)** - Visión general del proyecto en GitHub

---

**¡Buena suerte rescatando a Chipi!** 🐕

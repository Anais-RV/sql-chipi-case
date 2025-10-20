# 🐼 sql-chipi-case

> **Un proyecto educativo para enseñar SQL resolviendo un misterio.**

Chipi, la mascota de **SuperKode**, ha sido secuestrada el 19 de octubre a las **02:13**. Los alumnos del bootcamp deben usar **SQL** para resolver pistas y descubrir quién fue.

---

## 📖 Contexto

El 19 de octubre de 2025, a las **02:13**, Chipi desapareció de la oficina de SuperKode.

**Los sospechosos:**
- 🛠️ **Cris** (formadora): "Fue el router. Siempre es el router."
- 🔧 **Andrea** (formadora): "El pipeline está roto."
- 📊 **Yeraldín** (formadora): "Revisar los commits."
- 🦆 **Mamá Pato** (formadora): "Yo no fui. *quack quack*"

**Los investigadores: TÚ y tus compañeros del bootcamp SuperKode.**

---

## 🎯 Objetivo

Practicar **SQL** resolviendo un caso misterioso:

- ✅ **SELECT** básico: listar datos
- ✅ **JOIN**: conectar tablas relacionadas
- ✅ **WHERE**: filtrar información
- ✅ **GROUP BY**: analizar datos
- ✅ **CTEs** y **Window Functions**: consultas avanzadas

---

## 📋 Requisitos

Antes de empezar, asegúrate de tener:

- **PostgreSQL 16+** instalado
- **psql** disponible en tu PATH (o usa `make setup PSQL="ruta\a\psql.exe"`)
- **Make** instalado (viene con Git for Windows)
- **DBeaver** o cualquier cliente SQL

> 🚀 **¿Primera vez?** Lee [`QUICKSTART.md`](QUICKSTART.md) para configurar todo en 5 minutos.
- **DBeaver** (opcional pero recomendado)

---

## 🚀 Instalación y Setup

> **📖 Guía rápida:** Lee [`QUICKSTART.md`](QUICKSTART.md) para instrucciones detalladas de instalación.

### Configurar PostgreSQL

```powershell
$env:PGPASSWORD="postgres"
```

### Inicializar base de datos

```powershell
make setup
```

Esto creará la base de datos `chipi_case` con todas las tablas y datos.

---

## 🎮 Los Retos

### Día 0: Calentamiento (OPCIONAL)

**Si nunca has visto SQL, empieza aquí.**

Abre **`challenges/day0_warmup.md`** y haz 4 retos ultra-básicos sin JOINs.

---

### Día 1: SELECT Basics

Abre **`challenges/day1_select_basics.md`** y resuelve 5 retos + 1 bonus.

**Conceptos:** SELECT, FROM, WHERE, JOIN, ORDER BY, LIMIT

Valida con: `make check-day1`

### Día 2: JOINs y Análisis

Abre **`challenges/day2_joins_analysis.md`** y resuelve 4 retos + 1 bonus.

**Conceptos:** GROUP BY, COUNT, STRING_AGG, UNION, HAVING

Valida con: `make check-day2`

### Día 3: CTEs y Window Functions (OPCIONAL)

Abre **`challenges/day3_window_functions.md`** para retos avanzados.

**Conceptos:** WITH (CTEs), ROW_NUMBER, PARTITION BY

Valida con: `make check-day3`

### 📅 Día 4: Revelación Final (Optativo pero épico 🎉)

Abre **`challenges/day4_final.md`** para resolver el misterio completo.

**Conceptos:** Integración total (JOINs + CTEs + Window Functions + PL/pgSQL)

**Entregables:**
- Vista `solve_d4_reveal` con 4 columnas: `sospechoso`, `motivo`, `ubicacion_final`, `codigo_rescate`
- Llamada exitosa: `SELECT unlock_chipi(codigo_rescate) FROM solve_d4_reveal;`

**Script Python (opcional):**
```powershell
pip install psycopg
python final/reveal.py
```

Valida con: `make check-day4`

---

## 📊 Acceder a la Base de Datos

### Con DBeaver (recomendado)

1. Abre DBeaver
2. `Database` → `New Database Connection` → PostgreSQL
3. Completa:
   - Host: `localhost`
   - Port: `5432`
   - Database: `chipi_case`
   - Username: `postgres`
   - Password: `postgres`

### Con psql (línea de comandos)

```powershell
$env:PGPASSWORD="postgres"
psql -h localhost -U postgres -d chipi_case
```

---

## 📝 ¿Cómo entregar los retos?

Para cada reto, **crea una vista SQL** con el nombre exacto:

```sql
CREATE VIEW solve_d1_r1 AS
SELECT ...
```

Valida tu trabajo con:

```powershell
make check-day1
```

---

## 🗄️ Tablas Principales

- **`equipos`** - Equipos del bootcamp
- **`alumnos`** - Alumnos (13 registros)
- **`commits`** - Commits hechos por alumnos
- **`cafe_ordenes`** - Órdenes de café
- **`discord_logs`** - Mensajes en Discord
- **`dispositivos`** - Dispositivos asignados
- **`ubicaciones`** - Ubicaciones
- **`pistas`** - Pistas criptográficas

---

## 🧭 Comandos Útiles

```powershell
make setup         # Setup inicial
make check-day1    # Validar Day 1
make check-day2    # Validar Day 2
make check-day3    # Validar Day 3 (opcional)
make check-all     # Validar todo
make reset         # Reiniciar todo
make help          # Ver ayuda
```

---

## 💡 Consejos

- No hay prisa. Tómate el tiempo que necesites.
- Lee la pista varias veces si el reto es difícil.
- Consulta la estructura de las tablas antes de escribir queries.
- Day 3 es opcional: enfócate primero en Day 1 y Day 2.

---

*Mamá Pato 🦆 sigue negando. Cris sigue culpando al router. Tú tienes SQL. ¡A investigar! 🕵️*
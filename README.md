# 🐼 sql-chipi-case

> **Un proyecto educativo para enseñar SQL resolviendo un misterio.**

<div align="center">
  <img src="assets/WANTED.png" alt="WANTED: Chipi - Contacto: David Vaamonde" width="400">
</div>

Chipi, la mascota de **SuperKode**, ha sido secuestrada el 19 de octubre a las **02:13**. Los alumnos del bootcamp deben usar **SQL** para resolver pistas y descubrir quién fue.

---

## 📜 Sobre este Proyecto

**Creado por:** [Anaïs Rodríguez Villanueva](https://github.com/Anais-RV)  
**Propósito:** Recurso educativo gratuito para aprender SQL de forma práctica y divertida  
**Tiempo de desarrollo:** Creado en mi tiempo libre personal con dedicación y cariño 💜

> ⚠️ **Nota importante:** Este material es de uso libre para fines educativos. Si lo utilizas en tu clase, bootcamp o curso, **agradecería enormemente que menciones la autoría**. Es una forma de reconocer el trabajo que hay detrás y me motiva a seguir creando recursos como este.
>
> **¿Lo estás usando?** ¡Me encantaría saberlo! Puedes:
> - ⭐ Darle una estrella al repo
> - 🐦 Mencionarme en redes sociales
> - 💬 Contarme cómo te fue usándolo
>
> **Licencia:** MIT License - Libre para usar, modificar y compartir (con atribución)

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

> 🎯 **[¡COMIENZA TU AVENTURA AQUÍ! →](docs/00_COMIENZA_AQUI.md)**

---

## 🚀 Instalación y Setup

> **📖 Guía completa:** [docs/instalacion.md](docs/instalacion.md)

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

## 📝 ¿Cómo resolver los retos?

Para cada reto, **crea una vista SQL** con el nombre exacto:

```sql
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT nombre, equipo, turno
FROM alumnos ...
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

Ver esquema completo: **[docs/04_schema-reference.md](docs/04_schema-reference.md)**

---

## 🧭 Recursos y Ayuda

### 🆘 ¿Atascado en un Reto?
- 📋 **[AYUDA_ANTI_BLOQUEOS/INDICE.md](AYUDA_ANTI_BLOQUEOS/INDICE.md)** - Guías paso a paso sin dar soluciones
- 🔰 **[Day 0: Warmup](AYUDA_ANTI_BLOQUEOS/day0_guia.md)** - SELECT, WHERE, GROUP BY básico
- 📘 **[Day 1: SELECT Basics](AYUDA_ANTI_BLOQUEOS/day1_guia.md)** - JOINs, filtros, ORDER BY
- 📗 **[Day 2: JOINs y Análisis](AYUDA_ANTI_BLOQUEOS/day2_guia.md)** - Agregaciones, STRING_AGG, UNION
- 📙 **[Day 3: CTEs y Window Functions](AYUDA_ANTI_BLOQUEOS/day3_guia.md)** - WITH, ROW_NUMBER, PARTITION BY
- 📕 **[Day 4: Revelación Final](AYUDA_ANTI_BLOQUEOS/day4_guia.md)** - CTEs complejos, CROSS JOIN

### Documentación Completa
- 🎯 **[docs/00_COMIENZA_AQUI.md](docs/00_COMIENZA_AQUI.md)** - Índice principal (¡empieza aquí!)
- 📖 **[docs/02_como-crear-vistas.md](docs/02_como-crear-vistas.md)** - Tutorial paso a paso
- 🔧 **[docs/03_comandos.md](docs/03_comandos.md)** - Referencia de comandos make
- 📊 **[docs/04_schema-reference.md](docs/04_schema-reference.md)** - Estructura de tablas
- 🆘 **[docs/05_sql-cheatsheet.md](docs/05_sql-cheatsheet.md)** - Cheatsheet SQL
- ⚠️ **[docs/06_problemas-comunes.md](docs/06_problemas-comunes.md)** - Troubleshooting

### Comandos Rápidos
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

- 🕒 No hay prisa. Tómate el tiempo que necesites.
- 📖 Lee la pista varias veces si el reto es difícil.
- 📊 Consulta la estructura de las tablas antes de escribir queries.
- 🧙 Day 3 es opcional: enfócate primero en Day 1 y Day 2.
- 🆘 **Si te atascas, usa las [Guías Anti-Bloqueos](AYUDA_ANTI_BLOQUEOS/INDICE.md)** - te ayudan a pensar sin darte la solución.

---

## 📜 Créditos y Licencia

**Creado por:** [Anaïs Rodríguez Villanueva](https://github.com/Anais-RV) 💜

Este proyecto es **gratuito y de código abierto** (MIT License). Puedes usarlo, modificarlo y compartirlo libremente.

**Si lo usas en tu clase o bootcamp, por favor menciona la autoría.** Es la forma de reconocer el trabajo y motivar a crear más recursos educativos gratuitos.

Ver detalles completos: **[CREDITS.md](CREDITS.md)**

---

*Mamá Pato 🦆 sigue negando. Cris sigue culpando al router. Tú tienes SQL. ¡A investigar! 🕵️*
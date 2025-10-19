# 🐼 sql-chipi-case# 🐼 sql-chipi-case# 🐼 sql-chipi-case



> **Un proyecto educativo para enseñar SQL resolviendo un misterio.**



Chipi, la mascota de **SuperKode**, ha sido secuestrada el 19 de octubre a las **02:13**. Los alumnos del bootcamp deben usar **SQL** para resolver pistas y descubrir quién fue.> **Un proyecto educativo para enseñar SQL resolviendo un misterio.**> **Un proyecto educativo para enseñar SQL resolviendo un misterio.**



---



## 📖 ContextoChipi, la mascota de **SuperKode**, ha sido secuestrada el 19 de octubre a las **02:13**. Los alumnos del bootcamp deben usar **SQL** para resolver pistas y descubrir quién fue.Chipi, la mascota de **SuperKode**, ha sido secuestrada. Los alumnos del bootcamp deben usar **SQL** para resolver pistas y descubrir quién fue.



El 19 de octubre de 2025, a las **02:13**, Chipi desapareció de la oficina de SuperKode.



**Los sospechosos:**------

- 🛠️ **Cris** (formadora): "Fue el router. Siempre es el router."

- 🔧 **Andrea** (formadora): "El pipeline está roto."

- 📊 **Yeraldín** (formadora): "Revisar los commits."

- 🦆 **Mamá Pato** (formadora): "Yo no fui. *quack quack*"## 🎯 Para Principiantes: Diseño Accesible## 📖 Contexto



**Los investigadores: TÚ y tus compañeros del bootcamp SuperKode.**



---**Este proyecto está diseñado para alumnos con:**El 19 de octubre de 2025, a las **02:13**, Chipi desapareció de la oficina de SuperKode.



## 🎯 Objetivo- ✅ Conocimiento NULO de SQL



Practicar **SQL** resolviendo un caso misterioso:- ✅ Neurodivergencia (TDAH, autismo, dislexia, etc.)**Los sospechosos:**



- ✅ **SELECT** básico: listar datos- ✅ Sensibilidad a la sobrecarga cognitiva- 🛠️ **Cris** (formadora): "Fue el router. Siempre es el router."

- ✅ **JOIN**: conectar tablas relacionadas

- ✅ **WHERE**: filtrar información- 🔧 **Andrea** (formadora): "El pipeline está roto."

- ✅ **ORDER BY**, **GROUP BY**: analizar datos

- ✅ **Subqueries** y **CTEs**: consultas avanzadas**Progresión cuidadosa:**- 📊 **Yeraldín** (formadora): "Revisar los commits."



---- **Día 1:** SELECT básico (SELECT, FROM, WHERE, JOIN, ORDER BY)- 🦆 **Mamá Pato** (formadora): "Yo no fui. *quack quack*"



## 📋 Requisitos- **Día 2:** Análisis con agregaciones (GROUP BY, COUNT, STRING_AGG, UNION)



Antes de empezar, asegúrate de tener:- **Día 3 (OPCIONAL):** Técnicas avanzadas (CTEs, Window Functions)**Los investigadores: TÚ y tus compañeros del bootcamp SuperKode.**



- **PostgreSQL 16+** instalado

- **psql** disponible en tu PATH

- **Make** instalado------

- **DBeaver** (opcional pero recomendado)



---

## 🚀 Instalación Rápida## 🎯 Objetivo

## 🚀 Instalación y Setup



### Paso 1: Configura la contraseña de PostgreSQL

### Paso 1: Configurar variablesPracticar **SQL** resolviendo un caso misterioso:

```powershell

$env:PGPASSWORD="postgres"```powershell

```

$env:PGPASSWORD="postgres"- ✅ **SELECT** básico: listar datos

### Paso 2: Ejecuta el setup

```- ✅ **JOIN**: conectar tablas relacionadas

```powershell

make setup- ✅ **WHERE**: filtrar información

```

### Paso 2: Setup- ✅ **ORDER BY**, **GROUP BY**: analizar datos

Esto creará la base de datos `chipi_case` con todas las tablas y datos iniciales.

```powershell- ✅ **Subqueries** y **CTEs**: consultas avanzadas

---

make setup

## 🎮 Los Retos

```---

### Día 1: SELECT Basics



Abre **`challenges/day1_select_basics.md`** y resuelve 5 retos + 1 bonus.

**Listo.** Base de datos creada con datos para los retos.## 📋 Requisitos

Valida con: `make check-day1`



### Día 2: JOINs y Análisis

---Antes de empezar, asegúrate de tener:

Abre **`challenges/day2_joins_analysis.md`** y resuelve 4 retos + 1 bonus.



Valida con: `make check-day2`

## 📖 Cómo Resolver los Retos- **PostgreSQL 16+** instalado ([descargar](https://www.postgresql.org/download/))

### Día 3: CTEs y Window Functions (OPCIONAL)

- **psql** disponible en tu PATH (`psql --version`)

Abre **`challenges/day3_window_functions.md`** para retos avanzados.

### Día 1: SELECT Basics- **Make** instalado en Windows (incluido en herramientas de desarrollo o usa GnuWin32)

Valida con: `make check-day3`

```powershell- **DBeaver** (opcional pero recomendado para ver datos gráficamente)

---

# 1. Lee los retos

## 📊 Acceder a los datos

cat challenges/day1_select_basics.md### Verificar que todo está instalado:

### Con DBeaver (recomendado)



1. Abre DBeaver

2. `Database` → `New Database Connection` → PostgreSQL# 2. Escribe tu vista SQL con el nombre exacto```powershell

3. Completa:

   - Host: `localhost`CREATE VIEW solve_d1_r1 ASpsql --version

   - Port: `5432`

   - Database: `chipi_case`SELECT ...# Output: psql (PostgreSQL) 16.x

   - Username: `postgres`

   - Password: `postgres`



### Con psql (línea de comandos)# 3. Valida tu trabajomake --version



```powershellmake check-day1# Output: GNU Make 4.x

$env:PGPASSWORD="postgres"

psql -h localhost -U postgres -d chipi_case``````

```



---

**Retos del Día 1:**---

## 📝 ¿Cómo entregar los retos?

- `solve_d1_r1` - Conoce al equipo

Para cada reto, **crea una vista SQL** con el nombre exacto:

- `solve_d1_r2` - ¿Quién mencionó a Chipi?## 🚀 Instalación y Setup

```sql

CREATE VIEW solve_d1_r1 AS- `solve_d1_r3` - Cafetera a las 02:13 🚨

SELECT nombre, equipo, turno

FROM alumnos a- `solve_d1_r4` - Pistas en Discord### Paso 1: Configura la contraseña de PostgreSQL

JOIN equipos e ON a.equipo_id = e.id

ORDER BY e.nombre, a.nombre;- `solve_d1_bonus` - ¿Quién está raro?

```

En **PowerShell**, configura la variable de entorno:

Valida con: `make check-day1`

### Día 2: JOINs y Análisis

---

```powershell```powershell

## 🗄️ Tablas Principales

# 1. Lee los retos$env:PGPASSWORD="postgres"

- **`equipos`** - Los 3 equipos del bootcamp

- **`alumnos`** - Alumnos (13)cat challenges/day2_joins_analysis.md```

- **`commits`** - Commits hechos por alumnos

- **`cafe_ordenes`** - Quién tomó qué, cuándo

- **`discord_logs`** - Mensajes en Discord

- **`dispositivos`** - Dispositivos asignados# 2. Escribe tus vistas> **Nota:** Reemplaza `"postgres"` con tu contraseña real si es diferente.

- **`ubicaciones`** - Dónde estaban

- **`pistas`** - Pistas criptográficasCREATE VIEW solve_d2_r1 AS ...



---### Paso 2: Ejecuta el setup



## 🧭 Comandos Útiles# 3. Valida



```powershellmake check-day2```powershell

make setup         # Setup inicial

make check-day1    # Validar Day 1```make setup

make check-day2    # Validar Day 2

make check-day3    # Validar Day 3```

make check-all     # Validar todo

make reset         # Reiniciar todo**Retos del Día 2:**

make help          # Ver ayuda

```- `solve_d2_r1` - Alumnos por equipoEsto hará:



---- `solve_d2_r2` - Ramas por alumno1. ✅ Crear la base de datos `chipi_case`



*Mamá Pato 🦆 sigue negando. Cris sigue culpando al router. Tú tienes SQL. ¡A investigar! 🕵️*- `solve_d2_r3` - Commits fallidos2. ✅ Ejecutar el esquema (crear tablas)


- `solve_d2_r4` - Bebidas más consumidas3. ✅ Insertar datos iniciales

- `solve_d2_bonus` - Timeline 02:00-02:30

---

### Día 3: CTEs y Window Functions (OPCIONAL)

```powershell## 📊 Acceder a los datos

# Solo si quieres explorar técnicas avanzadas

cat challenges/day3_window_functions.md### Opción A: Con DBeaver (recomendado)

make check-day3

```1. Abre **DBeaver**

2. Click en `Database` → `New Database Connection`

---3. Selecciona **PostgreSQL**

4. Completa:

## ✅ Validación Automática   - Host: `localhost`

   - Port: `5432`

Después de cada día, ejecuta:   - Database: `chipi_case`

   - Username: `postgres`

```powershell   - Password: `postgres`

make check-day1    # Valida Día 15. Click en `Finish` y explora las tablas

make check-day2    # Valida Día 2

make check-day3    # Valida Día 3 (opcional)### Opción B: Con línea de comandos (psql)

make check-all     # Valida todo

``````powershell

$env:PGPASSWORD="postgres"

Los tests **NO revelan la solución**, solo verifican:psql -h localhost -U postgres -d chipi_case

- ✅ Que la vista existe```

- ✅ Que tiene las columnas correctas

- ✅ Que los datos son consistentesLuego puedes escribir queries SQL directamente:



---```sql

SELECT nombre, email, turno FROM alumnos;

## 💾 Acceso a la Base de Datos```



### Con DBeaver (recomendado)---

1. Abre DBeaver

2. `Database` → `New Database Connection` → PostgreSQL## 🎮 Retos

3. Completa:

   - Host: `localhost`### Día 1: SELECT Basics

   - Port: `5432`

   - Database: `chipi_case`Abre **`challenges/day1_select_basics.md`** y resuelve:

   - Username: `postgres`

   - Password: `postgres`1. **Reto 1:** Lista todos los alumnos con su equipo y turno

2. **Reto 2:** Encuentra commits que contengan "chipi"

### Con psql (línea de comandos)3. **Reto 3:** ¿Quién tomó café a las 02:13? 🚨 (Pista crítica)

```powershell4. **Reto 4:** Últimas pistas en Discord

$env:PGPASSWORD="postgres"5. **BONUS:** ¿Quién miente? (análisis avanzado)

psql -h localhost -U postgres -d chipi_case

```---



---## 📁 Estructura del Proyecto



## 🗄️ Las 8 Tablas de la Base de Datos```

sql-chipi-case/

| Tabla | Descripción |├── db/

|-------|-------------|│   ├── 00_schema.sql      # Definición de tablas

| `equipos` | Los 3 equipos del bootcamp |│   └── 01_seed.sql        # Datos iniciales

| `alumnos` | Alumnos con su equipo y turno |├── challenges/

| `commits` | Commits hechos por alumnos (rama, mensaje, estado) |│   └── day1_select_basics.md  # Retos del Día 1

| `cafe_ordenes` | Quién tomó qué, cuándo y con leche |├── lore/

| `discord_logs` | Todos los mensajes en Discord |│   └── nota_secuestro.txt # Contexto y pistas

| `dispositivos` | Dispositivos asignados a alumnos |├── Makefile               # Automatización

| `ubicaciones` | Dónde estaban (oficina, home, etc.) |└── README.md              # Este archivo

| `pistas` | Pistas adicionales criptográficas |```



**Total: 79 registros coherentes** que cuentan una historia de misterio.---



---## 🗄️ Tablas de la Base de Datos



## 📊 Conceptos SQL que Aprenderás### `equipos`

- `id` (SERIAL, PK)

**Día 1:**- `nombre` (TEXT, UNIQUE)

- SELECT / FROM / WHERE- `descripcion` (TEXT)

- JOIN (conectar tablas)

- ORDER BY / LIMIT### `alumnos`

- GROUP BY / HAVING (intro)- `id` (SERIAL, PK)

- `nombre` (TEXT)

**Día 2:**- `email` (TEXT, UNIQUE)

- GROUP BY (avanzado)- `equipo_id` (INT, FK → equipos)

- Agregaciones: COUNT, STRING_AGG- `turno` (TEXT: 'mañana' o 'tarde')

- UNION (combinar queries)- `fecha_inscripcion` (TIMESTAMP)

- LEFT JOIN

### `commits`

**Día 3 (opcional):**- `id` (SERIAL, PK)

- CTEs (Common Table Expressions)- `alumno_id` (INT, FK → alumnos)

- Window Functions: ROW_NUMBER, PARTITION BY- `rama` (TEXT)

- Análisis temporal avanzado- `mensaje` (TEXT) ← **Contiene pistas**

- `estado_ci` (TEXT: 'success', 'failed', 'pending')

---- `fecha` (TIMESTAMP)



## 🧠 Diseño Neurodiverso### `cafe_ordenes`

- `id` (SERIAL, PK)

Este proyecto evita:- `alumno_id` (INT, FK → alumnos)

- ❌ Sobrecarga de información- `bebida` (TEXT)

- ❌ Pistas confusas o ambiguas- `leche` (TEXT: 'sí', 'no', 'parcial')

- ❌ Presión de "velocidad"- `hora` (TIME) ← **Pista crítica: alguien a las 02:13**

- ❌ Soluciones visibles (tentación de copiar)- `fecha` (TIMESTAMP)



En su lugar, ofrece:### `discord_logs`

- ✅ Progresión clara: básico → intermedio → avanzado- `id` (SERIAL, PK)

- ✅ Pistas directas y específicas- `usuario` (TEXT)

- ✅ Validación automática sin revelar respuestas- `canal` (TEXT)

- ✅ Flexibilidad: pausas, retrocesos, ritmo propio- `mensaje` (TEXT) ← **Confusión y pistas**

- `fecha` (TIMESTAMP)

---

### `dispositivos`

## 📝 Comandos Útiles- `id` (SERIAL, PK)

- `tipo` (TEXT: 'laptop', 'desktop', 'tablet', 'phone')

```powershell- `ip` (INET)

# Setup inicial- `alumno_id` (INT, FK → alumnos)

make setup- `fecha_registro` (TIMESTAMP)



# Reiniciar todo### `ubicaciones`

make reset- `id` (SERIAL, PK)

- `nombre` (TEXT)

# Validar retos- `lugar` (TEXT)

make check-day1- `estado` (TEXT: 'seguro', 'peligro', 'desconocido')

make check-day2- `ultima_actualizacion` (TIMESTAMP)

make check-day3

make check-all### `pistas`

- `id` (SERIAL, PK)

# Ver ayuda- `dia` (INT)

make help- `codigo` (TEXT, UNIQUE)

```- `descripcion` (TEXT)

- `desbloqueo_sql` (TEXT) ← **La query que resuelve la pista**

---- `resuelta` (BOOLEAN)

- `fecha_creacion` (TIMESTAMP)

## 🎓 Conclusión

---

**¿Quién secuestró a Chipi?**

## 💡 Ejemplos de Queries Útiles

- Si resuelves **Día 1 + Día 2**: Tienes 90% de la respuesta

- Si haces **Día 3**: Tienes la cronología completa### Listar todos los alumnos

```sql

No importa el ritmo. No importa si necesitas descansos. **SQL es un viaje, no una carrera.** 🚀SELECT nombre, email, turno FROM alumnos ORDER BY nombre;

```

---

### Ver quién comitteó "chipi"

*Mamá Pato 🦆 sigue negando. Cris sigue culpando al router. Tú tienes SQL.*```sql

SELECT a.nombre, c.mensaje, c.fecha 
FROM alumnos a 
JOIN commits c ON a.id = c.alumno_id 
WHERE c.mensaje ILIKE '%chipi%';
```

### ¿Quién estaba en la cafetera a las 02:13?
```sql
SELECT a.nombre, c.bebida, c.hora 
FROM alumnos a 
JOIN cafe_ordenes c ON a.id = c.alumno_id 
WHERE c.hora = '02:13';
```

---

## 🔧 Comandos Make

```bash
make setup      # Crear DB + esquema + datos (comando principal)
make initdb     # Solo crear la base de datos
make schema     # Solo crear tablas
make seed       # Solo insertar datos
make clean      # Borrar la base de datos
make reset      # Borrar todo y volver a crear (clean + setup)
make help       # Mostrar esta ayuda
```

---

## � ¿Cómo entregar los retos?

### Para cada reto, crea una **vista SQL** con el nombre indicado

Cada reto tiene un **nombre de vista** específico. Por ejemplo:
- Día 1, Reto 1 → `solve_d1_r1`
- Día 1, Reto 2 → `solve_d1_r2`
- Día 2, Reto 1 → `solve_d2_r1`
- (etc.)

### Ejemplo: Reto 1 del Día 1

El enunciado pide: *"Lista todos los alumnos con su equipo y turno"*

Tú escribes:

```sql
CREATE VIEW solve_d1_r1 AS
SELECT 
  a.nombre, 
  e.nombre as equipo, 
  a.turno 
FROM alumnos a 
JOIN equipos e ON a.equipo_id = e.id 
ORDER BY e.nombre, a.nombre;
```

### Validar tu trabajo

Ejecuta:

```powershell
make check-day1
```

Este comando verificará que:
- ✅ La vista `solve_d1_r1` existe
- ✅ Tiene las columnas esperadas (nombre, equipo, turno)
- ✅ Los datos se ven correctos

**No hay soluciones mostradas** en los archivos `.md` de retos. Debes pensar y escribir tus propias consultas. 💪

### Comandos disponibles

```powershell
make check-day1    # Validar retos del Día 1
make check-day2    # Validar retos del Día 2
make check-day3    # Validar retos del Día 3 (opcional)
make check-all     # Validar todos los retos
```

---

## �🐛 Troubleshooting

### Error: "FATAL: role 'postgres' does not exist"
→ PostgreSQL no está instalado o no está corriendo. Instala PostgreSQL 16.

### Error: "psql: command not found"
→ `psql` no está en tu PATH. Añade la carpeta de PostgreSQL a PATH:
```powershell
$env:Path += "C:\Program Files\PostgreSQL\16\bin"
```

### Error: "password authentication failed"
→ Configura la variable de entorno correctamente:
```powershell
$env:PGPASSWORD="tu_contraseña_real"
```

### Error: "Database 'chipi_case' already exists"
→ La DB ya existe. Usa `make reset` para borrar y recrear:
```powershell
make reset
```

---

## 📚 Próximos Pasos

1. ✅ Ejecuta `make setup`
2. ✅ Abre `challenges/day1_select_basics.md`
3. ✅ Resuelve los 5 retos
4. ✅ Descubre quién secuestró a Chipi
5. ✅ Celebra con Mamá Pato 🦆

---

## 🤝 Contribuir

¿Encontraste un error? ¿Quieres añadir más retos?

1. Abre un issue
2. Propón cambios
3. Recuerda: **Chipi depende de ti**

---

## 📝 Licencia

Proyecto educativo creado para **SuperKode Bootcamp**.
Inspirado en narrativas de videojuegos educativos.

---

## 🦆 Créditos

- 📖 **Proyecto:** sql-chipi-case
- 🎨 **Historia:** Mamá Pato 🦆, Cris, Andrea, Yeraldín
- 👥 **Investigadores:** Miguel, SalchiPresi, Marcus, Daniel, Roxy, Cale, La Rusa, Ramazan, Wizi, Sara, Rubén, David
- 🐼 **Víctima:** Chipi (aún sin recuperar...)

---

**¿Listos para resolver el caso? 🔍**

```powershell
$env:PGPASSWORD="postgres"
make setup
# Y a investigar... 🕵️
```

*P.D.: Mamá Pato sigue negando todo. Cris sigue culpando al router.*

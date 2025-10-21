# sql-chipi-case - Quickstart

> Chipi ha sido secuestrado. Usa SQL para resolver el misterio.

---

## Requisitos

- PostgreSQL 16+
- Make (viene con Git for Windows)
- DBeaver o cualquier cliente SQL

---

## Instalacion (5 minutos)

### 1. Configurar password de PostgreSQL

```powershell
$env:PGPASSWORD="postgres"
```

### 2. Inicializar base de datos

```powershell
make setup
```

**Si psql no esta en PATH:**
```powershell
make setup PSQL="C:\Program Files\PostgreSQL\16\bin\psql.exe"
```

### 3. Conectar con DBeaver

- Host: localhost
- Puerto: 5432
- Database: chipi_case
- Usuario: postgres

### 4. Empezar los retos

Abre en orden:

1. `challenges/day0_warmup.md` (opcional si ya sabes SQL)
2. `challenges/day1_select_basics.md`
3. `challenges/day2_joins_analysis.md`
4. `challenges/day3_window_functions.md` (OPCIONAL)
5. `challenges/day4_final.md` (FINAL)

**Como funciona:**
- Lee el reto en el archivo `.md`
- Escribe tu query en DBeaver
- Crea una VISTA con tu solucion (ejemplo: `CREATE OR REPLACE VIEW solve_d1_r1 AS SELECT ...`)
- Valida con `make check-day1`

---

## Comandos

```powershell
make help         # Ver todos los comandos
make setup        # Crear DB + esquema + datos
make reset        # Borrar y recrear todo
make clean        # Borrar base de datos

make check-day1   # Validar soluciones Dia 1
make check-day2   # Validar soluciones Dia 2
make check-day3   # Validar soluciones Dia 3
make check-day4   # Validar soluciones Dia 4
make check-all    # Validar todos los retos
```

---

## Primeras queries para practicar

```sql
-- Ver todos los alumnos
SELECT nombre, email, turno FROM alumnos;

-- Quien estaba en la cafetera a las 02:13?
SELECT a.nombre, c.bebida 
FROM alumnos a 
JOIN cafe_ordenes c ON a.id = c.alumno_id 
WHERE c.hora = '02:13';

-- Commits con "chipi"
SELECT a.nombre, c.mensaje 
FROM alumnos a 
JOIN commits c ON a.id = c.alumno_id 
WHERE c.mensaje ILIKE '%chipi%';
```

---

## Como resolver un reto (ejemplo Day 1 - Reto 1)

### Paso 1: Lee el reto en `challenges/day1_select_basics.md`

```
Reto 1: Lista todos los alumnos con su equipo y turno
Columnas esperadas: nombre, equipo, turno
```

### Paso 2: Escribe tu query en DBeaver

```sql
-- Primero prueba tu query
SELECT 
    a.nombre,
    e.nombre AS equipo,
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id
ORDER BY a.nombre;
```

### Paso 3: Crea la vista con tu solucion

```sql
-- Cuando funcione, crea la vista
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT 
    a.nombre,
    e.nombre AS equipo,
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id
ORDER BY a.nombre;
```

### Paso 4: Valida

```powershell
make check-day1
```

Si ves `[OK] Reto 1 completado`, ¡lo lograste!

---

## Ayuda

- **Como crear vistas:** `COMO_CREAR_VISTAS.md` ⭐ **EMPIEZA AQUI**
- **SQL Cheatsheet:** `SOS_SQL.md`
- **Estructura de datos:** `SCHEMA_REFERENCE.md`
- **Historia completa:** `lore/nota_secuestro.txt`

---

## Problemas comunes

**"psql: command not found"**
→ Usa: `make setup PSQL="C:\ruta\a\psql.exe"`

**"password authentication failed"**
→ Verifica la password de PostgreSQL

**"Database already exists"**
→ Ejecuta: `make reset`

**"Vista solve_d1_r1 no existe"**
→ Crea la vista con: `CREATE OR REPLACE VIEW solve_d1_r1 AS SELECT ...`

**"Quiero ver mis vistas creadas"**
→ En DBeaver: `SELECT * FROM information_schema.views WHERE table_schema = 'public';`

**"Puedo guardar mis queries en un archivo?"**
→ Sí, puedes crear `mis_soluciones.sql` y ejecutarlo cuando quieras, pero las vistas deben estar en PostgreSQL para que `make check-dayX` funcione.

---

## Objetivo final

Descubre **quien secuestro a Chipi** usando solo SQL.

**Pista:** El codigo de rescate tiene 6 caracteres... buscalo en la base de datos.


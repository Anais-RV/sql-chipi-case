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

## Ayuda

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

---

## Objetivo final

Descubre **quien secuestro a Chipi** usando solo SQL.

**Pista:** El codigo de rescate tiene 6 caracteres... buscalo en la base de datos.


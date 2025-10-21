# Como Crear Vistas - Guia Practica

> Aprende a crear vistas en PostgreSQL paso a paso

---

## Que es una Vista?

Una **vista** es una query guardada en la base de datos con un nombre.

**Ventajas:**
- Reutilizable: ejecutas `SELECT * FROM mi_vista;` en vez de escribir la query completa
- Validable: make puede verificar que creaste las vistas correctas
- Limpia: tu codigo SQL queda organizado

---

## Sintaxis Basica

```sql
CREATE OR REPLACE VIEW nombre_vista AS
SELECT columna1, columna2
FROM tabla
WHERE condicion;
```

**Importante:**
- `CREATE OR REPLACE` permite sobrescribir si ya existe
- `AS` separa el nombre de la query
- Termina con `;`

---

## Ejemplo 1: Vista Simple

**Reto:** Lista todos los alumnos con su email

**Paso 1:** Escribe la query normal

```sql
SELECT nombre, email
FROM alumnos
ORDER BY nombre;
```

**Paso 2:** Pruebala en DBeaver (debe funcionar)

**Paso 3:** Conviertela en vista

```sql
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT nombre, email
FROM alumnos
ORDER BY nombre;
```

**Paso 4:** Verifica que funciona

```sql
SELECT * FROM solve_d1_r1;
```

**Paso 5:** Valida con Make

```powershell
make check-day1
```

---

## Ejemplo 2: Vista con JOIN

**Reto:** Lista alumnos con su equipo

**Paso 1:** Escribe la query con JOIN

```sql
SELECT 
    a.nombre,
    e.nombre AS equipo,
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id
ORDER BY a.nombre;
```

**Paso 2:** Pruebala (debe mostrar 12 alumnos)

**Paso 3:** Conviertela en vista

```sql
CREATE OR REPLACE VIEW solve_d1_r2 AS
SELECT 
    a.nombre,
    e.nombre AS equipo,
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id
ORDER BY a.nombre;
```

**Paso 4:** Verifica

```sql
SELECT * FROM solve_d1_r2;
-- Debe mostrar: nombre, equipo, turno
```

---

## Ejemplo 3: Vista con WHERE y LIKE

**Reto:** Encuentra commits que mencionen "chipi"

**Paso 1:** Query con filtro

```sql
SELECT 
    a.nombre,
    c.mensaje,
    c.estado_ci
FROM alumnos a
JOIN commits c ON a.id = c.alumno_id
WHERE c.mensaje ILIKE '%chipi%'
ORDER BY c.id;
```

**Paso 2:** Pruebala (debe mostrar 7 commits)

**Paso 3:** Crea la vista

```sql
CREATE OR REPLACE VIEW solve_d1_r3 AS
SELECT 
    a.nombre,
    c.mensaje,
    c.estado_ci
FROM alumnos a
JOIN commits c ON a.id = c.alumno_id
WHERE c.mensaje ILIKE '%chipi%'
ORDER BY c.id;
```

---

## Ejemplo 4: Vista con Agregacion

**Reto:** Cuenta commits por alumno

**Paso 1:** Query con GROUP BY

```sql
SELECT 
    a.nombre,
    COUNT(c.id) AS total_commits
FROM alumnos a
LEFT JOIN commits c ON a.id = c.alumno_id
GROUP BY a.nombre
ORDER BY total_commits DESC;
```

**Paso 2:** Pruebala

**Paso 3:** Crea la vista

```sql
CREATE OR REPLACE VIEW solve_d2_r1 AS
SELECT 
    a.nombre,
    COUNT(c.id) AS total_commits
FROM alumnos a
LEFT JOIN commits c ON a.id = c.alumno_id
GROUP BY a.nombre
ORDER BY total_commits DESC;
```

---

## Flujo Completo de Trabajo

### 1. Leer el Reto

Abre `challenges/day1_select_basics.md` y lee el reto 1:

```
Reto 1: Lista de Alumnos con Equipo
Crea una vista llamada solve_d1_r1 que muestre:
- nombre del alumno
- nombre del equipo
- turno
```

### 2. Escribir la Query

En DBeaver, escribe la query SIN crear vista todavia:

```sql
SELECT 
    a.nombre,
    e.nombre AS equipo,
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```

### 3. Probar y Ajustar

Ejecuta varias veces hasta que funcione correctamente.

**Errores comunes:**
- `column "equipo_id" does not exist` → Revisa el nombre de la columna en SCHEMA_REFERENCE.md
- `ambiguous column name "nombre"` → Usa alias: `a.nombre`, `e.nombre`

### 4. Crear la Vista

Cuando la query funciona, añade `CREATE OR REPLACE VIEW`:

```sql
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT 
    a.nombre,
    e.nombre AS equipo,
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```

### 5. Verificar Vista Creada

```sql
-- Ver todas las vistas creadas
SELECT table_name 
FROM information_schema.views 
WHERE table_schema = 'public';

-- Probar la vista
SELECT * FROM solve_d1_r1;
```

### 6. Validar con Make

```powershell
$env:PGPASSWORD="postgres"
make check-day1
```

**Si pasa:** ✓ Vista correcta!

**Si falla:** Lee el error, ajusta la vista, repite paso 4-6

---

## Comandos Utiles

### Ver tus vistas

```sql
-- Lista todas las vistas
\dv

-- Ver definicion de una vista
\d+ solve_d1_r1
```

### Borrar una vista

```sql
DROP VIEW IF EXISTS solve_d1_r1;
```

### Recrear vista (si te equivocaste)

```sql
-- Opcion 1: DROP y CREATE
DROP VIEW solve_d1_r1;
CREATE VIEW solve_d1_r1 AS ...;

-- Opcion 2: CREATE OR REPLACE (MAS FACIL)
CREATE OR REPLACE VIEW solve_d1_r1 AS ...;
```

---

## Convenciones de Nombres

Las vistas deben seguir este patron:

```
solve_dX_rY
```

**Donde:**
- `X` = numero de dia (1, 2, 3, 4)
- `Y` = numero de reto (1, 2, 3, 4)

**Ejemplos:**
- `solve_d1_r1` - Day 1, Reto 1
- `solve_d1_r2` - Day 1, Reto 2
- `solve_d2_r1` - Day 2, Reto 1
- `solve_d4_reveal` - Day 4, Revelacion final (nombre especial)

**IMPORTANTE:** Los nombres deben ser EXACTOS, make los busca asi.

---

## Errores Comunes

### "relation solve_d1_r1 does not exist"

**Causa:** No creaste la vista todavia

**Solucion:** Ejecuta `CREATE OR REPLACE VIEW solve_d1_r1 AS ...`

---

### "column X does not exist in view solve_d1_r1"

**Causa:** La vista no tiene las columnas esperadas

**Solucion:** 
1. Lee el reto para ver que columnas pide
2. Ajusta tu SELECT para incluirlas
3. Recrea la vista con `CREATE OR REPLACE`

---

### "view has X columns but Y were expected"

**Causa:** Numero incorrecto de columnas

**Solucion:** El reto especifica cuantas columnas debe tener la vista. Revisa el archivo del reto.

---

### "syntax error at or near CREATE"

**Causa:** Olvidaste el `;` en la query anterior

**Solucion:** Cada statement SQL debe terminar con `;`

---

## Tips Pro

### Tip 1: Usa Aliases Descriptivos

```sql
-- MAL (confuso)
SELECT a.nombre, e.nombre
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;

-- BIEN (claro)
SELECT 
    a.nombre AS alumno,
    e.nombre AS equipo
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```

### Tip 2: Formatea tu SQL

```sql
-- MAL (dificil de leer)
SELECT a.nombre,e.nombre AS equipo FROM alumnos a JOIN equipos e ON a.equipo_id=e.id WHERE a.turno='mañana';

-- BIEN (facil de leer)
SELECT 
    a.nombre,
    e.nombre AS equipo
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id
WHERE a.turno = 'mañana';
```

### Tip 3: Comenta tu Codigo

```sql
-- Reto 1: Alumnos con su equipo y turno
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT 
    a.nombre,           -- Nombre del alumno
    e.nombre AS equipo, -- Nombre del equipo
    a.turno             -- Turno (mañana/tarde)
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```

### Tip 4: Guarda tus Queries

Crea un archivo `mis_soluciones.sql` y guarda ahi todas tus vistas:

```sql
-- mis_soluciones.sql
-- Mis soluciones de sql-chipi-case

-- Day 1 - Reto 1
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT ...;

-- Day 1 - Reto 2
CREATE OR REPLACE VIEW solve_d1_r2 AS
SELECT ...;

-- etc...
```

Asi puedes:
- Recrearlas facilmente si borras la BD
- Compartirlas con companeros
- Revisarlas despues

---

## Practica Guiada: Tu Primera Vista

Vamos a crear juntos la primera vista paso a paso:

### Paso 1: Conectar a la BD

1. Abre DBeaver
2. Conecta a `chipi_case`
3. Abre una nueva ventana SQL (F3)

### Paso 2: Explorar Datos

```sql
-- Ver alumnos
SELECT * FROM alumnos LIMIT 5;

-- Ver equipos
SELECT * FROM equipos;
```

### Paso 3: Escribir Query Basica

```sql
SELECT nombre, email FROM alumnos;
```

Ejecuta (Ctrl+Enter). Debe mostrar 12 alumnos.

### Paso 4: Añadir el JOIN

```sql
SELECT 
    a.nombre,
    e.nombre AS equipo
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```

Ejecuta. Debe mostrar alumnos con sus equipos.

### Paso 5: Añadir Turno

```sql
SELECT 
    a.nombre,
    e.nombre AS equipo,
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```

Ejecuta. Ahora si, tiene las 3 columnas!

### Paso 6: Crear Vista

```sql
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT 
    a.nombre,
    e.nombre AS equipo,
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```

Ejecuta. Debe decir: `CREATE VIEW`

### Paso 7: Probar Vista

```sql
SELECT * FROM solve_d1_r1;
```

Debe mostrar los mismos 12 alumnos.

### Paso 8: Validar

```powershell
make check-day1
```

Debe pasar el test del Reto 1!

---

## Siguiente Paso

Ahora que sabes crear vistas, practica con:

1. `challenges/day0_warmup.md` - Calentamiento (opcional)
2. `challenges/day1_select_basics.md` - 4 retos basicos
3. `challenges/day2_joins_analysis.md` - JOINs avanzados
4. `challenges/day3_window_functions.md` - Funciones ventana (opcional)
5. `challenges/day4_final.md` - Resuelve el misterio!

---

## Recursos

- `SOS_SQL.md` - Cheatsheet SQL
- `SCHEMA_REFERENCE.md` - Estructura de tablas
- `make help` - Comandos disponibles
- `\?` en psql - Ayuda de comandos

---

**Recuerda:** El objetivo es **aprender SQL resolviendo un misterio**. 

No te frustres si algo no funciona a la primera. Todos empezamos asi!

**Pista final:** El codigo de rescate de Chipi tiene 6 caracteres... 🐼

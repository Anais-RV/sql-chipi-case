# 🆘 Day 3: CTEs y Window Functions - Guía Anti-Bloqueos

> **Nota:** Day 3 es OPCIONAL y más avanzado. Si Day 2 te costó mucho, está bien saltártelo.

---

## 🎯 Reto 1: Alumnos raros (CTEs)

**Objetivo:** Encuentra alumnos que cumplan TODAS estas condiciones:
- Café de noche (22:00-06:00)
- Tienen commits fallidos
- Han escrito en Discord

### 🤔 Preguntas guía

1. **¿Qué son los CTEs?**
   - CTEs = Common Table Expressions = "WITH ... AS (...)"
   - Son como "variables temporales" para queries
   - Hacen el código más legible

2. **¿Cómo estructurar la solución?**
   - CTE 1: Alumnos que tomaron café de noche
   - CTE 2: Alumnos con commits fallidos
   - CTE 3: Alumnos que escribieron en Discord
   - SELECT final: JOIN de los 3 CTEs

3. **¿Cómo filtrar por hora de noche?**
   - `EXTRACT(HOUR FROM hora) >= 22` → Después de las 22:00
   - `OR EXTRACT(HOUR FROM hora) < 6` → Antes de las 06:00

### 📝 Plantilla paso a paso

```sql
-- PASO 1: CTE para café de noche
WITH night_coffee AS (
  SELECT 
    alumno_id,
    STRING_AGG(bebida, ', ' ORDER BY bebida) AS bebidas_noche
  FROM cafe_ordenes
  WHERE EXTRACT(HOUR FROM hora) >= ??? OR EXTRACT(HOUR FROM hora) < ???
  GROUP BY alumno_id
),

-- PASO 2: CTE para commits fallidos
failed_commits AS (
  SELECT 
    alumno_id,
    COUNT(*) AS commits_fallidos
  FROM commits
  WHERE estado_ci = ???
  GROUP BY alumno_id
),

-- PASO 3: CTE para usuarios de Discord
discord_users AS (
  SELECT 
    alumnos.id AS alumno_id,
    COUNT(*) AS menciones_discord
  FROM alumnos
  JOIN discord_logs ON discord_logs.usuario = alumnos.nombre
  GROUP BY alumnos.id
)

-- PASO 4: Combinar los 3 CTEs
SELECT 
  alumnos.nombre,
  nc.bebidas_noche,
  fc.commits_fallidos,
  du.menciones_discord
FROM alumnos
JOIN night_coffee nc ON alumnos.id = nc.alumno_id
JOIN failed_commits fc ON alumnos.id = fc.alumno_id
JOIN discord_users du ON alumnos.id = du.alumno_id
ORDER BY fc.commits_fallidos DESC;
```

### 💡 Conceptos clave
- **WITH ... AS**: Define un CTE (query temporal)
- **EXTRACT(HOUR FROM ...)**: Extrae la hora de un TIME o TIMESTAMP
- **JOIN múltiples CTEs**: Funciona igual que JOIN de tablas normales
- **INNER JOIN**: Solo devuelve filas que cumplen TODAS las condiciones

### 🧠 Pensamiento lógico
Si usas INNER JOIN entre los 3 CTEs, solo verás alumnos que aparecen en LOS 3. Si alguno no cumple alguna condición, no aparecerá.

---

## 🎯 Reto 2: Últimos 2 commits por alumno

**Objetivo:** Para cada alumno, sus 2 commits más recientes.

### 🤔 Preguntas guía

1. **¿Qué es una Window Function?**
   - Hace cálculos "por ventana" (grupo) sin colapsar filas
   - Diferencia con GROUP BY: GROUP BY colapsa filas, Window Functions las mantienen

2. **¿Qué función numera filas?**
   - `ROW_NUMBER()` → Asigna un número a cada fila
   - `PARTITION BY` → Define el grupo (ventana)
   - `ORDER BY` → Define el orden dentro del grupo

3. **¿Cómo estructurar la solución?**
   - Paso 1: Numera los commits de cada alumno (1, 2, 3, ...)
   - Paso 2: Filtra solo los que tienen número <= 2

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Numerar commits por alumno
SELECT 
  alumnos.nombre,
  commits.rama,
  commits.mensaje,
  commits.fecha,
  ROW_NUMBER() OVER (
    PARTITION BY alumnos.id    -- Agrupa por alumno
    ORDER BY commits.fecha DESC  -- Más reciente primero
  ) AS numero
FROM alumnos
JOIN commits ON alumnos.id = commits.alumno_id;

-- PASO 2: Filtrar solo los 2 primeros
WITH numbered_commits AS (
  -- Copia el SELECT de arriba aquí
)
SELECT nombre, rama, mensaje, fecha, numero
FROM numbered_commits
WHERE numero <= ???
ORDER BY nombre, numero;
```

### 💡 Conceptos clave
- **ROW_NUMBER()**: Asigna número secuencial (1, 2, 3, ...)
- **PARTITION BY**: Define los grupos ("por cada alumno")
- **ORDER BY dentro de OVER**: Orden dentro de cada grupo
- **Window Function vs GROUP BY**: Window Function NO colapsa filas

### 🧠 Pensamiento lógico
```
Alumno A: commit3 (más reciente), commit2, commit1
          → numero=1,              numero=2, numero=3

Alumno B: commit5 (más reciente), commit4
          → numero=1,              numero=2
```
Luego filtras `WHERE numero <= 2` y solo ves los 2 primeros de cada alumno.

---

## 🎯 BONUS: Cronología del crimen (01:00 - 03:00)

**Objetivo:** Timeline completa con commits, café y Discord entre 01:00 y 03:00.

### 🤔 Preguntas guía

1. **¿Es igual que el EXTRA de Day 2?**
   - Sí, pero con ventana de tiempo diferente (01:00 - 03:00)
   - Usa la misma estructura: 3 CTEs + UNION ALL

2. **¿Qué cambias del Day 2?**
   - Solo el filtro de fecha: `BETWEEN '2025-10-19 01:00:00' AND '2025-10-19 03:00:00'`

### 📝 Plantilla paso a paso

```sql
WITH commits_window AS (
  SELECT 
    commits.fecha AS fecha_hora,
    'commit' AS evento_tipo,
    alumnos.nombre AS actor,
    commits.rama || ': ' || commits.mensaje AS descripcion
  FROM alumnos
  JOIN commits ON alumnos.id = commits.alumno_id
  WHERE commits.fecha BETWEEN ??? AND ???
),
cafe_window AS (
  SELECT 
    cafe_ordenes.fecha AS fecha_hora,
    'café' AS evento_tipo,
    alumnos.nombre AS actor,
    cafe_ordenes.bebida || ' (' || cafe_ordenes.leche || ')' AS descripcion
  FROM alumnos
  JOIN cafe_ordenes ON alumnos.id = cafe_ordenes.alumno_id
  WHERE cafe_ordenes.fecha BETWEEN ??? AND ???
),
discord_window AS (
  SELECT 
    discord_logs.fecha AS fecha_hora,
    'discord' AS evento_tipo,
    discord_logs.usuario AS actor,
    discord_logs.canal || ': ' || discord_logs.mensaje AS descripcion
  FROM discord_logs
  WHERE discord_logs.fecha BETWEEN ??? AND ???
)
SELECT * FROM (
  SELECT * FROM commits_window
  UNION ALL
  SELECT * FROM cafe_window
  UNION ALL
  SELECT * FROM discord_window
) timeline
ORDER BY fecha_hora ASC;
```

### 💡 Conceptos clave
- Reutiliza la estructura de Day 2 EXTRA
- Solo cambia la ventana de tiempo

---

## 🚀 Siguiente paso

Si completaste Day 3, ¡eres un maestro SQL! 🧙‍♂️ Day 4 es la revelación final donde usarás todo lo aprendido.

**Recuerda:** 
- CTEs = "variables" temporales para hacer queries más legibles
- Window Functions = cálculos "por grupo" sin colapsar filas
- Practica con queries simples primero, luego añade complejidad

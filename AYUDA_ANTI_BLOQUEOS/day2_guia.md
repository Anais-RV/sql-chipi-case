# 🆘 Day 2: JOINs y Análisis - Guía Anti-Bloqueos

---

## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?

**Objetivo:** Contar miembros por equipo.

### 🤔 Preguntas guía

1. **¿Qué necesitas contar?**
   - Alumnos
   - Agrupados por equipo

2. **¿Qué función cuenta filas?**
   - `COUNT(*)` → Cuenta todas las filas
   - `COUNT(columna)` → Cuenta valores no-NULL
   - Para este caso: `COUNT(alumnos.id)`

3. **¿LEFT JOIN o INNER JOIN?**
   - LEFT JOIN → Incluye equipos sin alumnos (mostraría 0)
   - INNER JOIN → Solo equipos con alumnos
   - Pista: El enunciado quiere todos los equipos

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver equipos
SELECT * FROM equipos;

-- PASO 2: Contar alumnos por equipo
SELECT 
  equipos.nombre AS equipo,
  COUNT(alumnos.id) AS cantidad_alumnos
FROM equipos
LEFT JOIN alumnos ON equipos.id = alumnos.???
GROUP BY equipos.nombre
ORDER BY ??? DESC;  -- ¿Cómo ordenar por cantidad?
```

### 💡 Conceptos clave
- **GROUP BY**: Necesario cuando usas funciones agregadas (COUNT, SUM, AVG)
- **LEFT JOIN**: Mantiene todas las filas de la tabla izquierda (equipos)
- **AS**: Renombra columnas para que coincidan con el enunciado

---

## 🎯 Reto 2: ¿En qué ramas trabajó cada alumno?

**Objetivo:** Lista de ramas separadas por comas para cada alumno.

### 🤔 Preguntas guía

1. **¿Cómo juntar varios valores en una sola celda?**
   - `STRING_AGG(columna, separador)`
   - Ejemplo: `STRING_AGG(rama, ', ')`

2. **¿Qué pasa si un alumno no tiene commits?**
   - LEFT JOIN → Mostrará NULL en ramas
   - INNER JOIN → No aparecerá
   - Pista: El enunciado dice "cada alumno", usa LEFT JOIN

3. **¿Cómo evitar ramas duplicadas?**
   - `STRING_AGG(DISTINCT rama, ', ')`

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver commits y sus ramas
SELECT alumno_id, rama FROM commits;

-- PASO 2: Agrupar por alumno y concatenar ramas
SELECT 
  alumnos.nombre,
  STRING_AGG(DISTINCT commits.rama, ', ' ORDER BY commits.rama) AS ramas
FROM alumnos
LEFT JOIN commits ON alumnos.id = commits.???
GROUP BY alumnos.nombre
ORDER BY alumnos.nombre;
```

### 💡 Conceptos clave
- **STRING_AGG**: Concatena valores de múltiples filas en una sola celda
- **DISTINCT**: Elimina duplicados
- **ORDER BY dentro de STRING_AGG**: Ordena los valores concatenados

---

## 🎯 Reto 3: ¿Quiénes tuvieron commits fallidos?

**Objetivo:** Alumnos con al menos 1 commit con estado 'failed'.

### 🤔 Preguntas guía

1. **¿Cómo filtrar por estado?**
   - `WHERE estado_ci = 'failed'`

2. **¿Cómo contar solo los fallidos?**
   - Primero filtra con WHERE, luego COUNT(*)

3. **¿HAVING o WHERE?**
   - WHERE → Filtra filas ANTES de agrupar
   - HAVING → Filtra grupos DESPUÉS de agrupar
   - Aquí: WHERE para filtrar commits fallidos

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver commits fallidos
SELECT * FROM commits WHERE estado_ci = 'failed';

-- PASO 2: Contar por alumno
SELECT 
  alumnos.nombre,
  COUNT(*) AS commits_fallidos
FROM alumnos
JOIN commits ON alumnos.id = commits.alumno_id
WHERE commits.estado_ci = ???  -- ¿Qué estado filtramos?
GROUP BY alumnos.nombre
HAVING COUNT(*) > 0  -- Opcional si ya filtraste con WHERE
ORDER BY commits_fallidos DESC;
```

### 💡 Conceptos clave
- **WHERE**: Filtra filas individuales
- **HAVING**: Filtra grupos
- **GROUP BY + COUNT**: Cuenta cuántas filas tiene cada grupo

---

## 🎯 Reto 4: ¿Qué bebidas son más populares?

**Objetivo:** Bebidas más consumidas.

### 🤔 Preguntas guía

1. **¿Qué tabla tiene las bebidas?**
   - `cafe_ordenes`

2. **¿Qué necesitas contar?**
   - Cuántas veces aparece cada bebida
   - `COUNT(*) GROUP BY bebida`

3. **¿Necesitas JOIN?**
   - No, solo trabajas con una tabla

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver todas las bebidas
SELECT bebida FROM cafe_ordenes;

-- PASO 2: Contar por bebida
SELECT 
  bebida,
  COUNT(*) AS veces_consumida
FROM cafe_ordenes
GROUP BY ???
ORDER BY veces_consumida ???;  -- ¿Ascendente o descendente?
```

### 💡 Conceptos clave
- **GROUP BY sin JOIN**: Puedes agrupar en una sola tabla
- **ORDER BY DESC**: Más consumida primero

---

## 🎯 EXTRA: Timeline 02:00 - 02:30

**Objetivo:** Combinar TODOS los eventos (commits, café, Discord) en una línea de tiempo.

### 🤔 Preguntas guía

1. **¿Cómo combinar resultados de diferentes tablas?**
   - `UNION` → Elimina duplicados
   - `UNION ALL` → Mantiene todos (más rápido)
   - Pista: Usa UNION ALL

2. **¿Qué columnas necesitan las 3 queries?**
   - Todas deben tener las MISMAS columnas
   - Mismo orden, mismo tipo de dato

3. **¿Cómo filtrar por ventana de tiempo?**
   - `WHERE fecha BETWEEN '2025-10-19 02:00:00' AND '2025-10-19 02:30:00'`

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver commits en la ventana 02:00-02:30
SELECT 
  'commit' AS tipo_evento,
  alumnos.nombre AS nombre_usuario,
  commits.rama || ': ' || commits.mensaje AS detalle,
  commits.fecha AS timestamp
FROM commits
JOIN alumnos ON commits.alumno_id = alumnos.id
WHERE commits.fecha BETWEEN '2025-10-19 02:00:00' AND '2025-10-19 02:30:00';

-- PASO 2: Hacer lo mismo para café
-- Pista: cafe_ordenes tiene columna `fecha` también

-- PASO 3: Hacer lo mismo para Discord
-- Pista: discord_logs tiene columna `fecha`

-- PASO 4: Combinar los 3 con UNION ALL
WITH commits_window AS (
  -- Tu query de commits aquí
),
cafe_window AS (
  -- Tu query de café aquí
),
discord_window AS (
  -- Tu query de Discord aquí
)
SELECT * FROM (
  SELECT * FROM commits_window
  UNION ALL
  SELECT * FROM cafe_window
  UNION ALL
  SELECT * FROM discord_window
) timeline
ORDER BY timestamp ASC;
```

### 💡 Conceptos clave
- **UNION ALL**: Combina resultados de múltiples SELECTs
- **WITH (CTEs)**: Nombre temporal para queries, hace el código más legible
- **||**: Concatena strings (`'hola' || ' ' || 'mundo'` = 'hola mundo')
- **BETWEEN**: Filtra rango de fechas (inclusivo)

---

## 🚀 Siguiente paso

Day 2 es un salto grande. Si lo completaste, ¡estás listo para CTEs y Window Functions en Day 3! 🎉

**Recuerda:** UNION es como apilar resultados. Todas las queries deben tener las mismas columnas.

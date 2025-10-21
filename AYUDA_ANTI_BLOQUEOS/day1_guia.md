# 🆘 Day 1: SELECT Basics - Guía Anti-Bloqueos

---

## 🎯 Reto 1: Conoce al equipo

**Objetivo:** Listar todos los alumnos con su equipo y turno.

### 🤔 Preguntas guía

1. **¿Qué tablas necesitas?**
   - Piensa: ¿Dónde están los nombres de los alumnos?
   - ¿Dónde está el nombre del equipo?
   - Pista: Son **dos tablas** diferentes

2. **¿Cómo las conectas?**
   - ¿Qué columna tienen en común ambas tablas?
   - Pista: Busca algo que diga `equipo_id` en una y `id` en la otra

3. **¿Qué tipo de JOIN usas?**
   - ¿Quieres TODOS los alumnos o solo los que tengan equipo?
   - Pista: Si quieres todos → `JOIN` (o `INNER JOIN`)

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver qué hay en alumnos
SELECT * FROM alumnos LIMIT 3;

-- PASO 2: Ver qué hay en equipos
SELECT * FROM equipos;

-- PASO 3: Conectar ambas tablas
SELECT 
  alumnos.nombre,
  equipos.???,  -- ¿Qué columna de equipos quieres?
  alumnos.???   -- ¿Qué más del alumno necesitas?
FROM alumnos
JOIN equipos ON alumnos.??? = equipos.???;  -- ¿Qué columnas conectan?

-- PASO 4: Ordenar
-- Pista: ORDER BY acepta varias columnas separadas por comas
```

### 💡 Conceptos clave
- **JOIN**: Conecta dos tablas usando una columna común
- **Alias**: Puedes escribir `e.nombre AS equipo` para renombrar columnas

---

## 🎯 Reto 2: ¿Quién mencionó a Chipi?

**Objetivo:** Commits que contengan "chipi" (sin importar mayúsculas).

### 🤔 Preguntas guía

1. **¿Dónde están los commits?**
   - Tabla: `commits`
   - ¿Qué columna tiene el texto del mensaje?

2. **¿Cómo buscar texto que contenga algo?**
   - `WHERE mensaje = 'chipi'` → NO, busca exacto
   - `WHERE mensaje LIKE '%chipi%'` → Sí, pero distingue mayúsculas
   - `WHERE mensaje ILIKE '%chipi%'` → ✅ Perfecto, ignora mayúsculas

3. **¿Necesitas el nombre del alumno?**
   - Sí → JOIN con `alumnos`
   - No → Solo `SELECT * FROM commits WHERE ...`

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver commits con "chipi"
SELECT mensaje FROM commits WHERE mensaje ILIKE '%chipi%';

-- PASO 2: Añadir JOIN para traer el nombre del alumno
SELECT 
  alumnos.???,  -- Nombre del alumno
  commits.rama,
  commits.mensaje,
  commits.???   -- ¿Qué más pide el enunciado?
FROM commits
JOIN alumnos ON commits.??? = alumnos.???
WHERE commits.mensaje ILIKE '%chipi%';

-- PASO 3: Ordenar por fecha (más reciente primero)
-- Pista: ORDER BY fecha DESC
```

### 💡 Conceptos clave
- **ILIKE**: Búsqueda insensible a mayúsculas
- **%**: Comodín que significa "cualquier texto"
- **DESC**: Descendente (del mayor al menor, más reciente primero)

---

## 🎯 Reto 3: Cafetera a las 02:13

**Objetivo:** ¿Quién tomó café exactamente a las 02:13?

### 🤔 Preguntas guía

1. **¿Qué tabla tiene las órdenes de café?**
   - `cafe_ordenes`

2. **¿Cómo filtrar por hora exacta?**
   - La columna `hora` es de tipo TIME
   - Puedes comparar directamente: `WHERE hora = '02:13'`
   - O convertir: `WHERE hora = '02:13:00'::time`

3. **¿Necesitas el nombre del alumno?**
   - Sí, JOIN con `alumnos`

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver todas las órdenes de café
SELECT * FROM cafe_ordenes LIMIT 5;

-- PASO 2: Filtrar por hora 02:13
SELECT * FROM cafe_ordenes WHERE hora = ???;

-- PASO 3: Añadir JOIN para traer el nombre
SELECT 
  alumnos.???,
  cafe_ordenes.bebida,
  cafe_ordenes.???,  -- ¿Qué más pide el enunciado?
  cafe_ordenes.hora
FROM cafe_ordenes
JOIN alumnos ON cafe_ordenes.??? = alumnos.???
WHERE cafe_ordenes.hora = '02:13';
```

### 💡 Conceptos clave
- **TIME**: Tipo de dato para horas (HH:MM:SS)
- **::time**: Conversión explícita (opcional si el string ya está en formato correcto)

---

## 🎯 Reto 4: Últimas pistas en Discord

**Objetivo:** Últimos 10 mensajes en #general, #confesiones, #secreto.

### 🤔 Preguntas guía

1. **¿Cómo filtrar por varios valores?**
   - `WHERE canal = '#general' OR canal = '#confesiones' OR ...` → Funciona pero largo
   - `WHERE canal IN ('#general', '#confesiones', '#secreto')` → ✅ Más limpio

2. **¿Cómo limitar a 10 filas?**
   - `LIMIT 10` al final de la query

3. **¿Cómo ordenar para tener los más recientes?**
   - `ORDER BY fecha DESC` → Más reciente primero

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver todos los logs de Discord
SELECT * FROM discord_logs LIMIT 5;

-- PASO 2: Filtrar por canales sospechosos
SELECT * FROM discord_logs 
WHERE canal IN (???, ???, ???);

-- PASO 3: Ordenar y limitar
SELECT 
  usuario,
  canal,
  mensaje,
  fecha
FROM discord_logs
WHERE canal IN ('#general', '#confesiones', '#secreto')
ORDER BY ??? ???  -- ¿Cómo ordenar por fecha más reciente?
LIMIT ???;
```

### 💡 Conceptos clave
- **IN**: Compara con una lista de valores
- **LIMIT**: Limita el número de filas del resultado
- **ORDER BY ... DESC**: Orden descendente (mayor a menor)

---

## 🎯 BONUS: ¿Quién está raro?

**Objetivo:** Alumnos sospechosos (tarde/noche + café + commits fallidos).

### 🤔 Preguntas guía

1. **¿Qué tablas necesitas?**
   - `alumnos` (turno)
   - `commits` (estado_ci = 'failed')
   - `cafe_ordenes` (que hayan tomado café)

2. **¿Cómo combinar múltiples condiciones?**
   - Necesitas 3 JOINs diferentes
   - GROUP BY para contar por alumno

3. **¿Cómo contar commits fallidos?**
   - `COUNT(*)` con `WHERE estado_ci = 'failed'`
   - O mejor: `COUNT(CASE WHEN estado_ci = 'failed' THEN 1 END)`

4. **¿Cómo juntar bebidas en una sola celda?**
   - `STRING_AGG(bebida, ', ')` → Concatena con comas

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver alumnos de tarde/noche
SELECT * FROM alumnos WHERE turno IN ('tarde', 'noche');

-- PASO 2: Añadir commits fallidos (GROUP BY)
SELECT 
  alumnos.nombre,
  COUNT(CASE WHEN commits.estado_ci = 'failed' THEN 1 END) as commits_fallidos
FROM alumnos
LEFT JOIN commits ON alumnos.id = commits.alumno_id
WHERE alumnos.turno IN ('tarde', 'noche')
GROUP BY alumnos.id, alumnos.nombre;

-- PASO 3: Añadir bebidas con STRING_AGG
SELECT 
  alumnos.nombre,
  alumnos.turno,
  COUNT(DISTINCT CASE WHEN commits.estado_ci = 'failed' THEN commits.id END) as commits_fallidos,
  STRING_AGG(DISTINCT cafe_ordenes.bebida, ', ' ORDER BY cafe_ordenes.bebida) as bebidas
FROM alumnos
LEFT JOIN commits ON alumnos.id = commits.alumno_id
LEFT JOIN cafe_ordenes ON alumnos.id = cafe_ordenes.alumno_id
WHERE alumnos.turno IN ('tarde', 'noche')
GROUP BY alumnos.id, alumnos.nombre, alumnos.turno
HAVING ??? > 0 AND ???;  -- ¿Qué condiciones filtran sospechosos?
```

### 💡 Conceptos clave
- **GROUP BY**: Agrupa filas para hacer cálculos (COUNT, SUM, AVG)
- **HAVING**: Filtra grupos (después de GROUP BY)
- **STRING_AGG**: Concatena valores de múltiples filas
- **LEFT JOIN**: Incluye todos los alumnos aunque no tengan commits/café
- **DISTINCT**: Elimina duplicados

---

## 🚀 Siguiente paso

Si completaste Day 1, ¡felicidades! 🎉 Ahora ve a **Day 2** donde combinarás JOINs con agregaciones más complejas.

**Recuerda:** Prueba cada paso en DBeaver antes de avanzar al siguiente.

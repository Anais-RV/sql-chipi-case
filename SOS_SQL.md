# 🆘 SQL - Chuleta de Rescate

Ayuda rápida para resolver los retos de sql-chipi-case.

---

## 📌 SELECT Básico

```sql
-- Mostrar todas las columnas
SELECT * FROM alumnos;

-- Columnas específicas
SELECT nombre, email FROM alumnos;

-- Con alias
SELECT nombre AS estudiante, turno AS horario FROM alumnos;
```

---

## 🔍 Filtros (WHERE)

```sql
-- Condición exacta
SELECT * FROM alumnos WHERE turno = 'mañana';

-- Búsqueda parcial (case-insensitive)
SELECT * FROM commits WHERE mensaje ILIKE '%chipi%';

-- Múltiples condiciones
SELECT * FROM alumnos WHERE turno = 'tarde' AND equipo_id = 1;
```

---

## 🔗 JOINs

```sql
-- INNER JOIN (solo filas que coinciden)
SELECT a.nombre, e.nombre AS equipo
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;

-- LEFT JOIN (todas las filas de la izquierda)
SELECT e.nombre, COUNT(a.id) AS miembros
FROM equipos e
LEFT JOIN alumnos a ON e.id = a.equipo_id
GROUP BY e.nombre;
```

---

## 📊 Agregaciones (GROUP BY)

```sql
-- Contar por grupo
SELECT turno, COUNT(*) AS total
FROM alumnos
GROUP BY turno;

-- Concatenar textos
SELECT equipo_id, STRING_AGG(nombre, ', ') AS miembros
FROM alumnos
GROUP BY equipo_id;
```

---

## 🪟 Window Functions

```sql
-- Ranking por partición
SELECT nombre, equipo_id,
       ROW_NUMBER() OVER (PARTITION BY equipo_id ORDER BY nombre) AS ranking
FROM alumnos;
```

---

## 🧩 CTEs (WITH)

```sql
WITH turnos_count AS (
    SELECT turno, COUNT(*) AS total
    FROM alumnos
    GROUP BY turno
)
SELECT * FROM turnos_count WHERE total > 3;
```

---

## 🛠️ Funciones Útiles

```sql
-- Substring
SUBSTRING('noche', 1, 1)  -- 'n'

-- Upper/Lower
UPPER('hola')  -- 'HOLA'

-- Concatenar
'A' || 'B' || 'C'  -- 'ABC'

-- Fecha/Hora
EXTRACT(HOUR FROM timestamp)  -- Obtener hora
TO_CHAR(timestamp, 'HH')      -- Hora como texto
```

---

## 💡 Consejos

- Usa **\d nombre_tabla** en psql para ver estructura.
- Lee SCHEMA_REFERENCE.md para detalles de cada tabla.
- Ejecuta queries parciales para debuggear paso a paso.
- Day 4 requiere combinar varias técnicas: ¡piensa en subqueries o CTEs!

---

*Si sigues atascado, revisa las pistas en cada reto. ¡No hay trampa, solo SQL!*

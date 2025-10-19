# 🐼 sql-chipi-case: Retos del Día 2 - JOINs y Análisis Avanzado

## 📖 Contexto
Los retos del Día 1 te dieron pistas. Ahora necesitas análisis más profundos para descubrir quién miente.

---

## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?
**Dificultad:** ⭐⭐ Intermedio (GROUP BY + COUNT)

Agrupa por equipo y cuenta miembros.

```sql
SELECT 
  e.nombre as equipo, 
  COUNT(a.id) as cantidad_alumnos 
FROM equipos e 
LEFT JOIN alumnos a ON e.id = a.equipo_id 
GROUP BY e.id, e.nombre 
ORDER BY cantidad_alumnos DESC;
```

---

## 🎯 Reto 2: ¿Quién trabajó en qué rama?
**Dificultad:** ⭐⭐ Intermedio (GROUP BY + STRING_AGG)

Muestra para cada alumno sus ramas de trabajo.

```sql
SELECT 
  a.nombre, 
  STRING_AGG(DISTINCT c.rama, ', ') as ramas 
FROM alumnos a 
LEFT JOIN commits c ON a.id = c.alumno_id 
GROUP BY a.id, a.nombre 
ORDER BY a.nombre;
```

---

## 🎯 Reto 3: Análisis de commits por estado
**Dificultad:** ⭐⭐⭐ Avanzado (GROUP BY + HAVING)

¿Quién tiene más commits fallidos?

```sql
SELECT 
  a.nombre, 
  c.estado_ci, 
  COUNT(c.id) as total_commits 
FROM alumnos a 
JOIN commits c ON a.id = c.alumno_id 
GROUP BY a.id, a.nombre, c.estado_ci 
HAVING c.estado_ci = 'failed' 
ORDER BY total_commits DESC;
```

---

## 🎯 Reto 4: Timeline de eventos sospechosos
**Dificultad:** ⭐⭐⭐ Avanzado (ORDER BY + TIMESTAMP)

Crea un timeline de todo lo que pasó entre las 02:00 y las 02:30.

```sql
SELECT 
  ca.fecha, 
  'café' as evento, 
  a.nombre, 
  ca.bebida as detalles 
FROM cafe_ordenes ca 
JOIN alumnos a ON ca.alumno_id = a.id 
WHERE ca.hora BETWEEN '02:00' AND '02:30'

UNION ALL

SELECT 
  c.fecha, 
  'commit' as evento, 
  a.nombre, 
  c.mensaje as detalles 
FROM commits c 
JOIN alumnos a ON c.alumno_id = a.id 
WHERE c.fecha::time BETWEEN '02:00' AND '02:30'

UNION ALL

SELECT 
  d.fecha, 
  'discord' as evento, 
  d.usuario, 
  d.mensaje as detalles 
FROM discord_logs d 
WHERE d.fecha::time BETWEEN '02:00' AND '02:30'

ORDER BY fecha DESC;
```

---

## ⭐ BONUS: Correlación sospechosa
**Dificultad:** ⭐⭐⭐⭐ Experto (JOINs múltiples + Subqueries)

Encuentra alumnos que:
- Tomaron café de noche
- Tienen commits fallidos
- Y están mencionados en Discord

```sql
WITH sospechosos_cafe AS (
  SELECT DISTINCT a.id, a.nombre
  FROM alumnos a
  JOIN cafe_ordenes c ON a.id = c.alumno_id
  WHERE EXTRACT(HOUR FROM c.hora) >= 22 
     OR EXTRACT(HOUR FROM c.hora) < 6
),
sospechosos_commits AS (
  SELECT DISTINCT a.id, a.nombre
  FROM alumnos a
  JOIN commits c ON a.id = c.alumno_id
  WHERE c.estado_ci = 'failed'
),
sospechosos_discord AS (
  SELECT DISTINCT usuario as nombre
  FROM discord_logs
  WHERE mensaje ILIKE '%chipi%'
)
SELECT DISTINCT sc.nombre
FROM sospechosos_cafe sc
WHERE sc.nombre IN (SELECT nombre FROM sospechosos_commits)
  AND sc.nombre IN (SELECT nombre FROM sospechosos_discord);
```

---

## 🔮 Conclusión

Si has llegado hasta aquí, ya tienes las herramientas para ser **SQL Detective Pro**.

Próximo paso: **Día 3 - Window Functions y análisis temporal**

*Mamá Pato sigue negando. Cris sigue culpando al router.*

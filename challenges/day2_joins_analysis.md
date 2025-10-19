# 🐼 sql-chipi-case: Retos del Día 2 - JOINs y Análisis# 🐼 sql-chipi-case: Retos del Día 2 - JOINs y Análisis# 🐼 sql-chipi-case: Retos del Día 2 - JOINs y Análisis Avanzado



## 📖 Contexto



**Día 1 te dio pistas básicas. Ahora necesitas hacer análisis más profundos.**## 📖 Contexto## 📖 Contexto



Vas a conectar múltiples tablas y usar agregaciones para descubrir patrones sospechosos.Los retos del Día 1 te dieron pistas. Ahora necesitas análisis más profundos para descubrir quién miente.



---**Día 1 te dio pistas básicas. Ahora necesitas hacer análisis más profundos.**



## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?---



**Necesitamos saber cuántos miembros tiene cada equipo.**Vas a conectar múltiples tablas y usar agregaciones para descubrir patrones sospechosos.



Agrupa por equipo y cuenta cuántos alumnos hay en cada uno.## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?



**Columnas esperadas:**---**Dificultad:** ⭐⭐ Intermedio (GROUP BY + COUNT)

- `equipo` (nombre del equipo)

- `cantidad_alumnos` (cuántos alumnos)



**Orden:** Mayor cantidad primero## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?Agrupa por equipo y cuenta miembros.



**Nombre de la vista:** `solve_d2_r1`



**Pista:****Necesitamos saber cuántos miembros tiene cada equipo.**```sql

- Usa `COUNT()` para contar

- Usa `GROUP BY` para agrupar por equipoSELECT 

- Usa `ORDER BY` con DESC

Agrupa por equipo y cuenta cuántos alumnos hay en cada uno.  e.nombre as equipo, 

---

  COUNT(a.id) as cantidad_alumnos 

## 🎯 Reto 2: ¿En qué ramas trabajó cada alumno?

**Columnas esperadas:**FROM equipos e 

**Necesitamos saber: alumno → qué ramas usó**

- `equipo` (nombre del equipo)LEFT JOIN alumnos a ON e.id = a.equipo_id 

Para cada alumno, combina todas sus ramas en una línea (separadas por comas).

- `cantidad_alumnos` (cuántos alumnos)GROUP BY e.id, e.nombre 

**Columnas esperadas:**

- `nombre` (del alumno)ORDER BY cantidad_alumnos DESC;

- `ramas` (lista de ramas donde trabajó, separadas por ", ")

**Orden:** Mayor cantidad primero```

**Orden:** Alfabético por nombre



**Nombre de la vista:** `solve_d2_r2`

**Nombre de la vista:** `solve_d2_r1`---

**Pista:**

- Usa `STRING_AGG()` para combinar strings

- Usa `GROUP BY` para agrupar por alumno

- Si un alumno no tiene commits, debería aparecer sin ramas (usa `LEFT JOIN`)**Pista:**## 🎯 Reto 2: ¿Quién trabajó en qué rama?



---- Usa `COUNT()` para contar**Dificultad:** ⭐⭐ Intermedio (GROUP BY + STRING_AGG)



## 🎯 Reto 3: ¿Quién tiene commits fallidos?- Usa `GROUP BY` para agrupar por equipo



**Sabemos que alguien tiene muchos commits fallidos. ¿Quién es?**- Usa `ORDER BY` con DESCMuestra para cada alumno sus ramas de trabajo.



Para cada alumno, cuenta cuántos commits fallidos (estado_ci = 'failed') tiene.



**Columnas esperadas:**---```sql

- `nombre` (del alumno)

- `commits_fallidos` (cuántos commits fallaron)SELECT 



**Orden:** Mayor cantidad de fallos primero## 🎯 Reto 2: ¿En qué ramas trabajó cada alumno?  a.nombre, 



**Nombre de la vista:** `solve_d2_r3`  STRING_AGG(DISTINCT c.rama, ', ') as ramas 



**Pista:****Necesitamos saber: alumno → qué ramas usó**FROM alumnos a 

- Filtra donde `estado_ci = 'failed'`

- Usa `COUNT()` para contarLEFT JOIN commits c ON a.id = c.alumno_id 

- Usa `GROUP BY` para agrupar por alumno

- Usa `HAVING` para mostrar solo quiénes tienen al menos 1 falloPara cada alumno, combina todas sus ramas en una línea (separadas por comas).GROUP BY a.id, a.nombre 



---ORDER BY a.nombre;



## 🎯 Reto 4: ¿Qué bebidas se consumieron más?**Columnas esperadas:**```



**En la cafetera, ¿qué se tomó más? Esto podría revelar patrones.**- `nombre` (del alumno)



Cuéntalas bebidas: quién bebió qué, cuántas veces.- `ramas` (lista de ramas donde trabajó, separadas por ", ")---



**Columnas esperadas:**

- `bebida` (nombre de la bebida)

- `veces_consumida` (cuántas veces alguien la pidió)**Orden:** Alfabético por nombre## 🎯 Reto 3: Análisis de commits por estado



**Orden:** Más consumidas primero**Dificultad:** ⭐⭐⭐ Avanzado (GROUP BY + HAVING)



**Nombre de la vista:** `solve_d2_r4`**Nombre de la vista:** `solve_d2_r2`



**Pista:**¿Quién tiene más commits fallidos?

- Tabla `cafe_ordenes` tiene las bebidas

- Usa `COUNT()` para contar**Pista:**

- Usa `GROUP BY` para agrupar por bebida

- Usa `STRING_AGG()` para combinar strings```sql

---

- Usa `GROUP BY` para agrupar por alumnoSELECT 

## ⭐ BONUS: Timeline de todo lo que pasó

- Si un alumno no tiene commits, debería aparecer sin ramas (usa `LEFT JOIN`)  a.nombre, 

**Necesitamos ver TODO lo que sucedió entre las 02:00 y las 02:30 del 19 de octubre.**

  c.estado_ci, 

Combina eventos de:

- Café consumido---  COUNT(c.id) as total_commits 

- Commits hechos

- Mensajes en DiscordFROM alumnos a 



En UN SOLO resultado, cronológicamente ordenado.## 🎯 Reto 3: ¿Quién tiene commits fallidos?JOIN commits c ON a.id = c.alumno_id 



**Columnas esperadas:**GROUP BY a.id, a.nombre, c.estado_ci 

- `fecha` (cuándo pasó)

- `tipo_evento` (qué tipo: 'café', 'commit', 'discord')**Sabemos que alguien tiene muchos commits fallidos. ¿Quién es?**HAVING c.estado_ci = 'failed' 

- `quien` (quién/qué usuario)

- `detalles` (qué pasó: bebida, mensaje del commit, etc.)ORDER BY total_commits DESC;



**Orden:** Más reciente primeroPara cada alumno, cuenta cuántos commits fallidos (estado_ci = 'failed') tiene.```



**Nombre de la vista:** `solve_d2_bonus`



**Pista:****Columnas esperadas:**---

- Este es avanzado. Usa `UNION ALL` para combinar 3 SELECTs diferentes

- Cada SELECT debe tener las mismas 4 columnas- `nombre` (del alumno)

- Filtra por hora entre 02:00 y 02:30

- Ordena el resultado final por fecha DESC- `commits_fallidos` (cuántos commits fallaron)## 🎯 Reto 4: Timeline de eventos sospechosos



---**Dificultad:** ⭐⭐⭐ Avanzado (ORDER BY + TIMESTAMP)



## 📝 ¿Cómo entregar?**Orden:** Mayor cantidad de fallos primero



Para cada reto, **crea una vista SQL** con el nombre exacto:Crea un timeline de todo lo que pasó entre las 02:00 y las 02:30.



```sql**Nombre de la vista:** `solve_d2_r3`

CREATE VIEW solve_d2_r1 AS

SELECT ...```sql

```

**Pista:**SELECT 

Para validar tus retos:

- Filtra donde `estado_ci = 'failed'`  ca.fecha, 

```powershell

make check-day2- Usa `COUNT()` para contar  'café' as evento, 

```

- Usa `GROUP BY` para agrupar por alumno  a.nombre, 

---

- Usa `HAVING` para mostrar solo quiénes tienen al menos 1 fallo  ca.bebida as detalles 

## 🎓 Conceptos SQL del Día 2

FROM cafe_ordenes ca 

- ✅ **COUNT()** - Contar filas

- ✅ **GROUP BY** - Agrupar datos---JOIN alumnos a ON ca.alumno_id = a.id 

- ✅ **HAVING** - Filtrar grupos

- ✅ **STRING_AGG()** - Combinar stringsWHERE ca.hora BETWEEN '02:00' AND '02:30'

- ✅ **ORDER BY DESC** - Ordenar descendente

- ✅ **LEFT JOIN** - JOINs preservando tabla izquierda## 🎯 Reto 4: ¿Qué bebidas se consumieron más?

- ✅ **UNION ALL** - Combinar múltiples queries

UNION ALL

---

**En la cafetera, ¿qué se tomó más? Esto podría revelar patrones.**

## 🔮 Próximos pasos

SELECT 

- **Día 3 (opcional):** CTEs, Window Functions, análisis temporal avanzado

- **Conclusión:** ¿Quién secuestró a Chipi?Cuéntalas bebidas: quién bebió qué, cuántas veces.  c.fecha, 



**¡Casi resuelves el misterio! 🕵️**  'commit' as evento, 


**Columnas esperadas:**  a.nombre, 

- `bebida` (nombre de la bebida)  c.mensaje as detalles 

- `veces_consumida` (cuántas veces alguien la pidió)FROM commits c 

JOIN alumnos a ON c.alumno_id = a.id 

**Orden:** Más consumidas primeroWHERE c.fecha::time BETWEEN '02:00' AND '02:30'



**Nombre de la vista:** `solve_d2_r4`UNION ALL



**Pista:**SELECT 

- Tabla `cafe_ordenes` tiene las bebidas  d.fecha, 

- Usa `COUNT()` para contar  'discord' as evento, 

- Usa `GROUP BY` para agrupar por bebida  d.usuario, 

  d.mensaje as detalles 

---FROM discord_logs d 

WHERE d.fecha::time BETWEEN '02:00' AND '02:30'

## ⭐ BONUS: Timeline de todo lo que pasó

ORDER BY fecha DESC;

**Necesitamos ver TODO lo que sucedió entre las 02:00 y las 02:30 del 19 de octubre.**```



Combina eventos de:---

- Café consumido

- Commits hechos## ⭐ BONUS: Correlación sospechosa

- Mensajes en Discord**Dificultad:** ⭐⭐⭐⭐ Experto (JOINs múltiples + Subqueries)



En UN SOLO resultado, cronológicamente ordenado.Encuentra alumnos que:

- Tomaron café de noche

**Columnas esperadas:**- Tienen commits fallidos

- `fecha` (cuándo pasó)- Y están mencionados en Discord

- `tipo_evento` (qué tipo: 'café', 'commit', 'discord')

- `quien` (quién/qué usuario)```sql

- `detalles` (qué pasó: bebida, mensaje del commit, etc.)WITH sospechosos_cafe AS (

  SELECT DISTINCT a.id, a.nombre

**Orden:** Más reciente primero  FROM alumnos a

  JOIN cafe_ordenes c ON a.id = c.alumno_id

**Nombre de la vista:** `solve_d2_bonus`  WHERE EXTRACT(HOUR FROM c.hora) >= 22 

     OR EXTRACT(HOUR FROM c.hora) < 6

**Pista:**),

- Este es avanzado. Usa `UNION ALL` para combinar 3 SELECTs diferentessospechosos_commits AS (

- Cada SELECT debe tener las mismas 4 columnas  SELECT DISTINCT a.id, a.nombre

- Filtra por hora entre 02:00 y 02:30  FROM alumnos a

- Ordena el resultado final por fecha DESC  JOIN commits c ON a.id = c.alumno_id

  WHERE c.estado_ci = 'failed'

---),

sospechosos_discord AS (

## 📝 ¿Cómo entregar?  SELECT DISTINCT usuario as nombre

  FROM discord_logs

Para cada reto, **crea una vista SQL** con el nombre exacto:  WHERE mensaje ILIKE '%chipi%'

)

```sqlSELECT DISTINCT sc.nombre

CREATE VIEW solve_d2_r1 ASFROM sospechosos_cafe sc

SELECT ...WHERE sc.nombre IN (SELECT nombre FROM sospechosos_commits)

```  AND sc.nombre IN (SELECT nombre FROM sospechosos_discord);

```

Para validar tus retos:

---

```powershell

make check-day2## 🔮 Conclusión

```

Si has llegado hasta aquí, ya tienes las herramientas para ser **SQL Detective Pro**.

---

Próximo paso: **Día 3 - Window Functions y análisis temporal**

## 🎓 Conceptos SQL del Día 2

*Mamá Pato sigue negando. Cris sigue culpando al router.*

- ✅ **COUNT()** - Contar filas
- ✅ **GROUP BY** - Agrupar datos
- ✅ **HAVING** - Filtrar grupos
- ✅ **STRING_AGG()** - Combinar strings
- ✅ **ORDER BY DESC** - Ordenar descendente
- ✅ **LEFT JOIN** - JOINs preservando tabla izquierda
- ✅ **UNION ALL** - Combinar múltiples queries

---

## 🔮 Próximos pasos

- **Día 3 (opcional):** CTEs, Window Functions, análisis temporal avanzado
- **Conclusión:** ¿Quién secuestró a Chipi?

**¡Casi resuelves el misterio! 🕵️**

# 🐼 sql-chipi-case: Retos del Día 2 - JOINs y Análisis# 🐼 sql-chipi-case: Retos del Día 2 - JOINs y Análisis# 🐼 sql-chipi-case: Retos del Día 2 - JOINs y Análisis# 🐼 sql-chipi-case: Retos del Día 2 - JOINs y Análisis# 🐼 sql-chipi-case: Retos del Día 2 - JOINs y Análisis Avanzado



## 📖 Contexto



**Día 1 te dio pistas básicas. Ahora necesitas hacer análisis más profundos.**## 📖 Contexto



Vas a conectar múltiples tablas y usar agregaciones para descubrir patrones sospechosos.



Los retos del Día 1 te dieron pistas. Ahora necesitas análisis más profundos para descubrir quién miente.**Día 1 te dio pistas básicas. Ahora necesitas hacer análisis más profundos.**## 📖 Contexto



---



## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?Vas a conectar múltiples tablas y usar agregaciones para descubrir patrones sospechosos.



**Objetivo:** Necesitamos saber cuántos miembros tiene cada equipo. Agrupa por equipo y cuenta.



**Dificultad:** ⭐⭐ Intermedio (GROUP BY + COUNT)---**Día 1 te dio pistas básicas. Ahora necesitas hacer análisis más profundos.**## 📖 Contexto## 📖 Contexto



**Columnas esperadas:**

- `equipo` (nombre del equipo)

- `cantidad_alumnos` (cuántos alumnos)## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?



**Orden:** Mayor cantidad primero



**Entregable:** Vista `solve_d2_r1`**Necesitamos saber cuántos miembros tiene cada equipo.**Vas a conectar múltiples tablas y usar agregaciones para descubrir patrones sospechosos.Los retos del Día 1 te dieron pistas. Ahora necesitas análisis más profundos para descubrir quién miente.



**Pista:**

- Usa `COUNT()` para contar

- Usa `GROUP BY` para agrupar por equipoAgrupa por equipo y cuenta cuántos alumnos hay en cada uno.

- Usa `ORDER BY` con DESC



---

**Dificultad:** ⭐⭐ Intermedio (GROUP BY + COUNT)---**Día 1 te dio pistas básicas. Ahora necesitas hacer análisis más profundos.**

## 🎯 Reto 2: ¿En qué ramas trabajó cada alumno?



**Objetivo:** Para cada alumno, combina todas sus ramas en una línea (separadas por comas).

**Columnas esperadas:**

**Dificultad:** ⭐⭐ Intermedio (GROUP BY + STRING_AGG + LEFT JOIN)

- `equipo` (nombre del equipo)

**Columnas esperadas:**

- `nombre` (del alumno)- `cantidad_alumnos` (cuántos alumnos)## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?---

- `ramas` (lista de ramas donde trabajó, separadas por ", ")



**Orden:** Alfabético por nombre

**Orden:** Mayor cantidad primero

**Entregable:** Vista `solve_d2_r2`



**Pista:**

- Usa `STRING_AGG()` para combinar strings**Nombre de la vista:** `solve_d2_r1`**Necesitamos saber cuántos miembros tiene cada equipo.**Vas a conectar múltiples tablas y usar agregaciones para descubrir patrones sospechosos.

- Usa `GROUP BY` para agrupar por alumno

- Si un alumno no tiene commits, debería aparecer sin ramas (usa `LEFT JOIN`)



---**Pista:**



## 🎯 Reto 3: ¿Quién tiene commits fallidos?- Usa `COUNT()` para contar



**Objetivo:** Para cada alumno, cuenta cuántos commits fallidos (estado_ci = 'failed') tiene.- Usa `GROUP BY` para agrupar por equipoAgrupa por equipo y cuenta cuántos alumnos hay en cada uno.## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?



**Dificultad:** ⭐⭐⭐ Avanzado (GROUP BY + HAVING + WHERE)- Usa `ORDER BY` con DESC



**Columnas esperadas:**

- `nombre` (del alumno)

- `commits_fallidos` (cuántos commits fallaron)**Ejemplo de resultado:**



**Orden:** Mayor cantidad de fallos primero```**Columnas esperadas:**---**Dificultad:** ⭐⭐ Intermedio (GROUP BY + COUNT)



**Entregable:** Vista `solve_d2_r3`     equipo      | cantidad_alumnos



**Pista:**-----------------+------------------- `equipo` (nombre del equipo)

- Filtra donde `estado_ci = 'failed'`

- Usa `COUNT()` para contar SuperKode A     |                5

- Usa `GROUP BY` para agrupar por alumno

- Usa `HAVING` para mostrar solo quiénes tienen al menos 1 fallo SuperKode B     |                4- `cantidad_alumnos` (cuántos alumnos)



--- SuperKode C     |                4



## 🎯 Reto 4: ¿Qué bebidas se consumieron más?```



**Objetivo:** En la cafetera, ¿qué se tomó más? Cuenta las bebidas.



**Dificultad:** ⭐⭐ Intermedio (GROUP BY + COUNT + ORDER BY)---**Orden:** Mayor cantidad primero## 🎯 Reto 1: ¿Cuántos alumnos hay en cada equipo?Agrupa por equipo y cuenta miembros.



**Columnas esperadas:**

- `bebida` (nombre de la bebida)

- `veces_consumida` (cuántas veces alguien la pidió)## 🎯 Reto 2: ¿En qué ramas trabajó cada alumno?



**Orden:** Más consumidas primero



**Entregable:** Vista `solve_d2_r4`**Necesitamos saber: alumno → qué ramas usó****Nombre de la vista:** `solve_d2_r1`



**Pista:**

- Tabla `cafe_ordenes` tiene las bebidas

- Usa `COUNT()` para contarPara cada alumno, combina todas sus ramas en una línea (separadas por comas).

- Usa `GROUP BY` para agrupar por bebida



---

**Dificultad:** ⭐⭐ Intermedio (GROUP BY + STRING_AGG + LEFT JOIN)**Pista:****Necesitamos saber cuántos miembros tiene cada equipo.**```sql

## ⭐ BONUS EXTRA: Timeline de todo lo que pasó



**Objetivo:** Necesitamos ver TODO lo que sucedió entre las 02:00 y las 02:30 del 19 de octubre.

**Columnas esperadas:**- Usa `COUNT()` para contar

Combina eventos de:

- Café consumido- `nombre` (del alumno)

- Commits hechos

- Mensajes en Discord- `ramas` (lista de ramas donde trabajó, separadas por ", ")- Usa `GROUP BY` para agrupar por equipoSELECT 



En UN SOLO resultado, cronológicamente ordenado.



**Dificultad:** ⭐⭐⭐⭐ Experto (UNION ALL + Múltiples JOINs)**Orden:** Alfabético por nombre- Usa `ORDER BY` con DESC



**Columnas esperadas:**

- `fecha` (cuándo pasó)

- `tipo_evento` (qué tipo: 'café', 'commit', 'discord')**Nombre de la vista:** `solve_d2_r2`Agrupa por equipo y cuenta cuántos alumnos hay en cada uno.  e.nombre as equipo, 

- `quien` (quién/qué usuario)

- `detalles` (qué pasó: bebida, mensaje del commit, etc.)



**Orden:** Más reciente primero**Pista:**---



**Entregable:** Vista `solve_d2_extra`- Usa `STRING_AGG()` para combinar strings



**Pista:**- Usa `GROUP BY` para agrupar por alumno  COUNT(a.id) as cantidad_alumnos 

- Este reto es avanzado. Usa `UNION ALL` para combinar 3 SELECTs diferentes

- Cada SELECT debe tener las mismas 4 columnas con los mismos tipos- Si un alumno no tiene commits, debería aparecer sin ramas (usa `LEFT JOIN`)

- Filtra por hora entre 02:00 y 02:30

- Ordena el resultado final por fecha DESC## 🎯 Reto 2: ¿En qué ramas trabajó cada alumno?



---**Ejemplo de resultado:**



## 📝 ¿Cómo entregar?```**Columnas esperadas:**FROM equipos e 



Para cada reto, **crea una vista SQL** con el nombre exacto:     nombre      |                       ramas



```sql------------------+-------------------------------------------------**Necesitamos saber: alumno → qué ramas usó**

CREATE VIEW solve_d2_r1 AS

SELECT ... Andrea           | main

```

 Cale             | main, fix/database, feature/auth- `equipo` (nombre del equipo)LEFT JOIN alumnos a ON e.id = a.equipo_id 

Para validar tus retos:

 Cris             | main, dev/tests

```powershell

make check-day2 ...Para cada alumno, combina todas sus ramas en una línea (separadas por comas).

```

```

---

- `cantidad_alumnos` (cuántos alumnos)GROUP BY e.id, e.nombre 

## 🎓 Conceptos SQL del Día 2

---

- ✅ **COUNT()** - Contar filas

- ✅ **GROUP BY** - Agrupar datos**Columnas esperadas:**

- ✅ **HAVING** - Filtrar grupos

- ✅ **STRING_AGG()** - Combinar strings## 🎯 Reto 3: Análisis de commits por estado

- ✅ **ORDER BY DESC** - Ordenar descendente

- ✅ **LEFT JOIN** - JOINs preservando tabla izquierda- `nombre` (del alumno)ORDER BY cantidad_alumnos DESC;

- ✅ **UNION ALL** - Combinar múltiples queries

- ✅ **WHERE** con agregaciones - Filtrar antes de agrupar**Sabemos que alguien tiene muchos commits fallidos. ¿Quién es?**



---- `ramas` (lista de ramas donde trabajó, separadas por ", ")



## 🔮 Próximos pasosPara cada alumno, cuenta cuántos commits fallidos (estado_ci = 'failed') tiene.



- **Día 3 (opcional):** CTEs, Window Functions, análisis temporal avanzado**Orden:** Mayor cantidad primero```

- **Conclusión:** ¿Quién secuestró a Chipi?

**Dificultad:** ⭐⭐⭐ Avanzado (GROUP BY + HAVING + WHERE)

---

**Orden:** Alfabético por nombre

*Mamá Pato 🦆 sigue negando. Cris sigue culpando al router. Tú tienes SQL. ¡Casi lo resuelves! 🕵️*

**Columnas esperadas:**

- `nombre` (del alumno)

- `commits_fallidos` (cuántos commits fallaron)

**Nombre de la vista:** `solve_d2_r2`

**Orden:** Mayor cantidad de fallos primero

**Nombre de la vista:** `solve_d2_r1`---

**Nombre de la vista:** `solve_d2_r3`

**Pista:**

**Pista:**

- Filtra donde `estado_ci = 'failed'`- Usa `STRING_AGG()` para combinar strings

- Usa `COUNT()` para contar

- Usa `GROUP BY` para agrupar por alumno- Usa `GROUP BY` para agrupar por alumno

- Usa `HAVING` para mostrar solo quiénes tienen al menos 1 fallo

- Si un alumno no tiene commits, debería aparecer sin ramas (usa `LEFT JOIN`)**Pista:**## 🎯 Reto 2: ¿Quién trabajó en qué rama?

**Ejemplo de resultado:**

```

    nombre     | commits_fallidos

---------------+---------------------- Usa `COUNT()` para contar**Dificultad:** ⭐⭐ Intermedio (GROUP BY + STRING_AGG)

 David         |                3

 Ramazan       |                2

 Sara          |                1

```## 🎯 Reto 3: ¿Quién tiene commits fallidos?- Usa `GROUP BY` para agrupar por equipo



---



## 🎯 Reto 4: ¿Qué bebidas se consumieron más?**Sabemos que alguien tiene muchos commits fallidos. ¿Quién es?**- Usa `ORDER BY` con DESCMuestra para cada alumno sus ramas de trabajo.



**En la cafetera, ¿qué se tomó más? Esto podría revelar patrones.**



Cuéntalas bebidas: quién bebió qué, cuántas veces.Para cada alumno, cuenta cuántos commits fallidos (estado_ci = 'failed') tiene.



**Dificultad:** ⭐⭐ Intermedio (GROUP BY + COUNT + ORDER BY)



**Columnas esperadas:****Columnas esperadas:**---```sql

- `bebida` (nombre de la bebida)

- `veces_consumida` (cuántas veces alguien la pidió)- `nombre` (del alumno)



**Orden:** Más consumidas primero- `commits_fallidos` (cuántos commits fallaron)SELECT 



**Nombre de la vista:** `solve_d2_r4`



**Pista:****Orden:** Mayor cantidad de fallos primero## 🎯 Reto 2: ¿En qué ramas trabajó cada alumno?  a.nombre, 

- Tabla `cafe_ordenes` tiene las bebidas

- Usa `COUNT()` para contar

- Usa `GROUP BY` para agrupar por bebida

**Nombre de la vista:** `solve_d2_r3`  STRING_AGG(DISTINCT c.rama, ', ') as ramas 

**Ejemplo de resultado:**

```

     bebida      | veces_consumida

-----------------+------------------**Pista:****Necesitamos saber: alumno → qué ramas usó**FROM alumnos a 

 café con leche  |                7

 matcha latte    |                5- Filtra donde `estado_ci = 'failed'`

 café solo       |                3

```- Usa `COUNT()` para contarLEFT JOIN commits c ON a.id = c.alumno_id 



---- Usa `GROUP BY` para agrupar por alumno



## ⭐ BONUS: Timeline de todo lo que pasó- Usa `HAVING` para mostrar solo quiénes tienen al menos 1 falloPara cada alumno, combina todas sus ramas en una línea (separadas por comas).GROUP BY a.id, a.nombre 



**Necesitamos ver TODO lo que sucedió entre las 02:00 y las 02:30 del 19 de octubre.**



Combina eventos de:---ORDER BY a.nombre;

- Café consumido

- Commits hechos

- Mensajes en Discord

## 🎯 Reto 4: ¿Qué bebidas se consumieron más?**Columnas esperadas:**```

En UN SOLO resultado, cronológicamente ordenado.



**Dificultad:** ⭐⭐⭐⭐ Experto (UNION ALL + Múltiples JOINs)

**En la cafetera, ¿qué se tomó más? Esto podría revelar patrones.**- `nombre` (del alumno)

**Columnas esperadas:**

- `fecha` (cuándo pasó)

- `tipo_evento` (qué tipo: 'café', 'commit', 'discord')

- `quien` (quién/qué usuario)Cuéntalas bebidas: quién bebió qué, cuántas veces.- `ramas` (lista de ramas donde trabajó, separadas por ", ")---

- `detalles` (qué pasó: bebida, mensaje del commit, etc.)



**Orden:** Más reciente primero

**Columnas esperadas:**

**Nombre de la vista:** `solve_d2_bonus`

- `bebida` (nombre de la bebida)

**Pista:**

- Este es avanzado. Usa `UNION ALL` para combinar 3 SELECTs diferentes- `veces_consumida` (cuántas veces alguien la pidió)**Orden:** Alfabético por nombre## 🎯 Reto 3: Análisis de commits por estado

- Cada SELECT debe tener las mismas 4 columnas

- Filtra por hora entre 02:00 y 02:30

- Ordena el resultado final por fecha DESC

**Orden:** Más consumidas primero**Dificultad:** ⭐⭐⭐ Avanzado (GROUP BY + HAVING)

**Ejemplo de resultado:**

```

            fecha            | tipo_evento |      quien      |                    detalles

-----------------------------+-------------+-----------------+--------------------------------------------**Nombre de la vista:** `solve_d2_r4`**Nombre de la vista:** `solve_d2_r2`

 2025-10-19 02:30:00         | discord     | root_but_intern | Si quereis recuperar a Chipi...

 2025-10-19 02:25:00         | commit      | David           | hotfix/chipi-emergency: EMERGENCIA...

 2025-10-19 02:13:00         | café        | Wizi            | matcha latte (sin leche)

```**Pista:**¿Quién tiene más commits fallidos?



---- Tabla `cafe_ordenes` tiene las bebidas



## 📝 ¿Cómo entregar?- Usa `COUNT()` para contar**Pista:**



Para cada reto, **crea una vista SQL** con el nombre exacto:- Usa `GROUP BY` para agrupar por bebida



```sql- Usa `STRING_AGG()` para combinar strings```sql

CREATE VIEW solve_d2_r1 AS

SELECT ...---

```

- Usa `GROUP BY` para agrupar por alumnoSELECT 

Para validar tus retos:

## ⭐ BONUS: Timeline de todo lo que pasó

```powershell

make check-day2- Si un alumno no tiene commits, debería aparecer sin ramas (usa `LEFT JOIN`)  a.nombre, 

```

**Necesitamos ver TODO lo que sucedió entre las 02:00 y las 02:30 del 19 de octubre.**

---

  c.estado_ci, 

## 🎓 Conceptos SQL del Día 2

Combina eventos de:

- ✅ **COUNT()** - Contar filas

- ✅ **GROUP BY** - Agrupar datos- Café consumido---  COUNT(c.id) as total_commits 

- ✅ **HAVING** - Filtrar grupos

- ✅ **STRING_AGG()** - Combinar strings- Commits hechos

- ✅ **ORDER BY DESC** - Ordenar descendente

- ✅ **LEFT JOIN** - JOINs preservando tabla izquierda- Mensajes en DiscordFROM alumnos a 

- ✅ **UNION ALL** - Combinar múltiples queries

- ✅ **WHERE** con agregaciones - Filtrar antes de agrupar



---En UN SOLO resultado, cronológicamente ordenado.## 🎯 Reto 3: ¿Quién tiene commits fallidos?JOIN commits c ON a.id = c.alumno_id 



## 🔮 Próximos pasos



- **Día 3 (opcional):** CTEs, Window Functions, análisis temporal avanzado**Columnas esperadas:**GROUP BY a.id, a.nombre, c.estado_ci 

- **Conclusión:** ¿Quién secuestró a Chipi?

- `fecha` (cuándo pasó)

---

- `tipo_evento` (qué tipo: 'café', 'commit', 'discord')**Sabemos que alguien tiene muchos commits fallidos. ¿Quién es?**HAVING c.estado_ci = 'failed' 

*Mamá Pato 🦆 sigue negando. Cris sigue culpando al router. Tú tienes SQL. ¡Casi lo resuelves! 🕵️*

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

# 🐼 sql-chipi-case: Retos del Día 1 - SELECT Basics# 🐼 sql-chipi-case: Retos del Día 1 - SELECT Basics



## 📖 Contexto



**Chipi desapareció a las 02:13 del 19 de octubre.** Los formadores (Cris, Andrea, Yeraldín y Mamá Pato 🦆) sospechan. Tú debes investigar con **SQL**.## 📖 Contexto



Los alumnos del bootcamp SuperKode tienen datos, pero necesitas preguntar a la base de datos para descubrir pistas.



**Tu misión: usa SQL para descubrir quién secuestró a Chipi.****Chipi desapareció a las 02:13 del 19 de octubre.** Los formadores (Cris, Andrea, Yeraldín y Mamá Pato 🦆) sospechan. Tú debes investigar con **SQL**.## 📖 Contexto



---



## 🎯 Reto 1: ¿Quién es quién en SuperKode?Los alumnos del bootcamp SuperKode tienen datos, pero necesitas preguntar a la base de datos para descubrir pistas.



**Objetivo:** Listar a **todos los alumnos** con su nombre, equipo y turno.



**Dificultad:** ⭐ Básico (SELECT + JOIN)**Tu misión: usa SQL para descubrir quién secuestró a Chipi.****Chipi desapareció a las 02:13 del 19 de octubre.** Los formadores sospechan. Tú debes investigar con **SQL**.## 📖 Contexto## 📖 Contexto



**Columnas esperadas:**

- `nombre` (del alumno)

- `equipo` (nombre del equipo)---

- `turno` (mañana, tarde o noche)



**Orden:** Primero por equipo (A→Z), luego por nombre (A→Z)

## 🎯 Reto 1: Conoce al equipoLos alumnos del bootcamp SuperKode tienen datos, pero necesitas preguntar a la base de datos para descubrir pistas.Chipi desapareció a las **02:13** del 19 de octubre. Los formadores (Cris, Andrea, Yeraldín y Mamá Pato 🦆) señalan al router, al pipeline, al CI... pero alguien miente.

**Entregable:** Vista `solve_d1_r1`



**Pista:** Necesitas datos de dos tablas: `alumnos` y `equipos`. Usa `JOIN` para conectarlas.

**¿Quién es quién en SuperKode?**

---



## 🎯 Reto 2: ¿Quién mencionó a Chipi?

Necesitamos listar a **todos los alumnos** con su nombre, su equipo y su turno.---**Chipi desapareció a las 02:13 del 19 de octubre.** Los formadores sospechan. Tú debes investigar con **SQL**.

**Objetivo:** Encontrar todos los **commits que contengan la palabra "chipi"** (sin importar mayúsculas/minúsculas).



**Dificultad:** ⭐⭐ Intermedio (WHERE + ILIKE + JOIN)

**Dificultad:** ⭐ Básico (SELECT + JOIN)

**Columnas esperadas:**

- `nombre` (del alumno que hizo el commit)

- `rama` (nombre de la rama)

- `mensaje` (el mensaje del commit)**Columnas esperadas:**## 🎯 Reto 1: Conoce al equipoTu misión: **usa SQL para descubrir quién secuestró a Chipi.**

- `estado_ci` (success, failed, pending)

- `fecha` (cuándo fue el commit)- `nombre` (del alumno)



**Orden:** Más recientes primero- `equipo` (nombre del equipo)



**Entregable:** Vista `solve_d1_r2`- `turno` (mañana, tarde, noche)



**Pista:****¿Quién es quién en SuperKode?**Los alumnos del bootcamp SuperKode tienen datos, pero necesitas preguntar a la base de datos para descubrir pistas.

- Tabla `commits` contiene los commits

- Tabla `alumnos` contiene quién los hizo**Orden:** Primero por equipo (A→Z), luego por nombre (A→Z)

- Usa `WHERE` con `ILIKE` para búsqueda flexible (sin importar mayúsculas)



---

**Nombre de la vista:** `solve_d1_r1`

## 🎯 Reto 3: ¿Quién estaba en la cafetera a las 02:13? 🚨

Necesitamos listar a **todos los alumnos** con su nombre, su equipo y su turno.---

**Objetivo:** Encontrar **quién tomó café exactamente a las 02:13** (la hora del crimen).

**Pista:** Necesitas datos de dos tablas: `alumnos` y `equipos`. Usa `JOIN` para conectarlas.

**Dificultad:** ⭐⭐ Intermedio (WHERE + TIME + JOIN)



**Columnas esperadas:**

- `nombre` (del alumno)**Ejemplo de resultado:**

- `bebida` (qué tomó)

- `leche` (sí, no o parcial)```**Columnas esperadas:**---

- `hora` (la hora exacta)

     nombre      |    equipo     | turno

**Orden:** Alfabético por nombre

-----------------+---------------+-------- `nombre` (del alumno)

**Entregable:** Vista `solve_d1_r3`

 Miguel          | SuperKode A   | mañana

**Pista:**

- Tabla `cafe_ordenes` tiene café consumido Marcus          | SuperKode A   | mañana- `equipo` (nombre del equipo)## 🎯 Reto 1: Lista todos los alumnos con su equipo y turno

- Usa `WHERE` para filtrar por hora = '02:13'

- Necesitas `JOIN` con `alumnos` para saber el nombre SalchiPresi     | SuperKode A   | tarde



--- ...- `turno` (mañana, tarde, noche)



## 🎯 Reto 4: Últimas pistas en Discord```



**Objetivo:** Encontrar los **últimos 10 mensajes en los canales #general, #confesiones y #secreto**.## 🎯 Reto 1: Conoce al equipo**Dificultad:** ⭐ Básico (SELECT + JOIN)



**Dificultad:** ⭐⭐ Intermedio (WHERE + IN + ORDER BY + LIMIT)---



**Columnas esperadas:****Orden:** Primero por equipo (A→Z), luego por nombre (A→Z)

- `usuario` (quién escribió)

- `canal` (en qué canal)## 🎯 Reto 2: ¿Quién mencionó a Chipi?

- `mensaje` (qué escribió)

- `fecha` (cuándo)



**Orden:** Más recientes primero**Pista crítica: Alguien en los commits ha hablado de Chipi.**



**Entregable:** Vista `solve_d1_r4`**Nombre de la vista:** `solve_d1_r1`



**Pista:**Necesitamos encontrar todos los **commits que contengan la palabra "chipi"** (no importa mayúsculas).

- Tabla `discord_logs` tiene todos los mensajes

- Usa `WHERE` con `IN` para filtrar múltiples canales**¿Quién es quién en SuperKode?**Muestra el nombre, equipo y turno de todos los alumnos del bootcamp SuperKode.

- Usa `LIMIT` para los últimos 10

**Dificultad:** ⭐⭐ Intermedio (WHERE + ILIKE + JOIN)

---

**Pista:** Necesitas datos de dos tablas: `alumnos` y `equipos`. Usa `JOIN` para conectarlas.

## ⭐ BONUS: ¿Quién está raro?

**Columnas esperadas:**

**Objetivo:** Encontrar alumnos sospechosos que cumplen TODAS estas condiciones:

- `nombre` (del alumno que hizo el commit)

1. Estaban en turno de noche o tarde

2. Tomaron café (cualquier café)- `rama` (nombre de la rama)

3. Tuvieron al menos 1 commit fallido

- `mensaje` (el mensaje del commit)---

**Dificultad:** ⭐⭐⭐⭐ Experto (JOINs múltiples + GROUP BY + HAVING)

- `estado_ci` (success, failed, pending)

**Columnas esperadas:**

- `nombre` (del alumno)- `fecha` (cuándo fue el commit)Necesitamos listar a **todos los alumnos** con su nombre, su equipo y su turno.```sql

- `turno` (noche o tarde)

- `commits_fallidos` (cuántos fallaron)

- `bebidas` (qué bebidas tomaron, separadas por comas)

**Orden:** Más recientes primero## 🎯 Reto 2: ¿Quién mencionó a Chipi?

**Orden:** Más commits fallidos primero



**Entregable:** Vista `solve_d1_bonus`

**Nombre de la vista:** `solve_d1_r2`-- Escribe tu solución aquí

**Pista:**

- Este reto es difícil. Usa `GROUP BY` para agrupar por alumno

- Usa `LEFT JOIN` con tablas de `commits` y `cafe_ordenes`

- Usa `HAVING` para filtrar grupos (>0 commits fallidos)**Pista:****Pista crítica: Alguien en los commits ha hablado de Chipi.**

- Usa `STRING_AGG()` para combinar bebidas con comas

- Tabla `commits` contiene los commits

---

- Tabla `alumnos` contiene quién los hizo**Columnas esperadas:**SELECT 

## 📝 ¿Cómo entregar?

- Usa `WHERE` con `ILIKE` para búsqueda flexible (sin importar mayúsculas)

Para cada reto, **crea una vista SQL** con el nombre exacto:

Necesitamos encontrar todos los **commits que contengan la palabra "chipi"** (no importa mayúsculas).

```sql

CREATE VIEW solve_d1_r1 AS**Ejemplo de resultado:**

SELECT ...

``````- `nombre` (del alumno)  a.nombre, 



Para validar tus retos: nombre |           rama           |                    mensaje                     | estado_ci |           fecha



```powershell--------+--------------------------+------------------------------------------------+-----------+---------------------------**Columnas esperadas:**

make check-day1

``` Miguel | feature/auth             | Implementar JWT con chipi_secret               | success   | 2025-10-19 10:30:00



Esto te dirá si tu vista: David  | hotfix/chipi-emergency   | EMERGENCIA: Chipi desaparecido!                | pending   | 2025-10-19 02:15:00- `nombre` (del alumno que hizo el commit)- `equipo` (nombre del equipo)  e.nombre as equipo, 

- ✅ Existe

- ✅ Tiene las columnas correctas```

- ✅ Muestra los datos esperados

- `rama` (nombre de la rama)

---

---

## 🎓 Conceptos SQL del Día 1

- `mensaje` (el mensaje del commit)- `turno` (mañana, tarde, noche)  a.turno 

- ✅ **SELECT** - Qué columnas queremos

- ✅ **FROM** - De qué tabla## 🎯 Reto 3: Cafetera a las 02:13 🚨

- ✅ **JOIN** - Conectar dos tablas

- ✅ **WHERE** - Filtrar filas- `estado_ci` (success, failed, pending)

- ✅ **ORDER BY** - Ordenar resultados

- ✅ **LIMIT** - Limitar filas**Alerta: Chipi desapareció a las 02:13. ¿Quién estaba en la cafetera en ese momento?**

- ✅ **ILIKE** - Búsquedas insensibles a mayúsculas

- ✅ **IN** - Filtrar múltiples valores- `fecha` (cuándo fue el commit)FROM alumnos a 



---Necesitamos saber **quién tomó café exactamente a las 02:13**.



## 🔮 Próximos pasos



- **Día 2:** JOINs más complejos, GROUP BY avanzado, análisis de datos**Dificultad:** ⭐⭐ Intermedio (WHERE + TIME + JOIN)

- **Día 3 (opcional):** CTEs y Window Functions

**Orden:** Más recientes primero**Orden:** Primero por equipo (A→Z), luego por nombre (A→Z)JOIN equipos e ON a.equipo_id = e.id 

---

**Columnas esperadas:**

*Mamá Pato 🦆 sigue negando. Cris sigue culpando al router. Tú tienes SQL. ¡A investigar! 🕵️*

- `nombre` (del alumno)

- `bebida` (qué tomó)

- `leche` (sí o no)**Nombre de la vista:** `solve_d1_r2`ORDER BY e.nombre, a.nombre;

- `hora` (la hora exacta)



**Nombre de la vista:** `solve_d1_r3`

**Pista:** **Nombre de la vista:** `solve_d1_r1````

**Pista:**

- Tabla `cafe_ordenes` tiene café consumido- Tabla `commits` contiene los commits

- Usa `WHERE` para filtrar por hora = '02:13'

- Necesitas `JOIN` con `alumnos` para saber el nombre- Tabla `alumnos` contiene quién los hizo



**Ejemplo de resultado:**- Usa `WHERE` con `ILIKE` para búsqueda flexible (sin importar mayúsculas)

```

 nombre |    bebida    | leche | hora**Pista:** Necesitas datos de dos tablas: `alumnos` y `equipos`. Usa `JOIN` para conectarlas.**Expected output:**

--------+--------------+-------+-------

 Wizi   | matcha latte | no    | 02:13---

```

```

💡 **Nota:** Wizi estaba en la cafetera a la hora del crimen... coincidencia? 🤔

## 🎯 Reto 3: Cafetera a las 02:13 🚨

---

---      nombre      |    equipo     | turno

## 🎯 Reto 4: Últimas pistas sobre Chipi en Discord

**Alerta: Chipi desapareció a las 02:13. ¿Quién estaba en la cafetera en ese momento?**

**Los formadores dejaron mensajes en Discord. Necesitamos revisar los canales sospechosos.**

-----------------+---------------+-------

Encuentra los **últimos 10 mensajes en los canales #general, #confesiones y #secreto**.

Necesitamos saber **quién tomó café exactamente a las 02:13**.

**Dificultad:** ⭐⭐⭐ Avanzado (WHERE + ORDER BY + LIMIT + IN)

## 🎯 Reto 2: ¿Quién mencionó a Chipi? Miguel           | SuperKode A   | mañana

**Columnas esperadas:**

- `usuario` (quién escribió)**Columnas esperadas:**

- `canal` (en qué canal)

- `mensaje` (qué escribió)- `nombre` (del alumno) Marcus          | SuperKode A   | mañana

- `fecha` (cuándo)

- `bebida` (qué tomó)

**Orden:** Más recientes primero

- `leche` (sí o no)**Pista crítica: Alguien en los commits ha hablado de Chipi.** SalchiPresi     | SuperKode A   | tarde

**Nombre de la vista:** `solve_d1_r4`

- `hora` (la hora exacta)

**Pista:**

- Tabla `discord_logs` tiene todos los mensajes ...

- Usa `WHERE` para filtrar canales (con `IN`)

- Usa `LIMIT` para los últimos 10**Nombre de la vista:** `solve_d1_r3`



**Ejemplo de resultado:**Necesitamos encontrar todos los **commits que contengan la palabra "chipi"** (no importa mayúsculas).```

```

     usuario      |   canal    |                        mensaje                         |           fecha**Pista:**

------------------+------------+--------------------------------------------------------+---------------------------

 root_but_intern  | #secreto   | Si quereis recuperar a Chipi, consultad mejor que nunca| 2025-10-19 02:30:00- Tabla `cafe_ordenes` tiene café consumido

 SalchiPresi      | #general   | Los logs de Discord tampoco tienen coherencia a esa ho| 2025-10-19 02:25:00

```- Usa `WHERE` para filtrar por hora = '02:13'



---- Necesitas `JOIN` con `alumnos` para saber el nombre**Columnas esperadas:**---



## ⭐ BONUS: ¿Quién miente?



**Los datos no cuadran. Encuentra a alumnos que:**---- `nombre` (del alumno que hizo el commit)



1. Estaban en turno de noche o tarde

2. Tomaron café (cualquier café)

3. Tuvieron al menos 1 commit fallido## 🎯 Reto 4: Pistas en Discord- `rama` (nombre de la rama)## 🎯 Reto 2: Encuentra commits que contengan "chipi"



**Dificultad:** ⭐⭐⭐⭐ Experto (JOINs múltiples + GROUP BY + HAVING)



**Columnas esperadas:****Los formadores dejaron mensajes en Discord. Necesitamos revisar los canales sospechosos.**- `mensaje` (el mensaje del commit)**Dificultad:** ⭐⭐ Intermedio (WHERE + ILIKE)

- `nombre`

- `turno`

- `commits_fallidos` (cuántos commits fallaron)

- `bebidas` (qué bebidas tomaron, separadas por comas)Encuentra los **últimos 10 mensajes en los canales #general, #confesiones y #secreto**.- `estado_ci` (success, failed, pending)



**Orden:** Más commits fallidos primero



**Nombre de la vista:** `solve_d1_bonus`**Columnas esperadas:**- `fecha` (cuándo fue el commit)¿Quién ha estado trabajando con "Chipi" en sus commits? Esto podría ser una pista.



**Pista:**- `usuario` (quién escribió)

- Este es difícil. Usa `GROUP BY` para agrupar por alumno

- Usa `LEFT JOIN` con tablas de `commits` y `cafe_ordenes`- `canal` (en qué canal)

- Usa `HAVING` para filtrar grupos (>0 commits fallidos)

- Usa `STRING_AGG()` para combinar bebidas- `mensaje` (qué escribió)



---- `fecha` (cuándo)**Orden:** Más recientes primero```sql



## 📝 ¿Cómo entregar?



Para cada reto, **crea una vista SQL** con el nombre exacto (`solve_d1_r1`, `solve_d1_r2`, etc.):**Orden:** Más recientes primero-- Escribe tu solución aquí



```sql

CREATE VIEW solve_d1_r1 AS

SELECT ...**Nombre de la vista:** `solve_d1_r4`**Nombre de la vista:** `solve_d1_r2`SELECT 

```



Para validar tus retos:

**Pista:**  a.nombre, 

```powershell

make check-day1- Tabla `discord_logs` tiene todos los mensajes

```

- Usa `WHERE` para filtrar canales (IN)**Pista:**   c.rama, 

Esto te dirá si tu vista:

- ✅ Existe- Usa `LIMIT` para los últimos 10

- ✅ Tiene las columnas correctas

- ✅ Muestra los datos esperados- Tabla `commits` contiene los commits  c.mensaje, 



------



## 🎓 Conceptos SQL del Día 1- Tabla `alumnos` contiene quién los hizo  c.estado_ci, 



- ✅ **SELECT** - Qué columnas queremos## ⭐ BONUS: ¿Quién está raro?

- ✅ **FROM** - De qué tabla

- ✅ **JOIN** - Conectar dos tablas- Usa `WHERE` con `ILIKE` para búsqueda flexible (sin importar mayúsculas)  c.fecha 

- ✅ **WHERE** - Filtrar filas

- ✅ **ORDER BY** - Ordenar resultados**Los datos no cuadran. Encuentra a alumnos que:**

- ✅ **LIMIT** - Limitar filas

- ✅ **GROUP BY** - Agrupar datos- **1. Estaban en turno de noche o tarde**FROM alumnos a 

- ✅ **HAVING** - Filtrar grupos

- ✅ **ILIKE** - Búsquedas insensibles a mayúsculas- **2. Tomaron café (cualquier café)**

- ✅ **STRING_AGG()** - Combinar valores en una cadena

- **3. Tuvieron al menos 1 commit fallido**---JOIN commits c ON a.id = c.alumno_id 

---



## 🔮 Próximos pasos

**Columnas esperadas:**WHERE c.mensaje ILIKE '%chipi%' 

- **Día 2:** JOINs más complejos, GROUP BY avanzado, análisis de datos

- **Día 3 (opcional):** CTEs, Window Functions, análisis temporal- `nombre`



---- `turno`## 🎯 Reto 3: Cafetera a las 02:13 🚨ORDER BY c.fecha DESC;



*Mamá Pato 🦆 sigue negando. Cris sigue culpando al router. Tú tienes SQL. ¡A investigar! 🕵️*- `commits_fallidos` (cuántos commits fallaron)


- `bebidas` (qué bebidas tomaron, separadas por comas)```



**Orden:** Más commits fallidos primero**Alerta: Chipi desapareció a las 02:13. ¿Quién estaba en la cafetera en ese momento?**



**Nombre de la vista:** `solve_d1_bonus`**Expected output:**



**Pista:**Necesitamos saber **quién tomó café exactamente a las 02:13**.```

- Este es difícil. Usa `GROUP BY` para agrupar por alumno

- Usa `LEFT JOIN` con tablas de `commits` y `cafe_ordenes` nombre  |           rama           |                    mensaje                     | estado_ci |           fecha

- Usa `HAVING` para filtrar grupos

- Usa `STRING_AGG()` para combinar bebidas**Columnas esperadas:**---------+--------------------------+------------------------------------------------+-----------+---------------------------



---- `nombre` (del alumno) Miguel   | feature/auth             | Implementar JWT con chipi_secret               | success   | 2025-10-19 10:30:00



## 📝 ¿Cómo entregar?- `bebida` (qué tomó) David    | hotfix/chipi-emergency   | EMERGENCIA: Chipi desaparecido!                | pending   | 2025-10-19 02:15:00



Para cada reto, **crea una vista SQL** con el nombre exacto (`solve_d1_r1`, `solve_d1_r2`, etc.):- `leche` (sí o no) ...



```sql- `hora` (la hora exacta)```

CREATE VIEW solve_d1_r1 AS

SELECT ...

```

**Nombre de la vista:** `solve_d1_r3`---

Para validar tus retos:



```powershell

make check-day1**Pista:**## 🎯 Reto 3: ¿Quién tomó café a las 02:13? 🚨

```

- Tabla `cafe_ordenes` tiene café consumido**Dificultad:** ⭐⭐ Intermedio (WHERE + TIME)

Esto te dirá si tu vista:

- ✅ Existe- Usa `WHERE` para filtrar por hora = '02:13'

- ✅ Tiene las columnas correctas

- ✅ Muestra los datos esperados- Necesitas `JOIN` con `alumnos` para saber el nombre**Pista crítica:** Alguien estaba en la cafetera exactamente cuando Chipi desapareció.



---



## 🎓 Conceptos SQL del Día 1---```sql



- ✅ **SELECT** - Qué columnas queremos-- Escribe tu solución aquí

- ✅ **FROM** - De qué tabla

- ✅ **JOIN** - Conectar dos tablas## 🎯 Reto 4: Pistas en DiscordSELECT 

- ✅ **WHERE** - Filtrar filas

- ✅ **ORDER BY** - Ordenar resultados  a.nombre, 

- ✅ **LIMIT** - Limitar filas

- ✅ **GROUP BY** - Agrupar datos (intro)**Los formadores dejaron mensajes en Discord. Necesitamos revisar los canales sospechosos.**  c.bebida, 

- ✅ **HAVING** - Filtrar grupos (intro)

  c.leche, 

---

Encuentra los **últimos 10 mensajes en los canales #general, #confesiones y #secreto**.  c.hora 

## 🔮 Próximos pasos

FROM alumnos a 

- **Día 2:** JOINs más complejos, GROUP BY avanzado, análisis de datos

- **Día 3:** CTEs, Window Functions, análisis temporal (opcional)**Columnas esperadas:**JOIN cafe_ordenes c ON a.id = c.alumno_id 



**¡A investigar! 🕵️**- `usuario` (quién escribió)WHERE c.hora = '02:13';


- `canal` (en qué canal)```

- `mensaje` (qué escribió)

- `fecha` (cuándo)**Expected output:**

```

**Orden:** Más recientes primero nombre |    bebida    | leche | hora

--------+--------------+-------+-------

**Nombre de la vista:** `solve_d1_r4` Wizi   | matcha latte | no    | 02:13

```

**Pista:**

- Tabla `discord_logs` tiene todos los mensajes💡 **Nota:** Wizi estaba en la cafetera a la hora del crimen... coincidencia? Quizás solo tomaba matcha...

- Usa `WHERE` para filtrar canales (IN)

- Usa `LIMIT` para los últimos 10---



---## 🎯 Reto 4: Últimas pistas sobre Chipi en Discord

**Dificultad:** ⭐⭐⭐ Avanzado (WHERE + ORDER BY + LIMIT)

## ⭐ BONUS: ¿Quién está raro?

Revisa los canales #confesiones y #general. Las formadores y los alumnos han dejado pistas.

**Los datos no cuadran. Encuentra a alumnos que:**

- **1. Estaban en turno de noche o tarde**```sql

- **2. Tomaron café (cualquier café)**-- Escribe tu solución aquí

- **3. Tuvieron al menos 1 commit fallido**SELECT 

  usuario, 

**Columnas esperadas:**  canal, 

- `nombre`  mensaje, 

- `turno`  fecha 

- `commits_fallidos` (cuántos commits fallaron)FROM discord_logs 

- `bebidas` (qué bebidas tomaron, separadas por comas)WHERE canal IN ('#general', '#confesiones', '#secreto') 

ORDER BY fecha DESC 

**Orden:** Más commits fallidos primeroLIMIT 10;

```

**Nombre de la vista:** `solve_d1_bonus`

**Expected output:**

**Pista:**```

- Este es difícil. Usa `GROUP BY` para agrupar por alumno     usuario      |   canal    |                        mensaje                         |           fecha

- Usa `LEFT JOIN` con tablas de `commits` y `cafe_ordenes`------------------+------------+--------------------------------------------------------+---------------------------

- Usa `HAVING` para filtrar grupos root_but_intern  | #secreto   | Si quereis recuperar a Chipi, consultad mejor que nunca| 2025-10-19 02:30:00

- Usa `STRING_AGG()` para combinar bebidas SalchiPresi      | #general   | Los logs de Discord tampoco tienen coherencia a esa ho| 2025-10-19 02:25:00

 ...

---```



## 📝 ¿Cómo entregar?---



Para cada reto, **crea una vista SQL** con el nombre exacto (`solve_d1_r1`, `solve_d1_r2`, etc.):## ⭐ BONUS CHALLENGE: ¿Quién miente? 🔍

**Dificultad:** ⭐⭐⭐⭐ Experto (JOINs múltiples + GROUP BY + HAVING)

```sql

CREATE VIEW solve_d1_r1 ASEncuentra a los alumnos que:

SELECT ...1. Tomaron café en turno de noche (Wizi, Sara, David) 

```2. Tuvieron commits fallidos

3. Y estaban en turno "noche" o "tarde" a las 02:13

Para validar tus retos:

```sql

```powershell-- Escribe tu solución aquí

make check-day1SELECT 

```  a.nombre, 

  a.turno, 

Esto te dirá si tu vista:  COUNT(c.id) as commits_fallidos, 

- ✅ Existe  STRING_AGG(ca.bebida, ', ') as bebidas 

- ✅ Tiene las columnas correctasFROM alumnos a 

- ✅ Muestra los datos esperadosLEFT JOIN commits c ON a.id = c.alumno_id AND c.estado_ci = 'failed' 

LEFT JOIN cafe_ordenes ca ON a.id = ca.alumno_id 

---WHERE a.turno IN ('noche', 'tarde') 

GROUP BY a.id, a.nombre, a.turno 

## 🎓 Conceptos SQL del Día 1HAVING COUNT(c.id) > 0 

ORDER BY commits_fallidos DESC;

- ✅ **SELECT** - Qué columnas queremos```

- ✅ **FROM** - De qué tabla

- ✅ **JOIN** - Conectar dos tablas---

- ✅ **WHERE** - Filtrar filas

- ✅ **ORDER BY** - Ordenar resultados## 🏁 ¿Qué has aprendido?

- ✅ **LIMIT** - Limitar filas

- ✅ **GROUP BY** - Agrupar datos (intro)✅ **SELECT** para elegir columnas  

- ✅ **HAVING** - Filtrar grupos (intro)✅ **JOIN** para conectar tablas  

✅ **WHERE** para filtrar datos  

---✅ **ORDER BY** para ordenar resultados  

✅ **ILIKE** para búsquedas insensibles a mayúsculas  

## 🔮 Próximos pasos✅ **LIMIT** para limitar filas  

✅ **GROUP BY** y **HAVING** para análisis de datos  

- **Día 2:** JOINs más complejos, GROUP BY avanzado, análisis de datos

- **Día 3:** CTEs, Window Functions, análisis temporal (opcional)---



**¡A investigar! 🕵️**## 🔮 Próximos pasos

- **Día 2:** Subqueries y CTEs (Common Table Expressions)
- **Día 3:** Window Functions y análisis avanzado
- **Día 4:** Descubre al culpable definitivo con todos los datos 🕵️

---

*Nota: Mamá Pato 🦆 sigue negando todo. Cris sigue culpando al router.*

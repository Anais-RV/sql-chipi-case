# 🐼 sql-chipi-case: Retos del Día 1 - SELECT Basics# 🐼 sql-chipi-case: Retos del Día 1 - SELECT Basics# 🐼 sql-chipi-case: Retos del Día 1 - SELECT Basics



## 📖 Contexto



**Chipi desapareció a las 02:13 del 19 de octubre.** Los formadores sospechan. Tú debes investigar con **SQL**.## 📖 Contexto## 📖 Contexto



Los alumnos del bootcamp SuperKode tienen datos, pero necesitas preguntar a la base de datos para descubrir pistas.Chipi desapareció a las **02:13** del 19 de octubre. Los formadores (Cris, Andrea, Yeraldín y Mamá Pato 🦆) señalan al router, al pipeline, al CI... pero alguien miente.



---**Chipi desapareció a las 02:13 del 19 de octubre.** Los formadores sospechan. Tú debes investigar con **SQL**.



## 🎯 Reto 1: Conoce al equipoTu misión: **usa SQL para descubrir quién secuestró a Chipi.**



**¿Quién es quién en SuperKode?**Los alumnos del bootcamp SuperKode tienen datos, pero necesitas preguntar a la base de datos para descubrir pistas.



Necesitamos listar a **todos los alumnos** con su nombre, su equipo y su turno.---



**Columnas esperadas:**---

- `nombre` (del alumno)

- `equipo` (nombre del equipo)## 🎯 Reto 1: Lista todos los alumnos con su equipo y turno

- `turno` (mañana, tarde, noche)

## 🎯 Reto 1: Conoce al equipo**Dificultad:** ⭐ Básico (SELECT + JOIN)

**Orden:** Primero por equipo (A→Z), luego por nombre (A→Z)



**Nombre de la vista:** `solve_d1_r1`

**¿Quién es quién en SuperKode?**Muestra el nombre, equipo y turno de todos los alumnos del bootcamp SuperKode.

**Pista:** Necesitas datos de dos tablas: `alumnos` y `equipos`. Usa `JOIN` para conectarlas.



---

Necesitamos listar a **todos los alumnos** con su nombre, su equipo y su turno.```sql

## 🎯 Reto 2: ¿Quién mencionó a Chipi?

-- Escribe tu solución aquí

**Pista crítica: Alguien en los commits ha hablado de Chipi.**

**Columnas esperadas:**SELECT 

Necesitamos encontrar todos los **commits que contengan la palabra "chipi"** (no importa mayúsculas).

- `nombre` (del alumno)  a.nombre, 

**Columnas esperadas:**

- `nombre` (del alumno que hizo el commit)- `equipo` (nombre del equipo)  e.nombre as equipo, 

- `rama` (nombre de la rama)

- `mensaje` (el mensaje del commit)- `turno` (mañana, tarde, noche)  a.turno 

- `estado_ci` (success, failed, pending)

- `fecha` (cuándo fue el commit)FROM alumnos a 



**Orden:** Más recientes primero**Orden:** Primero por equipo (A→Z), luego por nombre (A→Z)JOIN equipos e ON a.equipo_id = e.id 



**Nombre de la vista:** `solve_d1_r2`ORDER BY e.nombre, a.nombre;



**Pista:** **Nombre de la vista:** `solve_d1_r1````

- Tabla `commits` contiene los commits

- Tabla `alumnos` contiene quién los hizo

- Usa `WHERE` con `ILIKE` para búsqueda flexible (sin importar mayúsculas)

**Pista:** Necesitas datos de dos tablas: `alumnos` y `equipos`. Usa `JOIN` para conectarlas.**Expected output:**

---

```

## 🎯 Reto 3: Cafetera a las 02:13 🚨

---      nombre      |    equipo     | turno

**Alerta: Chipi desapareció a las 02:13. ¿Quién estaba en la cafetera en ese momento?**

-----------------+---------------+-------

Necesitamos saber **quién tomó café exactamente a las 02:13**.

## 🎯 Reto 2: ¿Quién mencionó a Chipi? Miguel           | SuperKode A   | mañana

**Columnas esperadas:**

- `nombre` (del alumno) Marcus          | SuperKode A   | mañana

- `bebida` (qué tomó)

- `leche` (sí o no)**Pista crítica: Alguien en los commits ha hablado de Chipi.** SalchiPresi     | SuperKode A   | tarde

- `hora` (la hora exacta)

 ...

**Nombre de la vista:** `solve_d1_r3`

Necesitamos encontrar todos los **commits que contengan la palabra "chipi"** (no importa mayúsculas).```

**Pista:**

- Tabla `cafe_ordenes` tiene café consumido

- Usa `WHERE` para filtrar por hora = '02:13'

- Necesitas `JOIN` con `alumnos` para saber el nombre**Columnas esperadas:**---



---- `nombre` (del alumno que hizo el commit)



## 🎯 Reto 4: Pistas en Discord- `rama` (nombre de la rama)## 🎯 Reto 2: Encuentra commits que contengan "chipi"



**Los formadores dejaron mensajes en Discord. Necesitamos revisar los canales sospechosos.**- `mensaje` (el mensaje del commit)**Dificultad:** ⭐⭐ Intermedio (WHERE + ILIKE)



Encuentra los **últimos 10 mensajes en los canales #general, #confesiones y #secreto**.- `estado_ci` (success, failed, pending)



**Columnas esperadas:**- `fecha` (cuándo fue el commit)¿Quién ha estado trabajando con "Chipi" en sus commits? Esto podría ser una pista.

- `usuario` (quién escribió)

- `canal` (en qué canal)

- `mensaje` (qué escribió)

- `fecha` (cuándo)**Orden:** Más recientes primero```sql



**Orden:** Más recientes primero-- Escribe tu solución aquí



**Nombre de la vista:** `solve_d1_r4`**Nombre de la vista:** `solve_d1_r2`SELECT 



**Pista:**  a.nombre, 

- Tabla `discord_logs` tiene todos los mensajes

- Usa `WHERE` para filtrar canales (IN)**Pista:**   c.rama, 

- Usa `LIMIT` para los últimos 10

- Tabla `commits` contiene los commits  c.mensaje, 

---

- Tabla `alumnos` contiene quién los hizo  c.estado_ci, 

## ⭐ BONUS: ¿Quién está raro?

- Usa `WHERE` con `ILIKE` para búsqueda flexible (sin importar mayúsculas)  c.fecha 

**Los datos no cuadran. Encuentra a alumnos que:**

- **1. Estaban en turno de noche o tarde**FROM alumnos a 

- **2. Tomaron café (cualquier café)**

- **3. Tuvieron al menos 1 commit fallido**---JOIN commits c ON a.id = c.alumno_id 



**Columnas esperadas:**WHERE c.mensaje ILIKE '%chipi%' 

- `nombre`

- `turno`## 🎯 Reto 3: Cafetera a las 02:13 🚨ORDER BY c.fecha DESC;

- `commits_fallidos` (cuántos commits fallaron)

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

#  Día 1: SELECT Basics

Chipi desapareció a las 02:13 del 19 de octubre. Los formadores sospechan. Tú investigas con **SQL**.

Tu misión: **crea vistas SQL con los nombres exactos indicados** y resuelve cada pista.

---

##  Reto 1: Conoce al equipo

**Objetivo:** Listar **todos los alumnos** con su nombre, equipo y turno.

**Columnas esperadas:**
- nombre (alumno)
- equipo (nombre del equipo)
- turno (mañana, tarde, noche)

**Orden:** Primero por equipo (AZ), luego por nombre (AZ)

**Dificultad:**  Básico (SELECT + JOIN)

**Pista:** Necesitas dos tablas: alumnos y equipos. Usa JOIN.

**Entregable:** Vista solve_d1_r1

---

##  Reto 2: ¿Quién mencionó a Chipi?

**Objetivo:** Encontrar todos los **commits que contengan la palabra chipi** (sin importar mayúsculas).

**Columnas esperadas:**
- nombre (alumno que hizo el commit)
- rama (nombre de la rama)
- mensaje (del commit)
- estado_ci (success, failed, pending)
- fecha (cuándo)

**Orden:** Más recientes primero

**Dificultad:**  Intermedio (WHERE + ILIKE + JOIN)

**Pista:** Tabla commits y alumnos. Usa WHERE con ILIKE '%chipi%'.

**Entregable:** Vista solve_d1_r2

---

##  Reto 3: Cafetera a las 02:13 

**Objetivo:** Encontrar **quién tomó café exactamente a las 02:13** (hora del crimen).

**Columnas esperadas:**
- nombre (alumno)
- bebida (qué tomó)
- leche (sí, no, parcial)
- hora (la hora exacta)

**Orden:** Alfabético por nombre

**Dificultad:**  Intermedio (WHERE + TIME + JOIN)

**Pista:** Tabla cafe_ordenes y alumnos. Usa WHERE hora = '02:13'.

**Entregable:** Vista solve_d1_r3

---

##  Reto 4: Últimas pistas en Discord

**Objetivo:** Encontrar los **últimos 10 mensajes en los canales #general, #confesiones y #secreto**.

**Columnas esperadas:**
- usuario (quién escribió)
- canal (canal)
- mensaje (qué escribió)
- fecha (cuándo)

**Orden:** Más recientes primero

**Dificultad:**  Intermedio (WHERE + IN + ORDER BY + LIMIT)

**Pista:** Tabla discord_logs. Usa WHERE canal IN (...) y LIMIT 10.

**Entregable:** Vista solve_d1_r4

---

##  BONUS: ¿Quién está raro?

**Objetivo:** Encontrar alumnos sospechosos que cumplen **TODAS** estas condiciones:
1. Estaban en turno de noche o tarde
2. Tomaron café (cualquier café)
3. Tuvieron al menos 1 commit fallido

**Columnas esperadas:**
- nombre
- turno
- commits_fallidos (cantidad)
- bebidas (separadas por comas)

**Orden:** Más commits fallidos primero

**Dificultad:**  Experto (JOINs múltiples + GROUP BY + HAVING)

**Pista:** Usa GROUP BY, LEFT JOIN, HAVING COUNT > 0, STRING_AGG().

**Entregable:** Vista solve_d1_bonus

---

##  Validar tu trabajo

`powershell
make check-day1
`

Esto comprobará:
-  La vista existe
-  Tiene las columnas correctas
-  Los datos son consistentes

---

##  Conceptos SQL de Día 1

- **SELECT** - Qué columnas queremos
- **FROM** - De qué tabla
- **JOIN** - Conectar dos tablas
- **WHERE** - Filtrar filas
- **ORDER BY** - Ordenar resultados
- **LIMIT** - Limitar filas
- **ILIKE** - Búsquedas insensibles a mayúsculas
- **GROUP BY** / **HAVING** - Agrupar y filtrar grupos
- **STRING_AGG()** - Combinar valores en una cadena

---

*Mamá Pato  sigue negando. Cris sigue culpando al router. Tú tienes SQL. ¡A investigar! *

# 📊 Día 2: JOINs y Análisis

Día 1 te dio pistas básicas. Ahora necesitas análisis más profundos con agregaciones y múltiples JOINs.

Tu misión: **descubre patrones sospechosos en los datos**.

> 🆘 **¿Atascado?** Consulta la **[Guía Anti-Bloqueos Day 2](../AYUDA_ANTI_BLOQUEOS/day2_guia.md)** con pistas paso a paso.

---2: JOINs y Análisis

Día 1 te dio pistas básicas. Ahora necesitas análisis más profundos con agregaciones y múltiples JOINs.

Tu misión: **descubre patrones sospechosos en los datos**.

---

##  Reto 1: ¿Cuántos alumnos hay en cada equipo?

**Objetivo:** Contar cuántos miembros tiene cada equipo.

**Columnas esperadas:**
- equipo (nombre del equipo)
- cantidad_alumnos (cuántos)

**Orden:** Mayor cantidad primero

**Dificultad:**  Intermedio (GROUP BY + COUNT)

**Pista:** Usa COUNT() y GROUP BY equipo. Ordena con DESC.

**Entregable:** Vista solve_d2_r1

---

##  Reto 2: ¿En qué ramas trabajó cada alumno?

**Objetivo:** Para cada alumno, combina todas sus ramas en una línea (separadas por comas).

**Columnas esperadas:**
- nombre (del alumno)
- ramas (lista separada por ", ")

**Orden:** Alfabético por nombre

**Dificultad:**  Intermedio (GROUP BY + STRING_AGG + LEFT JOIN)

**Pista:** Usa STRING_AGG(rama, ', ') y GROUP BY. Si un alumno no tiene commits, usa LEFT JOIN.

**Entregable:** Vista solve_d2_r2

---

##  Reto 3: ¿Quiénes tuvieron commits fallidos?

**Objetivo:** Listar alumnos con al menos 1 commit fallido, mostrando cuántos fallaron.

**Columnas esperadas:**
- nombre (del alumno)
- commits_fallidos (cantidad)

**Orden:** Más commits fallidos primero

**Dificultad:**  Avanzado (GROUP BY + HAVING + COUNT)

**Pista:** Filtra estado_ci = 'failed'. Usa HAVING COUNT(*) > 0.

**Entregable:** Vista solve_d2_r3

---

##  Reto 4: ¿Qué bebidas son más populares?

**Objetivo:** Listar las bebidas más consumidas, con cuántas veces se pidieron.

**Columnas esperadas:**
- bebida
- veces_consumida (cantidad)

**Orden:** Más consumidas primero

**Dificultad:**  Intermedio (GROUP BY + COUNT)

**Pista:** Agrupa por bebida, cuenta con COUNT(*).

**Entregable:** Vista solve_d2_r4

---

##  EXTRA: Timeline 02:00 - 02:30

**Objetivo:** Combinar TODOS los eventos (commits, café, mensajes Discord) entre las 02:00 y 02:30.

**Columnas esperadas:**
- tipo_evento ('commit', 'cafe', 'discord')
- nombre_usuario (quién)
- detalle (mensaje, bebida, o rama)
- timestamp (cuándo)

**Orden:** Cronológico (más antiguos primero)

**Dificultad:**  Experto (UNION + múltiples SELECT)

**Pista:** Usa UNION para combinar 3 queries diferentes. Cada una selecciona de una tabla distinta. Filtra por hora con WHERE.

**Entregable:** Vista solve_d2_extra

---

##  Validar tu trabajo

`powershell
make check-day2
`

Esto comprobará:
-  La vista existe
-  Tiene las columnas correctas
-  Los datos son consistentes

---

##  Conceptos SQL de Día 2

- **GROUP BY** - Agrupar filas por columna
- **COUNT()** - Contar filas
- **STRING_AGG()** - Combinar valores en una cadena
- **HAVING** - Filtrar grupos (después de GROUP BY)
- **LEFT JOIN** - Incluir filas aunque no haya match
- **UNION** - Combinar resultados de múltiples queries

---

*Con estos datos, el misterio de Chipi empieza a resolverse... *

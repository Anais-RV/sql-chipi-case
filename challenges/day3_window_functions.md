# 🧙‍♂️ Día 3: CTEs y Window Functions (OPCIONAL)

¡Has llegado hasta aquí! Estos retos son opcionales y más desafiantes.

Si ya completaste Day 1 y Day 2, aquí puedes explorar técnicas SQL avanzadas.

> 🆘 **¿Atascado?** Consulta la **[Guía Anti-Bloqueos Day 3](../AYUDA_ANTI_BLOQUEOS/day3_guia.md)** con pistas paso a paso.

---3: CTEs y Window Functions (OPCIONAL)

¡Has llegado hasta aquí! Estos retos son opcionales y más desafiantes.

Si ya completaste Day 1 y Day 2, aquí puedes explorar técnicas SQL avanzadas.

---

##  Reto 1: Alumnos raros con CTE

**Objetivo:** Encuentra alumnos que cumplen TODAS estas condiciones:
- Tomaron café de noche (hora BETWEEN 22:00 y 06:00)
- Tienen al menos 1 commit fallido
- Han escrito en Discord

**Columnas esperadas:**
- nombre (del alumno)
- bebidas_noche (qué bebieron de noche)
- commits_fallidos (cuántos fallaron)
- menciones_discord (cuántas veces apareció en Discord)

**Dificultad:**  Avanzado (WITH + CTEs)

**Pista:** Usa estructura WITH nombre_cte AS (...) para cada condición. Luego combínalas con INNER JOIN para obtener solo los que cumplen TODO.

**Entregable:** Vista solve_d3_r1

---

##  Reto 2: Últimos 2 commits por alumno

**Objetivo:** Para cada alumno, muestra sus últimos 2 commits (más recientes).

**Columnas esperadas:**
- nombre (del alumno)
- rama (rama del commit)
- mensaje (mensaje del commit)
- fecha (cuándo)
- numero (1 = más reciente, 2 = segundo más reciente)

**Orden:** Por alumno (AZ), luego por número (1, 2)

**Dificultad:**  Avanzado (Window Functions)

**Pista:** Usa ROW_NUMBER() OVER (PARTITION BY nombre ORDER BY fecha DESC) para numerar commits por alumno. Luego filtra los que tengan número <= 2.

**Entregable:** Vista solve_d3_r2

---

##  BONUS: Cronología del crimen

**Objetivo:** Construye la CRONOLOGÍA COMPLETA del secuestro de Chipi entre 01:00 y 03:00.

Combina (UNION) tres fuentes de datos:
- Café consumido
- Commits hechos
- Mensajes en Discord

**Columnas esperadas:**
- fecha_hora (timestamp exacto)
- evento_tipo ('café' / 'commit' / 'discord')
- actor (quién)
- descripcion (qué pasó)

**Orden:** Cronológico (primero el más antiguo)

**Dificultad:**  Experto (UNION + múltiples SELECT)

**Pista:** Usa UNION ALL con 3 SELECT (uno por cada tabla). Asegúrate de que las columnas tengan los mismos tipos. Ordena por fecha_hora ASC.

**Entregable:** Vista solve_d3_bonus

---

##  Validar tu trabajo

`powershell
make check-day3
`

Esto comprobará:
-  La vista existe
-  Tiene las columnas correctas
-  Los datos son consistentes

---

##  Conceptos SQL de Día 3

- **WITH (CTEs)** - Named temporary queries
- **ROW_NUMBER()** - Rank rows in a window
- **PARTITION BY** - Define window boundaries
- **ORDER BY** en window functions - Orden dentro del grupo
- **UNION ALL** - Combinar resultados sin eliminar duplicados
- **CAST / ::type** - Conversión de tipos

---

##  Conclusión

**¡Has llegado al nivel máster de SQL en sql-chipi-case! **

Si completaste estos 3 retos, ya sabes:
-  SELECT, JOIN, WHERE, ORDER BY
-  GROUP BY, HAVING, agregaciones
-  CTEs y Window Functions

**Ahora sí... ¿Quién secuestró a Chipi? **

---

*Los retos del Día 3 son opcionales. Si ya completaste Day 1 y Day 2, ya tienes suficientes pistas. *

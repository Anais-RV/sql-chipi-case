# 🐼 Día 0: Calentamiento (sin miedo)

Bienvenido a SQL. Si nunca lo has usado, empieza aquí. Son 4 retos cortitos sin complicaciones.

**Objetivo:** Coger confianza con SELECT, WHERE y GROUP BY. Sin JOINs todavía.

---

## 🎯 Reto 1: Equipos visibles

**Objetivo:** Muestra todos los equipos.

**Columnas esperadas:**
- id
- nombre

**Dificultad:** ⭐ Ultra-básico

**Pista:** SELECT de la tabla `equipos`.

**Entregable:** Vista `solve_d0_r1`

---

## 🎯 Reto 2: Solo nombres de alumnos

**Objetivo:** Lista SOLO la columna `nombre` de todos los alumnos.

**Columnas esperadas:**
- nombre

**Dificultad:** ⭐ Ultra-básico

**Pista:** SELECT nombre FROM alumnos.

**Entregable:** Vista `solve_d0_r2`

---

## 🎯 Reto 3: Alumnos de turno mañana

**Objetivo:** Filtra alumnos que tienen turno = 'mañana'.

**Columnas esperadas:**
- nombre
- turno

**Dificultad:** ⭐ Básico (WHERE)

**Pista:** Usa WHERE turno = 'mañana'.

**Entregable:** Vista `solve_d0_r3`

---

## 🎯 Reto 4: Conteo por turno

**Objetivo:** Cuenta cuántos alumnos hay en cada turno.

**Columnas esperadas:**
- turno
- total

**Dificultad:** ⭐⭐ Básico (GROUP BY + COUNT)

**Pista:** GROUP BY turno, luego COUNT(*).

**Entregable:** Vista `solve_d0_r4`

---

## 👀 Comprueba a ojo en DBeaver

Abre cada vista y verifica:
- ✅ `solve_d0_r1` tiene columnas `id`, `nombre`
- ✅ `solve_d0_r2` solo tiene la columna `nombre`
- ✅ `solve_d0_r3` solo muestra filas con turno='mañana'
- ✅ `solve_d0_r4` muestra 2-3 filas con totales por turno

---

## 🎓 Conceptos del Día 0

- **SELECT** - Elegir columnas
- **FROM** - De qué tabla
- **WHERE** - Filtrar filas
- **GROUP BY** - Agrupar datos
- **COUNT()** - Contar filas

---

*Ahora sí, pasa al Día 1 cuando estés listo. ¡Sin prisa! 🚀*

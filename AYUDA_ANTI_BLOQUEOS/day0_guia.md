# 🆘 Day 0: Warmup - Guía Anti-Bloqueos

> **Nota:** Day 0 es súper básico. Si ya sabes SELECT y WHERE, sáltalo y ve directo a Day 1.

---

## 🎯 Reto 1: Mostrar todos los equipos

**Objetivo:** Devolver todas las filas de la tabla `equipos`.

### 🤔 Preguntas guía

1. **¿Qué tabla necesitas?**
   - `equipos`

2. **¿Qué columnas necesitas?**
   - Todas (`id`, `nombre`)

3. **¿Necesitas filtrar (WHERE)?**
   - No, queremos **todos** los equipos

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver qué hay en la tabla
SELECT * FROM equipos;

-- PASO 2: Crear la vista (es lo mismo)
CREATE OR REPLACE VIEW solve_d0_r1 AS
SELECT 
  id,
  nombre
FROM equipos;
```

### 💡 Conceptos clave
- **SELECT**: Elige qué columnas mostrar
- **FROM**: De qué tabla traer los datos
- **No WHERE**: Sin filtros = todas las filas

---

## 🎯 Reto 2: Solo nombres de alumnos

**Objetivo:** Lista SOLO la columna `nombre` de todos los alumnos.

### 🤔 Preguntas guía

1. **¿Qué tabla necesitas?**
   - `alumnos`

2. **¿Qué columna(s) necesitas?**
   - Solo `nombre` (no `id`, no `turno`, no `equipo_id`)

3. **¿Necesitas filtrar?**
   - No, todos los alumnos

### 📝 Plantilla paso a paso

```sql
CREATE OR REPLACE VIEW solve_d0_r2 AS
SELECT 
  nombre  -- Solo esta columna
FROM alumnos;
```

### 💡 Conceptos clave
- Puedes elegir una o más columnas específicas
- Si solo pones `nombre`, solo verás esa columna

---

## 🎯 Reto 3: Alumnos de turno mañana

**Objetivo:** Filtra solo alumnos con `turno = 'mañana'`.

### 🤔 Preguntas guía

1. **¿Qué tabla?**
   - `alumnos`

2. **¿Qué columnas?**
   - `nombre` y `turno`

3. **¿Cómo filtrar?**
   - `WHERE turno = 'mañana'`

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver todos los turnos
SELECT nombre, turno FROM alumnos;

-- PASO 2: Filtrar solo mañana
CREATE OR REPLACE VIEW solve_d0_r3 AS
SELECT 
  nombre,
  turno
FROM alumnos
WHERE turno = ???;  -- ¿Qué valor pones aquí?
```

### 💡 Conceptos clave
- **WHERE**: Filtra filas según una condición
- **turno = 'mañana'**: Igualdad exacta (texto entre comillas)
- Solo verás las filas que cumplen la condición

---

## 🎯 Reto 4: Conteo por turno

**Objetivo:** Cuenta cuántos alumnos hay en cada turno.

### 🤔 Preguntas guía

1. **¿Qué quieres agrupar?**
   - Por `turno` (mañana, tarde, noche)

2. **¿Qué quieres contar?**
   - El número de alumnos en cada turno

3. **¿Qué función usas para contar?**
   - `COUNT(*)`

### 📝 Plantilla paso a paso

```sql
-- PASO 1: Ver todos los turnos
SELECT turno FROM alumnos;

-- PASO 2: Agrupar y contar
CREATE OR REPLACE VIEW solve_d0_r4 AS
SELECT 
  turno,
  COUNT(*) AS total  -- Cuenta filas por grupo
FROM alumnos
GROUP BY turno;  -- Agrupa por turno
```

### 💡 Conceptos clave
- **GROUP BY**: Agrupa filas que tienen el mismo valor
- **COUNT(*)**: Cuenta cuántas filas hay en cada grupo
- **AS total**: Renombra la columna de conteo

### 🧠 Pensamiento lógico
```
alumnos:
  Ana - mañana
  Luis - mañana
  Eva - tarde

GROUP BY turno:
  mañana → 2 filas
  tarde → 1 fila
```

---

## 🎓 Resumen Day 0

Has aprendido los 4 comandos básicos de SQL:

1. **SELECT + FROM**: Traer datos de una tabla
2. **SELECT columnas específicas**: Elegir qué mostrar
3. **WHERE**: Filtrar filas
4. **GROUP BY + COUNT()**: Agrupar y contar

---

## 🚀 Siguiente paso

Cuando tengas los 4 retos validados con `make check-day0`, ¡pasa a Day 1!

**Day 1 introduce JOINs** (conectar tablas), que es el siguiente nivel. 💪

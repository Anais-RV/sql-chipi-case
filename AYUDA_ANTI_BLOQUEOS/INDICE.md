# 🆘 AYUDA ANTI-BLOQUEOS

> **¿Estás atascado en un reto?** Aquí encontrarás guías paso a paso que te ayudarán a **pensar como SQL** sin darte la solución directa.

---

## 💜 Nota de la Autora

Estas guías fueron creadas con mucho cariño por **[Anaïs Rodríguez Villanueva](https://github.com/Anais-RV)** en su tiempo libre, pensando en ti, que estás aprendiendo SQL.

Si te ayudan, considera **darle una ⭐ al repo** o **mencionar este recurso** si lo compartes. ¡Gracias! 😊

---

## 📋 ¿Cómo usar esta carpeta?

1. **Intenta resolver el reto por tu cuenta primero** (al menos 10-15 minutos)
2. Si te bloqueas, abre el archivo del día correspondiente
3. Lee **solo la sección del reto** en el que estás atascado
4. Sigue las preguntas guía paso a paso
5. Vuelve a DBeaver e intenta implementarlo

---

## 📂 Guías disponibles

- **[Day 0: Warmup](day0_guia.md)** → SELECT básico, WHERE, GROUP BY
- **[Day 1: SELECT Basics](day1_guia.md)** → JOINs, filtros, ORDER BY, LIMIT
- **[Day 2: JOINs y Análisis](day2_guia.md)** → Agregaciones, STRING_AGG, UNION
- **[Day 3: CTEs y Window Functions](day3_guia.md)** → WITH, ROW_NUMBER, PARTITION BY
- **[Day 4: Revelación Final](day4_guia.md)** → CTEs complejos, CROSS JOIN

---

## 💡 Consejos generales

### 1. Empieza siempre con lo simple
```sql
-- PASO 1: Ver qué hay en la tabla
SELECT * FROM tabla LIMIT 5;

-- PASO 2: Filtrar lo que necesitas
SELECT columna FROM tabla WHERE condicion;

-- PASO 3: Agregar más complejidad
SELECT columna, COUNT(*) FROM tabla GROUP BY columna;
```

### 2. Divide el problema en partes
- ¿Qué tablas necesito?
- ¿Qué columnas necesito de cada una?
- ¿Cómo las conecto (JOIN)?
- ¿Qué filtros aplico (WHERE)?
- ¿Cómo agrupo (GROUP BY)?
- ¿Cómo ordeno (ORDER BY)?

### 3. Prueba cada paso
No escribas toda la query de golpe. Añade una línea, ejecuta, ve el resultado, añade otra.

### 4. Lee los errores con calma
- `relation "X" does not exist` → La tabla/vista no existe, revisa el nombre
- `column "X" does not exist` → La columna no existe, revisa ortografía
- `syntax error near "X"` → Falta o sobra algo (coma, paréntesis, palabra clave)

---

## 🚫 Lo que NO haremos aquí

- ❌ Dar la solución completa (para eso están las soluciones del instructor)
- ❌ Copiar y pegar código
- ❌ Respuestas sin explicación

## ✅ Lo que SÍ haremos

- ✅ Hacerte preguntas que te ayuden a pensar
- ✅ Darte pistas sobre qué función SQL usar
- ✅ Mostrarte ejemplos genéricos (no del reto)
- ✅ Explicarte conceptos paso a paso

---

**Recuerda:** El objetivo es **aprender SQL**, no solo pasar los retos. ¡Tómate tu tiempo! 🧠

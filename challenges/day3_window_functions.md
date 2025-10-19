# 🐼 sql-chipi-case: Retos del Día 3 - CTEs y Window Functions (OPCIONAL)

## 📖 Contexto

**¡Has llegado hasta aquí! Estos retos son opcionales y más desafiantes.**

Si ya completaste Day 1 y Day 2, aquí puedes explorar técnicas SQL avanzadas.

---

## 🎯 Reto 1: Alumnos "raros" con CTE

**Las CTEs (Common Table Expressions) permiten escribir código más legible.**

Encuentra alumnos que cumplen TODAS estas condiciones:
- Tomaron café de noche (hora BETWEEN 22:00 y 06:00)
- Tienen al menos 1 commit fallido
- Han escrito en Discord

Usa una CTE para cada condición, luego combínalas.

**Columnas esperadas:**
- `nombre` (del alumno)
- `bebidas_noche` (qué bebieron de noche)
- `commits_fallidos` (cuántos fallaron)
- `menciones_discord` (cuántas veces apareció en Discord)

**Nombre de la vista:** `solve_d3_r1`

**Pista:**
- Estructura: 
  ```sql
  WITH cafe_noche AS (...)
  , commits_fallidos AS (...)
  , discord_menciones AS (...)
  SELECT ... FROM ...
  ```
- Usa `INNER JOIN` entre las CTEs para obtener solo los que cumplen TODO

---

## 🎯 Reto 2: Últimos 2 commits por alumno (Window Functions)

**Las Window Functions permiten analizar datos en "ventanas" o grupos.**

Para cada alumno, muestra sus últimos 2 commits (más recientes).

**Columnas esperadas:**
- `nombre` (del alumno)
- `rama` (rama del commit)
- `mensaje` (mensaje del commit)
- `fecha` (cuándo)
- `numero` (1 = más reciente, 2 = segundo más reciente)

**Orden:** Por alumno (A→Z), luego por número (1, 2)

**Nombre de la vista:** `solve_d3_r2`

**Pista:**
- Usa `ROW_NUMBER()` como window function
- Estructura: `ROW_NUMBER() OVER (PARTITION BY nombre ORDER BY fecha DESC) as numero`
- Luego filtra con `WHERE numero <= 2`

---

## ⭐ BONUS: Cronología del crimen

**Construye la CRONOLOGÍA COMPLETA del secuestro de Chipi entre 01:00 y 03:00.**

Combina (UNION) tres fuentes de datos:
- Café consumido
- Commits hechos
- Mensajes en Discord

Cada evento debe tener:
- Quién (usuario/alumno)
- Qué (tipo de evento)
- Cuándo (fecha y hora)
- Detalles (qué se hizo)

**Columnas esperadas:**
- `fecha_hora` (timestamp exacto)
- `evento_tipo` ('café' / 'commit' / 'discord')
- `actor` (quién)
- `descripcion` (qué pasó)

**Orden:** Cronológico (primero el más antiguo)

**Nombre de la vista:** `solve_d3_bonus`

**Pista:**
- Usa UNION ALL con 3 SELECT
- Asegúrate de que las columnas tengan los mismos tipos
- Para Discord y commits, convierte la fecha a timestamp si es necesario
- Ordena por fecha_hora ASC

---

## 📝 ¿Cómo entregar?

```sql
CREATE VIEW solve_d3_r1 AS
SELECT ...
```

Para validar (si existe):

```powershell
make check-day3
```

---

## 🎓 Conceptos SQL del Día 3

- ✅ **WITH (CTEs)** - Named temporary queries
- ✅ **ROW_NUMBER()** - Rank rows in a window
- ✅ **PARTITION BY** - Define window boundaries
- ✅ **ORDER BY** en window functions - Orden dentro del grupo
- ✅ **UNION ALL** - Combinar resultados sin eliminar duplicados
- ✅ **CAST / ::type** - Conversión de tipos

---

## 🔮 Conclusión

**¡Has llegado al nivel máster de SQL en sql-chipi-case! 🎉**

Si completaste estos 3 retos, ya sabes:
- ✅ SELECT, JOIN, WHERE, ORDER BY
- ✅ GROUP BY, HAVING, agregaciones
- ✅ CTEs y Window Functions

**Ahora sí... ¿Quién secuestró a Chipi? 🐼**

---

## 💡 Nota para instructores

Estos retos son **completamente opcionales**. Los alumnos con conocimiento nulo pueden completar Day 1 y Day 2 sin presión. Day 3 es para quiénes quieran explorar más.

**No hay prisa. SQL es un viaje, no una carrera. 🚀**

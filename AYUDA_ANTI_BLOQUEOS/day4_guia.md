# 🆘 Day 4: Revelación Final - Guía Anti-Bloqueos

> **Nota:** Este es el reto final. Si llegaste hasta aquí, ¡ya eres un SQL pro! 🏆

---

## 🎯 Vista requerida: `solve_d4_reveal`

**Objetivo:** 1 fila con 4 columnas que revelan el misterio completo.

### 🤔 Análisis del problema

El enunciado te pide combinar 4 pistas diferentes:

1. **Sospechoso**: Última persona en "Sala Servidor" antes de las 02:13
2. **Motivo**: Texto cifrado en tabla `pistas` (dia=3, codigo='P-MOTIVO-01')
3. **Ubicación final**: Último access_point WiFi del sospechoso después de las 02:13
4. **Código de rescate**: En tabla `pistas` (dia=3, codigo='P-CODIGO-RESCATE')

---

## 📋 Estrategia: CTEs paso a paso

No intentes hacer todo de golpe. Divide en 4 CTEs, uno por cada pista.

---

### 🔍 Pista 1: ¿Quién es el sospechoso?

**Pregunta:** ¿Quién fue la última persona en entrar a "Sala Servidor" antes de las 02:13?

#### Tabla a usar
- `door_logs` (registros de puertas)
- JOIN con `alumnos` para traer el nombre

#### Lógica
```sql
-- CTE: sospechoso_puerta
SELECT 
  alumnos.id,
  alumnos.nombre,
  door_logs.timestamp
FROM door_logs
JOIN alumnos ON door_logs.alumno_id = alumnos.id
WHERE door_logs.puerta = 'Sala Servidor'
  AND door_logs.timestamp < '2025-10-19 02:13:00'
ORDER BY door_logs.timestamp DESC
LIMIT 1;  -- Solo el más reciente
```

#### 🧠 Pensamiento lógico
- Filtra por puerta y hora
- Ordena descendente (más reciente primero)
- LIMIT 1 para quedarte solo con el último

---

### 📝 Pista 2: ¿Cuál es el motivo?

**Pregunta:** ¿Qué dice la pista del día 3 sobre el motivo?

#### Tabla a usar
- `pistas` (mensajes cifrados)

#### Lógica
```sql
-- CTE: motivo_pista
SELECT descripcion AS motivo
FROM pistas
WHERE dia = 3 AND codigo = 'P-MOTIVO-01'
LIMIT 1;
```

#### 🧠 Pensamiento lógico
- Simple SELECT con filtros
- No necesita JOIN

---

### 📍 Pista 3: ¿Dónde está Chipi ahora?

**Pregunta:** ¿Cuál fue el último access_point WiFi del sospechoso DESPUÉS de las 02:13?

#### Tablas a usar
- `wifi_events` (conexiones WiFi)
- `dispositivos` (para conectar con alumno)
- Necesitas el `id` del sospechoso del CTE anterior

#### Lógica
```sql
-- CTE: ubicacion_wifi
SELECT wifi_events.access_point
FROM wifi_events
JOIN dispositivos ON wifi_events.dispositivo_id = dispositivos.id
JOIN sospechoso_puerta ON dispositivos.alumno_id = sospechoso_puerta.id  -- Usa el CTE anterior
WHERE wifi_events.timestamp > '2025-10-19 02:13:00'
ORDER BY wifi_events.timestamp DESC
LIMIT 1;  -- Solo el más reciente
```

#### 🧠 Pensamiento lógico
- Conectas wifi_events → dispositivos → alumno
- Filtras solo eventos DESPUÉS de las 02:13
- Ordenas y tomas el último

---

### 🔑 Pista 4: ¿Cuál es el código de rescate?

**Pregunta:** ¿Qué código está en las pistas del día 3?

#### Tabla a usar
- `pistas`

#### Lógica
```sql
-- CTE: codigo_rescate
SELECT SUBSTRING(descripcion FROM 'CH[0-9]+') AS codigo_rescate
FROM pistas
WHERE dia = 3 AND codigo = 'P-CODIGO-RESCATE'
LIMIT 1;
```

#### 🧠 Pensamiento lógico
- Similar a la pista 2
- `SUBSTRING(...FROM regex)` extrae el patrón CH seguido de números

---

## 🔗 Combinar los 4 CTEs

Ahora que tienes los 4 CTEs, úsalos en el SELECT final:

```sql
WITH
sospechoso_puerta AS (
  -- Tu CTE de la pista 1 aquí
),
motivo_pista AS (
  -- Tu CTE de la pista 2 aquí
),
ubicacion_wifi AS (
  -- Tu CTE de la pista 3 aquí
),
codigo_rescate AS (
  -- Tu CTE de la pista 4 aquí
)
SELECT 
  sp.nombre AS sospechoso,
  mp.motivo,
  uw.access_point AS ubicacion_final,
  cr.codigo_rescate
FROM sospechoso_puerta sp
CROSS JOIN motivo_pista mp
CROSS JOIN ubicacion_wifi uw
CROSS JOIN codigo_rescate cr;
```

### 💡 ¿Por qué CROSS JOIN?

- Cada CTE devuelve **1 fila**
- CROSS JOIN las combina en una sola fila con todas las columnas
- Es como "pegar" las 4 pistas en una sola línea

---

## 🎯 Validación

Tu vista debe devolver **exactamente 1 fila con 4 columnas**:

```sql
SELECT * FROM solve_d4_reveal;
```

**Resultado esperado:**
| sospechoso | motivo | ubicacion_final | codigo_rescate |
|------------|--------|-----------------|----------------|
| Wizi | Chipi mordió mi cable Ethernet favorito... | AP-Pasillo-3F | CH0213 |

---

## 🔓 Desbloquear a Chipi

Una vez que tu vista funcione:

```sql
SELECT unlock_chipi(codigo_rescate) FROM solve_d4_reveal;
```

Deberías ver:
```
🎉 ¡CHIPI HA SIDO RESCATADO! 🐾
```

---

## 💡 Conceptos clave

- **CTEs anidados**: Los CTEs posteriores pueden usar los anteriores
- **CROSS JOIN**: Producto cartesiano (combina todas las filas)
- **LIMIT 1**: Asegura que cada CTE devuelve solo 1 fila
- **SUBSTRING ... FROM regex**: Extrae patrones con expresiones regulares

---

## 🧠 Pensamiento lógico general

1. **Divide el problema** en 4 partes independientes
2. **Resuelve cada CTE** por separado (pruébalos uno a uno)
3. **Combínalos** al final con CROSS JOIN
4. **Verifica** que devuelve exactamente 1 fila y 4 columnas

---

## 🎉 ¡Felicidades!

Si completaste Day 4, resolviste el caso de Chipi y dominaste:
- SELECT, JOINs, WHERE, ORDER BY, LIMIT
- GROUP BY, HAVING, agregaciones
- STRING_AGG, UNION
- CTEs (WITH)
- Window Functions (ROW_NUMBER, PARTITION BY)
- CROSS JOIN

**¡Eres oficialmente un SQL Detective!** 🕵️‍♂️🐼

---

## 🚀 Siguiente nivel

Si quieres seguir aprendiendo SQL:
- Índices y optimización
- Transacciones (BEGIN, COMMIT, ROLLBACK)
- Triggers y stored procedures
- Subconsultas correlacionadas
- JSON en PostgreSQL

**Pero por ahora... ¡disfruta de haber rescatado a Chipi!** 🎊

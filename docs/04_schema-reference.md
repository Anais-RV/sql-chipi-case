# 📊 sql-chipi-case: Diagrama ER y Referencia Rápida

## 🗂️ Diagrama de Entidades y Relaciones (ER)

```
┌─────────────────────────────────────────────────────────────────┐
│                     PROYECTO: sql-chipi-case                    │
│                   El Secuestro de Chipi 🐼                      │
└─────────────────────────────────────────────────────────────────┘

┌──────────────┐
│   equipos    │
├──────────────┤
│ id (PK)      │
│ nombre       │
│ descripcion  │
└──────────────┘
       │ 1:N
       │
       ▼
┌──────────────────────────────────────────┐
│           alumnos                        │
├──────────────────────────────────────────┤
│ id (PK)                                  │
│ nombre                                   │
│ email                      [sospechosos] │
│ equipo_id (FK → equipos)                 │
│ turno ('mañana' o 'tarde')              │
│ fecha_inscripcion                        │
└──────────────────────────────────────────┘
       │
       ├─ 1:N ──→ ┌───────────────────┐
       │          │  dispositivos     │
       │          ├───────────────────┤
       │          │ id (PK)           │
       │          │ tipo              │
       │          │ ip (UNIQUE)       │
       │          │ alumno_id (FK)    │
       │          │ fecha_registro    │
       │          └───────────────────┘
       │
       ├─ 1:N ──→ ┌───────────────────┐
       │          │  commits          │
       │          ├───────────────────┤ [PISTAS]
       │          │ id (PK)           │
       │          │ rama              │
       │          │ mensaje [chipi?]  │
       │          │ estado_ci         │
       │          │ fecha (TIMESTAMP) │
       │          │ alumno_id (FK)    │
       │          └───────────────────┘
       │
       ├─ 1:N ──→ ┌──────────────────────┐
       │          │  cafe_ordenes        │
       │          ├──────────────────────┤ [PISTA 🚨]
       │          │ id (PK)              │
       │          │ bebida               │
       │          │ leche                │
       │          │ hora [02:13?]        │
       │          │ fecha (TIMESTAMP)    │
       │          │ alumno_id (FK)       │
       │          └──────────────────────┘
       │
       └─ [MENCIONES] ─→ ┌─────────────────────┐
                         │  discord_logs       │
                         ├─────────────────────┤ [PISTAS]
                         │ id (PK)             │
                         │ usuario             │
                         │ canal               │
                         │ mensaje             │
                         │ fecha (TIMESTAMP)   │
                         └─────────────────────┘

┌──────────────────┐      ┌──────────────────┐
│  ubicaciones     │      │  pistas          │
├──────────────────┤      ├──────────────────┤
│ id (PK)          │      │ id (PK)          │
│ nombre           │      │ dia              │
│ lugar            │      │ codigo [P-***]   │
│ estado [?]       │      │ descripcion      │
│ última_update    │      │ desbloqueo_sql   │
└──────────────────┘      │ resuelta         │
                          │ fecha_creacion   │
                          └──────────────────┘
```

---

## 📋 Referencia Rápida de Tablas

### 🏢 equipos (3 registros)
```
id │ nombre            │ descripcion
───┼─────────────────┼──────────────────────
1  │ SuperKode A      │ Equipo Backend fuerte
2  │ SuperKode B      │ Equipo Frontend creativo
3  │ Los Pato Devs    │ Equipo DevOps
```

### 👥 alumnos (12 registros)
```
id │ nombre       │ email              │ equipo_id │ turno
───┼──────────────┼────────────────────┼───────────┼────────
1  │ Miguel       │ miguel@...         │ 1         │ mañana
2  │ SalchiPresi  │ salchipresi@...    │ 1         │ tarde
3  │ Marcus       │ marcus@...         │ 1         │ mañana
...
```

### ☕ cafe_ordenes (12 registros)
```
id │ alumno_id │ bebida            │ leche     │ hora   │ fecha
───┼───────────┼──────────────────┼───────────┼────────┼──────
9  │ 9 (Wizi)  │ matcha latte      │ parcial   │ 02:13  │ ... 🚨
...
```

### 💬 discord_logs (11 registros)
```
id │ usuario         │ canal          │ mensaje
───┼─────────────────┼────────────────┼────────────────
1  │ root_but_intern │ #general       │ A las 02:13 Chipi desapareció...
...
```

### 📝 commits (12 registros)
```
id │ alumno_id │ mensaje                        │ estado_ci │ fecha
───┼───────────┼────────────────────────────────┼───────────┼─────
1  │ 1 (Miguel)│ Implementar JWT con chipi_...  │ success   │ ...
...
```

---

## 🎯 Query Patrones Útiles

### Patrón 1: JOIN simple
```sql
SELECT a.nombre, e.nombre as equipo
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```

### Patrón 2: LEFT JOIN (incluir registros sin relación)
```sql
SELECT e.nombre, COUNT(a.id) as total_alumnos
FROM equipos e
LEFT JOIN alumnos a ON e.id = a.equipo_id
GROUP BY e.id;
```

### Patrón 3: WHERE con ILIKE (búsqueda insensible a mayúsculas)
```sql
SELECT * FROM commits
WHERE mensaje ILIKE '%chipi%';
```

### Patrón 4: GROUP BY con HAVING
```sql
SELECT a.nombre, COUNT(c.id) as commits_fallidos
FROM alumnos a
JOIN commits c ON a.id = c.alumno_id
WHERE c.estado_ci = 'failed'
GROUP BY a.id
HAVING COUNT(c.id) > 0;
```

### Patrón 5: UNION (combinar resultados)
```sql
SELECT 'café' as tipo, usuario FROM cafe_ordenes
UNION ALL
SELECT 'commit' as tipo, usuario FROM commits;
```

### Patrón 6: Subquery (query dentro de query)
```sql
SELECT * FROM alumnos
WHERE id IN (
  SELECT DISTINCT alumno_id FROM commits
  WHERE estado_ci = 'failed'
);
```

### Patrón 7: CTE (Common Table Expression)
```sql
WITH sospechosos AS (
  SELECT DISTINCT alumno_id FROM cafe_ordenes
  WHERE hora = '02:13'
)
SELECT a.nombre FROM alumnos a
WHERE a.id IN (SELECT alumno_id FROM sospechosos);
```

---

## 🔍 Pistas Claves

### Pista 1: ☕ La cafetera
```sql
SELECT a.nombre, c.bebida, c.hora 
FROM alumnos a 
JOIN cafe_ordenes c ON a.id = c.alumno_id 
WHERE c.hora = '02:13';
-- Resultado: Wizi, matcha latte, 02:13 🚨
```

### Pista 2: 💻 Commits sospechosos
```sql
SELECT a.nombre, c.rama, c.mensaje 
FROM alumnos a 
JOIN commits c ON a.id = c.alumno_id 
WHERE c.mensaje ILIKE '%chipi%';
-- Resultado: 6 commits con "chipi"
```

### Pista 3: 💬 Discord
```sql
SELECT usuario, mensaje FROM discord_logs
WHERE mensaje ILIKE '%chipi%'
ORDER BY fecha DESC;
-- Resultado: Pistas en #general, #dev, #confesiones
```

### Pista 4: 🖥️ Dispositivos
```sql
SELECT a.nombre, d.ip, d.tipo
FROM alumnos a
JOIN dispositivos d ON a.id = d.alumno_id
WHERE d.ip = '192.168.1.109';
-- Resultado: Wizi, desktop, 192.168.1.109
```

---

## 📊 Estadísticas Rápidas

### Equipos
- **SuperKode A:** 4 alumnos (Backend)
- **SuperKode B:** 4 alumnos (Frontend)
- **Los Pato Devs:** 4 alumnos (DevOps)

### Turnos
- **Mañana:** 6 alumnos
- **Tarde:** 6 alumnos

### Estados de CI
- **Success:** 7 commits
- **Failed:** 2 commits (🚨)
- **Pending:** 3 commits

### Bebidas más populares
- Café con leche / latte: 5 órdenes
- Espresso: 2 órdenes
- Especiales: 5 órdenes

---

## 🚀 Casos de Uso SQL

| Caso | Query | Tabla Principal |
|------|-------|-----------------|
| Listar alumnos por equipo | SELECT + JOIN | alumnos, equipos |
| Encontrar commits sospechosos | WHERE ILIKE | commits |
| Análisis por turno | GROUP BY | alumnos |
| Timeline de eventos | UNION + ORDER BY | cafe_ordenes, commits, discord_logs |
| Sospechosos principales | WHERE + HAVING | commits, cafe_ordenes |
| Correlaciones | Subqueries / CTE | múltiples tablas |

---

## 🎓 Habilidades que Practicarás

- ✅ SELECT básico
- ✅ WHERE con diferentes operadores
- ✅ JOIN (INNER, LEFT, UNION)
- ✅ GROUP BY y agregaciones
- ✅ ORDER BY, LIMIT
- ✅ Funciones de string (ILIKE, LENGTH)
- ✅ Funciones de agregación (COUNT, STRING_AGG)
- ✅ Subqueries y CTEs
- ✅ Window functions
- ✅ Índices y optimización

---

## 📞 Contacto / Soporte

Para dudas sobre SQL o el proyecto:
1. Revisa el [README principal](../README.md)
2. Lee los comentarios en `db/00_schema.sql`
3. Examina las pistas en `challenges/`
4. Consulta [00_COMIENZA_AQUI.md](00_COMIENZA_AQUI.md)
5. Pregunta a Mamá Pato 🦆 (ella niega haberlo visto todo)

---

**¿Listos para resolver el caso? 🔍**

```
Todos los datos están aquí.
La verdad está en tus queries.
Chipi te espera.

— root_but_intern
```

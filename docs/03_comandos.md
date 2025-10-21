# Comandos Make - sql-chipi-case

> Referencia rápida de todos los comandos disponibles

---

## 🚀 Setup Inicial

### `make setup`
Crea la base de datos, tablas y carga todos los datos.

```powershell
$env:PGPASSWORD="postgres"
make setup
```

**Qué hace:**
1. Crea la base de datos `chipi_case`
2. Crea las 11 tablas
3. Inserta todos los datos (alumnos, commits, etc.)
4. Carga funciones (unlock_chipi)

**Salida esperada:**
```
[1/3] Creando base de datos chipi_case...
[OK] Base de datos chipi_case creada con codificacion UTF-8.
[2/3] Ejecutando esquema (00_schema.sql)...
[OK] Tablas y funciones creadas.
[3/3] Insertando datos iniciales (01_seed.sql)...
[OK] Datos cargados.

============================================================
      PROYECTO SQL-CHIPI-CASE - COMPLETADO EXITOSAMENTE
============================================================
```

---

### `make reset`
Borra completamente la base de datos y vuelve a crearla desde cero.

```powershell
make reset
```

**Cuándo usarlo:**
- Algo salió mal y quieres empezar de nuevo
- Borraste datos por error
- Quieres practicar desde el inicio

⚠️ **Cuidado:** Esto eliminará TODAS tus vistas creadas

---

## ✅ Validación de Soluciones

### `make check-day0`
Valida las vistas del Day 0 (Warmup).

```powershell
make check-day0
```

Verifica que existan:
- `solve_d0_r1` - Todos los equipos
- `solve_d0_r2` - Alumnos de la mañana
- `solve_d0_r3` - Commits exitosos
- `solve_d0_r4` - Cafés ordenados

---

### `make check-day1`
Valida las vistas del Day 1 (SELECT Basics).

```powershell
make check-day1
```

Verifica que existan:
- `solve_d1_r1` - Lista de alumnos con equipo y turno
- `solve_d1_r2` - Commits que contienen "chipi"
- `solve_d1_r3` - ¿Quién pidió café a las 02:13?
- `solve_d1_r4` - Mensajes Discord entre 02:00-03:00

---

### `make check-day2`
Valida las vistas del Day 2 (JOINs).

```powershell
make check-day2
```

Verifica que existan:
- `solve_d2_r1` - Commits por alumno (con COUNT)
- `solve_d2_r2` - Actividad en cafetera
- `solve_d2_r3` - Discord + Git combinados
- `solve_d2_r4` - Estadísticas por equipo

---

### `make check-day3`
Valida las vistas del Day 3 (Window Functions - OPCIONAL).

```powershell
make check-day3
```

Verifica que existan:
- `solve_d3_r1` - Ranking de commits con ROW_NUMBER
- `solve_d3_r2` - Análisis con PARTITION BY
- `solve_d3_r3` - CTEs complejas

---

### `make check-day4`
Valida la vista final del Day 4.

```powershell
make check-day4
```

Verifica que exista:
- `solve_d4_reveal` - Vista con 4 columnas:
  - `sospechoso` (nombre del culpable)
  - `motivo` (razón del secuestro)
  - `ubicacion_final` (dónde está Chipi)
  - `codigo_rescate` (código de 6 caracteres)

---

### `make check-all`
Valida TODOS los días en secuencia.

```powershell
make check-all
```

Ejecuta:
- check-day0
- check-day1
- check-day2
- check-day3
- check-day4

---

## 🧹 Mantenimiento

### `make clean`
Elimina completamente la base de datos.

```powershell
make clean
```

⚠️ **Cuidado:** Esto borra TODO (base de datos, tablas, datos, vistas)

---

### `make help`
Muestra la ayuda con todos los comandos disponibles.

```powershell
make help
```

---

## 🔧 Configuración Avanzada

### Si `psql` no está en PATH

```powershell
make setup PSQL="C:\Program Files\PostgreSQL\16\bin\psql.exe"
```

También funciona con otros comandos:
```powershell
make check-day1 PSQL="C:\ruta\a\psql.exe"
make reset PSQL="C:\ruta\a\psql.exe"
```

---

### Si usas otra password

```powershell
$env:PGPASSWORD="tu_password_real"
make setup
```

---

### Si usas otro usuario

Edita el `Makefile` línea 12:
```makefile
DB_USER=tu_usuario
```

---

## 📊 Flujo de Trabajo Típico

### Primera vez:
```powershell
$env:PGPASSWORD="postgres"
make setup
```

### Resolver Day 1 en DBeaver:
```sql
-- Crear tus vistas solve_d1_r1, solve_d1_r2, etc.
```

### Validar Day 1:
```powershell
make check-day1
```

### Si quieres empezar de nuevo:
```powershell
make reset
```

---

## ❓ Preguntas Frecuentes

### "¿Cuándo uso `make setup` vs `make reset`?"

- **`make setup`**: Primera vez, o después de `make clean`
- **`make reset`**: Cuando quieres empezar de nuevo (borra y recrea)

---

### "¿Qué pasa si ejecuto `make setup` dos veces?"

La segunda vez dará error porque la base de datos ya existe.

**Solución:** Usa `make reset` en su lugar.

---

### "¿Los comandos `make check-*` borran mis vistas?"

**No.** Solo leen las vistas para validarlas. No modifican nada.

---

### "¿Puedo ejecutar `make check-all` sin hacer todos los días?"

Sí, pero fallará en los días que no hayas resuelto. No hay problema.

---

## 🎯 Comandos por Situación

| Situación | Comando |
|-----------|---------|
| Primera instalación | `make setup` |
| Algo salió mal, empezar de nuevo | `make reset` |
| Validar Day 1 | `make check-day1` |
| Validar todos los días | `make check-all` |
| Ver comandos disponibles | `make help` |
| Borrar todo | `make clean` |

---

**Volver a:** [Documentación Principal](README.md)

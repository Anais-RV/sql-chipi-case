# 🐼 Refactorización Completada: sql-chipi-case v2.0

## ✅ Objetivo Logrado

Se ha refactorizado completamente el proyecto **sql-chipi-case** para:
- ✅ Hacerlo más **accesible** a grupos sensibles a sobrecarga
- ✅ Quitar **soluciones** de los archivos de retos
- ✅ Implementar **vistas nombradas** como entregables
- ✅ Crear **tests automáticos** para validar
- ✅ Establecer una **rama privada** para soluciones del profesorado

---

## 📋 Cambios Principales

### 1. Retos Refactorizados (Sin Soluciones)

**Antes:** Los .md contenían SQL completo.
**Ahora:** Solo enunciados, pistas y nombres de vistas.

- `challenges/day1_select_basics.md` → 5 retos + 1 BONUS
- `challenges/day2_joins_analysis.md` → 4 retos + 1 EXTRA
- `challenges/day3_light_extra.md` → 2 retos + 1 EXTRA (opcional)

**Ejemplo:**
```markdown
## 🎯 Reto 1: Conoce al equipo
Crea una vista que muestre todos los alumnos con su equipo y turno.

Columnas esperadas: nombre, equipo, turno
Orden: por equipo (A→Z), luego por nombre (A→Z)
Nombre de la vista: solve_d1_r1

Pista: usa JOIN entre alumnos y equipos.
```

### 2. Vistas como Entregables

Cada reto pide una **vista SQL con nombre canónico**:

**Día 1:**
- `solve_d1_r1` - Lista alumnos
- `solve_d1_r2` - Commits con "chipi"
- `solve_d1_r3` - Cafetera a las 02:13
- `solve_d1_r4` - Discord
- `solve_d1_bonus` - Sospechosos activos

**Día 2:**
- `solve_d2_r1` - Dispositivos
- `solve_d2_r2` - Commits últimos 3 días
- `solve_d2_r3` - Tasa de fallos por equipo
- `solve_d2_r4` - Top 3 bebidas
- `solve_d2_extra` - Último avistamiento de Chipi

**Día 3:**
- `solve_d3_r1` - Alumnos activos y raros (CTE)
- `solve_d3_r2` - Últimos 2 commits por alumno (Window Function)
- `solve_d3_extra` - Cronología del crimen

### 3. Tests Automáticos

Se crearon tests en `db/tests/`:
- `day1_checks.sql` - Valida vistas, columnas, orden
- `day2_checks.sql` - Verifica propiedades
- `day3_checks.sql` - Opcional

**Sin revelar soluciones**, solo verifican:
- Que la vista existe
- Que tiene las columnas esperadas
- Conteos mínimos
- Orden correcto (con verificaciones tipo LEAD/LAG)

**Uso:**
```powershell
make check-day1    # Valida Day 1
make check-day2    # Valida Day 2
make check-day3    # Valida Day 3
make check-all     # Valida todo
```

### 4. Rama Local `instructor/solutions`

**Creada:** `git checkout -b instructor/solutions`

**Contenido:**
```
instructor/solutions/
├── day1_solutions.sql   (5 vistas + BONUS)
├── day2_solutions.sql   (4 vistas + EXTRA)
├── day3_solutions.sql   (2 vistas + EXTRA)
└── README.md            (instrucciones)
```

**Protección:**
- ✅ `.gitignore` excluye `instructor/**`
- ✅ `.git/info/exclude` refuerza localmente
- ✅ `.git/hooks/pre-push` bloquea push de la rama
- ✅ **Nunca se sube a GitHub**

### 5. Actualización de README.md

Nueva sección: **"¿Cómo entregar los retos?"**

```markdown
## 📝 ¿Cómo entregar los retos?

Para cada reto, crea una vista SQL:

CREATE VIEW solve_d1_r1 AS
SELECT ...

Valida:
make check-day1
```

### 6. Commits en main

```
1eb918e - docs: añadir sección 'Cómo entregar'...
fdda28e - refactor: accesibilidad y progresión en retos SQL-Chipi-Case
```

---

## 🎯 Arquitectura Final

```
main (público, para alumnado)
├── challenges/day1_select_basics.md      (sin soluciones)
├── challenges/day2_joins_analysis.md     (sin soluciones)
├── challenges/day3_light_extra.md        (sin soluciones)
├── db/tests/day1_checks.sql              (validaciones)
├── db/tests/day2_checks.sql              (validaciones)
├── db/tests/day3_checks.sql              (validaciones)
├── Makefile                              (check-day1/2/3/all)
├── README.md                             ("Cómo entregar")
└── .gitignore                            (excluye instructor/)

instructor/solutions (local, privado)
├── day1_solutions.sql
├── day2_solutions.sql
├── day3_solutions.sql
└── README.md
```

---

## 📊 Resumen de Cambios

| Aspecto | Antes | Ahora |
|---------|-------|-------|
| **Soluciones en .md** | ✗ Mostradas | ✓ Ocultas |
| **Entregables** | Confusos | ✓ Vistas nombradas |
| **Tests** | No existían | ✓ Automáticos (make check-dayX) |
| **Accesibilidad** | Media | ✓ Alta (progresivo, sin sobrecarga) |
| **Rama privada** | No existía | ✓ instructor/solutions (local) |
| **Protección** | Ninguna | ✓ .gitignore + hook pre-push |

---

## 🚀 Cómo Usar

### Para el Alumnado (rama `main`)

```powershell
# 1. Setup
$env:PGPASSWORD="postgres"
make setup

# 2. Ver retos
cat challenges/day1_select_basics.md

# 3. Crear vistas
CREATE VIEW solve_d1_r1 AS SELECT ...

# 4. Validar
make check-day1

# 5. Avanzar a Day 2
make check-day2

# 6. Opcional: Day 3
make check-day3
```

### Para el Profesorado (rama local)

```powershell
# 1. Ver soluciones
git checkout instructor/solutions

# 2. Ver los archivos
cat instructor/solutions/day1_solutions.sql
cat instructor/solutions/day2_solutions.sql

# 3. Volver a main
git checkout main

# NUNCA: git push (bloqueado por hook)
```

---

## ✨ Beneficios

✅ **Sin Sobrecarga:** Progresión clara de dificultad  
✅ **Claro:** Enunciados cortos, pistas útiles  
✅ **Validable:** Tests automáticos sin revelar soluciones  
✅ **Seguro:** Rama de soluciones local, protegida  
✅ **Educativo:** Estudiantes resuelven, no copian  
✅ **Flexible:** 3 días de retos, escalable  

---

## 📝 Notas Finales

1. **Los archivos .md de retos NO tienen soluciones** - Los estudiantes deben pensarlos
2. **Las vistas se entregan con nombres canónicos** - Fácil de validar
3. **Los tests son no-invasivos** - No revelan la solución, solo validan propiedades
4. **La rama instructor/solutions es local** - Nunca se sube a GitHub
5. **El Makefile tiene check-dayX** - Validación rápida y clara

---

## 🎊 Conclusión

**sql-chipi-case v2.0 está completamente refactorizado y listo para:**
- ✅ Enseñanza en bootcamps
- ✅ Grupos sensibles a sobrecarga
- ✅ Aprendizaje autodirigido
- ✅ Validación automática
- ✅ Soluciones privadas del profesorado

**¡Proyecto completado exitosamente!** 🐼✨

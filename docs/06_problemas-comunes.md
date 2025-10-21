# Problemas Comunes - sql-chipi-case

> Soluciones rápidas a los errores más frecuentes

---

## ✅ Nombres de vistas correctos (evita confusiones)

Asegúrate de crear exactamente estas vistas por día. Algunos checkers antiguos pedían nombres que no existen.

- Día 1 (SELECT Basics)
   - Requeridas: solve_d1_r1, solve_d1_r2, solve_d1_r3, solve_d1_r4
   - Opcional (bonus): solve_d1_bonus

- Día 2 (JOINs y análisis)
   - Requeridas: solve_d2_r1, solve_d2_r2, solve_d2_r3, solve_d2_r4
   - Nota: No existe solve_d2_r5

- Día 3 (CTEs y Window Functions)
   - Requeridas: solve_d3_r1, solve_d3_r2
   - Bonus opcional: solve_d3_bonus (en algunos materiales llamado "extra")

- Día 4 (Revelación Final)
   - Requerida: solve_d4_reveal (una sola fila con 4 columnas)
   - Nota: No existen solve_d4_r1/r2/r3/r4 ni solve_d4_final

Si tus checkers exigen vistas diferentes, actualiza el repo y vuelve a correr `make check-*`.

---

## � Arreglar la línea temporal SIN perder tus vistas

Si `solve_d2_extra` u otras consultas con horas fijas no devuelven datos y no quieres hacer `make reset`, hay un parche no destructivo que ajusta solo las fechas/horas del seed:

- Archivo: `db/patches/10_fix_timeline_without_reset.sql`
- Qué hace: ancla `commits`, `discord_logs` y `cafe_ordenes` al día del caso (2025-10-19) y ajusta horas clave. No borra ni toca tus vistas.

Opcional (PowerShell):
```powershell
# Ejecutar el parche sin resetear la BD
# Ajusta -U/-h/-p si usas credenciales distintas
psql -U postgres -d chipi_case -f db/patches/10_fix_timeline_without_reset.sql
```

Tras esto, vuelve a ejecutar las validaciones (`make check-day2`, etc.).

---

## �🔴 "psql: command not found"

### Problema
Al ejecutar `make setup`, ves:
```
psql: command not found
make: *** [Makefile:58] Error 2
```

### Causa
PostgreSQL no está en el PATH del sistema.

### Solución 1: Usar ruta completa

```powershell
make setup PSQL="C:\Program Files\PostgreSQL\16\bin\psql.exe"
```

También funciona con otros comandos:
```powershell
make check-day1 PSQL="C:\Program Files\PostgreSQL\16\bin\psql.exe"
```

### Solución 2: Añadir PostgreSQL al PATH

1. Abrir "Variables de entorno" de Windows
2. Editar la variable `Path` del usuario
3. Añadir: `C:\Program Files\PostgreSQL\16\bin`
4. Reiniciar la terminal
5. Ejecutar: `make setup`

---

## 🔴 "make: command not found"

### Problema
```
make: The term 'make' is not recognized
```

### Causa
Make no está instalado.

### Solución
Instalar Git for Windows (incluye Make):
1. Descargar: https://git-scm.com/download/win
2. Instalar con opciones por defecto
3. Reiniciar la terminal
4. Verificar: `make --version`

---

## 🔴 "password authentication failed"

### Problema
```
psql: FATAL: password authentication failed for user "postgres"
```

### Causa
La password configurada no coincide con la de PostgreSQL.

### Solución
```powershell
# Usar la password correcta:
$env:PGPASSWORD="tu_password_real"
make setup
```

### ¿No recuerdas la password?
La configuraste durante la instalación de PostgreSQL.

**Opción 1:** Reinstalar PostgreSQL  
**Opción 2:** Cambiar password desde pgAdmin 4

---

## 🔴 "Database chipi_case already exists"

### Problema
```
ERROR: database "chipi_case" already exists
```

### Causa
Ya ejecutaste `make setup` antes.

### Solución
Usar `make reset` en lugar de `make setup`:
```powershell
make reset
```

Esto borrará y recreará la base de datos.

---

## 🔴 "relation 'solve_d1_r1' does not exist"

### Problema
Al ejecutar `make check-day1`:
```
ERROR: relation "solve_d1_r1" does not exist
```

### Causa
No has creado la vista `solve_d1_r1` en DBeaver.

### Solución
1. Abrir DBeaver
2. Conectar a `chipi_case`
3. Crear la vista:
```sql
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT 
    a.nombre,
    e.nombre AS equipo,
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```
4. Ejecutar de nuevo: `make check-day1`

Ver guía completa: [Cómo Crear Vistas](como-crear-vistas.md)

---

## 🔴 "FATAL: role 'postgres' does not exist"

### Problema
```
FATAL: role "postgres" does not exist
```

### Causa
PostgreSQL no se instaló correctamente, o se usa otro usuario.

### Solución 1: Reinstalar PostgreSQL
1. Desinstalar PostgreSQL completamente
2. Reinstalar desde: https://www.postgresql.org/download/
3. Durante instalación, marcar "Command Line Tools"

### Solución 2: Usar tu usuario real
Si usas otro usuario (ejemplo: `miusuario`):

Editar `Makefile` línea 12:
```makefile
DB_USER=miusuario
```

---

## 🔴 Servicio PostgreSQL no está corriendo

### Problema
```
could not connect to server: Connection refused
```

### Causa
El servicio de PostgreSQL no está activo.

### Solución Windows
1. Abrir "Servicios" (Win + R → `services.msc`)
2. Buscar "postgresql-x64-16"
3. Click derecho → Iniciar
4. (Opcional) Configurar como "Automático"

---

## 🔴 "column 'nombre' does not exist in view"

### Problema
```
ERROR: La vista debe tener una columna llamada 'nombre'
```

### Causa
Tu vista no tiene las columnas esperadas.

### Solución
Verificar que tu vista tenga EXACTAMENTE las columnas pedidas en el reto.

**Ejemplo:**
```sql
-- ❌ Incorrecto (falta columna 'equipo'):
CREATE VIEW solve_d1_r1 AS
SELECT nombre, turno FROM alumnos;

-- ✅ Correcto (tiene todas las columnas):
CREATE VIEW solve_d1_r1 AS
SELECT 
    a.nombre,
    e.nombre AS equipo,  -- ← Esta columna faltaba
    a.turno
FROM alumnos a
JOIN equipos e ON a.equipo_id = e.id;
```

---

## 🔴 DBeaver no se conecta

### Problema
"Connection refused" o "Connection error" en DBeaver.

### Causa
PostgreSQL no está corriendo, o datos incorrectos.

### Solución
Verificar configuración de conexión en DBeaver:
- **Host:** `localhost`
- **Puerto:** `5432`
- **Database:** `chipi_case`
- **Usuario:** `postgres`
- **Password:** (tu password de PostgreSQL)

**Test de conexión:** Click en "Test Connection" en DBeaver

---

## 🔴 "syntax error at or near 'SELECT'"

### Problema
```
ERROR: syntax error at or near "SELECT"
```

### Causa
Olvidaste poner `CREATE VIEW ... AS` antes del SELECT.

### Solución
```sql
-- ❌ Incorrecto:
SELECT * FROM alumnos;

-- ✅ Correcto:
CREATE OR REPLACE VIEW solve_d1_r1 AS
SELECT * FROM alumnos;
```

Ver: [Cómo Crear Vistas](como-crear-vistas.md)

---

## 🔴 "permission denied for database"

### Problema
```
ERROR: permission denied for database chipi_case
```

### Causa
El usuario no tiene permisos en la base de datos.

### Solución
Conectar como usuario `postgres` (superusuario):
```powershell
$env:PGPASSWORD="postgres"
make setup
```

---

## 🔴 Caracteres raros (mojibake) en PowerShell

### Problema
Ves: `RubÃ©n` en lugar de `Rubén`

### Causa
PowerShell usa codepage por defecto (no UTF-8).

### Solución
**No es un problema.** Los datos están correctos en la BD.

**En DBeaver se ven bien:**
```sql
SELECT * FROM alumnos WHERE nombre LIKE '%Rubén%';
-- Muestra: Rubén (correctamente)
```

PowerShell solo afecta la visualización en terminal, no los datos.

---

## 🔴 `make reset` no funciona

### Problema
```
ERROR: database "chipi_case" is being accessed by other users
```

### Causa
Hay conexiones abiertas (DBeaver, pgAdmin, otra terminal).

### Solución
1. Cerrar DBeaver
2. Cerrar pgAdmin 4
3. Cerrar otras terminales con `psql`
4. Ejecutar de nuevo: `make reset`

---

## 🔴 "Function unlock_chipi does not exist"

### Problema
```
ERROR: function unlock_chipi(text) does not exist
```

### Causa
No se cargó el archivo `02_functions.sql`.

### Solución
```powershell
make reset
```

Esto recrea todo, incluyendo las funciones.

---

## 📞 ¿Otro problema?

### Opciones:

1. **Revisar documentación:**
   - [Comandos Make](comandos.md)
   - [Cómo Crear Vistas](como-crear-vistas.md)
   - [Instalación](instalacion.md)

2. **Empezar de cero:**
   ```powershell
   make clean
   make setup
   ```

3. **Verificar logs completos:**
   ```powershell
   make setup > log.txt 2>&1
   # Revisa log.txt para ver el error completo
   ```

---

**Volver a:** [Documentación Principal](README.md)

# 🐼 sql-chipi-case

> **Un proyecto educativo para enseñar SQL resolviendo un misterio.**

Chipi, la mascota de **SuperKode**, ha sido secuestrada. Los alumnos del bootcamp deben usar **SQL** para resolver pistas y descubrir quién fue.

---

## 📖 Contexto

El 19 de octubre de 2025, a las **02:13**, Chipi desapareció de la oficina de SuperKode.

**Los sospechosos:**
- 🛠️ **Cris** (formadora): "Fue el router. Siempre es el router."
- 🔧 **Andrea** (formadora): "El pipeline está roto."
- 📊 **Yeraldín** (formadora): "Revisar los commits."
- 🦆 **Mamá Pato** (formadora): "Yo no fui. *quack quack*"

**Los investigadores: TÚ y tus compañeros del bootcamp SuperKode.**

---

## 🎯 Objetivo

Practicar **SQL** resolviendo un caso misterioso:

- ✅ **SELECT** básico: listar datos
- ✅ **JOIN**: conectar tablas relacionadas
- ✅ **WHERE**: filtrar información
- ✅ **ORDER BY**, **GROUP BY**: analizar datos
- ✅ **Subqueries** y **CTEs**: consultas avanzadas

---

## 📋 Requisitos

Antes de empezar, asegúrate de tener:

- **PostgreSQL 16+** instalado ([descargar](https://www.postgresql.org/download/))
- **psql** disponible en tu PATH (`psql --version`)
- **Make** instalado en Windows (incluido en herramientas de desarrollo o usa GnuWin32)
- **DBeaver** (opcional pero recomendado para ver datos gráficamente)

### Verificar que todo está instalado:

```powershell
psql --version
# Output: psql (PostgreSQL) 16.x

make --version
# Output: GNU Make 4.x
```

---

## 🚀 Instalación y Setup

### Paso 1: Configura la contraseña de PostgreSQL

En **PowerShell**, configura la variable de entorno:

```powershell
$env:PGPASSWORD="postgres"
```

> **Nota:** Reemplaza `"postgres"` con tu contraseña real si es diferente.

### Paso 2: Ejecuta el setup

```powershell
make setup
```

Esto hará:
1. ✅ Crear la base de datos `chipi_case`
2. ✅ Ejecutar el esquema (crear tablas)
3. ✅ Insertar datos iniciales

---

## 📊 Acceder a los datos

### Opción A: Con DBeaver (recomendado)

1. Abre **DBeaver**
2. Click en `Database` → `New Database Connection`
3. Selecciona **PostgreSQL**
4. Completa:
   - Host: `localhost`
   - Port: `5432`
   - Database: `chipi_case`
   - Username: `postgres`
   - Password: `postgres`
5. Click en `Finish` y explora las tablas

### Opción B: Con línea de comandos (psql)

```powershell
$env:PGPASSWORD="postgres"
psql -h localhost -U postgres -d chipi_case
```

Luego puedes escribir queries SQL directamente:

```sql
SELECT nombre, email, turno FROM alumnos;
```

---

## 🎮 Retos

### Día 1: SELECT Basics

Abre **`challenges/day1_select_basics.md`** y resuelve:

1. **Reto 1:** Lista todos los alumnos con su equipo y turno
2. **Reto 2:** Encuentra commits que contengan "chipi"
3. **Reto 3:** ¿Quién tomó café a las 02:13? 🚨 (Pista crítica)
4. **Reto 4:** Últimas pistas en Discord
5. **BONUS:** ¿Quién miente? (análisis avanzado)

---

## 📁 Estructura del Proyecto

```
sql-chipi-case/
├── db/
│   ├── 00_schema.sql      # Definición de tablas
│   └── 01_seed.sql        # Datos iniciales
├── challenges/
│   └── day1_select_basics.md  # Retos del Día 1
├── lore/
│   └── nota_secuestro.txt # Contexto y pistas
├── Makefile               # Automatización
└── README.md              # Este archivo
```

---

## 🗄️ Tablas de la Base de Datos

### `equipos`
- `id` (SERIAL, PK)
- `nombre` (TEXT, UNIQUE)
- `descripcion` (TEXT)

### `alumnos`
- `id` (SERIAL, PK)
- `nombre` (TEXT)
- `email` (TEXT, UNIQUE)
- `equipo_id` (INT, FK → equipos)
- `turno` (TEXT: 'mañana' o 'tarde')
- `fecha_inscripcion` (TIMESTAMP)

### `commits`
- `id` (SERIAL, PK)
- `alumno_id` (INT, FK → alumnos)
- `rama` (TEXT)
- `mensaje` (TEXT) ← **Contiene pistas**
- `estado_ci` (TEXT: 'success', 'failed', 'pending')
- `fecha` (TIMESTAMP)

### `cafe_ordenes`
- `id` (SERIAL, PK)
- `alumno_id` (INT, FK → alumnos)
- `bebida` (TEXT)
- `leche` (TEXT: 'sí', 'no', 'parcial')
- `hora` (TIME) ← **Pista crítica: alguien a las 02:13**
- `fecha` (TIMESTAMP)

### `discord_logs`
- `id` (SERIAL, PK)
- `usuario` (TEXT)
- `canal` (TEXT)
- `mensaje` (TEXT) ← **Confusión y pistas**
- `fecha` (TIMESTAMP)

### `dispositivos`
- `id` (SERIAL, PK)
- `tipo` (TEXT: 'laptop', 'desktop', 'tablet', 'phone')
- `ip` (INET)
- `alumno_id` (INT, FK → alumnos)
- `fecha_registro` (TIMESTAMP)

### `ubicaciones`
- `id` (SERIAL, PK)
- `nombre` (TEXT)
- `lugar` (TEXT)
- `estado` (TEXT: 'seguro', 'peligro', 'desconocido')
- `ultima_actualizacion` (TIMESTAMP)

### `pistas`
- `id` (SERIAL, PK)
- `dia` (INT)
- `codigo` (TEXT, UNIQUE)
- `descripcion` (TEXT)
- `desbloqueo_sql` (TEXT) ← **La query que resuelve la pista**
- `resuelta` (BOOLEAN)
- `fecha_creacion` (TIMESTAMP)

---

## 💡 Ejemplos de Queries Útiles

### Listar todos los alumnos
```sql
SELECT nombre, email, turno FROM alumnos ORDER BY nombre;
```

### Ver quién comitteó "chipi"
```sql
SELECT a.nombre, c.mensaje, c.fecha 
FROM alumnos a 
JOIN commits c ON a.id = c.alumno_id 
WHERE c.mensaje ILIKE '%chipi%';
```

### ¿Quién estaba en la cafetera a las 02:13?
```sql
SELECT a.nombre, c.bebida, c.hora 
FROM alumnos a 
JOIN cafe_ordenes c ON a.id = c.alumno_id 
WHERE c.hora = '02:13';
```

---

## 🔧 Comandos Make

```bash
make setup      # Crear DB + esquema + datos (comando principal)
make initdb     # Solo crear la base de datos
make schema     # Solo crear tablas
make seed       # Solo insertar datos
make clean      # Borrar la base de datos
make reset      # Borrar todo y volver a crear (clean + setup)
make help       # Mostrar esta ayuda
```

---

## 🐛 Troubleshooting

### Error: "FATAL: role 'postgres' does not exist"
→ PostgreSQL no está instalado o no está corriendo. Instala PostgreSQL 16.

### Error: "psql: command not found"
→ `psql` no está en tu PATH. Añade la carpeta de PostgreSQL a PATH:
```powershell
$env:Path += "C:\Program Files\PostgreSQL\16\bin"
```

### Error: "password authentication failed"
→ Configura la variable de entorno correctamente:
```powershell
$env:PGPASSWORD="tu_contraseña_real"
```

### Error: "Database 'chipi_case' already exists"
→ La DB ya existe. Usa `make reset` para borrar y recrear:
```powershell
make reset
```

---

## 📚 Próximos Pasos

1. ✅ Ejecuta `make setup`
2. ✅ Abre `challenges/day1_select_basics.md`
3. ✅ Resuelve los 5 retos
4. ✅ Descubre quién secuestró a Chipi
5. ✅ Celebra con Mamá Pato 🦆

---

## 🤝 Contribuir

¿Encontraste un error? ¿Quieres añadir más retos?

1. Abre un issue
2. Propón cambios
3. Recuerda: **Chipi depende de ti**

---

## 📝 Licencia

Proyecto educativo creado para **SuperKode Bootcamp**.
Inspirado en narrativas de videojuegos educativos.

---

## 🦆 Créditos

- 📖 **Proyecto:** sql-chipi-case
- 🎨 **Historia:** Mamá Pato 🦆, Cris, Andrea, Yeraldín
- 👥 **Investigadores:** Miguel, SalchiPresi, Marcus, Daniel, Roxy, Cale, La Rusa, Ramazan, Wizi, Sara, Rubén, David
- 🐼 **Víctima:** Chipi (aún sin recuperar...)

---

**¿Listos para resolver el caso? 🔍**

```powershell
$env:PGPASSWORD="postgres"
make setup
# Y a investigar... 🕵️
```

*P.D.: Mamá Pato sigue negando todo. Cris sigue culpando al router.*

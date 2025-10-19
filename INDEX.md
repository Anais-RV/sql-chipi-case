╔════════════════════════════════════════════════════════════╗
║          🐼 sql-chipi-case: ÍNDICE DEL PROYECTO 🐼          ║
║       Proyecto Educativo SQL - SuperKode Bootcamp           ║
╚════════════════════════════════════════════════════════════╝

📂 ESTRUCTURA COMPLETA
═════════════════════════════════════════════════════════════

sql-chipi-case/
│
├── 📖 README.md ⭐ LEER PRIMERO
│   → Documentación completa del proyecto
│   → Requisitos y instalación
│   → Referencia de tablas
│
├── 🚀 QUICKSTART.md
│   → Guía de 3 pasos para empezar
│   → Comandos básicos
│   → Troubleshooting rápido
│
├── 📊 SCHEMA_REFERENCE.md
│   → Diagrama ER (Entidades y Relaciones)
│   → Referencia de tablas
│   → Query patterns útiles
│
├── 📁 db/
│   │
│   ├── 00_schema.sql
│   │   └─ Define 8 tablas: equipos, alumnos, commits,
│   │      cafe_ordenes, discord_logs, dispositivos,
│   │      ubicaciones, pistas
│   │
│   └── 01_seed.sql
│       └─ Inserta 48 registros de datos iniciales
│          (12 alumnos, 3 equipos, 12 commits, etc.)
│
├── 🎮 challenges/
│   │
│   ├── day1_select_basics.md ⭐ EMPEZAR CON ESTO
│   │   ├─ Reto 1: Lista alumnos
│   │   ├─ Reto 2: Commits con "chipi"
│   │   ├─ Reto 3: ¿Quién en la cafetera a las 02:13? 🚨
│   │   ├─ Reto 4: Pistas Discord
│   │   └─ BONUS: Análisis avanzado
│   │
│   └── day2_joins_analysis.md
│       ├─ Reto 1: COUNT y GROUP BY
│       ├─ Reto 2: JOINs múltiples
│       ├─ Reto 3: Análisis de estados
│       ├─ Reto 4: Timeline de eventos
│       └─ BONUS: Correlaciones avanzadas
│
├── 🎭 lore/
│   └── nota_secuestro.txt
│       └─ Narrativa del misterio
│          Contexto, sospechosos, pistas
│
└── ⚙️ Makefile
    ├─ make setup    (RECOMENDADO)
    ├─ make initdb
    ├─ make schema
    ├─ make seed
    ├─ make clean
    ├─ make reset
    └─ make help


═════════════════════════════════════════════════════════════
🎯 CÓMO EMPEZAR (3 PASOS)
═════════════════════════════════════════════════════════════

PASO 1: Configura PostgreSQL
────────────────────────────────────────────────────────────
$ $env:PGPASSWORD="postgres"

PASO 2: Ejecuta el setup
────────────────────────────────────────────────────────────
$ make setup

  ✓ Crea base de datos: chipi_case
  ✓ Crea tablas desde 00_schema.sql
  ✓ Inserta datos desde 01_seed.sql

PASO 3: Comienza a investigar
────────────────────────────────────────────────────────────
1. Abre DBeaver (o psql)
2. Conecta a: chipi_case en localhost:5432
3. Lee: challenges/day1_select_basics.md
4. Resuelve los 5 retos
5. Descubre quién secuestró a Chipi!


═════════════════════════════════════════════════════════════
📚 ARCHIVOS Y SU PROPÓSITO
═════════════════════════════════════════════════════════════

DOCUMENTACIÓN:
  README.md              → Documentación oficial (más completa)
  QUICKSTART.md          → Guía rápida (3 pasos)
  SCHEMA_REFERENCE.md    → Referencia técnica (tablas + queries)
  INDEX.md               → Este archivo

BASE DE DATOS:
  db/00_schema.sql       → Define la estructura
  db/01_seed.sql         → Carga datos iniciales

RETOS:
  challenges/day1_select_basics.md   → Nivel principiante ⭐
  challenges/day2_joins_analysis.md  → Nivel intermedio ⭐⭐

NARRATIVA:
  lore/nota_secuestro.txt            → Historia del caso

AUTOMATIZACIÓN:
  Makefile               → Comandos para gestionar BD


═════════════════════════════════════════════════════════════
🎓 LEARNING PATH
═════════════════════════════════════════════════════════════

Nivel 1: SELECT Basics (Día 1)
  ✓ SELECT simple
  ✓ WHERE con condiciones
  ✓ JOIN entre 2 tablas
  ✓ ORDER BY, LIMIT
  Reto: Encuentra quién estaba en la cafetera a las 02:13

Nivel 2: Análisis Avanzado (Día 2)
  ✓ GROUP BY y agregaciones
  ✓ HAVING con filtros
  ✓ JOINs múltiples
  ✓ UNION de resultados
  Reto: Correlaciona eventos sospechosos

Nivel 3: Experto (Día 3+)
  ✓ Window functions
  ✓ CTEs (Common Table Expressions)
  ✓ Subqueries complejas
  Reto: Resuelve el caso completo


═════════════════════════════════════════════════════════════
🗄️ DATOS DEL PROYECTO
═════════════════════════════════════════════════════════════

TABLAS:
  • equipos          (3 registros)
  • alumnos          (12 registros)
  • commits          (12 registros)
  • cafe_ordenes     (12 registros)  ← PISTA CRÍTICA
  • discord_logs     (11 registros)  ← PISTAS
  • dispositivos     (12 registros)
  • ubicaciones      (2 registros)
  • pistas           (5 registros)   ← GUÍAS EDUCATIVAS

TOTAL: 79 registros de datos coherentes

SOSPECHOSOS (alumnos):
  Miguel, SalchiPresi, Marcus, Daniel, Roxy, Cale,
  La Rusa, Ramazan, Wizi, Sara, Rubén, David

FORMADORES (menciones en Discord):
  Cris, Andrea, Yeraldín, Mamá Pato 🦆

VÍCTIMA: Chipi 🐼 (desaparecida a las 02:13)


═════════════════════════════════════════════════════════════
💡 PISTAS PRINCIPALES
═════════════════════════════════════════════════════════════

PISTA 1: ☕ LA CAFETERA
  Hora sospechosa: 02:13
  ¿Quién tomó bebida a esa hora?
  Query: SELECT a.nombre FROM alumnos a
         JOIN cafe_ordenes c ON a.id = c.alumno_id
         WHERE c.hora = '02:13';

PISTA 2: 💻 COMMITS
  Palabra clave: "chipi"
  ¿Qué commits mencionan a Chipi?
  Query: SELECT * FROM commits
         WHERE mensaje ILIKE '%chipi%';

PISTA 3: 💬 DISCORD
  Canales sospechosos: #general, #confesiones, #secreto
  ¿Qué se dijo cuando desapareció?
  Query: SELECT * FROM discord_logs
         WHERE canal IN ('#confesiones', '#secreto');

PISTA 4: 🖥️ DISPOSITIVOS
  IP sospechosa: 192.168.1.109 (Wizi's desktop)
  ¿Quién estaba activo?
  Query: SELECT a.nombre FROM alumnos a
         JOIN dispositivos d ON a.id = d.alumno_id
         WHERE d.ip = '192.168.1.109';


═════════════════════════════════════════════════════════════
🔧 COMANDOS PRINCIPALES
═════════════════════════════════════════════════════════════

SETUP INICIAL:
  $env:PGPASSWORD="postgres"
  make setup

COMANDOS INDIVIDUALES:
  make initdb    → Crear base de datos
  make schema    → Crear tablas
  make seed      → Insertar datos
  make clean     → Borrar todo
  make reset     → Borrar y recrear
  make help      → Ver ayuda

VER LA AYUDA:
  make help


═════════════════════════════════════════════════════════════
❓ FAQ / TROUBLESHOOTING
═════════════════════════════════════════════════════════════

P: Error "role 'postgres' does not exist"
R: PostgreSQL no está instalado. Instálalo desde postgresql.org

P: Error "psql: command not found"
R: Añade PostgreSQL\bin a tu PATH

P: Error "password authentication failed"
R: Configura PGPASSWORD correcto:
   $env:PGPASSWORD="tu_contraseña"

P: Error "database chipi_case already exists"
R: Ejecuta: make reset

P: ¿Cómo conecto en DBeaver?
R: Database → New Connection → PostgreSQL
   Host: localhost | Port: 5432 | DB: chipi_case
   User: postgres | Password: postgres

P: ¿Cuál es la contraseña por defecto?
R: "postgres" (puede variar según instalación)

P: ¿Puedo usar otro cliente SQL?
R: Sí: DBeaver, pgAdmin, psql, o cualquier cliente PostgreSQL


═════════════════════════════════════════════════════════════
🎯 OBJETIVOS DE APRENDIZAJE
═════════════════════════════════════════════════════════════

Al completar este proyecto, dominarás:

  ✅ SELECT y proyección de columnas
  ✅ WHERE con múltiples condiciones
  ✅ JOIN, LEFT JOIN, INNER JOIN
  ✅ GROUP BY, COUNT, agregaciones
  ✅ ORDER BY, LIMIT, OFFSET
  ✅ ILIKE y búsqueda de texto
  ✅ UNION de resultados
  ✅ Subqueries y CTEs
  ✅ Window functions
  ✅ Análisis y correlación de datos


═════════════════════════════════════════════════════════════
📞 RECURSOS
═════════════════════════════════════════════════════════════

DOCUMENTACIÓN INTERNA:
  • README.md - Completa (lee primero)
  • QUICKSTART.md - Rápida (empieza aquí)
  • SCHEMA_REFERENCE.md - Técnica
  • Makefile - Automatización
  • challenges/*.md - Retos

DOCUMENTACIÓN EXTERNA:
  • PostgreSQL: https://www.postgresql.org/docs/
  • SQL: https://sqlzoo.net (tutorial interactivo)
  • DBeaver: https://dbeaver.io/docs/

HERRAMIENTAS:
  • PostgreSQL 16: https://www.postgresql.org/download/
  • DBeaver: https://dbeaver.io/
  • Git: https://git-scm.com/


═════════════════════════════════════════════════════════════
🎉 PRÓXIMOS PASOS
═════════════════════════════════════════════════════════════

1. Abre PowerShell en esta carpeta
2. Ejecuta: $env:PGPASSWORD="postgres"
3. Ejecuta: make setup
4. Abre DBeaver y conecta a chipi_case
5. Lee: challenges/day1_select_basics.md
6. ¡Comienza a investigar! 🔍


═════════════════════════════════════════════════════════════
📝 NOTAS FINALES
═════════════════════════════════════════════════════════════

Este proyecto está diseñado para:
  • Enseñar SQL de forma divertida
  • Narrativa coherente y motivadora
  • Datos realistas y coherentes
  • Progresión gradual (básico → avanzado)
  • Múltiples puntos de entrada

NO es:
  • Un proyecto de producción
  • Un sistema de seguridad (contraseñas de ejemplo)
  • Exhaustivo en todas las características de SQL

ES:
  • Educativo y narrativo
  • Ejecutable con un comando: make setup
  • Escalable (se puede añadir más días/retos)
  • Libre de errores SQL


═════════════════════════════════════════════════════════════

                    ¿LISTOS? 🚀

          $env:PGPASSWORD="postgres"
                  make setup
                       ↓
          challenges/day1_select_basics.md
                       ↓
            ¡Encuentra a Chipi! 🐼

╔════════════════════════════════════════════════════════════╗
║  "Si quereis recuperar a Chipi,                           ║
║   consultad mejor que nunca."                             ║
║                                                            ║
║  Todos los datos están aquí.                              ║
║  La verdad está en tus queries.                            ║
║  SQL es tu arma.                                           ║
║                                                            ║
║                      — root_but_intern                    ║
╚════════════════════════════════════════════════════════════╝

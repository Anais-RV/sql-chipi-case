╔════════════════════════════════════════════════════════════╗
║          🐼 BIENVENIDO A sql-chipi-case 🐼                   ║
║     Proyecto educativo para enseñar SQL en SuperKode         ║
╚════════════════════════════════════════════════════════════╝

👋 GUÍA RÁPIDA DE INICIO
═════════════════════════════════════════════════════════════

🎯 OBJETIVO:
Chipi ha sido secuestrado. Usa SQL para resolver pistas.

📋 REQUISITOS:
  ✅ PostgreSQL 16+
  ✅ psql en PATH
  ✅ Make instalado
  ✅ DBeaver (opcional)

🚀 INICIO EN 3 PASOS:

  1️⃣  Abre PowerShell en la carpeta del proyecto

  2️⃣  Ejecuta:
      $env:PGPASSWORD="postgres"
      make setup

  3️⃣  Abre DBeaver, conecta a chipi_case y comienza

─────────────────────────────────────────────────────────────

📚 ARCHIVOS IMPORTANTES:

  ✓ README.md                    → Documentación completa
  ✓ challenges/day1_select_basics.md → Retos del Día 1
  ✓ lore/nota_secuestro.txt     → Contexto de la historia
  ✓ db/00_schema.sql            → Estructura de las tablas
  ✓ db/01_seed.sql              → Datos iniciales

─────────────────────────────────────────────────────────────

🎮 RETOS DISPONIBLES:

  Día 1 (SELECT Basics):
  
  Reto 1: Lista todos los alumnos con equipo y turno
  Reto 2: Encuentra commits con "chipi"
  Reto 3: ¿Quién tomó café a las 02:13? 🚨 (PISTA CRÍTICA)
  Reto 4: Pistas en Discord
  BONUS: Análisis avanzado con GROUP BY

─────────────────────────────────────────────────────────────

🧩 TABLAS DE LA BASE DE DATOS:

  • equipos          → Equipos del bootcamp
  • alumnos          → Los 12 investigadores
  • commits          → Código con pistas
  • cafe_ordenes     → ¿Quién estaba despierto?
  • discord_logs     → Conversaciones sospechosas
  • dispositivos     → IPs y hardware
  • ubicaciones      → ¿Dónde está Chipi?
  • pistas           → Retos a resolver

─────────────────────────────────────────────────────────────

💡 PRIMERAS QUERIES PARA PRACTICAR:

  -- Ver todos los alumnos
  SELECT nombre, email, turno FROM alumnos;

  -- ¿Quién estaba en la cafetera a las 02:13?
  SELECT a.nombre, c.bebida FROM alumnos a 
  JOIN cafe_ordenes c ON a.id = c.alumno_id 
  WHERE c.hora = '02:13';

  -- Commits con "chipi"
  SELECT a.nombre, c.mensaje FROM alumnos a 
  JOIN commits c ON a.id = c.alumno_id 
  WHERE c.mensaje ILIKE '%chipi%';

─────────────────────────────────────────────────────────────

🔧 COMANDOS MAKE:

  make setup     → Crear DB + esquema + datos (RECOMENDADO)
  make initdb    → Solo crear la base
  make schema    → Solo crear tablas
  make seed      → Solo insertar datos
  make clean     → Borrar todo
  make reset     → Borrar y recrear
  make help      → Ver todos los comandos

─────────────────────────────────────────────────────────────

🔍 INVESTIGACIÓN:

  1. Lee la nota de secuestro: lore/nota_secuestro.txt
  2. Abre los retos: challenges/day1_select_basics.md
  3. Conecta a la BD en DBeaver
  4. Escribe queries para resolver las pistas
  5. Descubre quién secuestró a Chipi

─────────────────────────────────────────────────────────────

❓ PROBLEMAS?

  "FATAL: role 'postgres' does not exist"
  → PostgreSQL no está instalado o no corre

  "psql: command not found"
  → Añade PostgreSQL/bin a tu PATH

  "password authentication failed"
  → Usa la contraseña correcta de PostgreSQL

  "Database 'chipi_case' already exists"
  → Ejecuta: make reset

─────────────────────────────────────────────────────────────

🎓 LEARNING PATH:

  Día 1: SELECT, WHERE, JOIN, ORDER BY
  Día 2: GROUP BY, HAVING, subqueries
  Día 3: Window functions, CTEs
  Día 4: Análisis final y resolución del caso

─────────────────────────────────────────────────────────────

👥 PERSONAJES:

  Alumnos (12):
  Miguel, SalchiPresi, Marcus, Daniel, Roxy, Cale,
  La Rusa, Ramazan, Wizi, Sara, Rubén, David

  Formadores (4):
  Cris, Andrea, Yeraldín, Mamá Pato 🦆

  Víctima:
  Chipi 🐼 (desaparecida)

─────────────────────────────────────────────────────────────

¿LISTO? 🚀

  $env:PGPASSWORD="postgres"
  make setup

  Y a investigar... 🕵️

╔════════════════════════════════════════════════════════════╗
║  "Si quereis recuperar a Chipi,                           ║
║   consultad mejor que nunca."                             ║
║                          — root_but_intern                ║
╚════════════════════════════════════════════════════════════╝

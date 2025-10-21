-- ============================================================
-- sql-chipi-case: Tests para Day 2 (JOINs y análisis)
-- ============================================================
-- Este script valida que los estudiantes han creado las vistas correctas

-- Configurar codificacion UTF-8
SET client_encoding = 'UTF8';
-- SIN revelar la solución exacta.
-- ============================================================

\echo '🔍 Validando Day 2...'
\echo ''

-- ===== RETO 1: solve_d2_r1 =====
\echo '📋 Reto 1: solve_d2_r1 (Alumnos por equipo)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d2_r1') THEN
    RAISE EXCEPTION '❌ Vista solve_d2_r1 no existe';
  END IF;
END $$;

SELECT 'solve_d2_r1' as vista,
       CASE 
         WHEN COUNT(*) >= 2 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d2_r1'
GROUP BY table_schema, table_name;

SELECT '✅ Reto 1: ' || COUNT(*) || ' equipos encontrados' as resultado
FROM solve_d2_r1;

\echo ''

-- ===== RETO 2: solve_d2_r2 =====
\echo '📋 Reto 2: solve_d2_r2 (Ramas por alumno)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d2_r2') THEN
    RAISE EXCEPTION '❌ Vista solve_d2_r2 no existe';
  END IF;
END $$;

SELECT 'solve_d2_r2' as vista,
       CASE 
         WHEN COUNT(*) >= 2 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d2_r2'
GROUP BY table_schema, table_name;

SELECT '✅ Reto 2: ' || COUNT(*) || ' alumnos con ramas registradas' as resultado
FROM solve_d2_r2;

\echo ''

-- ===== RETO 3: solve_d2_r3 =====
\echo '📋 Reto 3: solve_d2_r3 (Commits fallidos por alumno)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d2_r3') THEN
    RAISE EXCEPTION '❌ Vista solve_d2_r3 no existe';
  END IF;
END $$;

SELECT 'solve_d2_r3' as vista,
       CASE 
         WHEN COUNT(*) >= 2 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d2_r3'
GROUP BY table_schema, table_name;

SELECT '✅ Reto 3: ' || COUNT(*) || ' alumnos con commits fallidos' as resultado
FROM solve_d2_r3;

\echo ''

-- ===== RETO 4: solve_d2_r4 =====
\echo '📋 Reto 4: solve_d2_r4 (Bebidas más consumidas)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d2_r4') THEN
    RAISE EXCEPTION '❌ Vista solve_d2_r4 no existe';
  END IF;
END $$;

SELECT 'solve_d2_r4' as vista,
       CASE 
         WHEN COUNT(*) >= 2 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d2_r4'
GROUP BY table_schema, table_name;

SELECT '✅ Reto 4: ' || COUNT(*) || ' bebidas diferentes encontradas' as resultado
FROM solve_d2_r4;

\echo ''

-- ===== BONUS: solve_d2_bonus =====
\echo '⭐ BONUS: solve_d2_bonus (Timeline 02:00-02:30)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d2_bonus') THEN
    RAISE EXCEPTION '❌ Vista solve_d2_bonus no existe';
  END IF;
END $$;

SELECT 'solve_d2_bonus' as vista,
       CASE 
         WHEN COUNT(*) >= 4 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d2_bonus'
GROUP BY table_schema, table_name;

SELECT '✅ BONUS: ' || COUNT(*) || ' eventos en el timeline 02:00-02:30' as resultado
FROM solve_d2_bonus;

\echo ''
\echo '✅ ¡VALIDACIÓN DAY 2 COMPLETADA! 🎉'
\echo 'Próximo paso: Día 3 OPCIONAL (make check-day3)'

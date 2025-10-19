-- ============================================================
-- sql-chipi-case: Tests para Day 1 (Retos básicos)
-- ============================================================
-- Este script valida que los estudiantes han creado las vistas correctas
-- SIN revelar la solución exacta.
-- ============================================================

\echo '🔍 Validando Day 1...'
\echo ''

-- ===== RETO 1: solve_d1_r1 =====
\echo '📋 Reto 1: solve_d1_r1 (Conoce al equipo)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d1_r1') THEN
    RAISE EXCEPTION '❌ Vista solve_d1_r1 no existe';
  END IF;
END $$;

-- Validar columnas
SELECT 'solve_d1_r1' as vista,
       CASE 
         WHEN COUNT(*) >= 3 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d1_r1'
GROUP BY table_schema, table_name;

-- Validar que tiene al menos algunos datos
SELECT '✅ Reto 1: ' || COUNT(*) || ' filas encontradas' as resultado
FROM solve_d1_r1;

\echo ''

-- ===== RETO 2: solve_d1_r2 =====
\echo '📋 Reto 2: solve_d1_r2 (¿Quién mencionó a Chipi?)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d1_r2') THEN
    RAISE EXCEPTION '❌ Vista solve_d1_r2 no existe';
  END IF;
END $$;

SELECT 'solve_d1_r2' as vista,
       CASE 
         WHEN COUNT(*) >= 5 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d1_r2'
GROUP BY table_schema, table_name;

SELECT '✅ Reto 2: ' || COUNT(*) || ' commits con "chipi" encontrados' as resultado
FROM solve_d1_r2;

\echo ''

-- ===== RETO 3: solve_d1_r3 =====
\echo '📋 Reto 3: solve_d1_r3 (Cafetera a las 02:13)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d1_r3') THEN
    RAISE EXCEPTION '❌ Vista solve_d1_r3 no existe';
  END IF;
END $$;

SELECT 'solve_d1_r3' as vista,
       CASE 
         WHEN COUNT(*) >= 4 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d1_r3'
GROUP BY table_schema, table_name;

SELECT '✅ Reto 3: ' || COUNT(*) || ' órdenes de café a las 02:13' as resultado
FROM solve_d1_r3;

\echo ''

-- ===== RETO 4: solve_d1_r4 =====
\echo '📋 Reto 4: solve_d1_r4 (Pistas en Discord)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d1_r4') THEN
    RAISE EXCEPTION '❌ Vista solve_d1_r4 no existe';
  END IF;
END $$;

SELECT 'solve_d1_r4' as vista,
       CASE 
         WHEN COUNT(*) >= 4 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d1_r4'
GROUP BY table_schema, table_name;

SELECT '✅ Reto 4: ' || COUNT(*) || ' mensajes Discord encontrados (máximo 10)' as resultado
FROM solve_d1_r4
LIMIT 1;

\echo ''

-- ===== BONUS: solve_d1_bonus =====
\echo '⭐ BONUS: solve_d1_bonus (¿Quién está raro?)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d1_bonus') THEN
    RAISE EXCEPTION '❌ Vista solve_d1_bonus no existe';
  END IF;
END $$;

SELECT 'solve_d1_bonus' as vista,
       CASE 
         WHEN COUNT(*) >= 4 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d1_bonus'
GROUP BY table_schema, table_name;

SELECT '✅ BONUS: ' || COUNT(*) || ' alumnos "raros" identificados' as resultado
FROM solve_d1_bonus;

\echo ''
\echo '✅ ¡VALIDACIÓN DAY 1 COMPLETADA! 🎉'
\echo 'Próximo paso: Día 2 (make check-day2)'

-- ============================================================
-- sql-chipi-case: Tests para Day 3 (CTEs y Window Functions)
-- ============================================================
-- Este script valida que los estudiantes han creado las vistas correctas
-- SIN revelar la solución exacta.
-- NOTA: Day 3 es COMPLETAMENTE OPCIONAL
-- ============================================================

\echo '🔍 Validando Day 3 (OPCIONAL)...'
\echo ''

-- ===== RETO 1: solve_d3_r1 =====
\echo '📋 Reto 1: solve_d3_r1 (Alumnos raros con CTE)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d3_r1') THEN
    RAISE EXCEPTION '❌ Vista solve_d3_r1 no existe. (Este es reto OPCIONAL de Day 3)';
  END IF;
END $$;

SELECT 'solve_d3_r1' as vista,
       CASE 
         WHEN COUNT(*) >= 4 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d3_r1'
GROUP BY table_schema, table_name;

SELECT '✅ Reto 1: ' || COUNT(*) || ' alumnos "raros" encontrados con CTE' as resultado
FROM solve_d3_r1;

\echo ''

-- ===== RETO 2: solve_d3_r2 =====
\echo '📋 Reto 2: solve_d3_r2 (Últimos 2 commits por alumno - Window Functions)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d3_r2') THEN
    RAISE EXCEPTION '❌ Vista solve_d3_r2 no existe. (Este es reto OPCIONAL de Day 3)';
  END IF;
END $$;

SELECT 'solve_d3_r2' as vista,
       CASE 
         WHEN COUNT(*) >= 5 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d3_r2'
GROUP BY table_schema, table_name;

SELECT '✅ Reto 2: ' || COUNT(*) || ' commits (últimos 2 por alumno)' as resultado
FROM solve_d3_r2;

\echo ''

-- ===== BONUS: solve_d3_bonus =====
\echo '⭐ BONUS: solve_d3_bonus (Cronología completa del crimen)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d3_bonus') THEN
    RAISE EXCEPTION '❌ Vista solve_d3_bonus no existe. (Este es reto BONUS OPCIONAL de Day 3)';
  END IF;
END $$;

SELECT 'solve_d3_bonus' as vista,
       CASE 
         WHEN COUNT(*) >= 4 THEN '✅ Tiene columnas'
         ELSE '❌ Faltan columnas'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d3_bonus'
GROUP BY table_schema, table_name;

SELECT '✅ BONUS: ' || COUNT(*) || ' eventos en la cronología del crimen' as resultado
FROM solve_d3_bonus;

\echo ''
\echo '✅ ¡VALIDACIÓN DAY 3 (OPCIONAL) COMPLETADA! 🎉'

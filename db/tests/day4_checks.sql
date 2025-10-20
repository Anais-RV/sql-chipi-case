-- ============================================================
-- sql-chipi-case: Tests para Day 4 (Revelación Final)
-- ============================================================
-- Este script valida que los estudiantes han creado la vista solve_d4_reveal
-- SIN revelar la solución exacta.
-- ============================================================

\echo '🔍 Validando Day 4 (FINAL)...'
\echo ''

-- ===== RETO FINAL: solve_d4_reveal =====
\echo '📋 Reto Final: solve_d4_reveal (Mystery Resolution)'
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d4_reveal') THEN
    RAISE EXCEPTION '❌ Vista solve_d4_reveal no existe. Revisa challenges/day4_final.md';
  END IF;
END $$;

-- Validar que tenga las 4 columnas requeridas
SELECT 'solve_d4_reveal' as vista,
       CASE 
         WHEN COUNT(*) >= 4 THEN '✅ Tiene las 4 columnas requeridas'
         ELSE '❌ Faltan columnas (debe tener: sospechoso, motivo, ubicacion_final, codigo_rescate)'
       END as estado,
       string_agg(column_name, ', ') as columnas
FROM information_schema.columns
WHERE table_schema = 'public' AND table_name = 'solve_d4_reveal'
GROUP BY table_schema, table_name;

-- Validar que devuelva exactamente 1 fila
DO $$
DECLARE
    v_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM solve_d4_reveal;
    
    IF v_count = 0 THEN
        RAISE EXCEPTION '❌ La vista solve_d4_reveal está vacía (0 filas). Debe devolver exactamente 1 fila.';
    ELSIF v_count > 1 THEN
        RAISE EXCEPTION '❌ La vista solve_d4_reveal devuelve % filas. Debe devolver exactamente 1 fila.', v_count;
    END IF;
END $$;

SELECT '✅ Reto Final: Vista con 1 fila revelando el misterio' as resultado;

\echo ''
\echo '✅ ¡VALIDACIÓN DAY 4 (FINAL) COMPLETADA! 🎉'
\echo '🔓 Ahora ejecuta: SELECT unlock_chipi(codigo_rescate) FROM solve_d4_reveal;'
\echo '🐍 O automatiza con: python final/reveal.py'

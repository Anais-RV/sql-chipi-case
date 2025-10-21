-- ============================================================
-- sql-chipi-case: Tests del Día 0 (Warmup)
-- ============================================================

-- Configurar codificacion UTF-8
SET client_encoding = 'UTF8';

-- ============================================================-- Tests "amables" para profes: mensajes claros, no aborta

-- Este script valida que los estudiantes han creado las vistas correctas-- ============================================================

-- SIN revelar la solución exacta.

-- ============================================================\set ON_ERROR_STOP off



\echo '🔍 Validando Day 0...'DO $$

\echo ''DECLARE

    v_count INT;

-- ===== RETO 1: solve_d0_r1 =====    v_columns TEXT;

\echo '📋 Reto 1: solve_d0_r1 (Equipos visibles)'BEGIN

DO $$    RAISE NOTICE '';

BEGIN    RAISE NOTICE '╔════════════════════════════════════════════════════════╗';

  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d0_r1') THEN    RAISE NOTICE '║     Tests Día 0: Calentamiento (sin JOINs)             ║';

    RAISE EXCEPTION '❌ Vista solve_d0_r1 no existe';    RAISE NOTICE '╚════════════════════════════════════════════════════════╝';

  END IF;    RAISE NOTICE '';

END $$;

    -- ======== Reto 1: solve_d0_r1 ========

-- Validar columnas    RAISE NOTICE '🔍 Reto 1: solve_d0_r1 (equipos visibles)';

SELECT 'solve_d0_r1' as vista,    

       CASE     IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d0_r1') THEN

         WHEN COUNT(*) >= 2 THEN '✅ Tiene columnas'        RAISE NOTICE '  ✅ Vista solve_d0_r1 existe';

         ELSE '❌ Faltan columnas'        

       END as estado,        -- Verificar columnas

       string_agg(column_name, ', ') as columnas        SELECT string_agg(column_name, ', ' ORDER BY ordinal_position)

FROM information_schema.columns        INTO v_columns

WHERE table_schema = 'public' AND table_name = 'solve_d0_r1'        FROM information_schema.columns

GROUP BY table_schema, table_name;        WHERE table_name = 'solve_d0_r1';

        

-- Validar que tiene al menos algunos datos        IF v_columns ~ 'id' AND v_columns ~ 'nombre' THEN

SELECT '✅ Reto 1: ' || COUNT(*) || ' equipos encontrados' as resultado            RAISE NOTICE '  ✅ Columnas correctas: %', v_columns;

FROM solve_d0_r1;        ELSE

            RAISE NOTICE '  ⚠️  Columnas encontradas: % (se esperaba: id, nombre)', v_columns;

\echo ''        END IF;

        

-- ===== RETO 2: solve_d0_r2 =====        SELECT COUNT(*) INTO v_count FROM solve_d0_r1;

\echo '📋 Reto 2: solve_d0_r2 (Solo nombres)'        IF v_count = 3 THEN

DO $$            RAISE NOTICE '  ✅ Datos correctos: % equipos', v_count;

BEGIN        ELSE

  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d0_r2') THEN            RAISE NOTICE '  ⚠️  Se encontraron % filas (se esperaban 3 equipos)', v_count;

    RAISE EXCEPTION '❌ Vista solve_d0_r2 no existe';        END IF;

  END IF;    ELSE

END $$;        RAISE NOTICE '  ❌ Vista solve_d0_r1 NO existe';

    END IF;

SELECT 'solve_d0_r2' as vista,    

       CASE     RAISE NOTICE '';

         WHEN COUNT(*) >= 1 THEN '✅ Tiene columnas'

         ELSE '❌ Faltan columnas'    -- ======== Reto 2: solve_d0_r2 ========

       END as estado,    RAISE NOTICE '🔍 Reto 2: solve_d0_r2 (solo nombres)';

       string_agg(column_name, ', ') as columnas    

FROM information_schema.columns    IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d0_r2') THEN

WHERE table_schema = 'public' AND table_name = 'solve_d0_r2'        RAISE NOTICE '  ✅ Vista solve_d0_r2 existe';

GROUP BY table_schema, table_name;        

        SELECT string_agg(column_name, ', ' ORDER BY ordinal_position)

SELECT '✅ Reto 2: ' || COUNT(*) || ' alumnos encontrados' as resultado        INTO v_columns

FROM solve_d0_r2;        FROM information_schema.columns

        WHERE table_name = 'solve_d0_r2';

\echo ''        

        IF v_columns = 'nombre' THEN

-- ===== RETO 3: solve_d0_r3 =====            RAISE NOTICE '  ✅ Columna correcta: %', v_columns;

\echo '📋 Reto 3: solve_d0_r3 (Turno mañana)'        ELSE

DO $$            RAISE NOTICE '  ⚠️  Columnas encontradas: % (se esperaba solo: nombre)', v_columns;

BEGIN        END IF;

  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d0_r3') THEN        

    RAISE EXCEPTION '❌ Vista solve_d0_r3 no existe';        SELECT COUNT(*) INTO v_count FROM solve_d0_r2;

  END IF;        IF v_count = 13 THEN

END $$;            RAISE NOTICE '  ✅ Datos correctos: % alumnos', v_count;

        ELSE

SELECT 'solve_d0_r3' as vista,            RAISE NOTICE '  ⚠️  Se encontraron % filas (se esperaban 13 alumnos)', v_count;

       CASE         END IF;

         WHEN COUNT(*) >= 2 THEN '✅ Tiene columnas'    ELSE

         ELSE '❌ Faltan columnas'        RAISE NOTICE '  ❌ Vista solve_d0_r2 NO existe';

       END as estado,    END IF;

       string_agg(column_name, ', ') as columnas    

FROM information_schema.columns    RAISE NOTICE '';

WHERE table_schema = 'public' AND table_name = 'solve_d0_r3'

GROUP BY table_schema, table_name;    -- ======== Reto 3: solve_d0_r3 ========

    RAISE NOTICE '🔍 Reto 3: solve_d0_r3 (turno mañana)';

SELECT '✅ Reto 3: ' || COUNT(*) || ' alumnos de mañana encontrados' as resultado    

FROM solve_d0_r3;    IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d0_r3') THEN

        RAISE NOTICE '  ✅ Vista solve_d0_r3 existe';

\echo ''        

        SELECT string_agg(column_name, ', ' ORDER BY ordinal_position)

-- ===== RETO 4: solve_d0_r4 =====        INTO v_columns

\echo '📋 Reto 4: solve_d0_r4 (Conteo por turno)'        FROM information_schema.columns

DO $$        WHERE table_name = 'solve_d0_r3';

BEGIN        

  IF NOT EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d0_r4') THEN        IF v_columns ~ 'nombre' AND v_columns ~ 'turno' THEN

    RAISE EXCEPTION '❌ Vista solve_d0_r4 no existe';            RAISE NOTICE '  ✅ Columnas correctas: %', v_columns;

  END IF;        ELSE

END $$;            RAISE NOTICE '  ⚠️  Columnas encontradas: % (se esperaba: nombre, turno)', v_columns;

        END IF;

SELECT 'solve_d0_r4' as vista,        

       CASE         -- Verificar que SOLO hay turno='mañana'

         WHEN COUNT(*) >= 2 THEN '✅ Tiene columnas'        SELECT COUNT(DISTINCT turno) INTO v_count 

         ELSE '❌ Faltan columnas'        FROM solve_d0_r3;

       END as estado,        

       string_agg(column_name, ', ') as columnas        IF v_count = 1 THEN

FROM information_schema.columns            RAISE NOTICE '  ✅ Filtro correcto: solo turno mañana';

WHERE table_schema = 'public' AND table_name = 'solve_d0_r4'        ELSE

GROUP BY table_schema, table_name;            RAISE NOTICE '  ⚠️  Se encontraron % turnos diferentes (debería ser solo 1: mañana)', v_count;

        END IF;

SELECT '✅ Reto 4: ' || COUNT(*) || ' grupos de turnos encontrados' as resultado    ELSE

FROM solve_d0_r4;        RAISE NOTICE '  ❌ Vista solve_d0_r3 NO existe';

    END IF;

\echo ''    

\echo '✅ ¡VALIDACIÓN DAY 0 COMPLETADA! 🎉'    RAISE NOTICE '';

\echo 'Próximo paso: Día 1 (make check-day1)'

    -- ======== Reto 4: solve_d0_r4 ========
    RAISE NOTICE '🔍 Reto 4: solve_d0_r4 (conteo por turno)';
    
    IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_name = 'solve_d0_r4') THEN
        RAISE NOTICE '  ✅ Vista solve_d0_r4 existe';
        
        SELECT string_agg(column_name, ', ' ORDER BY ordinal_position)
        INTO v_columns
        FROM information_schema.columns
        WHERE table_name = 'solve_d0_r4';
        
        IF v_columns ~ 'turno' AND (v_columns ~ 'total' OR v_columns ~ 'count') THEN
            RAISE NOTICE '  ✅ Columnas correctas: %', v_columns;
        ELSE
            RAISE NOTICE '  ⚠️  Columnas encontradas: % (se esperaba: turno, total)', v_columns;
        END IF;
        
        SELECT COUNT(*) INTO v_count FROM solve_d0_r4;
        IF v_count >= 2 AND v_count <= 3 THEN
            RAISE NOTICE '  ✅ Datos correctos: % grupos de turnos', v_count;
        ELSE
            RAISE NOTICE '  ⚠️  Se encontraron % grupos (se esperaban 2-3 turnos)', v_count;
        END IF;
    ELSE
        RAISE NOTICE '  ❌ Vista solve_d0_r4 NO existe';
    END IF;
    
    RAISE NOTICE '';
    RAISE NOTICE '════════════════════════════════════════════════════════';
    RAISE NOTICE '✅ = Correcto  |  ⚠️  = Revisar  |  ❌ = Falta crear';
    RAISE NOTICE '════════════════════════════════════════════════════════';
    RAISE NOTICE '';
END $$;

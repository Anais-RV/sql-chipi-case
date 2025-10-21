\encoding UTF8
SET client_encoding = 'UTF8';
\set ON_ERROR_STOP on

DO $$
DECLARE
    v_count     INT;
    fail_count  INT := 0;
BEGIN
    RAISE NOTICE '';
    RAISE NOTICE '========================================';
    RAISE NOTICE 'Tests Day 1: SELECT Basics';
    RAISE NOTICE '========================================';
    RAISE NOTICE '';

    -- R1
    IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_schema='public' AND table_name = 'solve_d1_r1') THEN
        SELECT COUNT(*) INTO v_count FROM public.solve_d1_r1;
        RAISE NOTICE '[Reto 1] solve_d1_r1 [OK] (% filas)', v_count;
    ELSE
        RAISE NOTICE '[Reto 1] solve_d1_r1 [FAIL] (vista no existe)';
        fail_count := fail_count + 1;
    END IF;

    -- R2
    IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_schema='public' AND table_name = 'solve_d1_r2') THEN
        SELECT COUNT(*) INTO v_count FROM public.solve_d1_r2;
        RAISE NOTICE '[Reto 2] solve_d1_r2 [OK] (% filas)', v_count;
    ELSE
        RAISE NOTICE '[Reto 2] solve_d1_r2 [FAIL] (vista no existe)';
        fail_count := fail_count + 1;
    END IF;

    -- R3
    IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_schema='public' AND table_name = 'solve_d1_r3') THEN
        SELECT COUNT(*) INTO v_count FROM public.solve_d1_r3;
        RAISE NOTICE '[Reto 3] solve_d1_r3 [OK] (% filas)', v_count;
    ELSE
        RAISE NOTICE '[Reto 3] solve_d1_r3 [FAIL] (vista no existe)';
        fail_count := fail_count + 1;
    END IF;

    -- R4
    IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_schema='public' AND table_name = 'solve_d1_r4') THEN
        SELECT COUNT(*) INTO v_count FROM public.solve_d1_r4;
        RAISE NOTICE '[Reto 4] solve_d1_r4 [OK] (% filas)', v_count;
    ELSE
        RAISE NOTICE '[Reto 4] solve_d1_r4 [FAIL] (vista no existe)';
        fail_count := fail_count + 1;
    END IF;

    -- R5
    IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_schema='public' AND table_name = 'solve_d1_r5') THEN
        SELECT COUNT(*) INTO v_count FROM public.solve_d1_r5;
        RAISE NOTICE '[Reto 5] solve_d1_r5 [OK] (% filas)', v_count;
    ELSE
        RAISE NOTICE '[Reto 5] solve_d1_r5 [FAIL] (vista no existe)';
        fail_count := fail_count + 1;
    END IF;

    RAISE NOTICE '';

    IF fail_count = 0 THEN
        RAISE NOTICE 'Day 1 VALIDADO';
    ELSE
        RAISE NOTICE 'Day 1 NO VALIDADO (% fallos)', fail_count;
        -- Hacer fallar el comando psql para que `make` marque error:
        RAISE EXCEPTION 'Day 1 failed with % missing/invalid views', fail_count;
    END IF;
END $$;

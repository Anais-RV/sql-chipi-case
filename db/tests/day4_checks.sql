\encoding UTF8
SET client_encoding = 'UTF8';
\set ON_ERROR_STOP on

DO $$
DECLARE
    v_count       int;
    fail_count    int := 0;
    col_count     int;
    has_cols      int;
BEGIN
  RAISE NOTICE '';
  RAISE NOTICE '========================================';
  RAISE NOTICE 'Tests Day 4: Final Reveal';
  RAISE NOTICE '========================================';
  RAISE NOTICE '';

  -- 1) La vista requerida es SOLO solve_d4_reveal
  IF NOT EXISTS (
      SELECT 1 FROM information_schema.views 
      WHERE table_schema = 'public' AND table_name = 'solve_d4_reveal'
  ) THEN
      RAISE NOTICE '[FAIL] solve_d4_reveal (vista no existe)';
      fail_count := fail_count + 1;
  ELSE
      -- a) Debe devolver exactamente 1 fila
      EXECUTE 'SELECT COUNT(*) FROM public.solve_d4_reveal' INTO v_count;
      IF v_count = 1 THEN
          RAISE NOTICE '[OK] solve_d4_reveal: devuelve exactamente 1 fila';
      ELSE
          RAISE NOTICE '[FAIL] solve_d4_reveal: devuelve % filas (debe ser 1)', v_count;
          fail_count := fail_count + 1;
      END IF;

      -- b) Debe tener 4 columnas con nombres esperados
      SELECT COUNT(*) INTO col_count
      FROM information_schema.columns
      WHERE table_schema = 'public' AND table_name = 'solve_d4_reveal';

      IF col_count = 4 THEN
          RAISE NOTICE '[OK] solve_d4_reveal: 4 columnas';
      ELSE
          RAISE NOTICE '[FAIL] solve_d4_reveal: tiene % columnas (deben ser 4)', col_count;
          fail_count := fail_count + 1;
      END IF;

      SELECT COUNT(*) INTO has_cols
      FROM information_schema.columns
      WHERE table_schema = 'public' 
        AND table_name = 'solve_d4_reveal'
        AND column_name IN ('sospechoso','motivo','ubicacion_final','codigo_rescate');

      IF has_cols = 4 THEN
          RAISE NOTICE '[OK] solve_d4_reveal: columnas esperadas presentes';
      ELSE
          RAISE NOTICE '[FAIL] solve_d4_reveal: faltan columnas requeridas';
          fail_count := fail_count + 1;
      END IF;
  END IF;

  RAISE NOTICE '';
  IF fail_count = 0 THEN
    RAISE NOTICE 'Day 4 VALIDADO';
  ELSE
    RAISE NOTICE 'Day 4 NO VALIDADO (% fallos)', fail_count;
    RAISE EXCEPTION 'Day 4 failed with % missing/invalid views', fail_count;
  END IF;
END $$;

\encoding UTF8
SET client_encoding = 'UTF8';
\set ON_ERROR_STOP on

DO $$
DECLARE
  views      text[] := ARRAY['solve_d3_r1','solve_d3_r2'];
  v          text;
  v_count    int;
  fail_count int := 0;
BEGIN
  RAISE NOTICE '';
  RAISE NOTICE '========================================';
  RAISE NOTICE 'Tests Day 3: Window Functions';
  RAISE NOTICE '========================================';
  RAISE NOTICE '';

  FOREACH v IN ARRAY views LOOP
    IF EXISTS (SELECT 1 FROM information_schema.views WHERE table_schema='public' AND table_name=v) THEN
      EXECUTE format('SELECT count(*) FROM public.%I', v) INTO v_count;
      RAISE NOTICE '[OK] % (% filas)', v, v_count;
    ELSE
      RAISE NOTICE '[FAIL] % (vista no existe)', v;
      fail_count := fail_count + 1;
    END IF;
  END LOOP;

  RAISE NOTICE '';
  IF fail_count = 0 THEN
    RAISE NOTICE 'Day 3 VALIDADO';
  ELSE
    RAISE NOTICE 'Day 3 NO VALIDADO (% fallos)', fail_count;
    RAISE EXCEPTION 'Day 3 failed with % missing/invalid views', fail_count;
  END IF;
END $$;

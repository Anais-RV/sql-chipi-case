-- ============================================================
-- sql-chipi-case: Función para desbloquear a Chipi
-- Solo se ejecuta si el código de rescate es correcto
-- ============================================================

-- Configurar codificacion UTF-8 para caracteres especiales
SET client_encoding = 'UTF8';

CREATE OR REPLACE FUNCTION unlock_chipi(codigo TEXT)
RETURNS TEXT AS $$
DECLARE
    codigo_esperado TEXT;
    ubicacion_nueva TEXT := 'Oficina SuperKode - Sano y Salvo';
BEGIN
    -- Obtener el código de rescate desde la vista solve_d4_reveal
    SELECT codigo_rescate INTO codigo_esperado
    FROM solve_d4_reveal
    LIMIT 1;

    -- Validar código
    IF codigo_esperado IS NULL THEN
        RAISE EXCEPTION '❌ Error: La vista solve_d4_reveal no existe o no devuelve datos.';
    END IF;

    IF codigo != codigo_esperado THEN
        RAISE EXCEPTION '❌ Código incorrecto. Revisa tu lógica en solve_d4_reveal.';
    END IF;

    -- Insertar registro de rescate
    INSERT INTO rescate (ubicacion_nueva, rescatado_por)
    VALUES (ubicacion_nueva, (SELECT sospechoso FROM solve_d4_reveal LIMIT 1));

    -- Mensaje de éxito
    RETURN '🎉 ¡CHIPI HA SIDO RESCATADO! 🐾';
END;
$$ LANGUAGE plpgsql;

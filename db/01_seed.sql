-- ============================================================
-- sql-chipi-case: Datos Iniciales del Bootcamp SuperKode
-- Contexto: Chipi desapareció el 2025-10-19 a las 02:13
-- Investigación: Los alumnos deben resolver pistas con SQL
-- ============================================================

-- Insertar equipos del bootcamp SuperKode
INSERT INTO equipos (nombre, descripcion) VALUES
('SuperKode A', 'Equipo Backend fuerte'),
('SuperKode B', 'Equipo Frontend creativo'),
('Los Pato Devs', 'Equipo DevOps led by Mamá Pato 🦆');

-- Insertar alumnos (12 total: Miguel, SalchiPresi, Marcus, Daniel, Roxy, Cale, La Rusa, Ramazan, Wizi, Sara, Rubén, David)
INSERT INTO alumnos (nombre, email, equipo_id, turno) VALUES
('Miguel', 'miguel@superkode.dev', 1, 'mañana'),
('SalchiPresi', 'salchipresi@superkode.dev', 1, 'tarde'),
('Marcus', 'marcus@superkode.dev', 1, 'mañana'),
('Daniel', 'daniel@superkode.dev', 2, 'tarde'),
('Roxy', 'roxy@superkode.dev', 2, 'mañana'),
('Cale', 'cale@superkode.dev', 2, 'tarde'),
('La Rusa', 'larusa@superkode.dev', 3, 'mañana'),
('Ramazan', 'ramazan@superkode.dev', 3, 'tarde'),
('Wizi', 'wizi@superkode.dev', 1, 'tarde'),
('Sara', 'sara@superkode.dev', 2, 'mañana'),
('Rubén', 'ruben@superkode.dev', 3, 'mañana'),
('David', 'david@superkode.dev', 1, 'tarde');

-- Insertar dispositivos (laptops y desktops con IPs únicas)
INSERT INTO dispositivos (tipo, ip, alumno_id) VALUES
('laptop', '192.168.1.101', 1),   -- Miguel
('laptop', '192.168.1.102', 2),   -- SalchiPresi
('desktop', '192.168.1.103', 3),  -- Marcus
('laptop', '192.168.1.104', 4),   -- Daniel
('laptop', '192.168.1.105', 5),   -- Roxy
('laptop', '192.168.1.106', 6),   -- Cale
('laptop', '192.168.1.107', 7),   -- La Rusa
('laptop', '192.168.1.108', 8),   -- Ramazan
('desktop', '192.168.1.109', 9),  -- Wizi
('laptop', '192.168.1.110', 10),  -- Sara
('laptop', '192.168.1.111', 11),  -- Rubén
('laptop', '192.168.1.112', 12);  -- David

-- Insertar commits (algunos contienen "chipi" como pista sospechosa)
INSERT INTO commits (alumno_id, rama, mensaje, estado_ci) VALUES
(1, 'feature/auth', 'Implementar JWT con chipi_secret', 'success'),
(2, 'bugfix/chipi-redirect', 'Arreglar redirección de Chipi en dashboard', 'success'),
(3, 'feature/dashboard', 'Dashboard principal del bootcamp', 'success'),
(4, 'hotfix/chipi-bug', 'Bug crítico: Chipi se pierde en ruta /api/chipi', 'failed'),
(5, 'feature/api', 'Endpoints API para gestión de mascotas', 'pending'),
(6, 'refactor/chipi-service', 'Refactorizar servicio de localización de Chipi', 'success'),
(7, 'docs/readme', 'Documentación del proyecto SuperKode', 'success'),
(8, 'feature/monitoring', 'Sistema de monitoreo con alertas chipi', 'success'),
(9, 'bugfix/database', 'Optimizar queries en ubicaciones', 'success'),
(10, 'wip/chipi-location', 'WIP: Rastreo en tiempo real de Chipi', 'pending'),
(11, 'feature/logs', 'Mejorar sistema de logs y trazabilidad', 'success'),
(12, 'hotfix/chipi-emergency', 'EMERGENCIA: Chipi desaparecido!', 'pending');

-- Insertar órdenes de café (pista clave: ¿quién estaba en la cafetera a las 02:13?)
INSERT INTO cafe_ordenes (alumno_id, bebida, leche, hora) VALUES
(1, 'flat white con avena', 'sí', '08:30'),          -- Miguel
(2, 'americano doble', 'no', '09:15'),               -- SalchiPresi
(3, 'mocca con chocolate extra', 'sí', '08:45'),    -- Marcus
(4, 'latte con almendra', 'sí', '14:00'),           -- Daniel
(5, 'chai latte', 'sí', '08:20'),                    -- Roxy
(6, 'capuccino con canela', 'sí', '16:30'),         -- Cale
(7, 'té negro', 'no', '07:00'),                      -- La Rusa
(8, 'turkish coffee', 'no', '09:45'),               -- Ramazan
(9, 'matcha latte', 'parcial', '02:13'),            -- Wizi - ¡HORA SOSPECHOSA!
(10, 'espresso frío', 'no', '15:00'),               -- Sara
(11, 'espresso frío', 'no', '08:00'),               -- Rubén
(12, 'descafeinado', 'sí', '17:30');                -- David

-- Insertar logs de Discord (fuente de pistas confusas y divertidas)
INSERT INTO discord_logs (usuario, canal, mensaje) VALUES
('root_but_intern', '#general', 'A las 02:13 Chipi desapareció. Los logs no cuadran.'),
('Cris', '#general', 'Seguro que fue el router. Siempre es el router.'),
('Andrea', '#dev', 'Yo culpo al pipeline. Algo raro pasó en el CI.'),
('Yeraldín', '#dev', 'Revisad los commits recientes. Algo no encaja.'),
('Mamá Pato', '#random', 'Yo no fui. Yo cuidaba a Chipi. *quack quack*'),
('Miguel', '#confesiones', 'Visteis a Chipi en la cafetera esta madrugada?'),
('Wizi', '#confesiones', 'Yo tomé matcha a las 02:13... solo.'),
('SalchiPresi', '#general', 'Los logs de Discord tampoco tienen coherencia a esa hora.'),
('Marcus', '#dev', 'He revisado el estado_ci de los commits. Algunos fallaron justo a las 02:00.'),
('Rubén', '#soporte', 'El sistema de ubicaciones muestra "Desconocido" desde la 02:13.'),
('root_but_intern', '#secreto', 'Si quereis recuperar a Chipi, consultad mejor que nunca. SQL es vuestra salvación.');

-- Insertar ubicaciones (el misterio de dónde está Chipi)
INSERT INTO ubicaciones (nombre, lugar, estado) VALUES
('Chipi - Inicio', 'Oficina principal de SuperKode', 'seguro'),
('Última ubicación conocida', 'Cafetera del bootcamp', 'desconocido');

-- Insertar pistas iniciales (códigos educativos para practicar SQL)
INSERT INTO pistas (dia, codigo, descripcion, desbloqueo_sql) VALUES
(1, 'P-CAF-01', 
 'Pista 1: Alguien vio a Chipi en la cafetera a las 02:13. ¿Quién tomó bebida a esa hora?',
 'SELECT a.nombre, c.bebida, c.hora FROM alumnos a JOIN cafe_ordenes c ON a.id = c.alumno_id WHERE c.hora = ''02:13'';'),
(1, 'P-COM-01',
 'Pista 2: Los commits sospechosos. ¿Cuál tiene "chipi" en el mensaje?',
 'SELECT a.nombre, c.rama, c.mensaje FROM alumnos a JOIN commits c ON a.id = c.alumno_id WHERE c.mensaje ILIKE ''%chipi%'';'),
(1, 'P-DIS-01',
 'Pista 3: Revisad los dispositivos. ¿Quién tiene la IP 192.168.1.109 a las 02:13?',
 'SELECT a.nombre, d.ip, d.tipo FROM alumnos a JOIN dispositivos d ON a.id = d.alumno_id WHERE d.ip = ''192.168.1.109'';'),
(2, 'P-LOG-01',
 'Pista 4: Los logs de Discord revelan verdades. ¿Quién confesó estar despierto?',
 'SELECT usuario, canal, mensaje FROM discord_logs WHERE canal = ''#confesiones'' ORDER BY fecha DESC;'),
(2, 'P-EQU-01',
 'Pista 5: ¿Cuántos miembros hay en cada equipo?',
 'SELECT e.nombre, COUNT(a.id) as miembros FROM equipos e LEFT JOIN alumnos a ON e.id = a.equipo_id GROUP BY e.nombre;');

-- ============================================================
-- DAY 4: Datos para la revelación final
-- ============================================================

-- Door logs (accesos a puertas entre 01:00 y 03:00 del 2025-10-19)
INSERT INTO door_logs (alumno_id, puerta, timestamp) VALUES
(9, 'Sala Servidor', '2025-10-19 01:45:00'),  -- Wizi accede antes del secuestro
(7, 'Entrada Principal', '2025-10-19 01:50:00'),
(9, 'Sala Servidor', '2025-10-19 02:10:00'),  -- Última persona antes de las 02:13
(11, 'Baño 2F', '2025-10-19 02:30:00');

-- WiFi events (conexiones entre 02:00 y 04:00)
INSERT INTO wifi_events (dispositivo_id, access_point, timestamp) VALUES
(9, 'AP-Servidor-01', '2025-10-19 02:11:00'),  -- Desktop de Wizi en Sala Servidor
(9, 'AP-Pasillo-3F', '2025-10-19 02:45:00'),   -- Después del secuestro, se mueve
(1, 'AP-Aula-Main', '2025-10-19 02:20:00'),
(11, 'AP-Baño-2F', '2025-10-19 02:31:00');

-- Pista dia 3 (solo accesible para el culpable, motivo del secuestro)
INSERT INTO pistas (dia, codigo, descripcion, desbloqueo_sql) VALUES
(3, 'P-MOTIVO-01',
 'Wizi confesó: "Chipi mordió mi cable Ethernet favorito. Ahora pagará con WiFi lento."',
 'SELECT descripcion FROM pistas WHERE dia = 3 AND codigo = ''P-MOTIVO-01'';'),
(3, 'P-CODIGO-RESCATE',
 'Código de rescate final: CH0213',
 'SELECT descripcion FROM pistas WHERE dia = 3 AND codigo = ''P-CODIGO-RESCATE'';');

-- Ubicación final de Chipi (Pasillo 3F es donde Wizi lo dejó)
INSERT INTO ubicaciones (nombre, lugar, estado) VALUES
('Pasillo 3er Piso', 'Edificio SuperKode - Piso 3', 'peligro')
ON CONFLICT DO NOTHING;

-- ============================================================
-- sql-chipi-case: Esquema de Base de Datos
-- Proyecto educativo para enseñar SQL con una narrativa
-- La mascota Chipi 🐼 ha sido secuestrada en SuperKode!
-- ============================================================

-- Tabla de equipos del bootcamp
CREATE TABLE equipos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL UNIQUE,
    descripcion TEXT,
    CONSTRAINT check_nombre_no_vacio CHECK (LENGTH(nombre) > 0)
);

-- Tabla de alumnos (el alumnado de SuperKode)
CREATE TABLE alumnos (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    equipo_id INTEGER NOT NULL REFERENCES equipos(id),
    turno TEXT NOT NULL CHECK (turno IN ('mañana', 'tarde')),
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de dispositivos (laptops, desktops, etc.)
CREATE TABLE dispositivos (
    id SERIAL PRIMARY KEY,
    tipo TEXT NOT NULL CHECK (tipo IN ('laptop', 'desktop', 'tablet', 'phone')),
    ip INET NOT NULL UNIQUE,
    alumno_id INTEGER NOT NULL REFERENCES alumnos(id) ON DELETE CASCADE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de commits (trabajo en el repositorio)
CREATE TABLE commits (
    id SERIAL PRIMARY KEY,
    alumno_id INTEGER NOT NULL REFERENCES alumnos(id) ON DELETE CASCADE,
    rama TEXT NOT NULL,
    mensaje TEXT NOT NULL,
    estado_ci TEXT CHECK (estado_ci IN ('success', 'failed', 'pending')),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de órdenes de café (pista importante: ¿quién estaba en la cafetera a las 02:13?)
CREATE TABLE cafe_ordenes (
    id SERIAL PRIMARY KEY,
    alumno_id INTEGER NOT NULL REFERENCES alumnos(id) ON DELETE CASCADE,
    bebida TEXT NOT NULL,
    leche TEXT CHECK (leche IN ('sí', 'no', 'parcial')),
    hora TIME NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de logs de Discord (fuente de pistas y sospecha)
CREATE TABLE discord_logs (
    id SERIAL PRIMARY KEY,
    usuario TEXT NOT NULL,
    canal TEXT NOT NULL,
    mensaje TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de ubicaciones (¿dónde está Chipi?)
CREATE TABLE ubicaciones (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    lugar TEXT NOT NULL,
    estado TEXT NOT NULL CHECK (estado IN ('seguro', 'peligro', 'desconocido')),
    ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de pistas (los retos para resolver el caso)
CREATE TABLE pistas (
    id SERIAL PRIMARY KEY,
    dia INTEGER NOT NULL,
    codigo TEXT NOT NULL UNIQUE,
    descripcion TEXT NOT NULL,
    desbloqueo_sql TEXT NOT NULL,
    resuelta BOOLEAN DEFAULT FALSE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Índices para mejorar búsquedas
CREATE INDEX idx_alumnos_equipo ON alumnos(equipo_id);
-- ============================================================
-- DAY 4: Tablas adicionales para la revelación final
-- ============================================================

-- Registros de acceso por puertas RFID
CREATE TABLE door_logs (
    id SERIAL PRIMARY KEY,
    alumno_id INTEGER NOT NULL REFERENCES alumnos(id),
    puerta TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL
);

-- Eventos de conexión WiFi
CREATE TABLE wifi_events (
    id SERIAL PRIMARY KEY,
    dispositivo_id INTEGER NOT NULL REFERENCES dispositivos(id),
    access_point TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL
);

-- Tabla para registrar el rescate de Chipi
CREATE TABLE rescate (
    id SERIAL PRIMARY KEY,
    ubicacion_nueva TEXT NOT NULL,
    timestamp_rescate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rescatado_por TEXT
);

CREATE INDEX idx_commits_alumno ON commits(alumno_id);
CREATE INDEX idx_cafe_alumno ON cafe_ordenes(alumno_id);
CREATE INDEX idx_dispositivos_alumno ON dispositivos(alumno_id);
CREATE INDEX idx_discord_fecha ON discord_logs(fecha);
CREATE INDEX idx_discord_canal ON discord_logs(canal);

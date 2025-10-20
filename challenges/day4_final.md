# 🎯 Día 4: REVELACIÓN FINAL

**Objetivo:** Resolver el misterio del secuestro de Chipi combinando todas las pistas.

---

## 📖 Contexto

Has dominado SELECT, JOINs, GROUP BY, CTEs y Window Functions. Ahora es momento de usar todas tus habilidades para responder las preguntas definitivas:

- **¿Quién secuestró a Chipi?** (nombre del sospechoso)
- **¿Por qué lo hizo?** (motivo del secuestro)
- **¿Dónde está Chipi ahora?** (ubicación final)
- **¿Cuál es el código de rescate?** (para liberarlo)

---

## 🔍 Tablas Nuevas Disponibles

### `door_logs`
Registros de acceso por puertas con tarjeta RFID:
```sql
id | alumno_id | puerta | timestamp
```

### `wifi_events`
Eventos de conexión WiFi por dispositivo:
```sql
id | dispositivo_id | access_point | timestamp
```

### `rescate`
Tabla que se actualizará cuando Chipi sea liberado:
```sql
id | ubicacion_nueva | timestamp_rescate | rescatado_por
```

---

## 🎯 Reto Final

### **Vista Requerida: `solve_d4_reveal`**

Debe devolver **exactamente 1 fila** con 4 columnas:

| sospechoso | motivo | ubicacion_final | codigo_rescate |
|------------|--------|-----------------|----------------|
| (nombre)   | (texto)| (texto)         | (6 caracteres) |

**Pistas:**

1. **Sospechoso:** Cruza `door_logs` (última persona en acceder a "Sala Servidor" antes de las 02:13) con `discord_logs` (quien mencionó "chipi" en #confesiones).

2. **Motivo:** En `pistas` hay un mensaje cifrado que solo el sospechoso dejó. Búscalo filtrando por `nivel = 3`.

3. **Ubicación Final:** Combina `wifi_events` (último access_point activo después de las 02:13) con `ubicaciones` (descripcion del lugar).

4. **Código de Rescate:** Concatena las primeras letras de:
   - Nombre del sospechoso
   - Turno del sospechoso (UPPER)
   - ID del equipo (como texto)
   - Hora del último commit (HH format)
   
   Ejemplo: Si el sospechoso es "Wizi", turno "noche", equipo_id 1, última commit a las 23:00:
   ```sql
   'W' || UPPER(SUBSTRING('noche', 1, 1)) || '1' || '23' = 'WN123'
   ```

---

## 🔓 Desbloquear a Chipi

Una vez que tu vista `solve_d4_reveal` esté correcta:

```sql
SELECT unlock_chipi(codigo_rescate) FROM solve_d4_reveal;
```

Si el código es correcto, verás:
```
🎉 ¡CHIPI HA SIDO RESCATADO! 🐾
```

**Automatización (Python):**
```bash
python final/reveal.py
```

---

## 📦 Entregables

- Vista `solve_d4_reveal` con las 4 columnas correctas
- Código de rescate válido (6 caracteres)
- Llamada exitosa a `unlock_chipi()`

---

*El router nunca fue el culpable. Mamá Pato sabía la verdad. Solo SQL puede revelarla.*

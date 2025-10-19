# 🐼 sql-chipi-case: Retos del Día 1 - SELECT Basics

## 📖 Contexto
Chipi desapareció a las **02:13** del 19 de octubre. Los formadores (Cris, Andrea, Yeraldín y Mamá Pato 🦆) señalan al router, al pipeline, al CI... pero alguien miente.

Tu misión: **usa SQL para descubrir quién secuestró a Chipi.**

---

## 🎯 Reto 1: Lista todos los alumnos con su equipo y turno
**Dificultad:** ⭐ Básico (SELECT + JOIN)

Muestra el nombre, equipo y turno de todos los alumnos del bootcamp SuperKode.

```sql
-- Escribe tu solución aquí
SELECT 
  a.nombre, 
  e.nombre as equipo, 
  a.turno 
FROM alumnos a 
JOIN equipos e ON a.equipo_id = e.id 
ORDER BY e.nombre, a.nombre;
```

**Expected output:**
```
      nombre      |    equipo     | turno
-----------------+---------------+-------
 Miguel           | SuperKode A   | mañana
 Marcus          | SuperKode A   | mañana
 SalchiPresi     | SuperKode A   | tarde
 ...
```

---

## 🎯 Reto 2: Encuentra commits que contengan "chipi"
**Dificultad:** ⭐⭐ Intermedio (WHERE + ILIKE)

¿Quién ha estado trabajando con "Chipi" en sus commits? Esto podría ser una pista.

```sql
-- Escribe tu solución aquí
SELECT 
  a.nombre, 
  c.rama, 
  c.mensaje, 
  c.estado_ci, 
  c.fecha 
FROM alumnos a 
JOIN commits c ON a.id = c.alumno_id 
WHERE c.mensaje ILIKE '%chipi%' 
ORDER BY c.fecha DESC;
```

**Expected output:**
```
 nombre  |           rama           |                    mensaje                     | estado_ci |           fecha
---------+--------------------------+------------------------------------------------+-----------+---------------------------
 Miguel   | feature/auth             | Implementar JWT con chipi_secret               | success   | 2025-10-19 10:30:00
 David    | hotfix/chipi-emergency   | EMERGENCIA: Chipi desaparecido!                | pending   | 2025-10-19 02:15:00
 ...
```

---

## 🎯 Reto 3: ¿Quién tomó café a las 02:13? 🚨
**Dificultad:** ⭐⭐ Intermedio (WHERE + TIME)

**Pista crítica:** Alguien estaba en la cafetera exactamente cuando Chipi desapareció.

```sql
-- Escribe tu solución aquí
SELECT 
  a.nombre, 
  c.bebida, 
  c.leche, 
  c.hora 
FROM alumnos a 
JOIN cafe_ordenes c ON a.id = c.alumno_id 
WHERE c.hora = '02:13';
```

**Expected output:**
```
 nombre |    bebida    | leche | hora
--------+--------------+-------+-------
 Wizi   | matcha latte | no    | 02:13
```

💡 **Nota:** Wizi estaba en la cafetera a la hora del crimen... coincidencia? Quizás solo tomaba matcha...

---

## 🎯 Reto 4: Últimas pistas sobre Chipi en Discord
**Dificultad:** ⭐⭐⭐ Avanzado (WHERE + ORDER BY + LIMIT)

Revisa los canales #confesiones y #general. Las formadores y los alumnos han dejado pistas.

```sql
-- Escribe tu solución aquí
SELECT 
  usuario, 
  canal, 
  mensaje, 
  fecha 
FROM discord_logs 
WHERE canal IN ('#general', '#confesiones', '#secreto') 
ORDER BY fecha DESC 
LIMIT 10;
```

**Expected output:**
```
     usuario      |   canal    |                        mensaje                         |           fecha
------------------+------------+--------------------------------------------------------+---------------------------
 root_but_intern  | #secreto   | Si quereis recuperar a Chipi, consultad mejor que nunca| 2025-10-19 02:30:00
 SalchiPresi      | #general   | Los logs de Discord tampoco tienen coherencia a esa ho| 2025-10-19 02:25:00
 ...
```

---

## ⭐ BONUS CHALLENGE: ¿Quién miente? 🔍
**Dificultad:** ⭐⭐⭐⭐ Experto (JOINs múltiples + GROUP BY + HAVING)

Encuentra a los alumnos que:
1. Tomaron café en turno de noche (Wizi, Sara, David) 
2. Tuvieron commits fallidos
3. Y estaban en turno "noche" o "tarde" a las 02:13

```sql
-- Escribe tu solución aquí
SELECT 
  a.nombre, 
  a.turno, 
  COUNT(c.id) as commits_fallidos, 
  STRING_AGG(ca.bebida, ', ') as bebidas 
FROM alumnos a 
LEFT JOIN commits c ON a.id = c.alumno_id AND c.estado_ci = 'failed' 
LEFT JOIN cafe_ordenes ca ON a.id = ca.alumno_id 
WHERE a.turno IN ('noche', 'tarde') 
GROUP BY a.id, a.nombre, a.turno 
HAVING COUNT(c.id) > 0 
ORDER BY commits_fallidos DESC;
```

---

## 🏁 ¿Qué has aprendido?

✅ **SELECT** para elegir columnas  
✅ **JOIN** para conectar tablas  
✅ **WHERE** para filtrar datos  
✅ **ORDER BY** para ordenar resultados  
✅ **ILIKE** para búsquedas insensibles a mayúsculas  
✅ **LIMIT** para limitar filas  
✅ **GROUP BY** y **HAVING** para análisis de datos  

---

## 🔮 Próximos pasos
- **Día 2:** Subqueries y CTEs (Common Table Expressions)
- **Día 3:** Window Functions y análisis avanzado
- **Día 4:** Descubre al culpable definitivo con todos los datos 🕵️

---

*Nota: Mamá Pato 🦆 sigue negando todo. Cris sigue culpando al router.*

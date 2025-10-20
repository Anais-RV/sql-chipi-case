#!/usr/bin/env python3
"""
sql-chipi-case: Script de revelación automática
Conecta a la BD, lee solve_d4_reveal, llama unlock_chipi()
"""

import sys

try:
    from psycopg import connect
except ImportError:
    print("❌ Error: psycopg (psycopg3) no está instalado.")
    print("📦 Instala con: pip install psycopg")
    sys.exit(1)

# Configuración
DB_CONFIG = {
    "dbname": "chipi_case",
    "user": "postgres",
    "password": "postgres",  # ⚠️ Cambiar según tu configuración
    "host": "localhost",
    "port": 5432
}

ASCII_CHIPI = r"""
    |\---/|
    | o_o |
     \_^_/   ¡CHIPI ESTÁ A SALVO!
"""

def main():
    try:
        print("🔌 Conectando a chipi_case...")
        with connect(**DB_CONFIG) as conn:
            with conn.cursor() as cur:
                # Leer vista solve_d4_reveal
                cur.execute("SELECT sospechoso, motivo, ubicacion_final, codigo_rescate FROM solve_d4_reveal;")
                row = cur.fetchone()
                
                if not row:
                    print("❌ La vista solve_d4_reveal está vacía o no existe.")
                    sys.exit(1)
                
                sospechoso, motivo, ubicacion, codigo = row
                
                # Mostrar resultados
                print("\n" + "="*60)
                print("🕵️ REVELACIÓN FINAL")
                print("="*60)
                print(f"Sospechoso:      {sospechoso}")
                print(f"Motivo:          {motivo}")
                print(f"Ubicación Final: {ubicacion}")
                print(f"Código Rescate:  {codigo}")
                print("="*60)
                
                # Intentar desbloquear
                print("\n🔓 Intentando desbloquear a Chipi...\n")
                cur.execute("SELECT unlock_chipi(%s);", (codigo,))
                resultado = cur.fetchone()[0]
                
                conn.commit()
                
                print(resultado)
                print(ASCII_CHIPI)
                
    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

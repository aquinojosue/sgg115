import csv
import json
from grass.pygrass.vector import VectorTopo
from grass.pygrass.vector.geometry import Point

csv_path = '/home/jaquino/sgg115/csv/gimnasios_sv.csv'
# Primero que nada cargamos los datos, si no cargan pos no se sigue xd
with open(csv_path, 'r') as data:
    # Creamos la definicion de columnas
    cols = [(u'cat',   'INTEGER PRIMARY KEY'),
            (u'nombre_gym',  'VARCHAR'),
            (u'depto', 'VARCHAR'),
            (u'telefono_gym', 'VARCHAR')]
    # Iniciamos un nuevo mapa vectorial
    vector_puntos = VectorTopo('gimnasios_script')
    # Importante! si se pone true a overwrite sera para hacer una nueva tabla, pero false para agregar datos.
    vector_puntos.open('w', tab_cols=cols, overwrite=False)

    for gimnasio in csv.DictReader(data):
        point = Point(float(gimnasio['lon']),float(gimnasio['lat']))
        vector_puntos.write(
            point, 
            (gimnasio['nombre_gym'],gimnasio['depto'],gimnasio['telefono_gym'],)
        )
    # Guardamos los datos, sobretodo porque grass por defecto usa una base de datos sqlite
    vector_puntos.table.conn.commit()
    # Cerramos el acceso al vector
    vector_puntos.close()
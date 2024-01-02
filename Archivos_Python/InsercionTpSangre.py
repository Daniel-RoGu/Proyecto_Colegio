#!/usr/bin/env python
# coding: utf-8

# In[7]:


import json
import mysql.connector

def llamar_procedimiento(datos):
    try:
        config = {
            'user': 'root',
            'password': 'dani1998',
            'host': 'localhost',
            'database': 'bd_colegio',
            'raise_on_warnings': True
        }

        conexion = mysql.connector.connect(**config)
        print("¡Conexión exitosa!")

        cursor = conexion.cursor()

        for tipo_sangre in datos:
            grupo = tipo_sangre

            # Llamada al procedimiento con cada tipo de sangre
            parametros = (grupo,)
            cursor.callproc('registrarTipoSangre', parametros)
            conexion.commit()  # Confirmar los cambios en la base de datos

        print("Procedimiento almacenado llamado con éxito para todos los datos")

        cursor.close()
        conexion.close()

    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Lectura del archivo JSON
with open('C:\\Users\\Daniel\\Desktop\\Trabajo_Colegio\\TipoDeSangre.json') as file:
    data = json.load(file)

# Llamada a la función con los datos del JSON
llamar_procedimiento(data['tipos_de_sangre'])


# In[ ]:





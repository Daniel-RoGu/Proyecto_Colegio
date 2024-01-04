import json
#import mysql.connector
#import simplejson as json

grupo = []

def ObetenerDatos(datos):
    for puntaje_sisben in datos:
        grupo.append(puntaje_sisben)

def resultado():
    ObetenerDatos(data['puntaje_sisben'])
    return grupo;

# Lectura del archivo JSON
with open('~\\Archivos_Json\\PuntajeSisben.json', encoding='utf-8') as file:
    data = json.load(file)

# Llamada a la función con los datos del JSON
resultado()






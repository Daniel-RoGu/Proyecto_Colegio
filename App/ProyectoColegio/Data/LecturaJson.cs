using System;
using System.IO;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ProyectoColegio.Data
{
    public class LecturaJson
    {
        private List<string> grupo = new List<string>();

        /*
        public List<string> Resultado()
        {
            // Abrir el archivo JSON
            StreamReader reader = new StreamReader("Archivos_Json/PuntajeSisben.json");

            // Convertir el archivo JSON a un objeto
            string datos =reader.ReadToEnd();

            // Convertir el string a una lista
            grupo = datos.Split(',').ToList();
            Console.WriteLine(grupo.Count);

            // Imprimir la lista
            foreach (string dato in grupo)
            {
                Console.WriteLine(dato);
            }

            // Cerrar el archivo JSON
            reader.Close();
            return grupo;
        }
        */

        public List<string> Resultado()
        {
            // Abrir el archivo JSON
            StreamReader reader = new StreamReader("Archivos_Json/PuntajeSisben.json");

            // Convertir el archivo JSON a un objeto JObject
            JObject objecto = JToken.Parse(reader.ToString()).ToObject<JObject>();

            // Obtener el valor del objeto "puntaje_sisben"
            JArray puntaje_sisben = (JArray)objecto["puntaje_sisben"];

            // Convertir el objeto JArray a una lista de string
            List<string> lista = puntaje_sisben.Select(x => x.ToString()).ToList();

            // Cerrar el archivo JSON
            reader.Close();

            return lista;
        }

    }


}

using System;
using System.IO;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;

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

            try
            {
                // Leer el contenido del archivo JSON
                string jsonContent = File.ReadAllText("Archivos_Json/PuntajeSisben.json");

                // Deserializar el JSON en un objeto PuntajeSisben
                PuntajeSisben puntajeSisben = JsonConvert.DeserializeObject<PuntajeSisben>(jsonContent);

                // Verificar si se obtuvo un objeto válido
                if (puntajeSisben != null && puntajeSisben.Puntaje_Sisben != null)
                {
                    // Llenar la lista 'grupo' con los atributos del objeto 'puntaje_sisben'
                    grupo = puntajeSisben.Puntaje_Sisben;

                    // Imprimir la lista
                    Console.WriteLine(grupo.Count);
                    foreach (string dato in grupo)
                    {
                        Console.WriteLine(dato);
                    }
                }
                else
                {
                    Console.WriteLine("El archivo JSON no tiene el formato esperado.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al procesar el archivo JSON: {ex.Message}");
            }

            return grupo;
        }

        public class PuntajeSisben
        {
            public List<string> Puntaje_Sisben { get; set; }
        }

    }

}

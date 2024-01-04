using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;
using System;
using Microsoft.Scripting.Hosting;
using static IronPython.Modules._ast;
using System.IO;
using Newtonsoft.Json;
using NuGet.ProjectModel;

namespace ProyectoColegio.Controllers
{
    public class SisbenController : Controller
    {
        private readonly Contexto _contexto;
        List<string> datos = null;
        

        public SisbenController(Contexto contexto)
        {
            _contexto = contexto;
        }

        [STAThread]
        public void LeerSisben()
        {

            // Crear el motor y el alcance
            ScriptEngine engine = IronPython.Hosting.Python.CreateEngine();
            ScriptRuntime runtime = engine.Runtime;
            ScriptScope scope = runtime.CreateScope();

            // Ejecutar el script y obtener el resultado
            ScriptSource script = engine.CreateScriptSourceFromFile("InsercionSisben.py");
            try
            {
                datos = script.Execute<List<string>>(scope);

                // Verificar si hay un resultado y mostrarlo
                if (datos != null)
                {
                    Console.WriteLine($"Resultado del script: {string.Join(", ", datos)}");
                }
                else
                {
                    Console.WriteLine("Conexion al script fallida");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
            finally
            {
                // Cerrar el motor
                runtime.Shutdown();
            }

        }
        /*
        [HttpPost]
        public IActionResult RegistrarSisben()
        {

            foreach (string dato in datos)
            {
                using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                {
                    conexion.Open();
                    MySqlCommand Command = new MySqlCommand("registrarSisben", conexion);
                    Command.CommandType = System.Data.CommandType.StoredProcedure;
                    Command.Parameters.AddWithValue("nomSisben", dato);
                    Command.ExecuteNonQuery();
                }
            }

            //return RedirectToAction("Mostrar");

            return View();
        }
        */

       
        public IActionResult RegistrarSisben()
        { 
            return View();
        }


        [HttpPost]
        public IActionResult RegistrarSisben(Sisben sisben)
        {
            // Crear el motor y el alcance
            ScriptEngine engine = IronPython.Hosting.Python.CreateEngine();
            ScriptRuntime runtime = engine.Runtime;
            ScriptScope scope = runtime.CreateScope();

            // Ejecutar el script y obtener el resultado
            ScriptSource script = engine.CreateScriptSourceFromFile("InsercionSisben.py");
            string datosJson = script.Execute<string>(scope);

            // Convertir el JSON de vuelta a una lista de strings
            List<string> datos = JsonConvert.DeserializeObject<List<string>>(datosJson);
            TempData["MensajeConsola"] = "Paso los datos";

            foreach (string dato in datos)
            {
                using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                {
                    conexion.Open();
                    MySqlCommand Command = new MySqlCommand("registrarSisben", conexion);
                    Command.CommandType = System.Data.CommandType.StoredProcedure;
                    Command.Parameters.AddWithValue("nomSisben", dato);
                    Command.ExecuteNonQuery();
                }
            }

            return RedirectToAction("Index", "Home");
        }


    }

}

using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;
using System;
using Microsoft.Scripting.Hosting;

namespace ProyectoColegio.Controllers
{
    public class SisbenController : Controller
    {
        private readonly Contexto _contexto;

        public SisbenController(Contexto contexto)
        {
            _contexto = contexto;
        }

        /*
        [STAThread]
        public void RegistroSisben()
        {
            List<string> datos;
            //string pathPy = "~/Archivos_Python/InsercionSisben.py";

            ScriptEngine engine = IronPython.Hosting.Python.CreateEngine();
            ScriptRuntime runtime = engine.Runtime;
            ScriptScope scope = runtime.CreateScope();
            ScriptSource script = engine.CreateScriptSourceFromFile("~/Archivos_Python/InsercionSisben.py");
            var compiled = script.Compile();
            compiled.Execute(scope);
            runtime.Shutdown();


            //ScriptRuntime py = Python.CreateRuntime();
            //dynamic pyProgram = py.UseFile(pathPy);
            //pyProgram.resultado();

            //return View();
        }*/

        [STAThread]
        public void RegistroSisben()
        {
            List<string> datos;

            // Crear el motor y el alcance
            ScriptEngine engine = IronPython.Hosting.Python.CreateEngine();
            ScriptRuntime runtime = engine.Runtime;
            ScriptScope scope = runtime.CreateScope();

            // Ejecutar el script y obtener el resultado
            ScriptSource script = engine.CreateScriptSourceFromFile("~/Archivos_Python/InsercionSisben.py");
            var compiled = script.Compile();
            object result = compiled.Execute(scope);

            // Utilizar un try-catch para manejar posibles excepciones
            try
            {
                datos = script.Execute(scope);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }

            /*
            // Verificar si hay un resultado y mostrarlo
            if (datos != null)
            {
                Console.WriteLine($"Resultado del script: {datos}");
            }*/

            // Cerrar el motor
            runtime.Shutdown();
        }

    }
}

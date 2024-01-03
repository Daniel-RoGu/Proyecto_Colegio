using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;
using System;
using System.IO;
using IronPython;
using Microsoft.Scripting.Hosting;
using System.Reflection;

namespace ProyectoColegio.Controllers
{
    public class SisbenController : Controller
    {
        private readonly Contexto _contexto;

        public SisbenController(Contexto contexto)
        {
            _contexto = contexto;
        }

        
        public void RegistroSisben()
        {
            List<string> datos;
            string pathPy = "~/Archivos_Python/InsercionSisben.py";

            // Añadir la referencia a la biblioteca IronPython
            var assembly = Assembly.Load("IronPython.dll");

            // Importar la biblioteca IronPython
            using (var scope = new ScriptScope(assembly))
            {
                // Crear un objeto ScriptEngine
                var engine = new ScriptEngine(scope);

                // Cargar el script .py
                var script = File.ReadAllText(pathPy);
                engine.Execute(script);

                // Llama la función 
                datos = engine.Invoke("resultado");
            }


            //return View();
        }
       
    }
}

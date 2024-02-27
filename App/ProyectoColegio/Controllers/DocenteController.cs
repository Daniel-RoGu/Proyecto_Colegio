using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class DocenteController : Controller
    {
        private readonly Contexto _contexto;
        //ManejoProcedimientos manejoProcedimientos = new ManejoProcedimientos();
        ConsultasValidacionesBD consultasValidacionesBD = new ConsultasValidacionesBD();
        VariablesGlobales variablesGlobales = new VariablesGlobales();
        ConsultasGlobales consultasGlobales = new ConsultasGlobales();

        public DocenteController(Contexto contexto)
        {
            _contexto = contexto;
        }

        //[HttpPost]
        public IActionResult Principal()
        {
            //trae los datos del usuario logeado
            var identificacion = TempData["identificacion"];
            ViewBag.idetificacionUs = identificacion;
            var rol = TempData["rol"];
            ViewBag.rol = rol;

            ViewBag.ListaEstudiante = consultasGlobales.mostrarCsv(_contexto.Conexion, null);

            var grupo = TempData["grupo"];
            if (grupo != null)
            {
                ViewBag.ListaEstudianteGrupo = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(grupo));
                Console.WriteLine(grupo);
            }            

            //muestra info de asignaturas y grupos por grado desde bd
            ViewBag.Asignaturas = variablesGlobales.Asignaturas(_contexto.Conexion);
            ViewBag.GruposGrado = variablesGlobales.GruposGrado(_contexto.Conexion);

            return View();
        }

        [HttpPost]
        public IActionResult Principal(string Grupo)
        {
            //if (!string.IsNullOrEmpty(Grupo))
            //{

            //    //ViewBag.grupo = grupoSeleccionado;
            //    TempData["grupo"] = Grupo;

            //}
            return RedirectToAction("Principal", "Docente");
        }

        [HttpPost]
        public IActionResult obtenerGrupoSeleccionado(string Grupos)
        {
            if (!string.IsNullOrEmpty(Grupos))
            {
                //ViewBag.grupo = grupoSeleccionado;
                TempData["grupo"] = Grupos;
            }

            return RedirectToAction("Principal", "Docente");
        }

        //public void mostrarEstudiantesGrupo()
        //{
        //    var grupo = TempData["grupo"];
        //    if (grupo != null)
        //    {
        //        ViewBag.ListaEstudianteGrupo = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(grupo));
        //    }         
        //}

    }
}

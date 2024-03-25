using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;
using System.Web.Helpers;

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

        public JsonResult ListarDocenteAsignaturas(int grado)
        {
            var DocentesAsignatura = variablesGlobales.DocenteAsignaturas(DatosCompartidos.SedeUsuario, grado, Convert.ToInt64(DatosCompartidos.MiDato), _contexto.Conexion);
            List<object> docentes = new List<object>();

            foreach (var item in DocentesAsignatura)
            {
                docentes.Add(item);
            }

            return Json(docentes);
        }

        public JsonResult ListarEstudiantesSedeGrupo(string grupo, string identificacion)
        {
            List<object> estudiantes = new List<object>();
            List<Usuario> usuarios = new List<Usuario>();
            Usuario usuario = new Usuario();


            if (DatosCompartidos.SedeUsuario != null)
            {

                if (grupo != "null")
                {
                    estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(DatosCompartidos.SedeUsuario), Convert.ToString(grupo));
                }
                else
                {
                    estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(DatosCompartidos.SedeUsuario), null);
                }

            }
            else
            {
                estudiantes = consultasGlobales.mostrarCsv(_contexto.Conexion, null, null);
            }

            //organiza los resultados
            foreach (List<string> item in estudiantes)
            {
                usuario = new Usuario();
                usuario.Identificacion = (Convert.ToInt64(item[0]));
                usuario.NombreUsuario = Convert.ToString(item[1]) + ' ' + Convert.ToString(item[2]) + ' ' + Convert.ToString(item[3]) + ' ' + Convert.ToString(item[4]);
                usuario.SegundoNombreUsuario = Convert.ToString(item[2]);
                usuario.ApellidoUsuario = Convert.ToString(item[3]);
                usuario.SegundoApellidoUsuario = Convert.ToString(item[4]);
                usuario.Edad = Convert.ToInt16(item[5]);
                usuario.TelefonoCelular = Convert.ToString(item[6]);
                usuario.TelefonoFijo = Convert.ToString(item[7]);
                usuario.Correo = Convert.ToString(item[8]);
                usuario.Direccion = Convert.ToString(item[9]);
                usuario.Barrio = Convert.ToString(item[10]);
                usuario.FechaNacimiento = Convert.ToString(item[11]);
                usuario.TipoSangre = Convert.ToString(item[12]);
                usuario.TipoDocumento = Convert.ToString(item[13]);
                usuario.Discapacidad = Convert.ToString(item[14]);
                usuario.Sisben = Convert.ToString(item[15]);
                usuario.Genero = Convert.ToString(item[16]);
                usuario.EPS = Convert.ToString(item[17]);
                usuario.Estrato = Convert.ToString(item[18]);
                usuario.codigoEstudiante = Convert.ToString(item[19]);
                usuario.Grado = Convert.ToString(item[20]);
                usuario.Grupo = Convert.ToString(item[21]);
                usuarios.Add(usuario);

                if (identificacion != "null" && identificacion == item[0])
                {
                    usuarios = new List<Usuario>();
                    usuarios.Add(usuario);
                    Console.WriteLine(usuario);
                    return Json(usuarios);
                }
            }

            return Json(usuarios);
        }

        //[HttpPost]
        public IActionResult Index() { 

            return View();
        
        
        }


        public string GuardarDocente(DocenteInfo docente) {


            return "";  
        
        }       

        public IActionResult Principal()
        {
            //trae los datos del usuario logeado
            var identificacion = TempData["identificacion"];
            ViewBag.idetificacionUs = identificacion;
            var rol = TempData["rol"];
            ViewBag.rol = rol;
            var habilitarCargueNotaFinal = TempData["habilitarCargueNotaFinal"];
            ViewBag.HabilitacionNotaFinal = habilitarCargueNotaFinal;

            var sede = TempData["sede"];
            var grupo = TempData["grupo"];

            if (sede != null && grupo != null)
            {
                ViewBag.ListaEstudianteGrupo = consultasGlobales.mostrarCsv(_contexto.Conexion, Convert.ToString(sede), Convert.ToString(grupo));
                ViewBag.GrupoSeleccionado = grupo;
            }

            //muestra info de asignaturas y grupos por grado desde bd
            ViewBag.Asignaturas = variablesGlobales.Asignaturas(_contexto.Conexion);
            ViewBag.GruposGrado = variablesGlobales.GruposGrado(_contexto.Conexion);

            return View();
        }

        [HttpPost]
        public IActionResult Principal(string Grupo)
        {
            return RedirectToAction("Principal", "Docente");
        }        

        [HttpPost]
        public IActionResult obtenerGrupoSeleccionado(string Grupos)
        {
            string identificacion = DatosCompartidos.MiDato;
            string Sede = ObtenerSedeDocente(identificacion);

            if (!string.IsNullOrEmpty(Grupos) && !string.IsNullOrEmpty(Sede))
            {
                //ViewBag.grupo = grupoSeleccionado;
                TempData["grupo"] = Grupos;
                TempData["sede"] = Sede;
            }

            return RedirectToAction("Principal", "Docente");
        }

        public string ObtenerSedeDocente(string identificacion)
        {
            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                // Definir aqui atributos y tipos esperados
                { "Sede", typeof(string) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "obtenerSedeDocente";
            string nombreParametro = "identificacion";

            // Llamar al método
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, identificacion, numeroAtributos, _contexto.Conexion);
            string sede = "";
            foreach (var item in resultados)
            {
                sede = Convert.ToString(item);
            }
            
            return sede;
        }

        [HttpPost]
        public void GestionNotasAsistencia(string asignatura, string nota, string nFallas)
        {
            if (asignatura != null)
            {
                TempData["Asignatura"] = asignatura;
                
                if (nota != null)
                {
                    TempData["Nota"] = nota;
                }
                if (nFallas != null)
                {
                    TempData["NumeroFallas"] = nFallas;
                }
            }           
            
        }

        public void registrarNotaEstudiante()
        {
            string asignatura = Convert.ToString(TempData["Asignatura"]);
            string nota = Convert.ToString(TempData["Nota"]);

            //llamar metodo de registro en bd

        }

        public void registrarAsistenciasEstudiante()
        {
            string asignatura = Convert.ToString(TempData["Asignatura"]);
            string nFallas = Convert.ToString(TempData["NumeroFallas"]);

            //llamar metodo de registro en bd

        }

    }
}

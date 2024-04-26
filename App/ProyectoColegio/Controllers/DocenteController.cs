using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;
using System.Web.Helpers;
<<<<<<< Updated upstream
=======
using static IronPython.Modules._ast;
using static iText.Layout.Borders.Border;
using System.Linq;
using static IronPython.Modules.PythonIterTools;
>>>>>>> Stashed changes

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

        public IActionResult controlHabilitacionCargueNotaPeriodo(bool habilitarCargueNotaFinal)
        {
            if (habilitarCargueNotaFinal!=null)
            {
                TempData["habilitarCargueNotaFinal"] = habilitarCargueNotaFinal;
            }

            return RedirectToAction("Inicio", "Login");
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
<<<<<<< Updated upstream
                TempData["Asignatura"] = asignatura;
=======
                if (Convert.ToString(item[2]) != "Sin registro")
                {
                    string dato = Convert.ToString(item[2]);
                    decimal numero = decimal.Parse(dato, CultureInfo.InvariantCulture);
                    count++;
                    EstudianteEvaluado estudiante = new EstudianteEvaluado();
                    estudiante.Numero = count;
                    estudiante.Identificador = Convert.ToInt32(item[1]);
                    estudiante.Nota = Convert.ToSingle(numero);
                    estudiantesEvaluados.Add(estudiante);
                }
            }

            // Ordenar la lista de estudiantes por la nota de mayor a menor
            estudiantesEvaluados = estudiantesEvaluados.OrderByDescending(e => e.Nota).ToList();
            count = 0;

            foreach (EstudianteEvaluado item in estudiantesEvaluados)
            {                  
                    count++;
                    EstudianteEvaluado estudiante = new EstudianteEvaluado();
                    estudiante.Numero = count;
                    estudiante.Identificador = item.Identificador;
                    estudiante.Nota = item.Nota;
                    estudiantesOrdenados.Add(estudiante);
            }

            return Json(estudiantesOrdenados);
        }

        public List<EstudianteEvaluado> GestionNotasAsistenciaRetorno(string grupoRef, string asignaturaRef, string periodoRef)
        {
            List<object> estudiantes = ObtenerRegistroNotasEstudiantes(grupoRef, asignaturaRef, periodoRef);
            List<EstudianteEvaluado> estudiantesEvaluados = new List<EstudianteEvaluado>();
            List<EstudianteEvaluado> estudiantesOrdenados = new List<EstudianteEvaluado>();
            int count = 0;

            foreach (List<object> item in estudiantes)
            {
                if (Convert.ToString(item[2]) != "Sin registro")
                {
                    string dato = Convert.ToString(item[2]);
                    decimal numero = decimal.Parse(dato, CultureInfo.InvariantCulture);
                    count++;
                    EstudianteEvaluado estudiante = new EstudianteEvaluado();
                    estudiante.Numero = count;
                    estudiante.Identificador = Convert.ToInt32(item[1]);
                    estudiante.Nota = Convert.ToSingle(numero);
                    estudiantesEvaluados.Add(estudiante);
                }
            }

            // Ordenar la lista de estudiantes por la nota de mayor a menor
            estudiantesEvaluados = estudiantesEvaluados.OrderByDescending(e => e.Nota).ToList();
            count = 0;

            foreach (EstudianteEvaluado item in estudiantesEvaluados)
            {
                count++;
                EstudianteEvaluado estudiante = new EstudianteEvaluado();
                estudiante.Numero = count;
                estudiante.Identificador = item.Identificador;
                estudiante.Nota = item.Nota;
                estudiantesOrdenados.Add(estudiante);
            }

            return estudiantesOrdenados;
        }

        public string registrarNotaAsistenciaEstudiante( string grupo, string asignatura, int idEstudiante, string periodoNota, string nota, int Fallas)
        {
            int retorno = 0;
            
            if (!string.IsNullOrEmpty(asignatura) && idEstudiante != 0 && !string.IsNullOrEmpty(periodoNota))
            {                

                try
                {

                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "asignatura", asignatura },
                        { "docEstudiante", idEstudiante },
                        { "PeriodoNota", periodoNota },
                        { "nota", nota },
                        { "nFallasRef", Fallas },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarDocenteNotasAsistenciasPeriodo", parametros, _contexto.Conexion);
                    retorno = 1;

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }

                foreach (EstudianteEvaluado item in GestionNotasAsistenciaRetorno(grupo, asignatura, periodoNota))
                {
                    int nuevoPuesto = Convert.ToInt16(item.Numero);
                    long identificadorEstudiante = Convert.ToInt32(item.Identificador);
                    actualizarPuestoEstudiante(identificadorEstudiante, nuevoPuesto, periodoNota, grupo);
                }

            }           

            return "" + retorno;
        }

        public List<Object> ObtenerRegistroNotasEstudiantes(string grupoRef, string asignaturaRef, string periodoRef)
        {
            List<object> estudiantes = new List<object>();
            object estudiante = new object();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "grupoRef", grupoRef },
                 { "asignaturaRef", asignaturaRef },
                 { "periodoRef", periodoRef },                 
            };

            int grupoAtributosEsperadosDocente = 8;

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerEstudiantesNotasXGrupo", parametros, grupoAtributosEsperadosDocente, _contexto.Conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                estudiante = item;
                estudiantes.Add(estudiante);
                estudiante = new List<object>();
            }
         

            return estudiantes;
        }

        public void actualizarPuestoEstudiante(long idEstudianteRef , int puestoRef, string periodoNota, string grupoRef)
        {
            List<object> GrupoPuestos = ObtenerRegistroPuestosXgrupo(periodoNota, grupoRef);
            List<EstudianteGrupoPuesto> EstudiantesGrupo = new List<EstudianteGrupoPuesto>();            
            List<EstudianteGrupoPuesto> EstudiantesGrupoActualizado = new List<EstudianteGrupoPuesto>();                                

            if (idEstudianteRef != 0 && puestoRef != 0)
            {
                
                try
                {

                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "idEstudianteRef", idEstudianteRef },
                        { "puestoRef", puestoRef },
                        { "periodoRef", periodoNota },
                        { "grupoRef", grupoRef },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("ActualizarPosicionEstudiantes2", parametros, _contexto.Conexion);

                    if (GrupoPuestos.Count > 0)
                    {
                        foreach (List<object> item in GrupoPuestos)
                        {
                            EstudianteGrupoPuesto EstudianteGrupo = new EstudianteGrupoPuesto();
                            string notaRef = "0";
                            EstudianteGrupo.Numero = 0;
                            EstudianteGrupo.Identificador = Convert.ToInt32(item[0]);
                            notaRef = Convert.ToString(item[1]);
                            EstudianteGrupo.Nota = Convert.ToSingle(notaRef);
                            EstudianteGrupo.Periodo = Convert.ToString(item[2]);
                            EstudianteGrupo.Grupo = Convert.ToString(item[3]);
                            EstudiantesGrupo.Add(EstudianteGrupo);
                        }

                        EstudiantesGrupo = EstudiantesGrupo.OrderByDescending(e => e.Nota).ToList();
                        int count = 0;

                        foreach (EstudianteGrupoPuesto item in EstudiantesGrupo)
                        {
                            count++;
                            EstudianteGrupoPuesto estudiante = new EstudianteGrupoPuesto();
                            estudiante.Numero = count;
                            estudiante.Identificador = item.Identificador;
                            estudiante.Nota = item.Nota;
                            estudiante.Periodo = item.Periodo;
                            estudiante.Grupo = item.Grupo;                                                      
                            EstudiantesGrupoActualizado.Add(estudiante);                           
                        }

                        foreach (EstudianteGrupoPuesto item in EstudiantesGrupoActualizado)
                        {
                            Dictionary<string, object> parametros2 = new Dictionary<string, object>
                            {
                                { "idEstudianteRef", item.Identificador },
                                { "puestoRef", item.Numero },
                                { "periodoRef", item.Periodo },
                                { "grupoRef", item.Grupo },
                            };

                            ManejoBaseDatos.EjecutarProcedimientoMultiParametro("ActualizarPosicionEstudiantes2", parametros2, _contexto.Conexion);
                        }

                    }

                    //ManejoBaseDatos.EjecutarProcedimientoMultiParametro("ActualizarPosicionEstudiantes", parametros, _contexto.Conexion); //para actualizar posiciones por materia
                    
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
            }
        }

        public List<Object> ObtenerRegistroPuestosXgrupo(string periodoRef, string grupoRef)
        {
            List<object> estudiantes = new List<object>();
            object estudiante = new object();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "periodoRef", periodoRef },
                 { "grupoRef", grupoRef },
            };

            int grupoAtributosEsperadosEstudiante = 4;

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerPosicionEstudiantesGrupo", parametros, grupoAtributosEsperadosEstudiante, _contexto.Conexion);

            foreach (var item in resultados)
            {
                estudiante = item;
                estudiantes.Add(estudiante);
                estudiante = new List<object>();
            }


            return estudiantes;
        }

        public string actualizarConvivencia(int idEstudiante, string periodo, float nota, string grupoRef)
        {
            string retorno = "0";

            if (idEstudiante != 0 && nota != 0 && !string.IsNullOrEmpty(periodo) && !string.IsNullOrEmpty(grupoRef))
            {
                try
                {
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "idEstudiante", idEstudiante },
                        { "periodo", periodo },
                        { "nota", nota },
                        { "docDocente", Convert.ToInt32(DatosCompartidos.MiDato) },
                        { "grupoRef", grupoRef },
                    };

                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("ActualizarNotaConvivencia", parametros, _contexto.Conexion);
                    retorno = "1";

                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
                }
>>>>>>> Stashed changes
                
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
<<<<<<< Updated upstream
=======

    public class EstudianteEvaluado
    {
        public int Numero { get; set; }
        public long Identificador { get; set; }
        public float Nota { get; set; }
    }
    
    public class EstudianteGrupoPuesto
    {
        public int Numero { get; set; }
        public long Identificador { get; set; }
        public float Nota { get; set; }
        public string Periodo { get; set; }
        public string Grupo { get; set; }
    }
>>>>>>> Stashed changes
}

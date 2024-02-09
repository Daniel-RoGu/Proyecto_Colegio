using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Hosting;
using CsvHelper;
using CsvHelper.Configuration.Attributes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.VisualBasic.FileIO;
using System.Text;
using CsvHelper.Configuration;
using System.Globalization;
using DocumentFormat.OpenXml.EMMA;
using Newtonsoft.Json;

namespace ProyectoColegio.Controllers
{
    public class FuncionarioController : Controller
    {
        //Funcionario funcionario = new Funcionario();
        private readonly Contexto _contexto;
        ManejoProcedimientos manejoProcedimientos = new ManejoProcedimientos();
        
        public FuncionarioController(Contexto contexto)
        {
            _contexto = contexto;
        }

        //VariablesGlobales variablesGlobales = new VariablesGlobales();

        public IActionResult CargarCsv()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CargarCsv(IFormFile file)
        {

            var tempFilePath = "";

            if (file != null && file.Length > 0)
            {
                // Crear un archivo temporal
                tempFilePath = Path.GetTempFileName();

                // Guardar el contenido del archivo en el archivo temporal
                using (var stream = new FileStream(tempFilePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

            }

            // Lista para almacenar los datos
            List<InfoSimat> info = new List<InfoSimat>();

            var csvConfig = new CsvConfiguration(CultureInfo.InvariantCulture)
            {
                Delimiter = ";",
                HasHeaderRecord = true,
                Encoding = Encoding.GetEncoding("iso-8859-1")
            };

            // Leer el archivo CSV usando CsvHelper
            using (var reader = new StreamReader(tempFilePath, Encoding.GetEncoding("iso-8859-1"))) 
            using (var csv = new CsvReader(reader, csvConfig))
            {
                // Lee todos los registros a la vez
                var records = csv.GetRecords<InfoSimat>().ToList();

                // Agrega los registros a la lista
                info.AddRange(records);
            }

            // Eliminar el archivo temporal después de procesarlo si es necesario
            System.IO.File.Delete(tempFilePath);

            // Procesa la lista
            UsarCsv(info);
            
            //return RedirectToAction("Index", "Home");
            return RedirectToAction("CargarCsv", "Funcionario");

        }


        [HttpGet]
        public IActionResult mostrarCsv()
        {
            
            List<Estudiante> Estudiantes = new List<Estudiante>();
            Estudiante Student = new Estudiante();
            
            try
            {
                foreach (var item in mostrarInfoSimat())
                {
                    Student.Usuario.NombreUsuario = item.NombreUsuario;
                    Student.Usuario.SegundoNombreUsuario = item.SegundoNombreUsuario;
                    Student.Usuario.ApellidoUsuario = item.ApellidoUsuario;
                    Student.Usuario.SegundoApellidoUsuario = item.SegundoApellidoUsuario;
                    Student.Usuario.Edad = item.Edad;
                    Student.Usuario.TelefonoCelular = item.TelefonoCelular;
                    Student.Usuario.TelefonoFijo = item.TelefonoFijo;
                    Student.Usuario.Correo = item.Correo;
                    Student.Usuario.Direccion = item.Direccion;
                    Student.Usuario.Barrio = item.Barrio;
                    Student.Usuario.FechaNacimiento = item.FechaNacimiento;

                    Dictionary<string, Type> CodigoEs = new Dictionary<string, Type>
                    {
                            { "CodEstudiante", typeof(int) },
                    };
                    List<int> codigoEs = ManejoBaseDatos.ConsultarProcedimientoDinamico<int>("obtenerCodigoEstudiantes", CodigoEs, _contexto.Conexion);
                    foreach (var item1 in codigoEs)
                    {
                        Student.CodigoEstudiante = item1;
                    }

                    Student.Usuario.TipoSangre = item.TipoSangre;
                    Student.Usuario.TipoDocumento = item.TipoDocumento;
                    Student.Usuario.Discapacidad = item.Discapacidad;
                    Student.Usuario.Sisben = item.Sisben;
                    Student.Usuario.Genero = item.Genero;
                    Student.Usuario.EPS = item.EPS;
                    Student.Usuario.Estrato = item.Estrato;

                    Estudiantes.Add(Student);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }   
            
            return View(Estudiantes);
            //return View();
        }


        public void UsarCsv(List<InfoSimat> datos)
        {           
            try
            {
                foreach (InfoSimat dato in datos)
                {
                    
                    Dictionary<string, object> parametros = new Dictionary<string, object>
                    {
                        { "documento", dato.DOC },
                        { "nomUsuario", dato.NOMBRE1 },
                        { "nom2Usuario", dato.NOMBRE2 },
                        { "apellidoUsuario", dato.APELLIDO1 },
                        { "apellido2Usuario", dato.APELLIDO2 },
                        { "edad", ManejoBaseDatos.CalcularEdad(dato.FECHA_NACIMIENTO) },
                        { "telCelular", null },
                        { "telFijo", null },
                        { "correoUss", dato.CORREO },
                        { "direccionUss", null },
                        { "barrioUss", dato.BARRIO },
                        { "fechaNacimientoUss", dato.FECHA_NACIMIENTO },
                        { "tipoSangre", dato.TIPO_DE_SANGRE },
                        { "tipoDocumento", dato.TIPODOC },
                        { "nombreDiscapacidad", dato.DISCAPACIDAD },
                        { "nombreSisben", dato.SISBEN_IV },
                        { "nombreGenero", dato.GENERO },
                        { "nombreEps", dato.EPS },
                        { "nombreEstrato", dato.ESTRATO },
                        { "codigoStudent", dato.PER_ID },
                        { "ciudadNacimientoEs", null },
                        { "ciudadResidenciaEs", null },
                        { "ciudadExpedicionDocumentoEs", null },
                        { "paisOrigenEs", dato.PAIS_ORIGEN },
                        { "asistenciaAcademicaEspecialEs", dato.APOYO_ACADEMICO_ESPECIAL },
                        { "desplazadoEstadoEs", null },
                    };
                    ManejoBaseDatos.EjecutarProcedimientoMultiParametro("registrarEstudiante", parametros, _contexto.Conexion);

                    //variablesGlobales.InfoGlobal.Add(dato);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        
        public List<Usuario> mostrarInfoSimat()
        {
            Dictionary<string, Type> atributosEstudiante = new Dictionary<string, Type>
            {
                { "documento", typeof(long) },
                { "nomUsuario", typeof(string) },
                { "nom2Usuario", typeof(string) },
                { "apellidoUsuario", typeof(string) },
                { "apellido2Usuario", typeof(string) },
                { "edad", typeof(int) },
                { "telCelular", typeof(string) },
                { "telFijo", typeof(string) },
                { "correoUss", typeof(string) },
                { "direccionUss", typeof(string)  },
                { "barrioUss", typeof(string)  },
                { "fechaNacimientoUss", typeof(string) },
                { "estadoUss", typeof(string) },
                { "tipoSangre", typeof(string)  },
                { "tipoDocumento", typeof(string)  },
                { "nombreDiscapacidad", typeof(string)  },
                { "nombreSisben", typeof(string)  },
                { "nombreGenero", typeof(string)  },
                { "nombreEps", typeof(string)  },
                { "nombreEstrato", typeof(string)  },
                //{ "codigoStudent", typeof(string) },
                //{ "ciudadNacimientoEs", typeof(string)  },
                //{ "ciudadResidenciaEs", typeof(string)  },
                ////{ "ciudadExpedicionDocumentoEs", typeof(string)  },
                ////{ "paisOrigenEs", typeof(string)  },
                //{ "asistenciaAcademicaEspecialEs", typeof(string)  },
                //{ "desplazadoEstadoEs", typeof(string)  },
            };

            List<Usuario> listadoEstudiantes = ManejoBaseDatos.ConsultarProcedimientoDinamico<Usuario>("MostrarEstudiantes", atributosEstudiante, _contexto.Conexion);           
            return listadoEstudiantes; 
            
        }
         
        
                
    }

}

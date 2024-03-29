﻿using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;
using MySql.Data.MySqlClient;

namespace ProyectoColegio.Controllers
{
    public class AdministradorController : Controller
    {
        private readonly Contexto _contexto;
        ManejoProcedimientos manejoProcedimientos = new ManejoProcedimientos();
        EPS eps = new EPS();
        Discapacidad discapacidad = new Discapacidad();
        Estrato estrato = new Estrato();
        Genero genero = new Genero();
        Sisben sisben = new Sisben();
        TipoDocumento tipoDocumento = new TipoDocumento();
        TipoSangre tipoSangre = new TipoSangre();
        Asignatura asignatura = new Asignatura();
        Sede sede = new Sede();
        TipoNota tipoNota = new TipoNota(); 

        public AdministradorController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<string> LeerEPS()
        {
            //List<string> datos = null;
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            eps.EPSs = (lecturaJson.Resultado("Archivos_Json/EPS.json"));

            //return datos;
            return (eps.EPSs);
        }

        public List<string> LeerDiscapacidad()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            discapacidad.Discapacidades = (lecturaJson.Resultado("Archivos_Json/Discapacidad.json"));

            //return datos;
            return (discapacidad.Discapacidades);
        }

        public List<string> LeerEstrato()
        {
            //List<string> datos = null;
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            estrato.Estratos = (lecturaJson.Resultado("Archivos_Json/Estrato.json"));

            //return datos;
            return (estrato.Estratos);
        }

        public List<string> LeerGenero()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            genero.Generos = (lecturaJson.Resultado("Archivos_Json/Genero.json"));

            return (genero.Generos);
        }

        public List<string> LeerSisben()
        {
            //List<string> datos = null;
            LecturaJson lecturaJson = new LecturaJson();

            //datos = lecturaJson.Resultado("Archivos_Json/PuntajeSisben.json");
            sisben.PuntajeSisben = (lecturaJson.Resultado("Archivos_Json/PuntajeSisben.json"));

            //return datos;
            return (sisben.PuntajeSisben);
        }

        public List<string> LeerTipoDocumento()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            tipoDocumento.TpDocumento = (lecturaJson.Resultado("Archivos_Json/TipoDeDocumento.json"));

            //return datos;
            return (tipoDocumento.TpDocumento);
        }

        public List<string> LeerTipoSangre()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            tipoSangre.TpSangre = (lecturaJson.Resultado("Archivos_Json/TipoDeSangre.json"));

            //return datos;
            return (tipoSangre.TpSangre);
        }
        
        public List<string> LeerAsignatura()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            asignatura.Asignaturas = (lecturaJson.Resultado("Archivos_Json/Asignaturas.json"));             

            //return datos;
            return (asignatura.Asignaturas);
        }
        
        public List<string> LeerSedes()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            sede.Sedes = (lecturaJson.Resultado("Archivos_Json/Sedes.json"));             

            //return datos;
            return (sede.Sedes);
        }
        
        public List<string> LeerTipoNota()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            tipoNota.TipoNotas = (lecturaJson.Resultado("Archivos_Json/Sedes.json"));             

            //return datos;
            return (tipoNota.TipoNotas);
        }

        public IActionResult CargeJSON()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CargeJSON(int identidicacion)
        {
            //El archivo json debe traer solo una columna, estilo lista de nombres con el titulo de Datos
            //ej: {"Datos":["algo1", "algo2"]}
            return RedirectToAction("CargeJSON", "Administrador");
        }

        public void RegistrarEPS()
        {          
            try
            {              
                foreach (string dato in LeerEPS())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarEPS", "nomEPS", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }

        public void RegistrarDiscapacidad()
        {
            try
            {
                foreach (string dato in LeerDiscapacidad())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarDiscapacidad", "nomDiscapacidad", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        public void RegistrarEstrato()
        {
            try
            {
                foreach (string dato in LeerEstrato())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarEstrato", "nomEstrato", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        public void RegistrarGenero()
        {
            try
            {
                foreach (string dato in LeerGenero())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarGenero", "nomGenero", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        public void RegistrarSisben()
        {
            try
            {
                foreach (string dato in LeerSisben())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarSisben", "nomSisben", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        public void RegistrarTipoDocumento()
        {
            try
            {
                foreach (string dato in LeerTipoDocumento())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarTipoDocumento", "nomTpDocumento", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        public void RegistrarTipoSangre()
        {
            try
            {
                foreach (string dato in LeerTipoSangre())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarTipoSangre", "nomTpSangre", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }

        public void RegistrarAsignatura()
        {
            try
            {
                foreach (string dato in LeerAsignatura())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarAsignatura", "nomAsignatura", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        public void RegistrarSedes()
        {
            try
            {
                foreach (string dato in LeerSedes())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarSede", "nomSede", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }
        
        public void RegistrarTipoNota()
        {
            try
            {
                foreach (string dato in LeerTipoNota())
                {
                    ManejoBaseDatos.EjecutarProcedimientoAlmacenado("registrarTipoNota", "nomTpNota", dato, _contexto.Conexion);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }
        }

    }

}


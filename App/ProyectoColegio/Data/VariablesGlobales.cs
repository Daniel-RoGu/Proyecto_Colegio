using Org.BouncyCastle.Asn1.Cms;
using ProyectoColegio.Models;

namespace ProyectoColegio.Data
{
    public class VariablesGlobales
    {

        private List<InfoSimat> infoGlobal = new List<InfoSimat>();
        

        public List<InfoSimat> InfoGlobal
        {
            get { return infoGlobal; }
            set { infoGlobal = value; }
        }

        public List<string> Sedes(string conexion)
        {
            List<string> sedes = new List<string>();
            
            Dictionary<string, Type> atributosSede = new Dictionary<string, Type>
            {
                { "Sede", typeof(string) },
            };

            List<Object> resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("ObtenerSedes", atributosSede, conexion);
            
            foreach (var item in resultados)
            {
                sedes.Add(Convert.ToString(item));
            }

            return sedes;

        }
        
        public List<string> TiposSangre(string conexion)
        {
            List<string> tpsSangre = new List<string>();
            
            Dictionary<string, Type> atributosTpSangre = new Dictionary<string, Type>
            {
                { "TipoSangre", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("ObtenerTipoSangre", atributosTpSangre, conexion);
            
            foreach (var item in resultados)
            {
                tpsSangre.Add(item.ToString());
            }

            return tpsSangre;

        }
        
        public List<string> TiposDocumento(string conexion)
        {
            List<string> tpsDocumento = new List<string>();
            
            Dictionary<string, Type> atributosTpDocumento = new Dictionary<string, Type>
            {
                { "TipoDocumento", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("ObtenerTipoDocumento", atributosTpDocumento, conexion);
            
            foreach (var item in resultados)
            {
                tpsDocumento.Add(item.ToString());
            }

            return tpsDocumento;

        }
        
        public List<string> Discapacidades(string conexion)
        {
            List<string> tpsDiscapacidades = new List<string>();
            
            Dictionary<string, Type> atributosDiscapacidad = new Dictionary<string, Type>
            {
                { "Discapacidad", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerDiscapacidad", atributosDiscapacidad, conexion);
            
            foreach (var item in resultados)
            {
                tpsDiscapacidades.Add(item.ToString());
            }

            return tpsDiscapacidades;

        }
        
        public List<string> Sisbens(string conexion)
        {
            List<string> tpsSisbens = new List<string>();
            
            Dictionary<string, Type> atributosSisbens = new Dictionary<string, Type>
            {
                { "Siben", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerSisben", atributosSisbens, conexion);
            
            foreach (var item in resultados)
            {
                tpsSisbens.Add(item.ToString());
            }

            return tpsSisbens;

        }
        
        public List<string> Generos(string conexion)
        {
            List<string> tpsGeneros = new List<string>();
            
            Dictionary<string, Type> atributosGeneros = new Dictionary<string, Type>
            {
                { "Genero", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerGenero", atributosGeneros, conexion);
            
            foreach (var item in resultados)
            {
                tpsGeneros.Add(item.ToString());
            }

            return tpsGeneros;

        }
        
        public List<string> EPSs(string conexion)
        {
            List<string> tpsEPSs = new List<string>();
            
            Dictionary<string, Type> atributosEPSs = new Dictionary<string, Type>
            {
                { "EPS", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerEPS", atributosEPSs, conexion);
            
            foreach (var item in resultados)
            {
                tpsEPSs.Add(item.ToString());
            }

            return tpsEPSs;

        }
        
        public List<string> Estratos(string conexion)
        {
            List<string> tpsEstratos = new List<string>();
            
            Dictionary<string, Type> atributosEstratos = new Dictionary<string, Type>
            {
                { "Estrato", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerEstrato", atributosEstratos, conexion);
            
            foreach (var item in resultados)
            {
                tpsEstratos.Add(item.ToString());
            }

            return tpsEstratos;

        }
        
        public List<string> Asignaturas(string conexion)
        {
            List<string> tpsAsignaturas = new List<string>();
            
            Dictionary<string, Type> atributosAsignatura = new Dictionary<string, Type>
            {
                { "Asignatura", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerAsignaturas", atributosAsignatura, conexion);
            
            foreach (var item in resultados)
            {
                tpsAsignaturas.Add(item.ToString());
            }

            return tpsAsignaturas;

        }
        
        public List<string> Docentes(string conexion)
        {
            List<string> tpsDocentes = new List<string>();
            
            Dictionary<string, Type> atributosDocente = new Dictionary<string, Type>
            {
                { "Docente", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerDocentes", atributosDocente, conexion);
            
            foreach (var item in resultados)
            {
                tpsDocentes.Add(item.ToString());
            }

            return tpsDocentes;

        }

        public List<string> DocentesSede (string Sede, string conexion)
        {
            List<string> DocentesSd = new List<string>();

            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                // Definir aqui atributos y tipos esperados
                { "Docentes", typeof(string) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "ObtenerDocenteSede";
            string nombreParametro = "sedeRef";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, Sede, numeroAtributos, conexion);

            foreach (var item in resultados)
            {
                DocentesSd.Add(item.ToString());
            }

            return DocentesSd;

        }

        public List<object> DocentesSedeInfoCompleta(string Sede, string conexion)
        {
            List<object> DocentesSd = new List<object>();

            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                // Definir aqui atributos y tipos esperados                
                { "Docente", typeof(string) },
                { "Identificacion", typeof(string) },
                { "TipoSangre", typeof(string) },
                { "Genero", typeof(string) },
                { "TelefonoFijo", typeof(string) },
                { "Direccion", typeof(string) },
                { "TelefonoCelular", typeof(string) },
                { "Correo", typeof(string) },
                { "Sede", typeof(string) },
                { "HorasTrabajo", typeof(string) },
                { "Discapacidad", typeof(string) },
                { "Sisben", typeof(string) },
                { "Estrato", typeof(string) },
                { "EPS", typeof(string) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "ObtenerInfoDocenteSede";
            string nombreParametro = "sedeRef";

            // Llamar al método
            var resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, Sede, numeroAtributos, conexion);
            List<string> lista = new List<string>();

            foreach (var item in resultados)
            {
                                
                if (lista.Count > (numeroAtributos - 1))
                {
                    lista = new List<string>();

                }else if (lista.Count == (numeroAtributos - 1))
                {
                    DocentesSd.Add(lista);
                }

                lista.Add(item.ToString());
            }

            return DocentesSd;

        }

        public List<string> DocentesSedeGrupo (string Sede,string Grupo, string conexion) 
        {
            var resultados = new List<object>();
            List<string> docentes = new List<string>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "sedeRef", Sede },
                    { "nomGrupo", Grupo },
                };

            resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerDocentesSedeGrado", parametros, 1, conexion);

            foreach (var item in resultados)
            {
                docentes.Add(Convert.ToString(item));
            }

            return docentes;
        }

        public List<Object> DocentesSedeGrupoInfoCompleta(string Sede, string Grupo, string conexion)
        {            
            List<object> docentes = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "sedeRef", Sede },
                 { "nomGrupo", Grupo },
            };

            int grupoAtributosEsperadosDocente = 14;

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("ObtenerInfoDocentesSedeGrado", parametros, grupoAtributosEsperadosDocente, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                docentes.Add(item);                
            }

            return docentes;
        }


        public List<string> GruposGrado(string conexion)
        {
            List<string> tpsGruposGrado = new List<string>();
            
            Dictionary<string, Type> atributosGrupo = new Dictionary<string, Type>
            {
                { "Grupo", typeof(string) },
            };

            var resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("obtenerGruposGrado", atributosGrupo, conexion);
            
            foreach (var item in resultados)
            {
                tpsGruposGrado.Add(item.ToString());
            }

            return tpsGruposGrado;

        }

        public List<object> GruposGradoSede(string sede, string conexion)
        {
            List<object> gruposSede = new List<object>();

            Dictionary<string, object> parametros = new Dictionary<string, object>
            {
                 { "sedeGradoGrupo", sede },
            };

            int grupoAtributosEsperadosGruposSede = 1;

            var resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("obtenerGruposGradoSede", parametros, grupoAtributosEsperadosGruposSede, conexion);

            List<object> lista = new List<object>();

            foreach (var item in resultados)
            {
                gruposSede.Add(item);
            }

            return gruposSede;

        }

    }
}

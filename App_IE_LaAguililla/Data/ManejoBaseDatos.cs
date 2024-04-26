using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Collections.Generic;
using System.Dynamic;

namespace ProyectoColegio.Data
{
    public static class ManejoBaseDatos
    {

        public static void EjecutarProcedimientoAlmacenado(string nombreProcedimiento, string parametroNombre, object parametroValor, string cadenaConexion)
        {
            try
            {
                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                using (MySqlCommand comando = new MySqlCommand(nombreProcedimiento, conexion))
                {
                    conexion.Open();

                    comando.CommandType = CommandType.StoredProcedure;

                    if (parametroNombre != null)
                    {
                        comando.Parameters.AddWithValue(parametroNombre, parametroValor);
                    }

                    comando.ExecuteNonQuery();
                }

                Console.WriteLine("Procedimiento almacenado ejecutado correctamente");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }
        }

        public static void EjecutarProcedimientoMultiParametro(string nombreProcedimiento, Dictionary<string, object> parametros, string cadenaConexion)
        {
            try
            {
                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                using (MySqlCommand comando = new MySqlCommand(nombreProcedimiento, conexion))
                {
                    conexion.Open();

                    comando.CommandType = CommandType.StoredProcedure;

                    if (parametros != null)
                    {
                        foreach (var parametro in parametros)
                        {
                            comando.Parameters.AddWithValue(parametro.Key, parametro.Value);
                        }
                    }

                    comando.ExecuteNonQuery();
                }

                Console.WriteLine("Procedimiento almacenado ejecutado correctamente");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }
        }


        public static List<object> ConsultarProcedimientoDinamico(string nombreProcedimiento, Dictionary<string, Type> atributos, string cadenaConexion)
        {
            List<object> listaObjetos = new List<object>();
            List<object> listaDatosRetornoUnico = new List<object>();

            try
            {
                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    conexion.Open();

                    MySqlCommand comando = new MySqlCommand(nombreProcedimiento, conexion);
                    comando.CommandType = CommandType.StoredProcedure;

                    using (MySqlDataReader lector = comando.ExecuteReader())
                    {
                        while (lector.Read())
                        {
                            List<object> listaDatos = new List<object>();

                            foreach (var atributo in atributos)
                            {
                                string nombreColumna = atributo.Key;

                                // Verificar si la columna existe en el resultado del lector
                                if (lector.HasColumn(nombreColumna))
                                {
                                    object valor = lector[nombreColumna];

                                    // Convertir el valor al tipo especificado en los atributos
                                    object valorConvertido = valor != DBNull.Value ? Convert.ChangeType(valor, atributo.Value) : "Sin_Registro";
                                    listaDatos.Add(valorConvertido);
                                }
                                else
                                {
                                    // Si la columna no existe, agregar un valor por defecto
                                    listaDatos.Add("Sin_Registro");
                                }
                            }
                            listaDatosRetornoUnico.Add(listaDatos);
                            listaObjetos.Add(listaDatos);
                        }
                    }
                }

                Console.WriteLine("Procedimiento almacenado ejecutado correctamente");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }

            if (atributos.Count == 1)
            {
                return listaDatosRetornoUnico;
            }

            return listaObjetos;
        }


        public static List<object> EjecutarProcedimientoConParametroYConsulta(string nombreProcedimiento, string nombreParametro, object valorParametro, int numeroAtributos, string cadenaConexion)
        {
            List<object> listaObjetos = new List<object>();

            try
            {
                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    conexion.Open();

                    string sqlConsulta = $"CALL db_aa74fb_bdcoleg.{nombreProcedimiento}(@{nombreParametro})";
                    MySqlCommand comando = new MySqlCommand(sqlConsulta, conexion);
                    comando.Parameters.AddWithValue($"@{nombreParametro}", valorParametro);

                    using (MySqlDataReader reader = comando.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            for (int i = 0; i < numeroAtributos; i++)
                            {
                                listaObjetos.Add(reader.GetString(i));
                            }
                        }
                    }

                    Console.WriteLine("Procedimiento almacenado ejecutado correctamente");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }

            return listaObjetos;
        }


        public static List<object> EjecutarProcedimientoConMultiParametroYConsulta(string nombreProcedimiento, Dictionary<string, object> parametros, int numeroAtributos, string cadenaConexion)
        {
            List<object> listaObjetos = new List<object>();

            try
            {
                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    conexion.Open();

                    // Construye la consulta con los parámetros
                    string sqlConsulta = $"CALL db_aa74fb_bdcoleg.{nombreProcedimiento}(";

                    foreach (var parametro in parametros)
                    {
                        sqlConsulta += $"@{parametro.Key}, ";
                    }

                    sqlConsulta = sqlConsulta.TrimEnd(' ', ',') + ")";

                    MySqlCommand comando = new MySqlCommand(sqlConsulta, conexion);

                    // Agrega los parámetros al comando
                    foreach (var parametro in parametros)
                    {
                        comando.Parameters.AddWithValue($"@{parametro.Key}", parametro.Value);
                    }

                    using (MySqlDataReader reader = comando.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            List<object> listaDatos = new List<object>();

                            for (int i = 0; i < numeroAtributos; i++)
                            {
                                listaDatos.Add(reader.GetString(i));
                            }

                            listaObjetos.Add(listaDatos);
                        }
                    }
                }

                Console.WriteLine("Procedimiento almacenado ejecutado correctamente");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }

            return listaObjetos;
        }


        public static int CalcularEdad(string fechaNacimiento)
        {
            DateTime fechaNac;

            // Definir varios formatos de fecha posibles
            string[] formatosFecha = { "dd/MM/yyyy", "d/MM/yyyy", "dd/M/yyyy", "d/M/yyyy" };

            // Intentar convertir la fecha utilizando los formatos especificados
            if (DateTime.TryParseExact(fechaNacimiento, formatosFecha, null, System.Globalization.DateTimeStyles.None, out fechaNac))
            {
                DateTime fechaActual = DateTime.Now;
                int edad = fechaActual.Year - fechaNac.Year;

                // Verificar si aún no ha cumplido años en el año actual
                if (fechaNac > fechaActual.AddYears(-edad))
                {
                    edad--;
                }

                return edad;
            }
            else
            {
                // Manejar el caso en que la fecha de nacimiento no sea válida
                throw new ArgumentException("Formato de fecha de nacimiento no válido. Debe ser 'dd/MM/yyyy' o 'd/MM/yyyy'.");
            }
        }

    }


    public class Dato
    {
        public string Nombre { get; set; }
        public object Valor { get; set; }
    }

    public class GestionDato
    {
        
         public object ConvertirDatoADynamic(Dato dato)
         {
            dynamic dynamicObject = new ExpandoObject();
            var dictionary = (IDictionary<string, object>)dynamicObject;

            dictionary[dato.Nombre] = dato.Valor;

            return dynamicObject;
         }

    }

}

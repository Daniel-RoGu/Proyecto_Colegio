using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class FuncionarioController : Controller
    {
        Funcionario funcionario = new Funcionario();
        private readonly Contexto _contexto;

        public FuncionarioController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public IActionResult CargarCsv()
        {
            return View();
        }


        [HttpPost]
        public IActionResult CargarCsv(List<InfoSimat> datos)
        {

            try
            {

                foreach (InfoSimat dato in datos)
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand("registrarTipoSangre", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("nomTpSangre", dato.Nombre1);
                        Command.ExecuteNonQuery();
                    }
                    Console.WriteLine(dato);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }


            return RedirectToAction("Index", "Home");
        }
    }
}

using Microsoft.AspNetCore.Mvc;

namespace ProyectoColegio.Controllers
{
    public class EstudianteController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}

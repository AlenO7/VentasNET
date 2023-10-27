using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using VentasNet.Infra.DTO.Request;

namespace Venta.NET.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger; //CREA UN VARIABLE PRIVADA DE SOLO LECTURA
        
        public HomeController(ILogger<HomeController> logger)//CONSTRUCTOR
        {
            _logger = logger;
        }

        public IActionResult Index() //iActionResult es un tipo de dato de una interfaz.
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
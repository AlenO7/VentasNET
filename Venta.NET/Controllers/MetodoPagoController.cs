using Microsoft.AspNetCore.Mvc;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Repositories;

namespace Venta.Net.Controllers
{
    public class MetodoPagoController : Controller
    {
        private readonly IMetodoPagoRepo _metodoPagoRepo;

        public MetodoPagoController(IMetodoPagoRepo metodoPagoRepo) //inyeccion de independencia
        {
            _metodoPagoRepo = metodoPagoRepo;
        }


        public IActionResult AgregarMetodoPago(MetodoPagoReq metodoPago)
        {
            

            var metodoPagoResponse = _metodoPagoRepo.AddMetodoPago(metodoPago);
            if (metodoPagoResponse.Guardar)
            {
                return RedirectToAction("Listado");
            }


            return View();
        }

        public IActionResult Edit(MetodoPagoReq metodoPago)
        {

            var metodoPagoResponse = _metodoPagoRepo.UpdateMetodopago(metodoPago);

            return RedirectToAction("Listado", metodoPagoResponse);
        }
        public IActionResult ModificarMetodo(MetodoPagoReq metodoPago)
        {
            ViewBag.MetodoPago = _metodoPagoRepo.GetMetodoPago(metodoPago.IdMetodoPago);

            return View();
        }
        public IActionResult Delete(MetodoPagoReq metodoPago)
        {
            var result = _metodoPagoRepo.Delete(metodoPago);

            return RedirectToAction("Listado");
        }
        public IActionResult Listado(MetodoPagoReq metodoPago)
        {
            ViewBag.MetodosPago = _metodoPagoRepo.GetMetodosPago();

            return View();
        }



    }
        
}

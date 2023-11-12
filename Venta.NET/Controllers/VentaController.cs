using Microsoft.AspNetCore.Mvc;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Repositories;

namespace Venta.Net.Controllers
{
    public class VentaController : Controller
    {
        private readonly IVentaRepo _ventaRepo;

        public VentaController(IVentaRepo ventaRepo) //inyeccion de dependencia
        {
            _ventaRepo = ventaRepo;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult GenerarVenta()
        {

            var venta = _ventaRepo.GenerarVenta();
            ViewBag.DetallesVenta = VentasPersistido.productos;

            return View(venta);


        }
        public IActionResult GetClienteCuit(string cuit)
        {

            var cliente = _ventaRepo.GetClienteCuit(cuit);

            VentasPersistido.cliente = cliente == null ? new Cliente() : cliente;


            return RedirectToAction("GenerarVenta");
        }


        public IActionResult BuscarProducto(DetalleVentaReq detalle, string submitButton)
        {

            if (submitButton == "Buscar")
            {
                var producto = _ventaRepo.GetProductoCodigo(detalle.Codigo);

                VentasPersistido.producto = producto == null ? new Producto() : producto;

                var detalles = _ventaRepo.MapeoProdADetalle();

                VentasPersistido.detalles = detalles == null ? new DetalleVentaReq() : detalles;


            }
            else if (submitButton == "Agregar")
            {
                return RedirectToAction("AgregarProducto", detalle);

            }

            return RedirectToAction("GenerarVenta");
        }

      
        public IActionResult AgregarProducto(DetalleVentaReq detalle)
        {

            _ventaRepo.AgregarProducto(detalle);


            return RedirectToAction("GenerarVenta");
        }


        public IActionResult VentaFinalizada(VentaReq venta)
        {
            var datosVenta = _ventaRepo.GenerarVenta();

            return View(datosVenta);
        }



    }
}



using Microsoft.AspNetCore.Mvc;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Repositories;

namespace Venta.NET.Controllers
{
    public class ProveedorController : Controller
    {


        IProveedorRepo proveedorRepo;

        public ProveedorController(IProveedorRepo _proveedorRepo)
        {
            proveedorRepo = _proveedorRepo;
        }


        public IActionResult Index()
        {
            return View();
        }

        public IActionResult AgregarProveedor(ProveedorReq proveedor)
        {
            var proveedorResponse = proveedorRepo.AddProveedor(proveedor);

            if (proveedorResponse.Guardar)
            {
                return RedirectToAction("ListaProveedores");
            }

            return View();
        }

        public IActionResult ModificarProveedor(ProveedorReq proveedor)
        {
            ViewBag.Cliente = proveedorRepo.GetProveedorCuit(proveedor.Cuit);

            return View();
        }
        public IActionResult Editar(ProveedorReq proveedor)
        {
            var proveedorResponse = proveedorRepo.UpdateProveedor(proveedor);

            return RedirectToAction("ListaProveedores", proveedorResponse);
        }

        public IActionResult ListaProveedores()
        {
           ViewBag.Proveedores = proveedorRepo.ListaDeProveedores();

            return View(); 
        }
      
        public IActionResult Delete(ProveedorReq proveedor)
        {
            var result = proveedorRepo.Delete(proveedor);

            return RedirectToAction("ListaProveedores");
        }
    }
}

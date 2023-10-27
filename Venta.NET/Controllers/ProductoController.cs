
using Microsoft.AspNetCore.Mvc;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Repositories;

namespace Venta.NET.Controllers
{
    public class ProductoController : Controller
    {
        IProductoRepo productoRepo;

        public ProductoController(IProductoRepo _productoRepo)
        {
            productoRepo = _productoRepo;
        }



        public IActionResult Index()
        {
            return View();
        }

        public IActionResult AgregarProducto(ProductoReq prod)
        {
            var productoResponse = productoRepo.AddProducto(prod);

            return View();
        }

        public IActionResult ModificarProducto(ProductoReq prod)
        {
            ViewBag.Producto = productoRepo.GetProductoCodigo(prod.Codigo);

            return View();
        }

        public IActionResult Editar(ProductoReq prod)
        {

            var productoResponse = productoRepo.UpdateProducto(prod);

            return RedirectToAction("ListaProductos", productoResponse);
        }

        public IActionResult Delete(ProductoReq prod)
        {
            var result = productoRepo.Delete(prod);

            return RedirectToAction("ListaProductos");
        }
        public IActionResult ListaProductos(ProductoReq prod)
        {
            ViewBag.Producto = productoRepo.GetProductos();
            return View();
        }


    }
}

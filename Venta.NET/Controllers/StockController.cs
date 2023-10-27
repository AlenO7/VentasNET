using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Repositories;

namespace Venta.Net.Controllers
{
    public class StockController : Controller
    {
        IStockRepo _stockRepo;

        public StockController(IStockRepo stockRepo)
        {
            _stockRepo = stockRepo;
        }


        // GET: StockController
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult AgregarStock(StockReq stock)
        {
            var stockResponse = _stockRepo.AddStock(stock);

            if (stockResponse.Guardar)
            {
                return RedirectToAction("Listado");
            }

            return View();
        }

        public IActionResult ModificarProveedor(StockReq stock)
        {
            ViewBag.Stock = _stockRepo.GetStockIdProducto(stock.IdProducto);

            return View();
        }

        public IActionResult Editar(StockReq stock)
        {
            var stockResponse = _stockRepo.UpdateStock(stock);

            return RedirectToAction("Listado", stockResponse);
        }

        public IActionResult Delete(StockReq stock)
        {
            var result = _stockRepo.Delete(stock);

            return RedirectToAction("Listados");
        }

        public IActionResult ListaStock()
        {
            ViewBag.Stock = _stockRepo.ListadoStock();

            return View();
        }


    }
}

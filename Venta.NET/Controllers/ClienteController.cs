
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore.Infrastructure;
using NuGet.DependencyResolver;

using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Repositories;



namespace Venta.NET.Controllers
{
    public class ClienteController : Controller
    {

       private readonly IClienteRepo _clienteRepo;

        public ClienteController (IClienteRepo clienteRepo) //inyeccion de dependencia
        {
            _clienteRepo = clienteRepo;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult AgregarCliente(ClienteReq cli)
        {
            
           //ViewBag.Paises = _clienteRepo.GetPaises();

            //ViewBag.Provincias = _clienteRepo.GetProvincias();

           

            var clienteResponse = _clienteRepo.AddCliente(cli);
            if (clienteResponse.Guardar)
            {
                 return RedirectToAction("Listado");
            }


            return View();
        }

        public IActionResult Edit(ClienteReq cli)
        {

            var clienteResponse = _clienteRepo.UpdateCliente(cli);

            return RedirectToAction("Listado", clienteResponse);
        }


        public IActionResult ModificarCliente(ClienteReq cli)
        {
            ViewBag.Cliente = _clienteRepo.GetClienteCuit(cli.Cuit);

            return View();
        }


        public IActionResult Delete(ClienteReq cli)
        {
            var result = _clienteRepo.Delete(cli);

            return RedirectToAction("Listado");
        }

        public IActionResult Listado(ClienteReq cli)
        {
           
            ViewBag.Cliente = _clienteRepo.GetClientes();
            



            return View();
        }

       //public JsonResult GetProvincias(int Id)
       // {

       //     var listaProvincias = _clienteRepo.GetProvincias();

       //     return Json(listaProvincias, System.Web.Mvc.JsonRequestBehavior.AllowGet);

       // }

       


    }
}
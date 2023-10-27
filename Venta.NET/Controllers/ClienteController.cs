using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using NuGet.DependencyResolver;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Repositories;



namespace Venta.NET.Controllers
{
    public class ClienteController : Controller
    {

       private readonly IClienteRepo _clienteRepo;

        public ClienteController (IClienteRepo clienteRepo) //inyeccion de independencia
        {
            _clienteRepo = clienteRepo;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult AgregarCliente(ClienteReq cli)
        {
            //PaisReq objPais = new PaisReq();
            //List<PaisReq> listaPaises = clienteRepo.GetPais();
            //ViewBag.Paises = new SelectList(listaPaises, "Id", "Nombre");

            var clienteResponse = _clienteRepo.AddCliente( cli);
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

       

       


    }
}
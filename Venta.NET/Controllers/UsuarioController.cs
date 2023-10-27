
using Microsoft.AspNetCore.Mvc;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Repositories;

namespace Venta.NET.Controllers
{
    public class UsuarioController : Controller
    {
        IUsuarioRepo usuarioRepo;

        public UsuarioController(IUsuarioRepo _usuarioeRepo)
        {
            usuarioRepo = _usuarioeRepo;
        }

        
        public ActionResult Index(UsuarioReq usu)
        {

            return View(usu);
        }

        public ActionResult Inicio()
        {
            return View();
        }

        public IActionResult AgregarUsuario(UsuarioReq usuario)
        {

            var usuarioResponse = usuarioRepo.AddUsuario(usuario);

            if (usuarioResponse.Guardar)
            {
                return RedirectToAction("ListadoUsuarios");
            }

            return View();
        }
       

        public IActionResult Edit(UsuarioReq objUsuario)
        {

            var usuarioResponse = usuarioRepo.UpdateUsuario(objUsuario);

            return RedirectToAction("ListadoUsuarios", usuarioResponse);
        }
        public IActionResult ModificarUsuario(UsuarioReq usuario)
        {
            ViewBag.Usuario = usuarioRepo.GetUsuarioCuit(usuario.Cuit);

            return View();
        }

        public IActionResult Delete(UsuarioReq objUsuario)
        {
            var usuarioResponse = usuarioRepo.Delete(objUsuario);

            return RedirectToAction("ListadoUsuarios");
        }
        public IActionResult ListadoUsuarios()
        {
            ViewBag.Usuario = usuarioRepo.GetUsuarios();

            return View();
        }

        public IActionResult IngresoUsuario (string usuario, string clave)
        {
            
            var usuarioResponse = usuarioRepo.ValidarUsuario(usuario, clave);

            if(usuarioResponse.login)
            {
                return RedirectToAction("ListadoUsuarios");
            }
                



            return RedirectToAction("Index");
        }

        public IActionResult ConfigCuenta()
        {

            

            return View();
        }

    }


}




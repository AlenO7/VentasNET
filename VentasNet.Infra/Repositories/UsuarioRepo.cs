

using VentasNet.Entity.Data;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;
using VentasNet.Infra.Interfaces;

namespace VentasNet.Infra.Repositories
{
    public class UsuarioRepo :IUsuarioRepo 
    {
        private readonly VentasNETContext _context;
        public UsuarioRepo(VentasNETContext context)       
        {
            _context = context;


        }

        public UsuarioResponse AddUsuario(UsuarioReq objUsuario)
        {

            UsuarioResponse usuarioResponse = new UsuarioResponse();
           

            if (objUsuario.Cuit != null)
            {
                var existeUsuario = GetUsuarioCuit(objUsuario.Cuit);

                
                if (existeUsuario == null)
                {
                    try
                    {
                        var usuarioNew = MapeoUsuarioNuevo(objUsuario);

                        usuarioNew.Estado = true;
                        usuarioNew.FechaAlta = DateTime.Now.Date;

                        _context.Add(usuarioNew);
                        _context.SaveChanges(); 
                        usuarioResponse.Guardar = true;
                        usuarioResponse.Email = usuarioNew.Email;

                    }
                    catch (Exception ex)
                    {
                        usuarioResponse.Mensaje = "Error al agregar el Usuario."; 
                        usuarioResponse.Guardar = false;
                    }

                }
            }
            return usuarioResponse;
        }

        public UsuarioResponse UpdateUsuario(UsuarioReq objUsuario)
        {
            UsuarioResponse usuarioResponse = new UsuarioResponse();

            var existeUsuario = GetUsuarioCuit(objUsuario.Cuit);

            if (existeUsuario != null)
            {
                try
                {
                    var usuarioUp = MapeoUsuario(objUsuario, existeUsuario);


                    _context.Update(usuarioUp); 
                    _context.SaveChanges(); 
                    usuarioResponse.Guardar = true;
                    usuarioResponse.Email = usuarioUp.Email;
                }
                catch (Exception ex)
                {
                    usuarioResponse.Mensaje = "Error al modificar Usuario."; 
                    usuarioResponse.Guardar = false;
                }

            }

            return usuarioResponse;

        }

        public UsuarioResponse Delete(UsuarioReq objUsuario)
        {
            UsuarioResponse usuarioResponse = new UsuarioResponse();

            var existeUsuario = GetUsuarioCuit(objUsuario.Cuit);

            if (existeUsuario != null)
            {
                try
                {
                    existeUsuario.FechaBaja = DateTime.Now.Date;
                    existeUsuario.Estado = false;

                    _context.Update(existeUsuario); 
                    _context.SaveChanges(); 

                }
                catch (Exception ex)
                {
                    usuarioResponse.Mensaje = "Error al eliminar Usuario."; 
                    usuarioResponse.Guardar = false;
                }

            }

            return usuarioResponse;

        }

        public List<UsuarioReq> GetUsuarios()
        {
            List<UsuarioReq> listadoUsuarios = new List<UsuarioReq>();

            var lista = _context.Usuario.Where(x => x.Estado == true).ToList();

            foreach (var item in lista)
            {
                UsuarioReq usuarioReq = new UsuarioReq();

                usuarioReq.IdUsuario = item.IdUsuario;
                usuarioReq.Nombre = item.Nombre;
                usuarioReq.Apellido = item.Apellido;
                usuarioReq.Email = item.Email;
                usuarioReq.Cuit = item.Cuit;
                usuarioReq.Email = item.Email;


                listadoUsuarios.Add(usuarioReq);
            }

            return listadoUsuarios;
        }

        public Usuario MapeoUsuario(UsuarioReq objUsuario, Usuario existeUsuario)
        {

            existeUsuario.Nombre = objUsuario.Nombre != null ? objUsuario.Nombre : existeUsuario.Nombre;
            existeUsuario.Apellido = objUsuario.Apellido != null ? objUsuario.Apellido : existeUsuario.Apellido;
            existeUsuario.Email= objUsuario.Email != null ? objUsuario.Email : existeUsuario.Email;
           
           

            return existeUsuario;
        }

        public Usuario GetUsuarioCuit(string cuit)
        {
            var usuario = _context.Usuario.Where(x => x.Cuit == cuit).FirstOrDefault();

            return usuario;
        }

        public Usuario MapeoUsuarioNuevo(UsuarioReq objUsuario)
        {
            Usuario usuarioNuevo = new Usuario()
            {
                Nombre = objUsuario.Nombre,
                Apellido = objUsuario.Apellido,
                Cuit = objUsuario.Cuit,
                Email = objUsuario.Email,
                Clave = objUsuario.Clave
  
            };

            return usuarioNuevo;
        }


        public UsuarioResponse ValidarUsuario (string usuario, string clave)
        {
            UsuarioResponse usuarioResponse = new UsuarioResponse();          

            var existeEmail = ValidaUsuarioEmail(usuario);

            if (existeEmail != null)
            {
                var coincideClave = ValidaUsuarioClave(clave);

                if (coincideClave != null)
                {
                    usuarioResponse.login = true;
                    
                }    
                else
                {
                    usuarioResponse.login =false;
                }

            }
            else
            {
                usuarioResponse.Mensaje = "El usuario no existe";
            }




                return usuarioResponse;
        }

        public Usuario ValidaUsuarioEmail(string email)
        {
            var usuario = _context.Usuario.Where(x => x.Email == email).FirstOrDefault();

            return usuario;
        }

        public Usuario ValidaUsuarioClave(string clave)
        {
            var pass = _context.Usuario.Where(x => x.Clave == clave).FirstOrDefault();

            return pass;
        }


    }
}

using Microsoft.EntityFrameworkCore.Metadata.Internal;
using VentasNet.Entity.Data;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;
using VentasNet.Infra.Interfaces;
using VentasNet.Infra.Servicios.Interfaces;

namespace VentasNet.Infra.Repositories  
{
    public class ClienteRepo :IClienteRepo // el repo implementa la interfaz (no hereda)
    {
        private readonly VentasNETContext _context; 

        private readonly IClienteService _clienteService;

        public ClienteRepo(VentasNETContext context, IClienteService clienteService) //creo un constructor de la clase         
        {
            _context = context;
            _clienteService = clienteService;


        } 

        //En AddCliente recibo un parametro desde el Front (objCliente)
        public ClienteResponse AddCliente(ClienteReq objCliente)
        {
            
           

            ClienteResponse clienteResponse = new ClienteResponse();
            //llamo al metodo "GetClienteCuit" y le envio un parametro para que busqie si existe un cliente con ese cuit.

            if (objCliente.Cuit != null)
            {
                var existeCliente = GetClienteCuit(objCliente.Cuit);

                //Si "existeCliente" es null va a agregar un cliente.
                if (existeCliente == null)
                {
                    try
                    {
                        var clienteNew = MapeoClienteNuevo(objCliente);
                        //var nombrePais = GetNombrePais(clienteNew);

                        //clienteNew.NombrePais = nombrePais;
                        clienteNew.Estado = true;
                        clienteNew.FechaAlta = DateTime.Now.Date;

                         _clienteService.CrearNuevoCliente(clienteNew);

                        clienteResponse.Guardar = true;
                        clienteResponse.RazonSocial = clienteNew.RazonSocial;

                    }
                    // crear un diccionario de mensajes
                    catch (Exception ex)
                    {
                        clienteResponse.Mensaje = "Error al agregar Cliente."; // si ocurre un error al cargar muestra un mensaje
                        clienteResponse.Guardar = false;
                    }

                }
            }
            return clienteResponse;
        }

        public ClienteResponse UpdateCliente(ClienteReq obj )
        {
            ClienteResponse clienteResponse = new ClienteResponse();

            var existeCliente = GetClienteCuit(obj.Cuit);

            if (existeCliente != null)
            {
                try
                {
                    var clienteUp = MapeoCliente(obj, existeCliente);

                    _clienteService.ModificarCliente(clienteUp);

                  
                    clienteResponse.Guardar = true;
                    clienteResponse.RazonSocial = clienteUp.RazonSocial;
                }
                catch (Exception ex)
                {
                    clienteResponse.Mensaje = "Error al modificar Cliente."; // si ocurre un error al cargar muestra un mensaje
                    clienteResponse.Guardar = false;
                }

            }

            return clienteResponse;

        }

        public ClienteResponse Delete(ClienteReq objCliente)
        {
            ClienteResponse clienteResponse = new ClienteResponse();

            var existeCliente = GetClienteCuit(objCliente.Cuit);

            if (existeCliente != null)
            {
                try
                {
                    existeCliente.Estado = false;
                    existeCliente.FechaBaja = DateTime.Now;

                    _clienteService.EliminarCliente((int)existeCliente.IdCliente);

                    clienteResponse.Guardar = true;
                    clienteResponse.RazonSocial = existeCliente.RazonSocial;

                }
                catch (Exception ex)
                {
                    clienteResponse.Mensaje = "Error al eliminar Cliente."; // si ocurre un error al cargar muestra un mensaje
                    clienteResponse.Guardar = false;
                }

            }

            return clienteResponse;

        }

        public List<ClienteReq> GetClientes()
        {
            List<ClienteReq> listadoClientes = new List<ClienteReq>();

            var lista = _context.Cliente.Where(x => x.Estado == true).ToList();

          

            foreach (var item in lista)
            {
                ClienteReq clienteReq = new ClienteReq();

                clienteReq.IdCliente = item.IdCliente;
                clienteReq.RazonSocial = item.RazonSocial;
                clienteReq.Cuit = item.Cuit;
                clienteReq.Email = item.Email;
                clienteReq.Domicilio = item.Domicilio;
                clienteReq.Provincia = item.Provincia;
                clienteReq.Pais = item.Pais;
                clienteReq.Localidad = item.Localidad;
                clienteReq.Estado = item.Estado.Value; 
                //clienteReq.FechaAlta = item.FechaAlta;
                clienteReq.FechaBaja = item.FechaBaja;
             
               

                listadoClientes.Add(clienteReq);
            }
            
            return listadoClientes;
        }

        public Cliente GetClienteCuit(string cuit)
        {
            var cliente = _context.Cliente.Where(x => x.Cuit == cuit).FirstOrDefault();

            return cliente;
        }

        public Cliente MapeoClienteNuevo(ClienteReq objCliente)
        {
            Cliente clienteMapeado = new Cliente()
            {
                IdCliente = objCliente.IdCliente,
                RazonSocial = objCliente.RazonSocial,
                Cuit = objCliente.Cuit,
                Domicilio = objCliente.Domicilio,
                Email = objCliente.Email,
                Localidad = objCliente.Localidad,
                Provincia = objCliente.Provincia,   
                Pais = objCliente.Pais
                

            };

            return clienteMapeado;
        }

        public Cliente MapeoCliente(ClienteReq obj, Cliente existeCliente)
        {
            existeCliente.RazonSocial = obj.RazonSocial != null ? obj.RazonSocial : existeCliente.RazonSocial;
            existeCliente.Cuit = obj.Cuit != null ? obj.Cuit : existeCliente.Cuit;
            existeCliente.Domicilio = obj.Domicilio != null ? obj.Domicilio : existeCliente.Domicilio;
            existeCliente.Email = obj.Email != null ? obj.Email : existeCliente.Email;
            existeCliente.Pais = obj.Pais;
            existeCliente.Provincia = obj.Provincia;
            existeCliente.Localidad = obj.Localidad;




            return existeCliente;
        }

        //public List<PaisReq> GetPaises() 
        //{
        //    List<PaisReq> listadoPaises = new List<PaisReq> ();

        //    var listaPaises = _context.Pais.ToList();

        //    foreach (var item in listaPaises)
        //    {
        //        PaisReq paisReq = new PaisReq();

        //        paisReq.IdPais = item.IdPais;
        //        paisReq.Nombre = item.Nombre;

        //        listadoPaises.Add(paisReq);
        //    }


        //    return listadoPaises;
        //}

        //public List<Provincia> GetProvincias() 
        //{

        //    var listaProvincias = _context.Provincia.ToList();

        //    return listaProvincias;
        //}
       
        //public string GetNombrePais(Cliente clienteNew)
        //{
        //    var pais = _context.Pais.Where(x => x.IdPais == clienteNew.IdPais).FirstOrDefault();

        //    string nombrePais = pais.Nombre;

        //    return nombrePais;
        //}


    }
}

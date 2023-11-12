using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Data;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.Servicios.Interfaces;

namespace VentasNet.Infra.Servicios.Repo
{
    public class ClienteService : IClienteService
    {

        private readonly VentasNETContext _context;

        public ClienteService(VentasNETContext context)
        {
            _context = context;
        }

        public void CrearNuevoCliente(Cliente cliente)
        {


            _context.Add(cliente); 
            _context.SaveChanges(); 
        }



        public void ModificarCliente(Cliente cliente)
        {

            if (cliente != null)
            {
                _context.Update(cliente);
                _context.SaveChanges();
            }
        }
        public void EliminarCliente(int id)
        {

            var cliente = _context.Cliente.Where(x => x.IdCliente == id && x.Estado == true).FirstOrDefault();

            if (cliente != null)
            {
                cliente.Estado = false;
                cliente.FechaBaja = DateTime.Now;
                _context.Update(cliente);
                _context.SaveChanges();
            }
        }

        
    }
}

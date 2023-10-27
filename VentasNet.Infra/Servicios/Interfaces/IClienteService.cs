using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Models;

namespace VentasNet.Infra.Servicios.Interfaces
{
    public interface IClienteService
    {
        public void CrearNuevoCliente(Cliente cliente);
        public void ModificarCliente(Cliente cliente);
        public void EliminarCliente(int id);

    }
}

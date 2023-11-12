using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Models;

namespace VentasNet.Infra.DTO.Request
{
    public class ProductoVenta
    {
        public Producto producto { get; set; }

        public List<Producto> listaProductos { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Models;

namespace VentasNet.Infra.DTO.Request
{


    public class VentaReq
    {

        public int IdVenta { get; set; }
        public int IdComprobante { get; set; }
        public string NombreCorto { get; set; }
        public int IdFormaPago { get; set; }
        public string Descripcion { get; set; }
        public decimal ImporteTotal { get; set; }
        public int IdCliente { get; set; }
        public int IdUsuario { get; set; }
        public byte[]? FechaMovimiento { get; set; }


        public Cliente cliente { get; set; } = new Cliente();

        public ProductoVenta productoVenta { get; set; }

        public DetalleVentaReq detalles { get; set; } = new DetalleVentaReq();
        public List<DetalleVentaReq> productos { get; set; } = new List<DetalleVentaReq>();

        
        public Producto producto { get; set; } = new Producto();
       
        
       

    }
}



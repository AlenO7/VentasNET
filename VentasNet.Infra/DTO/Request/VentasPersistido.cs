using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Models;

namespace VentasNet.Infra.DTO.Request
{
    public static class VentasPersistido
    {

        public static int IdVenta { get; set; }
        public static int IdComprobante { get; set; }
        public static string NombreCorto { get; set; }
        public static int IdFormaPago { get; set; }
        public static string Descripcion { get; set; }
        public static decimal ImporteTotal { get; set; }
        public static int IdCliente { get; set; }
        public static int IdUsuario { get; set; }
        public static byte[]? FechaMovimiento { get; set; }


        public static Cliente cliente { get; set; }

        public static List<DetalleVentaReq> productos { get; set; } = new List<DetalleVentaReq>();

        public static ProductoVenta productoVenta { get; set; }


        public static Producto producto { get; set; }
        public static DetalleVentaReq detalles { get; set; }


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VentasNet.Infra.DTO.Request
{
    public class DetalleVentaReq : ProductoReq
    {
        public int IdDetalle { get; set; }
        public double? TotalProducto { get; set; }
        public int Cantidad { get; set; }


    }
}

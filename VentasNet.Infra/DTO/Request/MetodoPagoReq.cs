using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VentasNet.Infra.DTO.Request
{
    public class MetodoPagoReq
    {
        public int IdMetodoPago { get; set; }
        public string MetodoPago { get; set; }
        public bool Estado { get; set; }
        public DateTime? FechaAlta { get; set; }
        public DateTime? FechaBaja { get; set; }


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VentasNet.Infra.DTO.Common
{
    public class ComboDTO
    {
        
    }
    public class ComboMetodoPago
    {
        public int id { get; set; }
        public string metodoPago { get; set; }
    }
    public class ComboComprobante
    {
        public string nombreCorto { get; set; }
        public string descripcion { get; set; }
    }
}

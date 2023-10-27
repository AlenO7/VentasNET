using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VentasNet.Infra.DTO.Request
{
    public class ModelosClientePais : ClienteReq
    {
        public ClienteReq Cliente { get; set; }

        public PaisReq Pais{ get; set; }
    }
}

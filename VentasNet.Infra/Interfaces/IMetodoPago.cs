using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;
using VentasNet.Infra.Repositories;

namespace VentasNet.Infra.Interfaces
{
    public interface IMetodoPagoRepo
    {
        public MetodoPagoResponse AddMetodoPago(MetodoPagoReq metodoPago);
        public MetodoPagoResponse UpdateMetodopago(MetodoPagoReq metodoPago);
        public MetodoPagoResponse Delete(MetodoPagoReq metodoPago);      
        public MetodosPago GetMetodoPago(int idMetodoPago);
        public List<MetodoPagoReq> GetMetodosPago();
    }
}

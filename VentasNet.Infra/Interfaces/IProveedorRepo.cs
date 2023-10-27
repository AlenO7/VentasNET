using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;

namespace VentasNet.Infra.Interfaces
{
    public interface  IProveedorRepo
    {
        public ProveedorResponse AddProveedor(ProveedorReq proveedor);
        public ProveedorResponse UpdateProveedor(ProveedorReq proveedor);
        public ProveedorResponse Delete(ProveedorReq proveedor);
        public List<ProveedorReq> ListaDeProveedores();
        public Proveedor GetProveedorCuit(string cuit);




    }
}

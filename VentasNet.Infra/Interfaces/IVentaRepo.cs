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
    public interface IVentaRepo
    {

        public VentaReq GenerarVenta();

        public Cliente GetClienteCuit(string cuit);
        public Producto GetProductoCodigo(int codigo);

        public DetalleVentaReq MapeoProdADetalle();

        public VentaReq MapeoNuevaVenta();
        public void AgregarProducto(DetalleVentaReq detalle);
    }
}

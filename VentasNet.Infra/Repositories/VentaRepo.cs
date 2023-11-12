using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Data;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Common;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;
using VentasNet.Infra.Interfaces;

namespace VentasNet.Infra.Repositories
{
    
    public class VentaRepo : IVentaRepo
    {
        private readonly VentasNETContext _context;


        public VentaRepo(VentasNETContext context)
        {
            _context = context;

        }

        public VentaReq GenerarVenta()
        {

                var ventaNew = MapeoNuevaVenta();


            return ventaNew;
        }

        public VentaReq MapeoNuevaVenta()
        {

            VentaReq ventaNueva = new VentaReq()
            {
                IdCliente = VentasPersistido.IdCliente,
                IdComprobante = VentasPersistido.IdComprobante,
                NombreCorto = VentasPersistido.NombreCorto,
                IdFormaPago = VentasPersistido.IdFormaPago,
                Descripcion = VentasPersistido.Descripcion,
                ImporteTotal = VentasPersistido.ImporteTotal,
                cliente = VentasPersistido.cliente,
                producto = VentasPersistido.producto,
                detalles = VentasPersistido.detalles,
                productos = VentasPersistido.productos




            };

            return ventaNueva;
        }

        public DetalleVentaReq MapeoProdADetalle()
        {
            DetalleVentaReq detalles = new DetalleVentaReq()
            {
                IdProducto = VentasPersistido.producto.IdProducto,
               
                Codigo = VentasPersistido.producto.Codigo,
                Nombre = VentasPersistido.producto.Nombre,
                Descripcion = VentasPersistido.producto.Descripcion,
                Precio = VentasPersistido.producto.Precio,


            };

            return detalles;
        }

        public Cliente GetClienteCuit(string cuit)
        {
            var cliente = _context.Cliente.Where(x => x.Cuit == cuit).FirstOrDefault();

            return cliente;
        }
        
        public Producto GetProductoCodigo(int codigo)
         {
            var producto = _context.Producto.Where(x => x.Codigo == codigo).FirstOrDefault();

            return producto;

         }

        public void AgregarProducto(DetalleVentaReq detalle)
        {
            detalle.TotalProducto = detalle.Precio * detalle.Cantidad;
            VentasPersistido.productos.Add(detalle);


        }




        //public int? GetUltimoComprobante (string tipoFactura)
        //{
        //    int? nroCbte = null;
        //    var comprobante = _context.Vwcomprobante.Where(x => x.NombreCorto == tipoFactura).FirstOrDefault();

        //    if (comprobante != null)
        //    {
        //        nroCbte = comprobante.NroUltimoCbte;
        //    }

        //    return nroCbte;
        //}

        //public int? GetProximoComprobante(string tipoFactura)
        //{
        //    int? nroCbte = null;
        //    var comprobante = _context.Vwcomprobante.Where(x => x.NombreCorto == tipoFactura).FirstOrDefault();

        //    if (comprobante != null)
        //    {
        //        nroCbte =comprobante.NroUltimoCbte + 1;
        //    }

        //    return nroCbte;
        //}

        ////public int? GetSucursal(string tipoFactura)
        ////{
        ////    int? nroSuc = null;
        ////    var comprobante = _context.Vwcomprobante.Where(x => x.NombreCorto == tipoFactura).FirstOrDefault();

        ////    if (comprobante != null)
        ////    {
        ////        nroSuc = comprobante.NroSucursal;
        ////    }

        ////    return nroSuc;
        ////}

        //public string GetComprobanteCompleto(string tipoFactura) 
        //{
        //    string nroCompleto = string.Empty; //string vacio
        //    var comprobante = _context.Vwcomprobante.Where(x => x.NombreCorto == tipoFactura).FirstOrDefault();

        //    if (comprobante != null)
        //    {
        //        nroCompleto =comprobante.NroProximoCbte;
        //    }

        //    return nroCompleto;
        //}

        //public void CargarCombos()
        //{
        //    ComboComprobantes();
        //}

        //private void ComboComprobantes()
        //{
        //    ComboComprobante combo = new ComboComprobante();
        //    List<ComboComprobante> listaCombo = new List<ComboComprobante>();
        //   var listaObjeto = _context.Vwcomprobante.ToList();


        //    foreach(var obj in listaObjeto)
        //    {
        //        combo = new ComboComprobante();
        //        combo.nombreCorto = obj.NombreCorto;
        //        combo.descripcion = obj.Descripcion;
        //        listaCombo.Add(combo);
        //    }
        //}


    }
}

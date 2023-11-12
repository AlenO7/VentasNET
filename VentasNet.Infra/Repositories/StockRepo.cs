using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Data;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;
using VentasNet.Infra.Interfaces;

namespace VentasNet.Infra.Repositories
{
    public class StockRepo : IStockRepo
    {

        private readonly VentasNETContext _context;

        public StockRepo(VentasNETContext context)
        {
            _context = context;

        }


        public StockResponse AddStock(StockReq stock)
        {
            StockResponse stockResponse = new StockResponse();

            if (stock.IdProducto != null)
            {
                var existeStock = GetStockIdProducto(stock.IdProducto);


                if (existeStock == null)
                {
                    try
                    {
                        var stockNew = MapeoStockNuevo(stock);

                       // stockNew.Estado = true;
                        stockNew.FechaIngreso = DateTime.Now.Date;

                        _context.Add(stockNew);
                        _context.SaveChanges();
                        stockResponse.Guardar = true;
                        

                    }
                    catch (Exception ex)
                    {
                        stockResponse.Mensaje = "Error al agrega.";
                        stockResponse.Guardar = false;
                    }

                }
            }


            return stockResponse;
        }

        public StockResponse UpdateStock(StockReq stock)
        {
            StockResponse stockResponse = new StockResponse();

            var existeStock = GetStockIdProducto(stock.IdProducto);

            if (existeStock != null)
            {
                try
                {
                    var stockUp = MapeoStockUp(stock, existeStock);


                    _context.Update(stockUp);
                    _context.SaveChanges();
                    stockResponse.Guardar = true;
                    //stockResponse.Nombre = stockUp.Nombre;//OJO
                }
                catch (Exception ex)
                {
                    stockResponse.Mensaje = "Error al modificar Cliente.";
                    stockResponse.Guardar = false;
                }

            }
            return stockResponse;
        }

        public StockResponse Delete (StockReq stock)
        {
            StockResponse stockResponse = new StockResponse();

            var existeStock = GetStockIdProducto(stock.IdProducto);

            if (existeStock != null)
            {
                try
                {
                    existeStock.FechaEgreso = DateTime.Now.Date;
                    existeStock.CantEgreso = 0;

                    _context.Update(existeStock);
                    _context.SaveChanges();

                }
                catch (Exception ex)
                {
                    stockResponse.Mensaje = "Error al eliminar.";
                    stockResponse.Guardar = false;
                }

            }

          

            return stockResponse;
        }

        public List<StockReq> ListadoStock()
        {
            List<StockReq> listadoStock = new List<StockReq>();

            var lista = _context.Stock.Where(x => x.IdProducto > 0).ToList();

            foreach (var item in lista)
            {
               StockReq stockReq = new StockReq();

                stockReq.IdProducto = item.IdProducto;
                stockReq.CantIngreso = item.CantIngreso;
                stockReq.FechaIngreso = item.FechaIngreso;
                stockReq.CantEgreso = item.CantEgreso;
                stockReq.FechaEgreso = item.FechaEgreso;
                stockReq.IdComprobante = item.IdComprobante;
                stockReq.IdUsuario = item.IdUsuario;
                stockReq.FechaMovimiento = item.FechaMovimiento;

                listadoStock.Add(stockReq);
            }

            return listadoStock;
        }

        public Stock MapeoStockUp(StockReq stock, Stock existeStock)
        {
            throw new NotImplementedException();
        }

        public Stock MapeoStockNuevo(StockReq stock)
        {
            Stock stockMapeado = new Stock()
            {
                IdProducto = stock.IdProducto,
                CantIngreso = stock.CantIngreso,
                IdComprobante = stock.IdComprobante,
                CantEgreso = 0,
                IdUsuario = stock.IdUsuario,
                FechaMovimiento = stock.FechaMovimiento,
             

            };

            return stockMapeado;
        }

        public Stock GetStockIdProducto(int idProducto)
        {

            var stock = _context.Stock.Where(x => x.IdProducto == idProducto ).FirstOrDefault();

            return stock;
        }


        
    }
}

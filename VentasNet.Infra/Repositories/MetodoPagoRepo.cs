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
    public class MetodoPagoRepo : IMetodoPagoRepo
    {
        private readonly VentasNETContext _context;

        public MetodoPagoRepo(VentasNETContext context)
        {
            _context = context;

        }

        public MetodoPagoResponse AddMetodoPago(MetodoPagoReq metodoPago)
        {


            MetodoPagoResponse metodoPagoResponse = new MetodoPagoResponse();


            if (metodoPago.IdMetodoPago != null)
            {
                var existeMetodo = GetMetodoPago(metodoPago.IdMetodoPago);


                if (existeMetodo == null)
                {
                    try
                    {
                        var metodoPagoNew = MapeoMetodoNuevo(metodoPago);

                        metodoPagoNew.Estado = true;


                        _context.Add(metodoPagoNew);
                        _context.SaveChanges();
                        metodoPagoResponse.Guardar = true;
                        metodoPagoResponse.MetodoPago = metodoPagoNew.MetodoPago;

                    }
                    catch (Exception ex)
                    {
                        metodoPagoResponse.Mensaje = "Error al agregar.";
                    }

                }
            }
            return metodoPagoResponse;



        }

        public MetodoPagoResponse UpdateMetodopago(MetodoPagoReq metodoPago)
        {
            MetodoPagoResponse metodoPagoResponse = new MetodoPagoResponse();

            var existeMetodo = GetMetodoPago(metodoPago.IdMetodoPago);

            if (existeMetodo != null)
            {
                try
                {
                    var metodoUp = MapeoMetodoUp(metodoPago, existeMetodo);


                    _context.Update(metodoUp);
                    _context.SaveChanges();
                    metodoPagoResponse.Guardar = true;
                    metodoPagoResponse.MetodoPago = metodoUp.MetodoPago;
                }
                catch (Exception ex)
                {
                    metodoPagoResponse.Mensaje = "Error al modificar.";
                    metodoPagoResponse.Guardar = false;
                }

            }

            return metodoPagoResponse;




        }

        public MetodoPagoResponse Delete(MetodoPagoReq metodoPago)
        {
            MetodoPagoResponse metodoPagoResponse = new MetodoPagoResponse();

            var existeMetodo = GetMetodoPago(metodoPago.IdMetodoPago);

            if (existeMetodo != null)
            {
                try
                {

                    existeMetodo.Estado = false;

                    _context.Update(existeMetodo);
                    _context.SaveChanges();

                }
                catch (Exception ex)
                {
                    metodoPagoResponse.Mensaje = "Error al eliminar.";
                    metodoPagoResponse.Guardar = false;
                }

            }

            return metodoPagoResponse;
        }

        public MetodosPago MapeoMetodoUp(MetodoPagoReq metodoPago, MetodosPago existeMetodo)
        {
            existeMetodo.MetodoPago = metodoPago.MetodoPago != null ? metodoPago.MetodoPago : existeMetodo.MetodoPago;

            return existeMetodo;
        }

        public MetodosPago MapeoMetodoNuevo(MetodoPagoReq metodoPago)
        {
            MetodosPago metodoPagoMapeado = new MetodosPago()
            {
                MetodoPago = metodoPago.MetodoPago,
                Estado = true,
                FechaAlta = DateTime.Now.Date,
                
                

            };

            return metodoPagoMapeado;
        }

        public MetodosPago GetMetodoPago(int idMetodoPago)
        {
            var metodoPago = _context.MetodosPago.Where(x => x.IdMetodoPago == idMetodoPago).FirstOrDefault();

            return metodoPago;
        }

        public List<MetodoPagoReq> GetMetodosPago()
        {
            List<MetodoPagoReq> listadoMetodosPago = new List<MetodoPagoReq>();

            var lista = _context.MetodosPago.Where(x => x.Estado == true).ToList();

            foreach (var item in lista)
            {
                MetodoPagoReq metodoPagoReq = new MetodoPagoReq();

                
                metodoPagoReq.MetodoPago = item.MetodoPago;
 

                listadoMetodosPago.Add(metodoPagoReq);
            }

            return listadoMetodosPago;
        }
    }
}

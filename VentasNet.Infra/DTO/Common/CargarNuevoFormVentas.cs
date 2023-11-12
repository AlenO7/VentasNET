using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Models;

namespace VentasNet.Infra.DTO.Common
{
    public class CargarNuevoFormVentasDTO
    {
        public List<MetodosPago> metodosPago { get; set; } = new List<MetodosPago>();



        public DateTime FechaComprobante { get; set; } = new DateTime();

       // public List<FormaPago>  { get; set; } = new List<FormaPago>(); FALTA TRAER DE BD

        public Vwcomprobante Comprobante { get; set; } = new Vwcomprobante();



    }
}


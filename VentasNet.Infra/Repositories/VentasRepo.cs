using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentasNet.Entity.Data;

namespace VentasNet.Infra.Repositories
{
    
    public class VentasRepo
    {
        private readonly VentasNETContext _context;


        public VentasRepo(VentasNETContext context)
        {
            _context = context;

        }

        public int? GetUltimoComprobante (string tipoFactura)
        {
            int? nroCbte = null;
            var comprobante = _context.VWComprobante.Where(x => x.NombreCorto == tipoFactura).FirstOrDefault();

            if (comprobante != null)
            {
                nroCbte = comprobante.NroUltimoCbte;
            }

            return nroCbte;
        }

        public int? GetProximoComprobante(string tipoFactura)
        {
            int? nroCbte = null;
            var comprobante = _context.VWComprobante.Where(x => x.NombreCorto == tipoFactura).FirstOrDefault();

            if (comprobante != null)
            {
                nroCbte = comprobante.NroUltimoCbte + 1;
            }

            return nroCbte;
        }

        public int? GetSucursal(string tipoFactura)
        {
            int? nroCbte = null;
            var comprobante = _context.VWComprobante.Where(x => x.NombreCorto == tipoFactura).FirstOrDefault();

            if (comprobante != null)
            {
                nroCbte = comprobante.NroUltimoCbte + 1;
            }

            return nroCbte;
        }
    }
}

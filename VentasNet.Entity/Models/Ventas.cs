﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace VentasNet.Entity.Models
{
    public partial class Ventas
    {
        public int IdVenta { get; set; }
        public int IdComprobante { get; set; }
        public string NombreCorto { get; set; }
        public int IdFormaPago { get; set; }
        public string Descripcion { get; set; }
        public decimal ImporteTotal { get; set; }
        public int IdCliente { get; set; }
        public int IdUsuario { get; set; }
        public byte[] FechaMovimiento { get; set; }
    }
}
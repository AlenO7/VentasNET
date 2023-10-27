namespace VentasNet.Infra.DTO.Request
{
    public class ClienteReq
    {
        public long IdCliente { get; set; }
        public string RazonSocial { get; set; }
        public string Cuit { get; set; }
        public string Domicilio { get; set; }
        public DateTime FechaAlta { get; set; }
        public DateTime? FechaBaja { get; set; }
        public bool Estado { get; set; }
        public string Email { get; set; }
      
        
        public int? IdPais { get; set; }

        public int? IdProvincia { get; set; }

        public int? IdLocalidad { get; set; }
    }
}

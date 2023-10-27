namespace VentasNet.Infra.DTO.Request
{
    public class UsuarioReq
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Cuit { get; set; }
        public string Email { get; set; }
        public string Clave { get; set; }
        public DateTime? FechaAlta { get; set; }
        public DateTime? FechaBaja { get; set; }
        public bool? Estado { get; set; }





    }
  
}

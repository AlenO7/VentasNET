namespace VentasNet.Infra.DTO.Request
{
    public class ProductoReq
    {

        public int IdProducto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int? Precio { get; set; }
        public bool? Estado { get; set; }
        public int? IdProveeor { get; set; }
        public int Codigo { get; set; }


    }
}

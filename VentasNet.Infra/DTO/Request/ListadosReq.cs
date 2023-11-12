namespace VentasNet.Infra.DTO.Request
{
    public static class ListadosReq
    {
        public static List<ClienteReq> ListaCliente { get; set; } = new List<ClienteReq>(); // si ListaCliente es nulo (la primera vez) le va a pasar un cliente vacio.
        public static List<ProveedorReq> ListaProveedor { get; set; } = new List<ProveedorReq>();

        public static List<UsuarioReq> ListaUsuarios { get; set; } = new List<UsuarioReq> { };

        public static List<PaisReq> ListaPais { get; set; } = new List<PaisReq>();

        public static List<ProductoReq> ListaProducto { get; set; } = new List<ProductoReq>();
        public static List<MetodoPagoReq> ListaMetodosPago { get; set; } = new List<MetodoPagoReq>();
        public static List<VentaReq> ListaVentas { get; set; } = new List<VentaReq>();

        public static List<DetalleVentaReq> ListaDetalleVenta { get; set; } = new List<DetalleVentaReq>();

        //public static List<ProductoVendido> ListaProductoVendido { get; set; } = new List<ProductoVendido>();

        //public static List<Venta> ListaVenta { get; set; } = new List<Venta>();





    }




}

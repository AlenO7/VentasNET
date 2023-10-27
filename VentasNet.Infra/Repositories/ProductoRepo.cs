



using VentasNet.Entity.Data;
using VentasNet.Entity.Models;
using VentasNet.Infra.DTO.Request;
using VentasNet.Infra.DTO.Response;
using VentasNet.Infra.Interfaces;

namespace VentasNet.Infra.Repositories
{
    public class ProductoRepo : IProductoRepo
    {
        private readonly VentasNETContext _context;
        public ProductoRepo(VentasNETContext context) 
        {
            _context = context;


        }

        public ProductoResponse AddProducto(ProductoReq prod)
        {
            

            ProductoResponse productoResponse = new ProductoResponse();
            

            if (prod.Codigo != null)
            {
                var existeProducto = GetProductoCodigo(prod.Codigo);

                
                if (existeProducto == null)
                {
                    try
                    {
                        var productoNew = MapeoProductoNuevo(prod);

                        productoNew.Estado = true;
                       

                        _context.Add(productoNew); 
                        _context.SaveChanges(); 
                        productoResponse.Guardar = true;
                        productoResponse.Nombre = productoNew.Nombre;

                    }
                    catch (Exception ex)
                    {
                        productoResponse.Mensaje = "Error al agregar Producto."; 
                    }

                }
            }
            return productoResponse;


            
        }

        public ProductoResponse UpdateProducto(ProductoReq prod)
        {
            ProductoResponse productoResponse = new ProductoResponse();

            var existeProducto = GetProductoCodigo(prod.Codigo);

            if (existeProducto != null)
            {
                try
                {
                    var productoUp = MapeoProducto(prod, existeProducto);


                    _context.Update(productoUp); 
                    _context.SaveChanges(); 
                    productoResponse.Guardar = true;
                    productoResponse.Nombre = productoUp.Nombre;
                }
                catch (Exception ex)
                {
                    productoResponse.Mensaje = "Error al modificar Cliente."; 
                    productoResponse.Guardar = false;
                }

            }

            return productoResponse;
        }

        public ProductoResponse Delete(ProductoReq prod)
        {
            ProductoResponse productoResponse = new ProductoResponse();

            var existeProducto = GetProductoCodigo(prod.Codigo);

            if (existeProducto != null)
            {
                try
                {

                    existeProducto.Estado = false;

                    _context.Update(existeProducto); 
                    _context.SaveChanges();

                }
                catch (Exception ex)
                {
                    productoResponse.Mensaje = "Error al eliminar Cliente."; 
                    productoResponse.Guardar = false;
                }

            }

            return productoResponse;
        }

        public List<ProductoReq> GetProductos()
        {
            List<ProductoReq> listadoProductos = new List<ProductoReq>();

            var lista = _context.Producto.Where(x => x.Estado == true).ToList();

            foreach (var item in lista)
            {
                ProductoReq productoReq = new ProductoReq();

                productoReq.IdProducto = item.IdProducto;
                productoReq.Nombre= item.Nombre;
                productoReq.Descripcion = item.Descripcion;
                productoReq.Codigo = item.Codigo;
                productoReq.Precio = item.Precio;
                productoReq.IdProveeor = item.IdProveeor;
                

                listadoProductos.Add(productoReq);
            }

            return listadoProductos;
        }


        public Producto GetProductoCodigo(int codigo)
        {
            var producto = _context.Producto.Where(x => x.Codigo == codigo).FirstOrDefault();

            return producto;
        }


        public Producto MapeoProducto(ProductoReq prod, Producto existeProducto)
        {
            existeProducto.Nombre = prod.Nombre != null ? prod.Nombre : existeProducto.Nombre;
            existeProducto.Descripcion = prod.Descripcion != null ? prod.Descripcion : existeProducto.Descripcion;
            existeProducto.Precio = prod.Precio != null ? prod.Precio : existeProducto.Precio;
            existeProducto.Codigo = prod.Codigo != null ? prod.Codigo : existeProducto.Codigo;
            existeProducto.IdProveeor = prod.IdProveeor != null ? prod.IdProveeor : existeProducto.IdProveeor;




            return existeProducto;
        }

        public Producto MapeoProductoNuevo(ProductoReq prod)
        {
            Producto prodMapeado = new Producto()
            {
                Nombre = prod.Nombre,
                Codigo = prod.Codigo,
                Descripcion = prod.Descripcion,
                Precio = prod.Precio,
                IdProveeor = prod.IdProveeor,
                Estado = prod.Estado

            };

            return prodMapeado;
        }
    }
}

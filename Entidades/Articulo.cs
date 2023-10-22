using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Articulo
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public Categoria Categoria { get; set; }
        public Proveedor Proveedor { get; set; }
        public float PrecioVenta { get; set; }
        public float PrecioCompra { get; set; }
        public int Stock { get; set; }
        public bool Estado { get; set; }
        public Articulo() { }

        public Articulo(int id, string nombre, Categoria categoria, Proveedor proveedor, float precioVenta, float precioCompra, int stock, bool estado)
        {
            Id = id;
            Nombre = nombre;
            Categoria = categoria;
            Proveedor = proveedor;
            PrecioVenta = precioVenta;
            PrecioCompra = precioCompra;
            Stock = stock;
            Estado = estado;
        }
    }
}

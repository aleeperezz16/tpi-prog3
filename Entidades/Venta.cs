using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Venta
    {
        public int Id { get; set; }
        public Articulo Articulo { get; set; }
        public Clientes Cliente { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioTotal { get; set; }
        public DateTime Fecha { get; set; }

        
        public Venta()
        {

        }

        public Venta(int id, Articulo articulo, Clientes cliente, int cantidad, decimal precioTotal, DateTime fecha)
        {
            Id = id;
            Articulo = articulo;
            Cliente = cliente;
            Cantidad = cantidad;
            PrecioTotal = precioTotal;
            Fecha = fecha;
        }
    }
}

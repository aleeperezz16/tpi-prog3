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
        public Cliente Cliente { get; set; }
        public int Cantidad { get; set; }
        public float PrecioTotal { get; set; }
        public string Fecha { get; set; }

        
        public Venta()
        {

        }

        public Venta(int id, Articulo articulo, Cliente cliente, int cantidad, float precioTotal, string fecha)
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

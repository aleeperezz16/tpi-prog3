using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Pedido
    {
        public int Id { get; set; }
        public Articulo Articulo { get; set; }
        public Proveedor Proveedor { get; set; }
        public int Cantidad { get; set; }
        public string Fecha { get; set; }
        public float CostoTotal { get; set; }

        public Pedido() { }

        public Pedido(int id, Articulo articulo, Proveedor proveedor, int cantidad, string fecha, float costoTotal)
        {
            Id = id;
            Articulo = articulo;
            Proveedor = proveedor;
            Cantidad = cantidad;
            Fecha = fecha;
            CostoTotal = costoTotal;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioVentas
    {
        private DaoVentas _daoVentas = new DaoVentas();
        private DaoArticulos _daoArticulos = new DaoArticulos();

        public NegocioVentas() { }

        public DataTable ObtenerVentas(int id = 0, string articulo = "", string fecha = "", long dni = 0)
        {
            return _daoVentas.ObtenerVentas(id, articulo, fecha, dni);
        }

        public DataTable ObtenerArticulos(int id = 0)
        {
            return _daoArticulos.ObtenerArticulos(id);
        }

        public bool AgregarVenta(Venta venta)
        {
            return _daoVentas.AgregarVenta(venta) == 2;
        }
    }
}

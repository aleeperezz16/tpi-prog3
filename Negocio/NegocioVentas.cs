using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;

namespace Negocio
{
    public class NegocioVentas
    {
        private DaoVentas _daoVentas = new DaoVentas();
        private DaoArticulos _daoArticulos = new DaoArticulos();
        public NegocioVentas() { }

        public DataTable ObtenerVentas(string id = "", string articulo = "", string fecha = "", string dni = "")
        {
            return _daoVentas.ObtenerVentas(id, articulo, fecha, dni);
        }

        public DataTable ObtenerArticulos()
        {
            return _daoArticulos.ObtenerArticulosCompletos();
        }
    }
}

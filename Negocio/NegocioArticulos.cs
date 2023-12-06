using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioArticulos
    {
        DaoArticulos _dao = new DaoArticulos();

        public NegocioArticulos() { }

        public DataTable ObtenerArticulos(int id = 0)
        {
            return _dao.ObtenerArticulos(id);
        }

        public bool AgregarArticulo(Articulo art)
        {
            return _dao.AgregarArticulo(art) == 1;
        }
        public bool ModificarArticulo(Articulo art)
        {
            return _dao.ModificarArticulo(art) == 1;
        }
        public bool EliminarArticulo(int id)
        {
            return _dao.BorrarArticulo(id) == 1;
        }
    }
}

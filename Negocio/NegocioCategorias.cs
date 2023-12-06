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
    public class NegocioCategorias
    {
        DaoCategorias _dao = new DaoCategorias();

        public NegocioCategorias() { }

        public DataTable ObtenerCategorias(int id = 0)
        {
            return _dao.ObtenerCategorias(id);
        }

        public bool AgregarCategoria(Categoria cat)
        {
            return _dao.AgregarCategoria(cat) == 1;
        }
        public bool EliminarCategoria(int id)
        {
            return _dao.BorrarCategoria(id) == 1;
        }

        public bool ModificarCategorias(Categoria cat)
        {
            return _dao.ModificarCategoria(cat) == 1;
        }
    }
}

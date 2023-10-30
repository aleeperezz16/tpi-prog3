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
    public class NegocioProveedores
    {
        private DaoProveedores _dao = new DaoProveedores();

        public NegocioProveedores() { }

        public DataTable ObtenerProveedores(int id = 0, string nombre = "")
        {
            return _dao.ObtenerProveedores(id, nombre);
        }

        public bool AgregarProveedor(Proveedor proveedor)
        {
            return _dao.AgregarProveedor(proveedor) == 1;
        }

        public bool EliminarProveedor(int id)
        {
            return _dao.BorrarProveedor(id) == 1;
        }
    }
}

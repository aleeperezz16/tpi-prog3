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
        private DaoProveedores _daoProveedores = new DaoProveedores();
        private DaoCiudad _daoCiudad = new DaoCiudad();
        private DaoProvincia _daoProvincia = new DaoProvincia();

        public NegocioProveedores() { }

        public DataTable ObtenerProvincias(int id = 0)
        {
            return _daoProvincia.ObtenerProvincias(id);
        }

        public DataTable ObtenerProveedores(int id = 0, string nombre = "")
        {
            return _daoProveedores.ObtenerProveedores(id, nombre);
        }

        public bool ModificarProveedor(Proveedor proveedor)
        {
            return _daoProveedores.ModificarProveedor(proveedor) == 1;
        }

        public bool AgregarProveedor(Proveedor proveedor)
        {
            return _daoProveedores.AgregarProveedor(proveedor) == 1;
        }

        public bool EliminarProveedor(int id)
        {
            return _daoProveedores.BorrarProveedor(id) == 1;
        }

        public DataTable ObtenerCiudades(int id = 0, int idProvincia = 0)
        {
            return _daoCiudad.ObtenerCiudades(id, idProvincia);
        }
    }
}

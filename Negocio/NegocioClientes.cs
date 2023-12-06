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
    public class NegocioClientes
    {
        private DaoClientes _dao = new DaoClientes();
        public NegocioClientes() { }

        public DataTable ObtenerClientes(int id = 0)
        {
            return _dao.ObtenerCliente(id);
        }

        public DataTable ObtenerHistorial(Cliente cliente)
        {
            return _dao.ObtenerHistorial(cliente);
        }

        public bool EliminarCliente(int dni)
        {
            return _dao.BorrarCliente(dni) == 1;
        }
        public bool ModificarCliente(Cliente cliente)
        {
            return _dao.ModificarCliente(cliente) == 1;
        }

        public bool AgregarCliente(Cliente cliente)
        {
            return _dao.AgregarCliente(cliente) == 1;
        }

        public bool ExisteCliente(Cliente cliente)
        {
            return _dao.ExisteCliente(cliente);
        }
    }
}



    


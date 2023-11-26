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

        public bool EliminarCliente(int dni)
        {
            return _dao.BorrarCliente(dni) == 1;
        }
        public bool ModificarCliente(Clientes cliente)
        {
            int cantFilas = _dao.ModificarCliente(cliente);
            return cantFilas > 1 ? true : false;
        }

        public bool AgregarCliente(Clientes cliente)
        {
            int cantFilas = _dao.agregarCliente(cliente);
            return cantFilas > 1 ? true : false;
        }

        public DataTable ObtenerDNIClientes(Clientes cliente)
        {
        
            return _dao.ObtenerDNICliente(cliente);
        }

        public DataTable ObtenerALIASClientes(Clientes cliente)
        {

            return _dao.ObtenerALIASCliente(cliente);
        }


    }
}



    


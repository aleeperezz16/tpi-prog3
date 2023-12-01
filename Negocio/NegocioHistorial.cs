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
    public class NegocioHistorial
    {
        private DaoHistorial _daoHistorial = new DaoHistorial();
        public NegocioHistorial() { }

        public DataTable ObtenerHistorial(Cliente cliente)
        {
            return _daoHistorial.obtenerHistorial(cliente);
        }


    }
}

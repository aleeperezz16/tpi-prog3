using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;

namespace Negocio
{
    public class NegocioPedidos
    {

        private DaoPedidos _dao = new DaoPedidos();
        public NegocioPedidos() {}

        public DataTable ObtenerTablaPedidos(int id = 0)
        {
            
            return _dao.ObtenerPedidos(id);
        }


    }
}

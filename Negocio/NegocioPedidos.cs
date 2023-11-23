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
    public class NegocioPedidos
    {

        private DaoPedidos _dao = new DaoPedidos();
        public NegocioPedidos() {}

        public DataTable ObtenerTablaPedidos(int id = 0)
        {
            
            return _dao.ObtenerPedidos(id);
        }
        

        public bool agregarPedido(Pedido pedido)
        {
            DaoPedidos dao = new DaoPedidos();
            int cantFilas = 0;


            cantFilas = dao.AgregarPedido(pedido);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
        




    }
}

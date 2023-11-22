using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoPedidos
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");
        public DaoPedidos() { }

        public DataTable ObtenerPedidos(int id)
        {
            string consulta = "SELECT * FROM Pedidos";

            if (id > 0)
                consulta += $" WHERE IDPedido = {id}";

            return _datos.ObtenerTabla("Pedidos", consulta);
        }
    }
}

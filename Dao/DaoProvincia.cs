using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class DaoProvincia
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoProvincia() { }

        public DataTable ObtenerProvincias(int id)
        {
            string consulta = "SELECT * FROM Provincia";

            if (id > 0)
                consulta += $" WHERE IDProvincia = {id}";

            return _datos.ObtenerTabla("Provincias", consulta);

        }
    }
}

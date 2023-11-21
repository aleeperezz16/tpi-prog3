using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class DaoCiudad
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoCiudad() { }

        public DataTable ObtenerCiudades(int id, int idProvincia)
        {
            string consulta = "SELECT * FROM CIUDAD";

            string filtro = "";

            if (id > 0)
                filtro += $"CodigoCiudad = {id}";

            if (idProvincia > 0)
            {
                if (filtro != "")
                    filtro += " AND ";

                filtro += $"CodigoProvincia = {idProvincia}";
            }

            if (filtro != "")
                consulta += $" WHERE {filtro}";

            return _datos.ObtenerTabla("Ciudades", consulta);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;

namespace Dao
{
    public class DaoUsuarios
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoUsuarios() { }

        public DataTable ObtenerUsuarios()
        {
            return _datos.ObtenerTabla("Usuario", "SELECT * FROM LOGINUSUARIOS");
        }
    }
}

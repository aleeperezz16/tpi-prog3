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

        public DataTable ObtenerUsuario(Usuario usuario)
        {
            DataTable data =_datos.ObtenerTabla("Usuario", $"SELECT Alias, Contrasenia, Tipo FROM LOGINUSUARIOS WHERE Estado = 1 AND Alias = '{usuario.Alias}' AND Contrasenia = '{usuario.Contrasenia}'");
            if (data?.Rows.Count == 1)
            {
                return data;
            }

            return null;
        }

        public int CambiarContrasenia(string user,string password)
        {
            string consulta = $"UPDATE LOGINUSUARIOS SET Contrasenia = '{password}' WHERE Alias = '{user}'";

             return _datos.EjecutarConsulta(consulta);
        }
    }
}

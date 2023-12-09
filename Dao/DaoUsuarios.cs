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

        public Usuario ObtenerUsuario(string alias, string contrasenia)
        {
            string consulta = "SELECT Alias, Contrasenia, Tipo " +
                $"FROM LOGINUSUARIOS WHERE Estado = 1 AND Alias = '{alias}' AND Contrasenia = '{contrasenia}'";

            DataRow dato = _datos.ObtenerTabla("Usuario", consulta).Rows?[0];
            return dato != null ? new Usuario
            {
                Alias = dato.Field<string>("Alias"),
                Contrasenia = dato.Field<string>("Contrasenia"),
                Tipo = dato.Field<char>("Tipo"),
                Estado = true
            } : null;
        }
    }
}

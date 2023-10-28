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

        public char VerificarUsuario(string alias,string password)
        {
            char Resultado = 'E';

            string consulta = $"SELECT * FROM LOGINUSUARIOS WHERE Alias ={alias} AND Contrasenia = {password}";

            int Seleccion = _datos.EjecutarConsulta(consulta);

            if ( Seleccion == 1)
            {
                DataTable usuario = _datos.ObtenerTabla("user", consulta);

                int estado = usuario.Rows[0].Field<int>("Estado");

                if (estado == 1) 
                { 
                    Resultado = usuario.Rows[0].Field<char>("Tipo");
                }

            }

            return Resultado;
        }

        public DataTable obtenerCliente (string alias)
        {
            string consulta = $"SELECT * FROM LOGINUSUARIOS WHERE Alias ={alias}";
            DataTable usuario = _datos.ObtenerTabla("user", consulta);

            return usuario;
        }
    }
}

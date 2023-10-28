using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;

namespace Negocio
{
    public class LogearUsuario
    {
        private DaoUsuarios dao;

        public LogearUsuario() { }

        public char TipoDeIngreso(string user, string password)
        {
            char Tipo = dao.VerificarUsuario(user, password);

            return Tipo;
           
        }

        public Cliente DatosCliente(string Alias)
        {
            Cliente cliente = new Cliente();

            return cliente;
        }

    }


}

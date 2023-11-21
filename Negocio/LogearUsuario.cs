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
        public LogearUsuario() { }

        public object IniciarSesion(Usuario usuario)
        {
            DaoUsuarios daoUsuarios = new DaoUsuarios();
            DataTable data = daoUsuarios.ObtenerUsuario(usuario);

            if (data != null)
            {
                usuario.Tipo = data.Rows[0].Field<string>("Tipo")[0];

                if (usuario.Tipo != 'V')
                {
                    DaoClientes daoClientes = new DaoClientes();
                    Cliente cliente = daoClientes.ObtenerCliente(usuario);
                    return cliente;
                }

                return usuario;
            }

            return null;
        }
    }
}

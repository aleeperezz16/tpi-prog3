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
    public class NegocioUsuario
    {
        DaoUsuarios _daoUsuarios = new DaoUsuarios();
        public int CambiarContrasenia(string user, string pass)
        {
            return _daoUsuarios.CambiarContrasenia(user, pass);
        }
    }
}

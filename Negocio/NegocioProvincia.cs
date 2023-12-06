using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using System.Data;

namespace Negocio
{
    public class NegocioProvincia
    {

        public NegocioProvincia() { }
        public DataTable ObtenerProvincias(int id = 0) 
        {
            DaoProvincia dao = new DaoProvincia();
            return dao.ObtenerProvincias(id);    
        }
    }
}

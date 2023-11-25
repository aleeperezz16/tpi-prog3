using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using System.Data;

namespace Negocio
{
    public class NegocioCiudades
    {
        public NegocioCiudades() { }

        public DataTable ObtenerCiudades(int id = 0, int idProvincia = 0)
        {
            DaoCiudad ciudad = new DaoCiudad();
            return ciudad.ObtenerCiudades(id,idProvincia);
        }
    }
}

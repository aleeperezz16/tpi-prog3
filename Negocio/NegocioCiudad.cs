using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using System.Data;

namespace Negocio
{
    public class NegocioCiudad
    {
        public NegocioCiudad() { }

        public DataTable ObtenerCiudades()
        {
            DaoCiudad daoCiudad = new DaoCiudad();

            return daoCiudad.ObtenerCiudades(-1);
        }   
    }
}

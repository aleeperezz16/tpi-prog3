﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class DaoCiudad
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoCiudad() { }

        public DataTable ObtenerCiudades(int id)
        {
            string consulta = "SELECT * FROM CIUDAD";

            if (id > 0)
                consulta += $" WHERE CodigoCiudad = {id}";

            return _datos.ObtenerTabla("Ciudades", consulta);

        }
    }
}

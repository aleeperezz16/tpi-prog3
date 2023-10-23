﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class DaoClientes
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");
        public DaoClientes() { }

        public DataTable ObtenerClientes(int id)
        {
            string consulta = "SELECT * FROM Clientes";

            if (id > 0)
                consulta += $" WHERE Dni = {id}";

            return _datos.ObtenerTabla("Clientes", consulta);
        }
    }
}

﻿using System;
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
        public DataTable ObtenerProvincias() {
            DaoProvincia daoProvincia = new DaoProvincia();

            return daoProvincia.ObtenerProvincias(-1);    
         }
    }
}

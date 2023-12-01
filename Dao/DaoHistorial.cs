using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoHistorial
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");
        public DaoHistorial() { }


        public DataTable obtenerHistorial(Cliente cliente)
        {
            string consulta = "SELECT DISTINCT A.NombreArticulo AS Articulo," +
                "V.Cantidad AS Cantidad," +
                "V.PrecioTotal AS Total," +
                "V.FechaVenta " +
                "FROM Ventas AS V INNER JOIN Articulos AS A " +
                "ON V.IDArticulo = A.IDArticulo INNER JOIN Clientes C " +
                $"ON V.DNICliente = {cliente.Dni}";

            /*string filtro = "";

            if (id > 0)
                filtro += $"V.IDVenta={id}";

            if (articulo != "")
            {
                if (filtro != "")
                    filtro += " AND ";
                
                filtro += $"A.IDArticulo={articulo}";
            }

            if (fecha != "")
            {
                if (filtro != "")
                    filtro += " AND ";
                
                filtro += $"V.FechaVenta='{fecha}'";
            }

            if (dni > 0)
            {
                if (filtro != "")
                    filtro += " AND ";

                filtro += $"C.DNI={dni}";
            }

            if (filtro != "")
                consulta += $" WHERE {filtro}";*/

            DataTable dt =  _datos.ObtenerTabla("Historial", consulta);
            Console.WriteLine(dt.Columns[1]);
            return dt;
        }

    }
}

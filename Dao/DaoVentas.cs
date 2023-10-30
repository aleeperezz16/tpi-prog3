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
    public class DaoVentas
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");
        public DaoVentas() { }

        public int AgregarVenta(Venta venta)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregar(ref cmd, venta);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_AgregarVenta");
        }

        public DataTable ObtenerVentas(int id, string articulo, string fecha, long dni)
        {
            string consulta = "SELECT V.IDVenta AS [ID Venta]," +
                "A.NombreArticulo AS Articulo," +
                "V.Cantidad AS Cantidad," +
                "V.PrecioTotal AS Total," +
                "V.FechaVenta AS [Fecha Venta]," +
                "CONCAT_WS(' ', C.Nombre, C.Apellido) AS Comprador," +
                "C.DNI AS DNI " +
                "FROM Ventas AS V INNER JOIN Articulos AS A " +
                "ON V.IDArticulo = A.IDArticulo INNER JOIN Clientes C " +
                "ON V.DNICliente = C.DNI";

            string filtro = "";

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
                consulta += $" WHERE {filtro}";

            return _datos.ObtenerTabla("Ventas", consulta);
        }

        private void ArmarParametrosAgregar(ref SqlCommand cmd, Venta venta)
        {
            cmd.Parameters.AddWithValue("@IDARTICULO", venta.Articulo.Id);
            cmd.Parameters.AddWithValue("@DNICLIENTE", venta.Cliente.Dni);
            cmd.Parameters.AddWithValue("@CANTIDAD", venta.Cantidad);
            cmd.Parameters.AddWithValue("@PRECIOTOTAL", venta.PrecioTotal);
            cmd.Parameters.AddWithValue("@FECHA", venta.Fecha);
        }
    }
}

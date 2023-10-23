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

        public DataTable ObtenerVentas(int id)
        {
            string consulta = "SELECT * FROM Ventas";

            if (id > 0)
                consulta += $" WHERE IDVenta = {id}";

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

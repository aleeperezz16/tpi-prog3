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
    public class DaoProveedores
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoProveedores() { }

        public int AgregarProveedor(Proveedor prov)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregar(ref cmd, prov);
             int enter =_datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_AgregarProveedor");
            return enter;
        }

        public int ModificarProveedor(Proveedor prov)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosModificar(ref cmd, prov);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_ModificarProveedor");
        }

        public int BorrarProveedor(int id)
        {
            return _datos.EjecutarConsulta($"DELETE FROM Proveedores WHERE IDProveedor = {id}");
        }

        public DataTable ObtenerProveedores(int id, string nombre)
        {
            string consulta = "SELECT P.IDProveedor," +
                "P.NombreProveedor," +
                "P.Telefono," +
                "P.EMail," +
                "P.Direccion," +
                "C.NombreCiudad," +
                "P.Estado " +
                "FROM PROVEEDORES P INNER JOIN CIUDAD C " +
                "ON P.CodigoCiudad = C.CodigoCiudad";

            string filtro = "";

            if (id > 0)
                filtro += $"P.IDProveedor = {id}";

            if (nombre != "")
            {
                if (filtro != "")
                    filtro += " AND ";
                
                filtro += $"P.NombreProveedor LIKE '%{nombre}%'";
            }

            if (filtro != "")
                consulta += $" WHERE {filtro}";

            return _datos.ObtenerTabla("Proveedores", consulta);
        }

        private void ArmarParametrosAgregar(ref SqlCommand cmd, Proveedor prov)
        {
            cmd.Parameters.AddWithValue("@NOMBRE", prov.Nombre);
            cmd.Parameters.AddWithValue("@TELEFONO", prov.Telefono);
            cmd.Parameters.AddWithValue("@EMAIL", prov.Email);
            cmd.Parameters.AddWithValue("@DIRECCION", prov.Direccion);
            cmd.Parameters.AddWithValue("@CODCIUDAD", prov.Ciudad.Codigo);
        }

        private void ArmarParametrosModificar(ref SqlCommand cmd, Proveedor prov)
        {
            cmd.Parameters.AddWithValue("@IDPROVEEDOR", prov.Id);
            cmd.Parameters.AddWithValue("@NOMBRE", prov.Nombre);
            cmd.Parameters.AddWithValue("@TELEFONO", prov.Telefono);
            cmd.Parameters.AddWithValue("@EMAIL", prov.Email);
            cmd.Parameters.AddWithValue("@DIRECCION", prov.Direccion);
            cmd.Parameters.AddWithValue("@CODCIUDAD", prov.Ciudad.Codigo);
        }
    }
}

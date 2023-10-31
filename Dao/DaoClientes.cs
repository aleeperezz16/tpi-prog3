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
    public class DaoClientes
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");
        public DaoClientes() { }

        public int ModificarCliente(Cliente cli)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosModificar(ref cmd, cli);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_ModificarCliente");
        }

        public DataTable ObtenerClientes(int id)
        {
            string consulta = "SELECT CNT.DNI, " +
                "CNT.Apellido," +
                "CNT.Nombre, " +
                "CNT.Alias, " +
                "CNT.Telefono, " +
                "CNT.EMail, " +
                "CNT.Direccion, " +
                "C.NombreCiudad AS Ciudad, " +
                "P.NombreProvincia AS Provincia, " +
                "CNT.Estado " +
                "FROM CLIENTES CNT " +
                "INNER JOIN CIUDAD C ON CNT.CodigoCiudad = C.CodigoCiudad " +
                "INNER JOIN PROVINCIA P ON C.CodigoProvincia = P.CodigoProvincia ";

            if (id > 0)
                consulta += $" WHERE Dni = {id}";

            return _datos.ObtenerTabla("Clientes", consulta);
        }

        public int BorrarCliente(int id)
        {
            return _datos.EjecutarConsulta($"DELETE FROM Clientes WHERE Dni = {id}");
        }

        private void ArmarParametrosModificar(ref SqlCommand cmd, Cliente cli)
        {
            cmd.Parameters.AddWithValue("@DNI", cli.Dni);
            cmd.Parameters.AddWithValue("@APELLIDO", cli.Apellido);
            cmd.Parameters.AddWithValue("@NOMBRE", cli.Nombre);
            cmd.Parameters.AddWithValue("@ALIAS", cli.Usuario.Alias);
            cmd.Parameters.AddWithValue("@CONTRASENIA", cli.Usuario.Contrasenia);
            cmd.Parameters.AddWithValue("@TELEFONO", cli.Telefono);
            cmd.Parameters.AddWithValue("@EMAIL", cli.Email);
            cmd.Parameters.AddWithValue("@DIRECCION", cli.Direccion);
            cmd.Parameters.AddWithValue("@CODCIUDAD", cli.Ciudad.Codigo);
            cmd.Parameters.AddWithValue("@ESTADO", cli.Estado);
        }
    }
}

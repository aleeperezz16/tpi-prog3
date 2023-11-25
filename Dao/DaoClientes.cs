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

        public DataTable ObtenerCliente(int id)
        {
            string consulta = "SELECT CNT.DNI, " +
                "CNT.Apellido," +
                "CNT.Nombre, " +
                "CNT.Alias, " +
                "CNT.Telefono, " +
                "CNT.EMail, " +
                "CNT.Direccion, " +
                "C.CodigoCiudad AS Ciudad, " +
                "CNT.Estado " +
                "FROM CLIENTES CNT " +
                "INNER JOIN CIUDAD C ON CNT.CodigoCiudad = C.CodigoCiudad";

            if (id > 0)
                consulta += $" WHERE CNT.DNI = {id}";

            return _datos.ObtenerTabla("Clientes", consulta);
        }

        public Cliente ObtenerCliente(Usuario usuario)
        {
            string consulta = "SELECT " +
                "C.Apellido," +
                "C.Direccion," +
                "C.DNI," +
                "C.EMail," +
                "C.Estado," +
                "C.Nombre," +
                "C.Telefono," +
                "CI.CodigoCiudad," +
                "CI.NombreCiudad AS Ciudad," +
                "P.CodigoProvincia," +
                "P.NombreProvincia AS Provincia " +
                "FROM CLIENTES C INNER JOIN CIUDAD CI " +
                "ON C.CodigoCiudad = CI.CodigoCiudad INNER JOIN PROVINCIA P " +
                $"ON P.CodigoProvincia = CI.CodigoProvincia WHERE C.Alias = '{usuario.Alias}'";

            DataTable dt = _datos.ObtenerTabla("Clientes", consulta);
            DataRow dr = dt.Rows[0];
            Provincia provincia = new Provincia(dr.Field<int>("CodigoProvincia"), dr.Field<string>("Provincia"));
            Ciudad ciudad = new Ciudad(dr.Field<int>("CodigoCiudad"), dr.Field<string>("Ciudad"), provincia);

            Cliente cliente = new Cliente(dr.Field<int>("DNI"),
                dr.Field<string>("Apellido"),
                dr.Field<string>("Nombre"),
                usuario,
                dr.Field<string>("Telefono"),
                dr.Field<string>("EMail"),
                dr.Field<string>("Direccion"),
                ciudad,
                dr.Field<bool>("Estado"));

            return cliente;
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
            //cmd.Parameters.AddWithValue("@ALIAS", cli.Usuario.Alias);
           // cmd.Parameters.AddWithValue("@CONTRASENIA", cli.Usuario.Contrasenia);
            cmd.Parameters.AddWithValue("@TELEFONO", cli.Telefono);
            cmd.Parameters.AddWithValue("@EMAIL", cli.Email);
            cmd.Parameters.AddWithValue("@DIRECCION", cli.Direccion);
            cmd.Parameters.AddWithValue("@CODCIUDAD", cli.Ciudad.Codigo);
            cmd.Parameters.AddWithValue("@ESTADO", cli.Estado);
        }
    }
}

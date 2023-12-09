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
              "CNT.Estado, " +
              "LOGIN.Contrasenia " +
              "FROM CLIENTES CNT " +
              "INNER JOIN CIUDAD C ON CNT.CodigoCiudad = C.CodigoCiudad " +
              "INNER JOIN LOGINUSUARIOS LOGIN ON LOGIN.Alias = CNT.Alias";

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
            Cliente cliente = new Cliente(Convert.ToInt32(dr.ItemArray[2]),
                Convert.ToString(dr.ItemArray[0]),
                Convert.ToString(dr.ItemArray[5]),
                usuario,
                Convert.ToString(dr.ItemArray[6]),
                Convert.ToString(dr.ItemArray[3]),
                Convert.ToString(dr.ItemArray[1]),
                ciudad,
                Convert.ToBoolean(dr.ItemArray[4]));

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
            //cmd.Parameters.AddWithValue("@CONTRASENIA", cli.Usuario.Contrasenia);
            cmd.Parameters.AddWithValue("@TELEFONO", cli.Telefono);
            cmd.Parameters.AddWithValue("@EMAIL", cli.Email);
            cmd.Parameters.AddWithValue("@DIRECCION", cli.Direccion);
            cmd.Parameters.AddWithValue("@CODCIUDAD", cli.Ciudad.Codigo);
            //cmd.Parameters.AddWithValue("@ESTADO", cli.Estado);
        }



        public int agregarCliente(Cliente cliente)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregar(ref cmd, cliente);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_RegistrarCliente");
        }

        private void ArmarParametrosAgregar(ref SqlCommand cmd, Cliente cli)
        {
            cmd.Parameters.AddWithValue("@ALIAS", cli.Usuario.Alias);
            cmd.Parameters.AddWithValue("@CONTRASENIA", cli.Usuario.Contrasenia);
            cmd.Parameters.AddWithValue("@DNI",  cli.Dni );
            cmd.Parameters.AddWithValue("@APELLIDO", cli.Apellido);
            cmd.Parameters.AddWithValue("@NOMBRE", cli.Nombre);
            cmd.Parameters.AddWithValue("@TELEFONO", cli.Telefono);
            cmd.Parameters.AddWithValue("@EMAIL", cli.Email);
            cmd.Parameters.AddWithValue("@DIRECCION", cli.Direccion);
            cmd.Parameters.AddWithValue("@CODIGOCIUDAD", cli.Ciudad.Codigo);
           
        }

        public DataTable ObtenerDNICliente(Cliente cli)
        {
            string consulta = "SELECT * FROM CLIENTES WHERE DNI = "+cli.Dni;
            return _datos.ObtenerTabla("Clientes", consulta);
        }
        public DataTable ObtenerALIASCliente(Cliente cli)
        {
            string consulta = "SELECT * FROM CLIENTES WHERE ALIAS = '" + cli.Usuario.Alias+"'";
            return _datos.ObtenerTabla("Clientes", consulta);
        }
        public DataTable ObtenerProvinciaCliente(Cliente cli)
        {
            string consulta = "SELECT P.NombreProvincia FROM PROVINCIA P" +
                " INNER JOIN CIUDAD C ON P.CodigoProvincia = C.CodigoProvincia" +
                " INNER JOIN CLIENTES CL ON C.CodigoCiudad = CL.CodigoCiudad" +
                " WHERE DNI = " + cli.Dni;
            return _datos.ObtenerTabla("Clientes", consulta);
        }

    }

    
}

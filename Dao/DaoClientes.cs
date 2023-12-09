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

        public DataTable ObtenerClientes()
        {
            string consulta = "SELECT DNI, CONCAT_WS(' ', Nombre, Apellido) AS Nombre," +
                "Alias, Telefono, EMail, Direccion," +
                "NombreCiudad AS Ciudad, Estado " +
                "FROM CLIENTES C INNER JOIN CIUDAD CI ON C.CodigoCiudad = CI.CodigoCiudad";

            return _datos.ObtenerTabla("Clientes", consulta);
        }

        /*public Cliente ObtenerCliente(Usuario usuario)
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
            Cliente cliente = new Cliente
            {
                Dni = dr.Field<int>("DNI"),
                Apellido = dr.Field<string>("Apellido"),
                Nombre = dr.Field<string>("Nombre"),
                Usuario = usuario,
                Telefono = dr.Field<string>("Telefono"),
                Email = dr.Field<string>("EMail"),
                Direccion = dr.Field<string>("Direccion"),
                Ciudad = ciudad,
                Estado = dr.Field<bool>("Estado")
            };

            return cliente;
        }*/

        public DataTable ObtenerHistoriales()
        {
            string consulta = "SELECT IDVenta AS NroVenta, DNICliente AS Cliente, PrecioTotal, FechaVenta FROM VENTAS";
            return _datos.ObtenerTabla("Historiales", consulta);
        }

        public int BorrarCliente(int id)
        {
            return _datos.EjecutarConsulta($"DELETE FROM Clientes WHERE Dni = {id}");
        }

        public int AgregarCliente(Cliente cliente)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregar(ref cmd, cliente);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_RegistrarCliente");
        }

        public bool ExisteCliente(Cliente cliente)
        {
            string consulta = "SELECT C.Dni, C.Alias FROM Clientes C INNER JOIN LoginUsuarios L " +
                $"ON L.Alias = C.Alias WHERE C.Dni = {cliente.Dni} OR C.Alias = '{cliente.Usuario.Alias}'";

            return _datos.ExisteRegistro(consulta);
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
    }
}

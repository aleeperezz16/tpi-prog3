﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoArticulos
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");
        public DaoArticulos() { }

        public int AgregarArticulo(Articulo art)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregar(ref cmd, art);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_AgregarArticulo");
        }

        public int ModificarArticulo(Articulo art)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosModificar(ref cmd, art);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_ModificarArticulo");
        }

        public int BorrarArticulo(int id)
        {
            return _datos.EjecutarConsulta($"DELETE FROM Articulos WHERE IDArticulo = {id}");
        }

        public DataTable ObtenerArticulos(int id)
        {
            string consulta = "SELECT * FROM Articulos";

            if (id > 0)
                consulta += $" WHERE IDArticulo = {id}";

            return _datos.ObtenerTabla("Articulos", consulta);
        }

        private void ArmarParametrosAgregar(ref SqlCommand cmd, Articulo art)
        {
            cmd.Parameters.AddWithValue("@NOMBRE", art.Nombre);
            cmd.Parameters.AddWithValue("@IDCATEGORIA", art.Categoria.Id);
            cmd.Parameters.AddWithValue("@IDPROVEEDOR", art.Proveedor.Id);
            cmd.Parameters.AddWithValue("@PRECIOVENTA", art.PrecioVenta);
            cmd.Parameters.AddWithValue("@PRECIOCOMPRA", art.PrecioCompra);
            cmd.Parameters.AddWithValue("@STOCK", art.Stock);
        }

        private void ArmarParametrosModificar(ref SqlCommand cmd, Articulo art)
        {
            cmd.Parameters.AddWithValue("@IDARTICULO", art.Id);
            cmd.Parameters.AddWithValue("@NOMBRE", art.Nombre);
            cmd.Parameters.AddWithValue("@IDCATEGORIA", art.Categoria.Id);
            cmd.Parameters.AddWithValue("@IDPROVEEDOR", art.Proveedor.Id);
            cmd.Parameters.AddWithValue("@PRECIOVENTA", art.PrecioVenta);
            cmd.Parameters.AddWithValue("@PRECIOCOMPRA", art.PrecioCompra);
            cmd.Parameters.AddWithValue("@STOCK", art.Stock);
            cmd.Parameters.AddWithValue("@ESTADO", art.Estado);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;

namespace Dao
{
    public class DaoCategorias
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");
        public DaoCategorias() { }

        public int AgregarCategoria(Categoria cat)
        {
            return _datos.EjecutarConsulta($"INSERT INTO Categorias (NombreCategoria, Descripcion) VALUES ({cat.Nombre}, {cat.Descripcion})");
        }

        public int ModificarCategoria(Categoria cat)
        {
            return _datos.EjecutarConsulta($"UPDATE Categorias SET NombreCategoria = {cat.Nombre}, Descripcion = {cat.Descripcion} WHERE IDCategoria = {cat.Id}");
        }

        public int BorrarCategoria(int id)
        {
            return _datos.EjecutarConsulta($"DELETE FROM Categorias WHERE IDCategoria = {id}");
        }

        public DataTable ObtenerCategorias(int id)
        {
            string consulta = "SELECT * FROM Categorias";

            if (id > 0)
                consulta += $" WHERE IDCategoria = {id}";

            return _datos.ObtenerTabla("Categorias", consulta);
        }

    }
}

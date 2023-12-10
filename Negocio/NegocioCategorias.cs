using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioCategorias
    {
        

        public NegocioCategorias() { }

        public DataTable ObtenerCategorias(int id = 0)
        {
            DaoCategorias dao = new DaoCategorias();
            return dao.ObtenerCategorias(id);
        }
        public DataTable ObtenerCategoriasXnombre(string nombre)
        {
            DaoCategorias dao = new DaoCategorias();
            return dao.ObtenerCategoriasXnombre(nombre);
        }

        public Categoria ObtenerCategoriaObjeto(int id)
        {
            DaoCategorias dao = new DaoCategorias();
            DataTable dtCat = dao.ObtenerCategorias(id);
            DataRow drCat= dtCat.Rows[0];
            Categoria cat = new Categoria(); 
            cat.Id = id;
            cat.Nombre = drCat[1].ToString();
            cat.Descripcion = drCat[2].ToString();
            return cat;
        }

        public bool agregarCategoria(Categoria cat)
        {
            DaoCategorias dao = new DaoCategorias();
            int cantFilas = 0;

          
            cantFilas = dao.AgregarCategoria(cat);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
        public bool eliminarCategoria(int id)
        {
            DaoCategorias dao = new DaoCategorias();
            int cantidadFilas = 0;
        
            cantidadFilas = dao.BorrarCategoria(id);
            if (cantidadFilas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }


        }

        public bool ModificarCategorias(Categoria cat)
        {
            DaoCategorias dao = new DaoCategorias();
            int cantfilas = dao.ModificarCategoria(cat);
            return cantfilas > 1 ? true : false;
        }



    }
}

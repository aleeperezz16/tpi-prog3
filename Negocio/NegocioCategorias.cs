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


        public DataTable ObtenerCategorias(int id)
        {
            DaoCategorias dao = new DaoCategorias();
            return dao.ObtenerCategorias(id);
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

           
            /*if (dao.existeCategoría(cat) == false)
            {
                
            }*/
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
            /*if (!Conexion.existe(consulta))
            {
                
            }*/
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
    }
}

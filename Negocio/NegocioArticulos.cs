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
    public class NegocioArticulos
    {
        

        public NegocioArticulos() { }

        public DataTable ObtenerTodosLosArticulos()
        {
            DaoArticulos dao = new DaoArticulos();
            return dao.ObtenerArticulosCompletos(-1);
        }

        public DataTable ObtenerArticulo(int id)
        {
            DaoArticulos dao = new DaoArticulos();
            return dao.ObtenerArticulosCompletos(id);
        }
        public DataTable ObtenerArticulosActivos(int id)
        {
            DaoArticulos dao = new DaoArticulos();
            return dao.ObtenerArticulosActivos(id);
        }

        public DataTable ObtenerArticulosInactivos(int id)
        {
            DaoArticulos dao = new DaoArticulos();
            return dao.ObtenerArticulosInactivos(id);
        }

        public DataTable ObtenerArticulosxCategoriaActivos(int id)
        {
            DaoArticulos dao = new DaoArticulos();
            return dao.ObtenerArticulosxCategoriaActivos(id);
        }

        public bool agregarArticulo(Articulo Articulo)
        {
            DaoArticulos dao = new DaoArticulos();
            int cantFilas = 0;

           
            /*if (dao.existeCategoría(cat) == false)
            {
                
            }*/
            cantFilas = dao.AgregarArticulo(Articulo);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
        public bool ModificarArticulo(Articulo art)
        {
            DaoArticulos dao = new DaoArticulos();
            int cantfilas = dao.ModificarArticulo(art);
            return cantfilas > 1 ? true : false;
        }
        public bool eliminarArticulo(int  id)
        {
            DaoArticulos dao = new DaoArticulos();
            int cantidadFilas = 0;
            /*if (!Conexion.existe(consulta))
            {
                
            }*/
            cantidadFilas = dao.BorrarArticulo(id);
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

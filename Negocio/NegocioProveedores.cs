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
    public class NegocioProveedores
    {
        

        public NegocioProveedores() { }


        public DataTable ObtenerProveedores(int id)
        {
            DaoProveedores dao = new DaoProveedores();
            return dao.ObtenerProveedores(id);
        }
        public DataTable ObtenerProveedoresActivos(int id)
        {
            DaoProveedores dao = new DaoProveedores();
            return dao.ObtenerProveedoresActivos(id);
        }

        public Proveedor ObtenerProveedorObjeto(int id)
        {
            DaoProveedores dao = new DaoProveedores();
            DataTable dtProv = dao.ObtenerProveedoresActivos(id);
            DataRow dtRow = dtProv.Rows[0];
            Proveedor prov = new Proveedor();
            prov.Id = id;
            prov.Nombre = dtRow.ItemArray[1].ToString();
            prov.Telefono = dtRow.ItemArray[2].ToString();
            prov.Email = dtRow.ItemArray[3].ToString();
            prov.Direccion = dtRow.ItemArray[4].ToString();
            //prov.CiudadID =  FALTA AGREGAR LOGICA CON LA PROBLEMATICA DE CIUDAD
            prov.Estado = Convert.ToBoolean(dtRow.ItemArray[6].ToString());
            return prov;
        }

        public bool AgregarProveedor(Proveedor proveedor)
        {
            DaoProveedores dao = new DaoProveedores();
            int cantFilas = 0;

           
            /*if (dao.existeCategoría(cat) == false)
            {
                
            }*/
            cantFilas = dao.AgregarProveedor(proveedor);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool eliminarProveedor(int id)
        {
            DaoProveedores dao = new DaoProveedores();
            int cantidadFilas = 0;
            /*if (!Conexion.existe(consulta))
            {
                
            }*/
            cantidadFilas = dao.BorrarProveedor(id);
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

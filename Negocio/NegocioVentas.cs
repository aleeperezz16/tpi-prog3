using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioVentas
    {
        private DaoVentas _daoVentas = new DaoVentas();
        private DaoArticulos _daoArticulos = new DaoArticulos();

        public NegocioVentas() { }

        public DataTable ObtenerVentas()
        {
            return _daoVentas.ObtenerVentas();
        }

        public DataTable ObtenerDetalleVentas(Venta venta)
        {
            return _daoVentas.ObtenerDetalleVenta(venta.Id);
        }

        public DataTable ObtenerArticulos()
        {
            return _daoArticulos.ObtenerArticulos(id);
        }

        public bool AgregarDetalleVenta(int idVenta, List<DetalleVenta> ventas)
        {
            foreach (DetalleVenta detalleVenta in ventas)
            {
                detalleVenta.Venta.Id = idVenta;
                if (_daoVentas.AgregarDetalleVenta(detalleVenta) == 0)
                    return false;
            }

            return true;
        }

        public int agregarVenta(Venta venta)
        public int AgregarVenta(Venta venta)
        {
            return _daoVentas.AgregarVenta(venta);
        }
    }
}

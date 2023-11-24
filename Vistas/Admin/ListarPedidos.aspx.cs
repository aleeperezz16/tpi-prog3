using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas.Admin
{
    public partial class ListarPedidos : System.Web.UI.Page
    {
        NegocioArticulos negocioArt = new NegocioArticulos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarPedidosEnGrilla();
            }
        }


        private void cargarPedidosEnGrilla()
        {
            NegocioPedidos negocio = new NegocioPedidos();
            gdvListarPedidos.DataSource = negocio.ObtenerTablaPedidos(0);
            gdvListarPedidos.DataBind();
        }

        /// int id, Articulo articulo, Proveedor proveedor, int cantidad, DateTime fecha, decimal costoTotal

        protected void btnBuscarPedidoPorId_Click(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(tbBuscarPedidoPorId.Text.Trim());
            tbBuscarPedidoPorId.Text = "";
            NegocioPedidos negocio = new NegocioPedidos();
            gdvListarPedidos.DataSource = negocio.ObtenerTablaPedidos(num);
            gdvListarPedidos.DataBind();
         
            try
            {
                ///USO LA EXCEPCION DE FUERA DE RANGO del Row Con un Try Catch PARA CUANDO SÉ QUE NO ENCONTRÓ NADA
                String IDArticulo = ((Label)gdvListarPedidos.Rows[0].FindControl("lbl_it_IDArticulo")).Text;//agarre cualquier dato
            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("No hubo coincidencias, por favor intente con otro ID", "Informe");
            }
           
        }

        protected void btnVistaInicial_Click(object sender, EventArgs e)
        {
            tbBuscarPedidoPorId.Text = "";
            cargarPedidosEnGrilla();
            /// gdvListarPedidos.PageIndex = 0;
        }

        protected void gdvListarPedidos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvListarPedidos.PageIndex = e.NewPageIndex;
            cargarPedidosEnGrilla();
        }
        
        protected void gdvListarPedidos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }
        
    }


}

   


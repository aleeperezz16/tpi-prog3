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
            gdvListarPedidos.DataSource = negocio.ObtenerTablaPedidos();
            gdvListarPedidos.DataBind();
        }

        protected void btnBuscarPedidoPorId_Click(object sender, EventArgs e)
        {
            int num = Convert.ToInt32(tbBuscarPedidoPorId.Text.Trim());
            tbBuscarPedidoPorId.Text = "";
            NegocioPedidos negocio = new NegocioPedidos();
            gdvListarPedidos.DataSource = negocio.ObtenerTablaPedidos(num);
            gdvListarPedidos.DataBind();
        }
    }

   

}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas.MiCuenta
{
    public partial class HistorialCompra : Index
    {
        private NegocioClientes _negocio = new NegocioClientes();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cliente cliente = (Cliente)Session["Datos"];

                gvHistorial.DataSource = _negocio.ObtenerHistorial(cliente);
                gvHistorial.DataBind();
            }
        }

        protected void gvHistorial_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvHistorial.PageIndex = e.NewPageIndex;
            gvHistorial.DataBind();
        }
    }
}
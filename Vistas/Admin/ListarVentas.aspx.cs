using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;

namespace Vistas.Admin
{
    public partial class ListarVentas : System.Web.UI.Page
    {
        private NegocioVentas _negocio = new NegocioVentas();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlArticulos.DataSource = _negocio.ObtenerArticulos();
                ddlArticulos.DataTextField = "NombreArticulo";
                ddlArticulos.DataValueField = "IDArticulo";
                ddlArticulos.DataBind();

                gvVentas.DataSource = _negocio.ObtenerVentas();
                gvVentas.DataBind();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string idVenta = txtIdVenta.Text.Trim();
            string dia = txtFechaDia.Text.Trim();
            string mes = txtFechaMes.Text.Trim();
            string anio = txtFechaAnio.Text.Trim();
            string dni = txtDniCliente.Text.Trim();
            string articulo = ddlArticulos.SelectedValue;

            if (articulo == "--Seleccionar--")
                articulo = "";

            gvVentas.DataSource = _negocio.ObtenerVentas(idVenta != "" ? int.Parse(idVenta) : 0, articulo, $"{anio}{(mes.Length == 1 ? "0" : "")}{mes}{(dia.Length == 1 ? "0" : "")}{dia}", dni != "" ? long.Parse(dni) : 0);
            gvVentas.DataBind();
        }
    }
}

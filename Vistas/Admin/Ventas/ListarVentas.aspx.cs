using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;
using Entidades;

namespace Vistas.Admin.Ventas
{
    public partial class ListarVentas : Admin
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

                CargarVentasEnGrilla();

                VerUsuarioConectado();
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

            CargarVentasEnGrilla(idVenta != "" ? int.Parse(idVenta) : 0, articulo, $"{anio}{(mes.Length == 1 ? "0" : "")}{mes}{(dia.Length == 1 ? "0" : "")}{dia}", dni != "" ? long.Parse(dni) : 0);
        }

        protected void gvVentas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVentas.PageIndex = e.NewPageIndex;
            CargarVentasEnGrilla();
        }

        private void CargarVentasEnGrilla(int id = 0, string articulo = "", string fecha = "", long dni = 0)
        {
            gvVentas.DataSource = _negocio.ObtenerVentas();
            gvVentas.DataBind();
        }

        public void VerUsuarioConectado()
        {
            var datos = Session["Datos"];

            if (datos.GetType() == typeof(Usuario))
            {
                Usuario usuarito = (Usuario)Session["Datos"];
                lblCuentaIngresada.Text = usuarito.Alias;
            }
            else
            {
                Cliente Clientesito = (Cliente)Session["Datos"];
                lblCuentaIngresada.Text = Clientesito.Nombre + " " + Clientesito.Apellido;
            }
        }
    }
}
